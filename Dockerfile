FROM ghcr.io/dbt-labs/dbt-snowflake:1.9.0

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
