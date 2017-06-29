.DEFAULT_GOAL := help

PROJECT_NAME := VPN

.PHONY: help
help:
	@echo "------------------------------------------------------------------------"
	@echo "${PROJECT_NAME}"
	@echo "------------------------------------------------------------------------"
	@grep -E '^[a-zA-Z0-9_/%\-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: start
start: ## start vpn server
	@terraform validate terraform/
	@terraform plan terraform/
	@terraform apply terraform/

.PHONY: stop
stop: ## stop vpn server
	@terraform destroy -force terraform/
