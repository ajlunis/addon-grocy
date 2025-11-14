# Home Assistant Community Add-on: Grocy (ajlunis-Tweaks)

[Grocy][grocy] - ERP beyond your fridge is a powerful groceries & household
management solution for your home, delivering features like:

- Stock management
- Shopping list
- Recipes
- Chores & tasks
- Inventory
- and many more.

[Try out the online demo of Grocy][grocy-demo].

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "Grocy" add-on.
1. Check the logs of the "Grocy" add-on to see if everything went well.
1. Click on the "OPEN WEB UI" button to get into the interface of Grocy.
1. The default login is user: `admin` password: `admin`.
1. Enjoy the add-on!

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
culture: en
currency: USD
entry_page: stock
features:
  batteries: true
  calendar: true
  chores: true
  equipment: true
  recipes: true
  shoppinglist: true
  stock: true
  tasks: true
tweaks:
  calendar_first_day_of_week: 0
  stock_price_tracking: true
  stock_location_tracking: true
default_user_settings:
  stock_due_soon_days: 10
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface of Grocy
Panel. Set it `true` to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `culture`

Is used for setting the language. Choose between:

- `ca` (Catalan)
- `cs` (Czech)
- `da` (Danish)
- `de` (German)
- `el_GR` (Greek - Greece)
- `en` (English)
- `en_GB` (English - United Kingdom)
- `es` (Spanish)
- `fi` (Finnish)
- `fr` (French)
- `he_IL` (Hebrew - Israel)
- `hu` (Hungarian)
- `it` (Italian)
- `ja` (Japanese)
- `ko_KR` (Korean - South Korea)
- `nl` (Dutch)
- `no` (Norwegian)
- `pl` (Polish)
- `pt_BR` (Portuguese - Brazil)
- `pt_PT` (Portuguese - Portugal)
- `ru` (Russian)
- `sk_SK` (Slovak - Slovakia)
- `sv_SE` (Swedish - Sweden)
- `ta` (Tamil)
- `tr` (Turkish)
- `zh_CN` (Chinese - China)
- `zh_TW` (Chinese - Taiwan)

### Option: `currency`

Determines the currency as displayed in the Grocy interface, specified by the
ISO4217 three digit currency code.

Examples: `USD`, `CAD`, `GBP` or `EUR`.

### Option: `entry_page`

Allows you to specify an custom homepage if desired.

You can use the one of the following values:

- `batteries`
- `calendar`
- `chores`
- `equipment`
- `mealplan`
- `recipes`
- `shoppinglist`
- `stock`
- `tasks`

By default the homepage is set to the stock overview.

### Option: `mode`

Either "production", "dev", "demo" or "prerelease". When not "production", the application will work in a demo mode which means authentication is disabled and some demo data will be generated during the database schema migration.

### Option: `calendar_show_week_of_year`

If calendars should show week numbers.

### Option: `energy_unit`

Your preferred unit for energy. E.g. "kcal" or "kJ" or something else (doesn't really matter, it's only used to display energy values).

### Option: `base_path`

When running Grocy in a subdirectory, this should be set to the relative path, otherwise empty. It needs to be set to the part (of the URL) AFTER the document root, if URL rewriting is disabled, including index.php.

### Option: `base_url`

The base URL of your installation, should be just "/" when running directly under the root of a (sub)domain or for example "https://example.com/grocy" when using a subdirectory.

### Option: `stock_barcode_lookup_plugin`

The plugin to use for external barcode lookups, must be the filename (folder "/plugins" for built-in plugins or "/data/plugins" for user plugins) without the .php extension. Leave empty to disable external barcode lookups.

### Option: `disable_url_rewriting`

If your webserver does not support URL rewriting, set this to true.

### Option: `disable_auth`

Set this to true if you want to disable authentication / the login screen, places where user context is needed will then use the default (first existing) user.

### Option: `auth_class`

Either "Grocy\\Middleware\\DefaultAuthMiddleware", "Grocy\\Middleware\\ReverseProxyAuthMiddleware" or any class that implements Grocy\\Middleware\\AuthMiddleware.

### Option: `reverse_proxy_auth_header`

The name of the HTTP header which your reverse proxy uses to pass the username (on successful authentication).

### Option: `reverse_proxy_auth_use_env`

Set to true if the username is passed as environment variable.

### Option: `ldap_address`

Example value "ldap://vm-dc2019.local.berrnd.net"

### Option: `ldap_base_dn`

Example value "DC=local,DC=berrnd,DC=net"

### Option: `ldap_bind_dn`

