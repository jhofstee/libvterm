INCLUDEPATH += $$PWD/include

HEADERS += \
	$$PWD/src/fullwidth.inc \
	$$PWD/src/rect.h \
	$$PWD/src/utf8.h \
	$$PWD/src/vterm_internal.h \

SOURCES += \
	$$PWD/src/encoding.c \
	$$PWD/src/keyboard.c \
	$$PWD/src/mouse.c \
	$$PWD/src/parser.c \
	$$PWD/src/pen.c \
	$$PWD/src/screen.c \
	$$PWD/src/state.c \
	$$PWD/src/unicode.c \
	$$PWD/src/vterm.c

QMAKE_EXTRA_TARGETS += precmd
PRE_TARGETDEPS += precmd

precmd.input = $$PWD/tbl2inc_c.pl $$PWD/src/include/encoding/DECdrawing.tbl $$PWD/src/encoding/uk.tbl
precmd.output = $$PWD/src/include/encoding/DECdrawing.inc $$PWD/src/encoding/uk.inc
precmd.commands = perl -CSD $$PWD/tbl2inc_c.pl $$PWD/src/encoding/DECdrawing.tbl > $$PWD/src/encoding/DECdrawing.inc && \
				  perl -CSD $$PWD/tbl2inc_c.pl $$PWD/src/encoding/uk.tbl > $$PWD/src/encoding/uk.inc
