SERVICE_FILES = ${wildcard service/*}
SOCKET_FILES = ${wildcard socket/*}
TARGET_FILES = ${wildcard target/*}
PATH_FILES = ${wildcard path/*}
SCRIPTS = ${wildcard scripts/*}
TMP_FILES = ${wildcard tmpfiles/*}
MODULES_LOAD_FILES = ${wildcard modules-load/*}

SD_TMPDIR ?= etc/tmpfiles.d
SD_MODULE_LOADDIR ?= etc/modules-load.d
SD_LIBDIR ?= lib/systemd
SD_UNITDIR ?= ${SD_LIBDIR}/system
SD_SCRIPTDIR ?= ${SD_LIBDIR}/scripts

install:
	install -d "${DESTDIR}/${SYSTEMD_LIB_DIR}" "${DESTDIR}/${SD_SCRIPTDIR}" "${DESTDIR}/${SD_UNITDIR}" "${DESTDIR}/${SD_TMPDIR}"
	install -m644 -t "${DESTDIR}/${SD_UNITDIR}" ${SERVICE_FILES} ${SOCKET_FILES} ${TARGET_FILES} ${PATH_FILES}
	install -m755 -t "${DESTDIR}/${SD_SCRIPTDIR}" ${SCRIPTS}
	install -m644 -t "${DESTDIR}/${SD_TMPDIR}" ${TMP_FILES}
	install -m644 -t "${DESTDIR}/${SD_MODULE_LOADDIR}" ${MODULES_LOAD_FILES}