Example value "CN=grocy_bind_account,OU=service_accounts,DC=local,DC=berrnd,DC=net"

### Option: `ldap_bind_pw`

Password for the above account.

### Option: `ldap_user_filter`

Example value "(OU=grocy_users)"

### Option: `ldap_uid_attr`

Windows AD: "sAMAccountName", OpenLDAP: "uid", GLAuth: "cn"

### Option: `default_permissions`

Default permissions for new users. The array needs to contain the technical/constant names. See the file controllers/Users/User.php for possible values.

### Option: `grocycode_type`

"1D" (=> Code128) or "2D" (=> DataMatrix).

### Option: `label_printer_webhook`

The URI that Grocy will POST to when asked to print a label.

### Option: `label_printer_run_server`

Whether the webhook will be called server- or client-side.

### Option: `label_printer_params`

Additional parameters supplied to the webhook.

### Option: `label_printer_hook_json`

TRUE to use JSON or FALSE to use normal POST request variables.

### Option: `tprinter_is_network_printer`

Set to true if it's a network printer.

### Option: `tprinter_print_quantity_name`

Set to false if you do not want to print the quantity names (related to the shopping list).

### Option: `tprinter_print_notes`

Set to false if you do not want to print notes (related to the shopping list).

### Option: `tprinter_ip`

