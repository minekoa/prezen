ELM_MAKE=elm-make
ELM_PACKAGE=elm-package

SRC_DIR=src
OUT_DIR=doc
BOOK_DIR=Books

.PHONY: all env compile release clean


all: release

env:
	$(ELM_PACKAGE) install

$(OUT_DIR)/Main.js: $(SRC_DIR)/Main.elm $(BOOK_DIR)/ElmerAndTheDragon.elm $(BOOK_DIR)/CppWay1z.elm
	$(ELM_MAKE) $(SRC_DIR)/Main.elm --output $(OUT_DIR)/Main.js


release: $(OUT_DIR)/Main.js

clean:
	rm -rf $(OUT_DIR)

