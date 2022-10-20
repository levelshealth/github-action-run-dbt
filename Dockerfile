FROM fishtownanalytics/dbt:0.21.1

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
