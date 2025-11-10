# Makefile for MLOps-template

# ------------------------------
# Installation
# ------------------------------
install:
	@echo "Upgrading pip, setuptools, and wheel..."
	pip install --upgrade pip setuptools wheel
	@echo "Installing dependencies from requirements.txt..."
	pip install -r requirements.txt
	@echo "Installing latest Whisper from GitHub..."
	pip install --upgrade --no-deps --force-reinstall git+https://github.com/openai/whisper.git@main

# ------------------------------
# Testing
# ------------------------------
test:
	@echo "Running tests with coverage..."
	python -m pytest -vv --cov=main --cov=mylib test_*.py

# ------------------------------
# Code formatting
# ------------------------------
format:
	@echo "Formatting Python code with black..."
	black *.py utils/*.py hugging-face/*.py

# ------------------------------
# Linting
# ------------------------------
lint:
	@echo "Running pylint with relaxed rules..."
	pylint --disable=R,C,no-member,redefined-outer-name,pointless-statement \
		--ignore-patterns=test_.*?py *.py utils/*.py mylib/*.py hugging-face/*.py

container-lint:
	@echo "Linting Dockerfile..."
	docker run --rm -i hadolint/hadolint < Dockerfile

# ------------------------------
# GPU verification
# ------------------------------
checkgpu:
	@echo "Checking GPU for PyTorch..."
	python utils/verify_cuda_pytorch.py
	@echo "Checking GPU for TensorFlow..."
	python utils/quickstart_tf2.py

# ------------------------------
# Refactor (format + lint)
# ------------------------------
refactor: format lint

# ------------------------------
# Deployment placeholder
# ------------------------------
deploy:
	@echo "Deployment steps go here..."

# ------------------------------
# All-in-one
# ------------------------------
all: install lint test format deploy
