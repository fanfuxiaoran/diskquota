\! install_new_version_diskquota
\set new_version `echo $NEW_VERSION`
\! gpstop -raf > /dev/null
alter extension diskquota update to :'new_version';
