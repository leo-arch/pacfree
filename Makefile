########################
# Makefile for PacFree #
########################

PREFIX = /usr/bin
PROG = pacfree

install:
	@install -Dm755 "${PROG}" "${PREFIX}"/
	@mkdir -p /usr/share/man/man8
	@install -g 0 -o 0 -Dm644 manpage /usr/share/man/man8/"${PROG}".8
	@gzip /usr/share/man/man8/"${PROG}".8
	@printf "Successfully installed ${PROG}\n"

uninstall:
	@rm "${PREFIX}/${PROG}"
	@rm /usr/share/man/man8/"${PROG}".8.gz
	@printf "Successfully uninstalled ${PROG}\n"
