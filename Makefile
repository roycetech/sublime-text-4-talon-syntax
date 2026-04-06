# @Purpose:
# 	This Makefile simplifies the build workflow.
#
# @Created: Mon, Apr 06, 2026, at 11:05:02 AM

CURRENT_BUILD=$(shell ./set_build_number.sh)

check:
	@echo "Build Number: $(CURRENT_BUILD)"


tag:
	# Perform a release of a new version.
	@if git rev-parse -q --verify "refs/tags/$(CURRENT_BUILD)" >/dev/null 2>&1; then \
		echo "Tag $(CURRENT_BUILD) already exists locally; skipping."; \
	elif git ls-remote origin "refs/tags/$(CURRENT_BUILD)" 2>/dev/null | grep -q .; then \
		echo "Tag $(CURRENT_BUILD) already exists on origin; skipping."; \
	else \
		git tag "$(CURRENT_BUILD)" && \
		git push origin "$(CURRENT_BUILD)"; \
	fi

.PHONY: check build tag