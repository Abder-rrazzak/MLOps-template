🚀 MLOps Template | GPU-Ready Python Environment










🎯 Overview

A ready-to-use MLOps template optimized for GPU, Python 3.11, and production workflows.
Perfect for ML/DL development with PyTorch, TensorFlow, or Hugging Face, including CI/CD and Dockerized workflows.

No Conda needed: setup via virtualenv and pip

Pre-configured Makefile, Pytest, Linting (Pylint/Ruff)

Docker GPU ready

GitHub Copilot supported for intelligent code suggestions

🛠️ Quick Start
1. Setup Virtual Environment
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows
pip install --upgrade pip
make install

2. Verify GPU
# PyTorch GPU test
python utils/verify_cuda_pytorch.py

# TensorFlow GPU test in container
docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu \
python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000,1000])))"

# NVIDIA driver check
nvidia-smi -l 1

📚 Examples
Zero-Shot Classification
python hugging-face/zero_shot_classification.py classify

Keyword Extraction (YAKE)
python utils/kw_extract.py

Hugging Face Fine-Tuning
python hugging-face/hf_fine_tune_hello_world.py

BentoML Quickstart
docker run -it --rm -p 8888:8888 -p 3000:3000 -p 3001:3001 bentoml/quickstart:latest

🐳 Docker & GPU Integration

Run TensorFlow container interactively:

docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu /bin/bash
apt-get update && apt-get install -y pciutils git
cd /tmp && make install
python utils/quickstart_tf2.py


Deploy a TensorFlow Serving model:

docker run -t --rm -p 8501:8501 \
  -v "RETRIEVAL/MODEL/PATH:/models/retrieval" \
  -e MODEL_NAME=retrieval tensorflow/serving &

⚡ Features

CI/CD with GitHub Actions

Makefile tasks for reproducible ML pipelines

GPU-enabled workflows for PyTorch and TensorFlow

Jupyter & IPython for interactive experiments

Linting & testing included

GitHub Copilot integration

📖 References

TensorFlow GPU Documentation

Practical MLOps: Operationalizing ML Models

Coursera MLOps & Data Engineering Labs

🎯 Goals

Quick setup for ML/DL projects with GPU

Standardized production-ready MLOps workflow

Learning template for engineers, students, and hobbyists
