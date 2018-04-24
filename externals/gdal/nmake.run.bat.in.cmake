
call "${VCVARSALL_BAT} amd64"

cd "${SOURCE_DIR}"

#nmake /f makefile.vc EXT_NMAKE_OPT="${NMAKE_OPT}" clean
nmake /f makefile.vc EXT_NMAKE_OPT="${NMAKE_OPT}"
nmake /f makefile.vc EXT_NMAKE_OPT="${NMAKE_OPT}" install
nmake /f makefile.vc EXT_NMAKE_OPT="${NMAKE_OPT}" devinstall

copy /B /Y "${COPY_LIB_SOURCE}" "${COPY_LIB_TARGET}"
copy /B /Y "${COPY_DLL_SOURCE}" "${COPY_DLL_TARGET}"

