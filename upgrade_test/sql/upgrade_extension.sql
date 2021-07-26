\! install_new_version_diskquota
\! echo install_new_version_diskquota
\! echo $NEW_VERSION
\set new_version `echo $NEW_VERSION`
alter extension diskquota update to :'new_version';
\! gpstop -raf > /dev/null
