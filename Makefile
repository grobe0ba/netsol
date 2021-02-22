# Copyright (c) 2021 B. Atticus Grobe (grobe0ba@gmail.com)
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

.PHONY: all clean

all: screen.jcl

screen.jcl: screen.asm screen.m4 Makefile
	m4 -P screen.m4 > screen.jcl

screen.asm: screen mknetsol Makefile
	./mknetsol < screen > screen.asm

screen: Makefile
	figlet -c -w 80 -f calgphy2 MVS | sed -e '/^[[:blank:]]*$$/d;/^$$/d' > screen
	echo "MVS 3.8j build 8050" | fmt -80 -c >> screen

clean:
	rm -f screen screen.asm screen.jcl
