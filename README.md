# github-action-run-dbt

Github action to run dbt with the official docker file.

Inspired by https://github.com/mwhitaker/dbt-action, but
* removed unnecessary package install in docker to shave down start up time
* simplify all the password handling (dbt now can use env_var directly)
* use a single env var DBT_ROOT instead of having to specify dbt working directory for each step
