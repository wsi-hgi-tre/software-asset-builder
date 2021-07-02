IMG = ibd-imputation
SRC = IBD_Imputation.tar.gz
DEB = $(IMG).deb

all: $(DEB)

$(DEB): Dockerfile control $(SRC)
	docker build -t $(IMG) .
	CONTAINER="$$(docker create $(IMG))"; \
	docker cp "$${CONTAINER}:/working/$@" .; \
	docker rm "$${CONTAINER}"

$(SRC):
	@echo "Source does not exist; please contact the Martin Faculty." >&2
	@exit 1

clean:
	rm -f "$(DEB)"
	docker rmi -f $(IMG)

.PHONY: all clean
