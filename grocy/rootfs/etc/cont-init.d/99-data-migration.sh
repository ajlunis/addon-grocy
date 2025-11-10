#!/usr/bin/with-contenv bashio
# ==============================================================================
# This script moves the entire grocy data directory to /config/grocy_data
# and creates a symlink from the original location.
# This makes all Grocy data accessible on the host while being robust and
# safe to run multiple times.
# ==============================================================================

DATA_DIR="/var/www/grocy/data"
CONFIG_DIR="/config"
DEST_DATA_DIR="${CONFIG_DIR}/grocy_data"

bashio::log.info "Starting Grocy data directory migration..."

# If the source is already a symlink, our work is done.
if [ -L "${DATA_DIR}" ]; then
    bashio::log.info "Grocy data directory is already a symlink. No action needed."
    exit 0
fi

# If the destination directory exists, it implies a previous (possibly partial) migration.
# We prioritize the data in /config.
if [ -d "${DEST_DATA_DIR}" ]; then
    bashio::log.warning "Destination data directory '${DEST_DATA_DIR}' already exists."
    # If the original source *still* exists (and is not a symlink), it must be removed
    # before we can create the link. This might happen if the addon was restored
    # from a backup without the symlink being preserved.
    if [ -d "${DATA_DIR}" ]; then
        bashio::log.warning "Original data directory '${DATA_DIR}' also exists. Removing it to create symlink."
        rm -rf "${DATA_DIR}"
    fi
else
    # Destination doesn't exist, so we must move the original source data there.
    # This is the standard first-time run scenario.
    bashio::log.info "Moving original data directory to '${DEST_DATA_DIR}'..."
    mkdir -p "${CONFIG_DIR}"
    mv "${DATA_DIR}" "${DEST_DATA_DIR}"
fi

# Create the symlink from the original location to the new location.
bashio::log.info "Creating symlink from '${DATA_DIR}' to '${DEST_DATA_DIR}'..."
ln -s "${DEST_DATA_DIR}" "${DATA_DIR}"

bashio::log.info "Grocy data directory migration complete."
