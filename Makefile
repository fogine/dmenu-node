ifndef PREFIX
  PREFIX=/usr/local
endif

install:
	install -Dm755 dmenu-node $(DESTDIR)$(PREFIX)/bin/dmenu-node
	install -Dm644 README.md $(DESTDIR)$(PREFIX)/share/doc/dmenu-node/README.md
