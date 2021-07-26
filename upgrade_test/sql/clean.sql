SELECT schema_name, quota_in_mb, nspsize_in_bytes FROM diskquota.show_fast_schema_quota_view WHERE schema_name = 'badquota';
