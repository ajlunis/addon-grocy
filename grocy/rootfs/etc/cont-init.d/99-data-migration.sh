#!/usr/bin/with-contenv bashio
# ==============================================================================
# This script moves the grocy data to the /config directory and creates a 
# symlink to it from the original location. 
# ==============================================================================

if [ -d /var/www/grocy/data ] && [ ! -L /var/www/grocy/data ]; then
    echo "Moving grocy data to /config"
    mv /var/www/grocy/data/* /config/
    rm -rf /var/www/grocy/data
    ln -s /config /var/www/grocy/data
fi
