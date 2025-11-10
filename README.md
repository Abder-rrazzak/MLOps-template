
# MLOps Template | GPU-Ready Python Environment

## 1. Overview

This repository provides a **production-ready MLOps template** optimized for GPU and Python 3.11. It is designed for machine learning and deep learning projects using **PyTorch**, **TensorFlow**, and **Hugging Face**, including CI/CD pipelines, Docker integration, and virtual environment management.

Key benefits:

* **Fast setup** with `virtualenv` and `pip` (no Conda required)
* Pre-configured **Makefile**, **Pytest**, and **Linting**
* GPU-ready Docker workflows for reproducibility
* GitHub Copilot integration for coding assistance

---

## 2. Getting Started

### 2.1 Clone the Repository

```bash
git clone https://github.com/Abder-rrazzak/MLOps-template.git
cd MLOps-template
```

### 2.2 Setup Virtual Environment

```bash
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows
pip install --upgrade pip
make install
```

### 2.3 Verify GPU

```bash
# PyTorch GPU test
python utils/verify_cuda_pytorch.py

# TensorFlow GPU test in container
docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu \
python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000,1000])))"

# NVIDIA driver check
nvidia-smi -l 1
```

---

## 3. Project Structure

```
MLOps-template/
│
├─ hugging-face/                 # Hugging Face scripts
│  ├─ hf_fine_tune_hello_world.py
│  └─ zero_shot_classification.py
│
├─ utils/                        # Utility scripts
│  ├─ verify_cuda_pytorch.py
│  ├─ kw_extract.py
│  └─ quickstart_tf2.py
│
├─ tests/                        # Unit tests for code
│  └─ test_example.py
│
├─ Makefile                       # Automation tasks
├─ Dockerfile                      # Docker configuration
├─ requirements.txt               # Python dependencies
└─ README.md                      # This file
```

---

## 4. Usage Examples

### 4.1 Zero-Shot Classification

```bash
python hugging-face/zero_shot_classification.py classify
```

### 4.2 Keyword Extraction with YAKE

```bash
python utils/kw_extract.py
```

### 4.3 Hugging Face Fine-Tuning

```bash
python hugging-face/hf_fine_tune_hello_world.py
```

### 4.4 BentoML Quickstart

```bash
docker run -it --rm -p 8888:8888 -p 3000:3000 -p 3001:3001 bentoml/quickstart:latest
```

---

## 5. Docker & GPU Integration

### 5.1 Run TensorFlow GPU Container

```bash
docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu /bin/bash
apt-get update && apt-get install -y pciutils git
cd /tmp && make install
python utils/quickstart_tf2.py
```

### 5.2 Deploy TensorFlow Serving Model

```bash
docker run -t --rm -p 8501:8501 \
  -v "RETRIEVAL/MODEL/PATH:/models/retrieval" \
  -e MODEL_NAME=retrieval tensorflow/serving &
```

---

## 6. Features

* CI/CD integration via GitHub Actions
* Automated ML pipelines with Makefile
* GPU-enabled workflows for PyTorch and TensorFlow
* Interactive experimentation with Jupyter and IPython
* Linting and testing included
* GitHub Copilot integration

---

## 7. Contributing Guidelines

We welcome contributions to improve this template.

1. Fork the repository and create a new branch for your feature:

```bash
git checkout -b feature-name
```

2. Commit your changes with clear messages:

```bash
git commit -m "Add new feature or fix"
```

3. Push your branch and create a Pull Request:

```bash
git push origin feature-name
```

4. Ensure all tests pass and code is properly linted.

---

## 8. References

* TensorFlow GPU Documentation: [https://www.tensorflow.org/resources/recommendation-systems](https://www.tensorflow.org/resources/recommendation-systems)
* Practical MLOps: Operationalizing ML Models: [https://www.manning.com/books/practical-mlops](https://www.manning.com/books/practical-mlops)
* Coursera MLOps & Data Engineering Labs: [https://www.coursera.org/](https://www.coursera.org/)

---

## 9. Goals

* Provide a fast, production-ready environment for ML/DL projects
* Standardize MLOps workflows for reproducibility and scalability
* Serve as a learning template for engineers, students, and hobbyists
