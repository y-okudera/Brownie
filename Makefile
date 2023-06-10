.PHONY: help
help: ## Show this usage
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: setup
setup: ## setup
	brew install needle

.PHONY: di
di: ## di
	export SOURCEKIT_LOGGING=0 && needle generate ./Brownie/Generated/NeedleGenerated.swift Brownie Packages
