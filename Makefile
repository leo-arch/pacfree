PREFIX = /usr/local/bin
PROG = pacfree

install:
	@install -Dm755 "${PROG}" "${PREFIX}"/
	@printf "Successfully installed ${PROG}\n"

uninstall:
	@rm "${PREFIX}/${PROG}"
	@printf "Successfully uninstalled ${PROG}\n"
