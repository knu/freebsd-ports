define(`confEBINDIR',`%%PREFIX%%/libexec')
define(`confMANROOT',`%%PREFIX%%/man/man')
define(`confMANROOTMAN',`%%PREFIX%%/man/man')
define(`confUBINDIR',`%%PREFIX%%/bin')
define(`confINCLUDEDIR',`%%PREFIX%%/include')
define(`confLIBDIR',`%%PREFIX%%/lib')
define(`confSHAREDLIBDIR',`%%PREFIX%%/lib')
define(`confDONT_INSTALL_CATMAN',`True')
%%STATIC%%APPENDDEF(`confLIBS', `-static ')
%%BDB%%APPENDDEF(`confLIBDIRS', `-L%%BDB_LIB_DIR%% ')
%%BDB%%APPENDDEF(`confINCDIRS', `-I%%BDB_INCLUDE_DIR%% ')
%%BDB%%APPENDDEF(`confLIBS', `-l%%BDB_LIB_NAME%% ')
%%OPENSSL%%APPENDDEF(`confLIBDIRS', `-L%%OPENSSLLIB%% ')
%%OPENSSL%%APPENDDEF(`confINCDIRS', `-I%%OPENSSLINC%% ')
%%LIBTRE%%APPENDDEF(`confINCDIRS', `-I%%LOCALBASE%%/include/tre ')
%%LIBTRE%%APPENDDEF(`confLIBDIRS', `-L%%LOCALBASE%%/lib ')
%%LIBTRE%%APPENDDEF(`confLIBS', `-ltre ')
%%STATIC%%%%LIBTRE%%APPENDDEF(`confLIBS', `-lintl -liconv ')