IP of the network printer (does only matter if it's a network printer).

### Option: `tprinter_port`

Port of the network printer (does only matter if it's a network printer).

### Option: `tprinter_connector`

Printer device (does only matter if you use a locally attached printer). For USB on Linux this is often '/dev/usb/lp0', for serial printers it could be similar to '/dev/ttyS0'. Make sure that the user that runs the webserver has permissions to write to the printer - on Linux add your webserver user to the LP group with usermod -a -G lp www-data.

### Option: `features`

Here you can disable the parts which you don't need to have a less cluttered UI (set the setting to "false" to disable the corresponding part, which should be self explanatory).
- `stock`
- `shoppinglist`
- `recipes`
- `chores`
- `tasks`
- `batteries`
- `equipment`
- `calendar`
- `label_printer`

### Option: `tweaks`

- `calendar_first_day_of_week`: This is used to define the first day of a week for calendar views, leave empty to use the locale default. Needs to be a number where Sunday = 0, Monday = 1 and so forth.
- `chores_assignment`
- `meal_plan_first_day_of_week`: Set this if you want to have a different start day for the weekly meal plan view, leave empty to use CALENDAR_FIRST_DAY_OF_WEEK. Needs to be a number where Sunday = 0, Monday = 1 and so forth. Can also be set to -1 to dynamically start the meal plan week on "today".
- `multiple_shopping_lists`
- `stock_best_before_date_tracking`
- `stock_location_tracking`
- `stock_price_tracking`
- `stock_product_freezing`
- `stock_product_opened_tracking`
- `stock_count_opened_products_against_minimum_stock_amount`
- `stock_best_before_date_field_number_pad`: Activate the number pad in due date fields on (supported) mobile browsers.
- `recipes_mealplan`
- `thermal_printer`

### Option: `feature_settings`

- `disable_browser_barcode_camera_scanning`: Set this to true if you want to disable the ability to scan a barcode via the device camera (Browser API).
- `auto_torch_on_with_camera`: Enables the torch automatically (if the device has one).

### Option: `default_user_settings`

These settings can be changed per user and via the UI, below are the defaults which are used when the user has not changed the setting so far.

- `night_mode`: "on" = Night mode is always on ; "off" = Night mode is always off / "follow-system" = System preferred color schema is used.
- `auto_night_mode_enabled`: If night mode is enabled automatically when inside a given time range.
- `auto_night_mode_time_range_from`: Format HH:mm.
- `auto_night_mode_time_range_to`: Format HH:mm.
- `auto_night_mode_time_range_goes_over_midnight`: If the time range above goes over midnight.
- `night_mode_enabled_internal`: Internal setting if night mode is actually enabled (based on the other settings).
- `auto_reload_on_db_change`: If the page should be automatically reloaded when there was an external change.
- `show_clock_in_header`: Show a clock in the header next to the logo or not.
- `keep_screen_on`: If the screen should always be kept on.
- `keep_screen_on_when_fullscreen_card`: If the screen should be kept on when a "fullscreen-card" is displayed.
- `product_presets_location_id`: Default location id for new products (-1 means no location is preset).
- `product_presets_product_group_id`: Default product group id for new products (-1 means no product group is preset).
- `product_presets_qu_id`: Default quantity unit id for new products (-1 means no quantity unit is preset).
- `product_presets_default_due_days`: Default due days for new products (-1 means that the product will be never overdue).
- `product_presets_treat_opened_as_out_of_stock`: Default "Treat opened as out of stock" option for new products.
- `product_presets_default_stock_label_type`: "Default stock entry label" option for new products (0 = No label, 1 = Single Label, 2 = Label per unit).
- `stock_decimal_places_amounts`: Default decimal places allowed for amounts.
- `stock_decimal_places_prices_input`: Default decimal places allowed for prices (input).
- `stock_decimal_places_prices_display`: Default decimal places allowed for prices (display).
- `stock_auto_decimal_separator_prices`: If the decimal separator should be set automatically for amount inputs.
- `stock_due_soon_days`: The "expiring soon" days.
- `stock_default_purchase_amount`: The default amount prefilled on the purchase page.
- `stock_default_consume_amount`: The default amount prefilled on the consume page.
- `stock_default_consume_amount_use_quick_consume_amount`: If the products quick consume amount should be prefilled on the consume page.
- `scan_mode_consume_enabled`: If scan mode on the consume page is enabled.
- `scan_mode_purchase_enabled`: If scan mode on the purchase page is enabled.
- `show_icon_on_stock_overview_page_when_product_is_on_shopping_list`: When enabled, an icon is shown on the stock overview page (next to the product name) when the prodcut is currently on a shopping list.
- `stock_overview_show_all_out_of_stock_products`: By default the stock overview page lists all products which are currently in stock or below their min. stock amount - when this is enabled, all (active) products are always shown.
- `show_purchased_date_on_purchase`: Whether the purchased date should be editable on purchase (defaults to today otherwise).
- `show_warning_on_purchase_when_due_date_is_earlier_than_next`: Show a warning on purchase when the due date of the purchased product is earlier than the next due date in stock.
- `shopping_list_to_stock_workflow_auto_submit_when_prefilled`: Automatically do the booking using the last price and the amount of the shopping list item, if the product has "Default due days" set.
- `shopping_list_show_calendar`: When enabled, a small (month view) calendar will be shown on the shopping list page.
- `shopping_list_round_up`: When enabled, all quantity amounts on the shopping list are always displayed rounded up to the nearest whole number.
- `shopping_list_auto_add_below_min_stock_amount`: If products should be automatically added to the shopping list when they are below their min. stock amount.
- `shopping_list_auto_add_below_min_stock_amount_list_id`: When the above setting is enabled, the id of the shopping list to which the products will be added.
- `shopping_list_print_show_header`: Default for the shopping list print option "Show header".
- `shopping_list_print_group_by_product_group`: Default for the shopping list print option "Group by product group".
- `shopping_list_print_layout_type`: Default for the shopping list print option "Layout type" (table or list).
- `recipe_ingredients_group_by_product_group`: Group recipe ingredients by their product group.
- `recipes_show_list_side_by_side`: If the recipe should be displayed next to recipe list on the recipes page.
- `recipes_show_ingredient_checkbox`: When enabled, a little checkbox will be shown next to each ingredient to mark it as done.
- `chores_due_soon_days`: The "due soon" days.
- `chores_overview_swap_tracking_buttons`: When enabled, the "Track next chore schedule" and "Track chore execution now" buttons/menu items are swapped.
- `batteries_due_soon_days`: The "due soon" days.
- `tasks_due_soon_days`: The "due soon" days.
- `calendar_color_products`: The event color (hex code) for due products.
- `calendar_color_tasks`: The event color (hex code) for due tasks.
- `calendar_color_chores`: The event color (hex code) for due chores.
- `calendar_color_batteries`: The event color (hex code) for due battery charge cycles.
- `calendar_color_meal_plan`: The event color (hex code) for meal plan items.

### Option: `grocy_ingress_user`

Allows you to specify a default ingress user if desired (e.g. `admin`).

If no ingress user is set, the default login authentication is used.

## Known issues and limitations

- Grocy support to provide custom lookup resources to lookup information
  on the internet based on the product barcode. This is currently not yet
  supported by the add-on.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2019-2025 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_grocy&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[alpine-packages]: https://pkgs.alpinelinux.org/packages
[contributors]: https://github.com/hassio-addons/addon-grocy/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-grocy/112422?u=frenck
[frenck]: https://github.com/frenck
[grocy-demo]: https://demo-en.grocy.info
[grocy]: https://grocy.info/
[issue]: https://github.com/hassio-addons/addon-grocy/issues
[python-packages]: https://pypi.org/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-grocy/releases
[semver]: https://semver.org/spec/v2.0.0.html
