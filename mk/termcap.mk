ifeq (${MKTERMCAP},ncurses)
TERMCAP_CFLAGS:=	$(shell pkg-config ncurses --cflags 2> /dev/null)
LTERMCAP:=			$(shell pkg-config ncurses --libs 2> /dev/null)
ifeq ($(LTERMCAP),)
LIBTERMCAP?=	-lncurses
else
LIBTERMCAP?= $(LTERMCAP)
endif
CPPFLAGS+=	-DHAVE_TERMCAP ${TERMCAP_CFLAGS}
LDADD+=		${LIBTERMCAP}
else ifeq (${MKTERMCAP},termcap)
LIBTERMCAP?=	-ltermcap
CPPFLAGS+=	-DHAVE_TERMCAP
LDADD+=		${LIBTERMCAP}
else ifneq (${MKTERMCAP},)
$(error If MKTERMCAP is defined, it must be ncurses or termcap)
endif
