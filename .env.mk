SRC_TESTML := ../testml-tml
SRC_TML_FILES := $(shell find $(SRC_TESTML) -name *.tml \
    | egrep -v 'comments' \
    | grep -v 'data' \
    | grep -v 'external[12]' \
    | grep -v 'syntax2\?' \
    | grep -v 'topic' \
)
