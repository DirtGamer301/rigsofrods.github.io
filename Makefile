LINGUAS="cs de fr ru"
FOLDERS="content"

server: clean translate
	bundle exec middleman server --verbose

build: clean translate
	rm -rf build/*
	bundle exec middleman build

clean: clean-po
	rm -rf build/* source/localizable/download

clean-po:
	find content/po | grep ".po~" | xargs rm -f

translate:
	utils/po4a-bulk-translate content/source asciidoc adoc content/po source/localizable $(LINGUAS)
	utils/copy_en.sh

gettextize:
	rm -rf content/pot/*
	utils/po4a-bulk-gettextize content/source asciidoc adoc content/pot

updatepo:
	utils/create_locales.sh $(LINGUAS) $(FOLDERS)
	utils/po4a-bulk-updatepo content/source asciidoc adoc content/po $(LINGUAS)
	make clean-po
