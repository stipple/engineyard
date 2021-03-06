# ChangeLog

## NEXT

  *

## v1.4.13 (2011-12-07)

  * Fix last release.

## v1.4.12 (2011-12-07)

  * Print more informative messages on deploy.
  * Include new version of deploy system that fixes a bug with GIT_SSH not being set for some instances.

## v1.4.11 (2011-11-29)

  * Fix gemspec problem

## v1.4.10 (2011-11-26)

  *

## v1.4.9 (2011-11-26)

  * Includes an engineyard-serverside fix to prevent rebuilding gems on every deploy.

## v1.4.8 (2011-11-22)

  * The below changes improve other-ruby support. Notably, engineyard should now work from rubinius for the most part.
  * [refactor] More require, less autoload
  * [refactor] Clean up the way we read and write the .eyrc file.
  * [internal] Specs no longer depend on FakeFS.
  * [internal] Remove unused 'custom endpoint' complexity. $CLOUD_URL can still be set to override the api endpoint.

## v1.4.7 (2011-11-16)

  * Exit from ey ssh with the exit status of the ssh command. If running on multiple instances, exits with the status of the first failure, or 0 if all instances succeed.
  * Set LANG to 'en_US.UTF-8' while installing gems to avoid failures on 1.9.x

## v1.4.6 (2011-11-10)

  * Ran into the YAML Syck thing again when building the last version. Re-releasing.

## v1.4.5 (2011-11-10)

  * Use new engineyard-serverside version that should actually really fix the 32bit / 64bit problem. We now check every instance instead of (incorrectly) only checking the app master.

## v1.4.4 (2011-11-07)

  *

## v1.4.3 (2011-11-01)

  * Include new engineyard-serverside version with fixes:
  * Deploy fix: Don't fail if we can't precompile assets.
  * Deploy fix: Delete bundled\_gems directory if we can't determine under which 32 or 64bit the last bundle was run.

## v1.4.2 (2011-10-21)

  * bundle\_without: ey.yml option allows you to specify custom bundle install --without string (list of space separated groups, replaces the default 'test development') Put the option in your ey.yml file under the environment name key.
  * Includes a fix for Gemfile detection in engineyard-serverside.

## v1.4.1 (2011-10-18)

  * Improve warning messages during deploys.
  * Exclude bundler environment variables explicitly on bundler install during deploy.

## v1.4.0 (2011-10-07)

  * Remove bundler 0.9 support in engineyard-serverside.
  * `ey whoami` will tell you who you're logged in as.

## v1.3.33 (2011-09-27)

  *

## v1.3.32 (2011-09-23)

  * Use the environments API to check whether run migrations or not when the flag is
    not provided.

## v1.3.31 (2011-09-21)

  *

## v1.3.30 (2011-09-19)

  *

## v1.3.29 (2011-09-15)

  *

## v1.3.27 (2011-09-14)

  *

## v1.3.26 (2011-09-13)

  *

## v1.3.25 (2011-09-12)

  *

## v1.3.24 (2011-09-11)

  *

## v1.3.23 (2011-09-08)

  * Update version of serverside gem for rails 3.1 assets support.

## v1.3.22 (2011-08-09)

  * Patch RestClient to stop sending cookies - they interfere with AWS S3.

## v1.3.21 (2011-08-03)

  * Update README to include more info about the ey.yml config.
  * Suggest ey environments --all when no environments match.
  * Fix an issue with uploading recipe tgz files on windows.

## v1.3.20 (2011-05-27)

  * Start recording the new load_balance_ip_address from the environment API.
  * Fix for deprecated API key "stack_name"

## v1.3.19 (2011-05-23)

  * `ey status` shows most recent deployment status of an app and environment.

## v1.3.18 (2011-05-08)

  * Add --file (-f) option to specify a .tgz file containing the custom cookbooks dirctory.
  * Add --apply option which automatically runs recipes uploaded with `ey recipes upload`.
  * Improve recipes documentation.
  * Alias ey update to ey rebuild to conform to the terminology on the AppCloud dashboard.
  * Improve the documentation in the README file.
  * Send a User-Agent header with all API requests.

## Begin ChangeLog (2011-05-05)
