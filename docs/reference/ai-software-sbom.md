# AI Software Stack - SBOM (Software Bill of Materials)

Comprehensive Software Bill of Materials for AI/ML application stacks across different deployment scenarios and technology choices.

## Overview

This document provides SBOM information for **15 deployment stack patterns** covering:
- **Agent Frameworks** (LangChain, LlamaIndex, Haystack)
- **Enterprise Platforms** (OPEA, OpenShift AI, NVIDIA AI Enterprise)
- **LLM Provider Integrations** (OpenAI, Azure, AWS Bedrock, Anthropic)
- **Observability Stacks** (LangSmith, Phoenix, Prometheus+Grafana)
- **ML Runtime Stacks** (PyTorch, TensorFlow, vLLM, TensorRT)
- **Security Stacks** (5 patterns from open-source to hybrid multi-cloud)

Use this for:
- **Supply Chain Security**: Track all dependencies and their licenses
- **Vulnerability Management**: Monitor for CVEs in dependencies  
- **Compliance**: License compliance (OSS vs proprietary)
- **Procurement**: Vendor relationship management

**Last Updated**: December 7, 2025

---

## SBOM Format

Each stack includes:
- **Component Name & Version**
- **License** (SPDX identifier where applicable)
- **Primary Language/Runtime**
- **Key Dependencies**
- **CVE Monitoring** (where to check for vulnerabilities)

---

## PART 1: Agent Framework Stacks

### Stack AF-1: LangChain RAG Application

**Use Case**: RAG application with LangChain + vector DB  
**Monthly Cost**: $0-$500 (self-hosted) or $100-$2K (cloud)  
**Deployment**: Docker/Kubernetes or Cloud

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **LangChain** | 0.3.x | MIT | Python 3.9+ | Pydantic, SQLAlchemy, requests | PyPI, Snyk, GitHub |
| **LangGraph** | 0.2.x | MIT | Python 3.9+ | LangChain, networkx | PyPI, Snyk |
| **OpenAI Python SDK** | 1.x | Apache-2.0 | Python 3.8+ | httpx, pydantic, typing-extensions | PyPI, Snyk |
| **Chroma** | 0.5.x | Apache-2.0 | Python 3.8+ | FastAPI, SQLAlchemy, numpy | PyPI, GitHub |
| **Streamlit** | 1.35+ | Apache-2.0 | Python 3.8+ | pandas, numpy, tornado | PyPI, Snyk |

#### Dependencies File (requirements.txt)
```plaintext
langchain==0.3.0
langchain-openai==0.2.0
langchain-community==0.3.0
langgraph==0.2.0
chromadb==0.5.0
streamlit==1.35.0
pydantic==2.7.0
```

#### Total Dependencies
- **Python Packages**: ~80 (transitively)
- **License Risk**: **Low** (MIT, Apache-2.0)

---

### Stack AF-2: LlamaIndex RAG Application

**Use Case**: Data-heavy RAG with 160+ connectors  
**Monthly Cost**: $0-$500 (self-hosted) + LLM API costs  
**Deployment**: Self-hosted

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **LlamaIndex** | 0.11.x | MIT | Python 3.9+ | openai, tiktoken, nest-asyncio | PyPI, Snyk, GitHub |
| **LlamaIndex Core** | 0.11.x | MIT | Python 3.9+ | Pydantic, SQLAlchemy | PyPI, Snyk |
| **Pinecone Client** | 3.x | Apache-2.0 | Python 3.8+ | requests, urllib3 | PyPI, Snyk |
| **FastAPI** | 0.111.x | MIT | Python 3.8+ | pydantic, starlette, uvicorn | PyPI, Snyk |

#### Dependencies File (requirements.txt)
```plaintext
llama-index==0.11.0
llama-index-vector-stores-pinecone==0.2.0
llama-index-embeddings-openai==0.2.0
llama-index-llms-openai==0.2.0
pinecone-client==3.2.0
fastapi==0.111.0
uvicorn[standard]==0.29.0
```

#### Total Dependencies
- **Python Packages**: ~70 (transitively)
- **License Risk**: **Low** (MIT, Apache-2.0)

---

### Stack AF-3: Haystack Search Pipeline

**Use Case**: Production search + QA system  
**Monthly Cost**: $0-$500 (self-hosted)  
**Deployment**: Docker/Kubernetes

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **Haystack** | 2.x | Apache-2.0 | Python 3.8+ | transformers, sentence-transformers | PyPI, Snyk, GitHub |
| **Elasticsearch** | 8.x | SSPL/Elastic License | Java | N/A (standalone) | Elastic Security |
| **Transformers** | 4.40+ | Apache-2.0 | Python 3.8+ | torch, numpy, tokenizers | PyPI, Snyk |
| **Gradio** | 4.x | Apache-2.0 | Python 3.8+ | fastapi, pydantic, httpx | PyPI, Snyk |

#### Dependencies File (requirements.txt)
```plaintext
haystack-ai==2.3.0
transformers==4.40.0
sentence-transformers==3.0.0
elasticsearch==8.13.0
gradio==4.31.0
```

#### Total Dependencies
- **Python Packages**: ~90 (transitively)
- **External Services**: Elasticsearch (SSPL license)
- **License Risk**: **Medium** (SSPL requires attention)

---

## PART 2: Enterprise Platform Stacks

### Stack EP-1: OPEA GenAI Microservices

**Use Case**: Vendor-neutral GenAI application  
**Monthly Cost**: Infrastructure costs only ($500-$5K)  
**Deployment**: Kubernetes

| Component | Version | License | Deployment | Container Image | CVE Source |
|-----------|---------|---------|------------|-----------------|------------|
| **OPEA MegaService** | Latest | Apache-2.0 | Deployment | opea/megaservice:latest | Trivy, Grype |
| **TGI (Text Generation Inference)** | Latest | Apache-2.0 | Deployment | ghcr.io/huggingface/text-generation-inference | Trivy, Grype |
| **TEI (Text Embeddings Inference)** | Latest | Apache-2.0 | Deployment | ghcr.io/huggingface/text-embeddings-inference | Trivy, Grype |
| **Redis** | 7.x | BSD-3-Clause | StatefulSet | redis:7-alpine | Trivy, Grype |
| **NGINX** | 1.25+ | BSD-2-Clause | Deployment | nginx:1.25-alpine | Trivy, Grype |

#### Kubernetes Dependencies (Helm)
```yaml
# Chart.yaml
dependencies:
  - name: redis
    version: 19.0.0
    repository: https://charts.bitnami.com/bitnami
```

#### Total Dependencies
- **Container Images**: 5-8
- **Kubernetes Resources**: 15-25 manifests
- **License Risk**: **Low** (Apache-2.0, BSD)

---

### Stack EP-2: OpenShift AI MLOps

**Use Case**: Enterprise Kubernetes MLOps  
**Monthly Cost**: $5K-$20K (OpenShift subscription)  
**Deployment**: Red Hat OpenShift

| Component | Version | License | Deployment | Dependencies | CVE Source |
|-----------|---------|---------|------------|--------------|------------|
| **OpenShift AI** | 2.x | Proprietary | Operator | OpenShift 4.14+ | Red Hat Security |
| **Kubeflow Pipelines** | 2.x | Apache-2.0 | Operator | Kubernetes | GitHub, Snyk |
| **KServe** | 0.13.x | Apache-2.0 | Operator | Knative, Istio | GitHub, Snyk |
| **Jupyter Notebooks** | Latest | BSD-3-Clause | Deployment | JupyterHub | GitHub, PyPI |
| **MLflow** | 2.x | Apache-2.0 | Deployment | Flask, SQLAlchemy | PyPI, Snyk |

#### Total Dependencies
- **Operators**: 3-5 (OpenShift Operators)
- **Python SDK Packages**: ~100 (workbench environments)
- **License Risk**: **Low** (Apache-2.0, BSD)

---

### Stack EP-3: NVIDIA AI Enterprise

**Use Case**: GPU-optimized AI inference  
**Monthly Cost**: $2.25/GPU/hour (A100) + license  
**Deployment**: On-prem or Cloud (NVIDIA-Certified Systems)

| Component | Version | License | Runtime | Dependencies | CVE Source |
|-----------|---------|---------|---------|--------------|------------|
| **NVIDIA AI Enterprise** | 5.x | Proprietary | Host | CUDA 12.x, Driver 550+ | NVIDIA Security |
| **TensorRT** | 10.x | Proprietary | Library | CUDA, cuDNN | NVIDIA Security |
| **Triton Inference Server** | 2.45+ | BSD-3-Clause | Container | CUDA, TensorRT | NVIDIA Security, GitHub |
| **NIM (NVIDIA Inference Microservices)** | Latest | Proprietary | Container | TensorRT, Triton | NVIDIA Security |
| **CUDA** | 12.x | Proprietary | Driver | N/A | NVIDIA Security |

#### Container Dependencies
```bash
# Pull NVIDIA containers
nvcr.io/nvidia/tritonserver:24.05-py3
nvcr.io/nvidia/tensorrt:24.05-py3
nvcr.io/nvidia/cuda:12.4.0-runtime-ubuntu22.04
```

#### Total Dependencies
- **System Libraries**: CUDA toolkit, cuDNN, TensorRT
- **Container Images**: 3-5 (NVIDIA Container Registry)
- **License Risk**: **High** (Proprietary - requires NVIDIA AI Enterprise license)

---

## PART 3: LLM Provider Integration Stacks

### Stack LLM-1: OpenAI Integration

**Use Case**: OpenAI API integration  
**Monthly Cost**: API usage only ($0.03-$30/1M tokens)  
**Deployment**: Any

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **OpenAI Python SDK** | 1.x | Apache-2.0 | Python 3.8+ | httpx, pydantic, anyio | PyPI, Snyk, GitHub |
| **tiktoken** | 0.7.x | MIT | Python 3.8+ | regex, requests | PyPI, Snyk |

#### Dependencies
```plaintext
openai==1.30.0
tiktoken==0.7.0
```

#### Total Dependencies
- **Python Packages**: ~15 (transitively)
- **License Risk**: **Low** (Apache-2.0, MIT)

---

### Stack LLM-2: Azure OpenAI Integration

**Use Case**: Azure OpenAI Service integration  
**Monthly Cost**: Same as OpenAI pricing + Azure egress  
**Deployment**: Azure Cloud recommended

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **Azure OpenAI SDK** | 1.x | MIT | Python 3.8+ | openai, azure-core, azure-identity | PyPI, Snyk |
| **Azure Identity** | 1.16.x | MIT | Python 3.8+ | msal, cryptography | PyPI, Snyk |

#### Dependencies
```plaintext
azure-identity==1.16.0
openai==1.30.0
azure-core==1.30.0
```

#### Total Dependencies
- **Python Packages**: ~25 (transitively)
- **License Risk**: **Low** (MIT)

---

### Stack LLM-3: Amazon Bedrock Integration

**Use Case**: AWS Bedrock models (Claude, Llama, Titan)  
**Monthly Cost**: $0.002-$0.08/1K tokens  
**Deployment**: AWS Cloud

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **Boto3** | 1.34.x | Apache-2.0 | Python 3.7+ | botocore, jmespath, urllib3 | PyPI, Snyk, AWS |
| **LangChain AWS** | 0.2.x | MIT | Python 3.9+ | boto3, langchain-core | PyPI, Snyk |

#### Dependencies
```plaintext
boto3==1.34.100
langchain-aws==0.2.0
langchain-community==0.3.0
```

#### Total Dependencies
- **Python Packages**: ~30 (transitively)
- **License Risk**: **Low** (Apache-2.0, MIT)

---

### Stack LLM-4: Anthropic Claude Integration

**Use Case**: Claude API integration  
**Monthly Cost**: $3-$75/1M tokens  
**Deployment**: Any

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **Anthropic Python SDK** | 0.26.x | MIT | Python 3.8+ | httpx, pydantic, typing-extensions | PyPI, Snyk, GitHub |

#### Dependencies
```plaintext
anthropic==0.26.0
```

#### Total Dependencies
- **Python Packages**: ~12 (transitively)
- **License Risk**: **Low** (MIT)

---

## PART 4: Observability Stacks

### Stack OBS-1: LangSmith + LangChain

**Use Case**: LangChain tracing and evaluation  
**Monthly Cost**: $39-$399/month (LangSmith cloud)  
**Deployment**: Cloud SaaS

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **LangChain** | 0.3.x | MIT | Python 3.9+ | langsmith, pydantic | PyPI, Snyk |
| **LangSmith SDK** | 0.1.x | MIT | Python 3.9+ | requests, orjson | PyPI, Snyk |

#### Dependencies
```plaintext
langchain==0.3.0
langsmith==0.1.80
```

#### Total Dependencies
- **Python Packages**: ~85 (with LangChain)
- **License Risk**: **Low** (MIT)

---

### Stack OBS-2: Phoenix (Arize OSS)

**Use Case**: Self-hosted LLM observability  
**Monthly Cost**: $0 (open source)  
**Deployment**: Self-hosted (Docker)

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **Phoenix** | Latest | Apache-2.0 | Python 3.8+ | FastAPI, SQLAlchemy, pandas | PyPI, Snyk, GitHub |
| **PostgreSQL** | 16.x | PostgreSQL License | N/A | N/A | PostgreSQL Security |

#### Dependencies
```plaintext
arize-phoenix==4.10.0
fastapi==0.111.0
sqlalchemy==2.0.30
```

#### Total Dependencies
- **Python Packages**: ~50 (transitively)
- **External Services**: PostgreSQL (optional)
- **License Risk**: **Low** (Apache-2.0)

---

### Stack OBS-3: Prometheus + Grafana

**Use Case**: Infrastructure and model metrics  
**Monthly Cost**: $0 (open source)  
**Deployment**: Kubernetes

| Component | Version | License | Deployment | Container Image | CVE Source |
|-----------|---------|---------|------------|-----------------|------------|
| **Prometheus** | 2.52.x | Apache-2.0 | StatefulSet | prom/prometheus:v2.52.0 | Trivy, Grype, GitHub |
| **Grafana** | 11.x | AGPL-3.0 | Deployment | grafana/grafana:11.0.0 | Trivy, Grype, GitHub |
| **Prometheus Python Client** | 0.20.x | Apache-2.0 | Library | N/A | PyPI, Snyk |

#### Kubernetes Dependencies (Helm)
```yaml
# Install via Helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack
```

#### Total Dependencies
- **Container Images**: 6-10 (Prometheus, Grafana, exporters)
- **Helm Charts**: 1 (kube-prometheus-stack)
- **License Risk**: **Medium** (AGPL-3.0 for Grafana)

---

## PART 5: ML Runtime Stacks

### Stack ML-1: PyTorch Training & Inference

**Use Case**: Model training and inference  
**Monthly Cost**: Infrastructure only  
**Deployment**: GPU instances

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **PyTorch** | 2.3.x | BSD-3-Clause | Python 3.8+ | numpy, typing-extensions | PyPI, Snyk, GitHub |
| **Transformers** | 4.40.x | Apache-2.0 | Python 3.8+ | torch, tokenizers, huggingface-hub | PyPI, Snyk |
| **Accelerate** | 0.30.x | Apache-2.0 | Python 3.8+ | torch, numpy, pyyaml | PyPI, Snyk |

#### Dependencies
```plaintext
torch==2.3.0
torchvision==0.18.0
transformers==4.40.0
accelerate==0.30.0
```

#### Total Dependencies
- **Python Packages**: ~40 (transitively)
- **System Requirements**: CUDA 12.1+ (for GPU)
- **License Risk**: **Low** (BSD, Apache-2.0)

---

### Stack ML-2: TensorFlow Inference

**Use Case**: TensorFlow model serving  
**Monthly Cost**: Infrastructure only  
**Deployment**: CPU or GPU

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **TensorFlow** | 2.16.x | Apache-2.0 | Python 3.9+ | numpy, protobuf, keras | PyPI, Snyk, GitHub |
| **TensorFlow Serving** | 2.16.x | Apache-2.0 | Container | N/A (C++) | Docker Hub, Trivy |

#### Dependencies
```plaintext
tensorflow==2.16.1
tensorflow-serving-api==2.16.1
```

#### Total Dependencies
- **Python Packages**: ~50 (transitively)
- **Container Image**: tensorflow/serving:2.16.1
- **License Risk**: **Low** (Apache-2.0)

---

### Stack ML-3: vLLM Inference Server

**Use Case**: High-throughput LLM inference  
**Monthly Cost**: Infrastructure only  
**Deployment**: GPU instances (NVIDIA A100/H100)

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **vLLM** | 0.4.x | Apache-2.0 | Python 3.8+ | torch, transformers, ray | PyPI, Snyk, GitHub |
| **Ray** | 2.10.x | Apache-2.0 | Python 3.8+ | numpy, protobuf, aiohttp | PyPI, Snyk |

#### Dependencies
```plaintext
vllm==0.4.2
ray[default]==2.10.0
transformers==4.40.0
```

#### Total Dependencies
- **Python Packages**: ~100 (transitively)
- **System Requirements**: CUDA 12.1+, NVIDIA GPU
- **License Risk**: **Low** (Apache-2.0)

---

### Stack ML-4: TensorRT-LLM (NVIDIA)

**Use Case**: Optimized NVIDIA GPU inference  
**Monthly Cost**: Infrastructure + NVIDIA AI Enterprise license (optional)  
**Deployment**: NVIDIA GPU instances

| Component | Version | License | Runtime | Dependencies | CVE Source |
|-----------|---------|---------|---------|--------------|------------|
| **TensorRT-LLM** | 0.10.x | Apache-2.0 | Container | CUDA 12.4, TensorRT 10.0 | NVIDIA Security, GitHub |
| **Triton Inference Server** | 2.45.x | BSD-3-Clause | Container | CUDA, TensorRT | NVIDIA Security |

#### Container Dependencies
```bash
nvcr.io/nvidia/tritonserver:24.05-trtllm-python-py3
```

#### Total Dependencies
- **Container Images**: 1-2 (NVIDIA Container Registry)
- **System Requirements**: CUDA 12.4+, TensorRT 10.0+
- **License Risk**: **Low** (Apache-2.0, BSD for open parts; Proprietary for TensorRT/CUDA)

---

## PART 6: Security Stacks

### Stack SEC-1: Open-Source Foundation (Minimal Budget)

**Use Case**: Startups, self-hosted, full control  
**Monthly Cost**: $0-$500  
**Deployment**: Self-hosted (Docker/Kubernetes)

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **NVIDIA NeMo Guardrails** | Latest | Apache-2.0 | Python 3.8+ | LangChain, Pydantic, YAML | GitHub Security Advisories |
| **LangChain** | Latest | MIT | Python 3.8+ | Pydantic, SQLAlchemy, Requests | Snyk, GitHub |
| **HashiCorp Vault** | 1.15+ | MPL-2.0 | Go | None (static binary) | HashiCorp Security |
| **Phoenix (Arize)** | Latest | Apache-2.0 | Python 3.8+ | FastAPI, SQLAlchemy, Pandas | GitHub Security Advisories |
| **LLM Guard** | Latest | MIT | Python 3.9+ | Transformers, ONNX, spaCy | GitHub Security Advisories |

### Total Dependencies Summary
- **Python Packages**: ~50 (transitively)
- **System Libraries**: Standard (no special requirements)
- **Containers**: 3-5 Docker images
- **License Risk**: **Low** (all OSS-permissive)

### SBOM Export Commands
```bash
# Generate Python dependencies SBOM
pip install pip-audit
pip-audit --format json > sbom-python.json

# SPDX format
pip install spdx-tools
pip-licenses --format=json | python -m spdx_tools.spdx.to_sbom > sbom.spdx

# CycloneDX format
pip install cyclonedx-bom
cyclonedx-py -r requirements.txt -o sbom.xml
```

---

### Stack SEC-2: Azure-Native (Enterprise)

**Use Case**: Azure OpenAI users, Microsoft ecosystem  
**Monthly Cost**: $1K-$5K  
**Deployment**: Azure Cloud

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **Microsoft Entra ID** | Cloud | Proprietary | N/A (SaaS) | N/A | Microsoft Security Response Center |
| **Azure Key Vault** | Cloud | Proprietary | N/A (SaaS) | N/A | Microsoft Security Response Center |
| **Azure Content Safety** | Cloud | Proprietary | N/A (SaaS) | N/A | Microsoft Security Response Center |
| **Azure Monitor** | Cloud | Proprietary | N/A (SaaS) | N/A | Microsoft Security Response Center |
| **Azure OpenAI SDK** | 1.x | MIT | Python 3.8+ | openai, azure-identity, requests | PyPI, Snyk |
| **Azure Identity SDK** | 1.15+ | MIT | Python 3.8+ | cryptography, msal, requests | PyPI, Snyk |

### Client-Side Dependencies (Python SDK)
```plaintext
azure-identity==1.15.0
azure-keyvault-secrets==4.7.0
azure-monitor-opentelemetry==1.2.0
openai==1.10.0
```

### Total Dependencies Summary
- **Azure Services**: 5 (managed by Microsoft)
- **Python SDK Packages**: ~20 (client-side)
- **License Risk**: **Low** (Azure SDKs are MIT)

### SBOM Export Commands
```bash
# Generate SBOM for Azure Python dependencies
pip install azure-cli-core
pip list --format=json | jq '.[] | select(.name | startswith("azure"))' > azure-sbom.json

# CycloneDX with Azure packages
cyclonedx-py -r requirements-azure.txt -o azure-sbom.xml
```

---

### Stack SEC-3: AWS-Native (Cloud-First)

**Use Case**: Amazon Bedrock users, AWS-centric  
**Monthly Cost**: $1K-$5K  
**Deployment**: AWS Cloud

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **AWS IAM** | Cloud | Proprietary | N/A (SaaS) | N/A | AWS Security Bulletins |
| **AWS Secrets Manager** | Cloud | Proprietary | N/A (SaaS) | N/A | AWS Security Bulletins |
| **Amazon Bedrock Guardrails** | Cloud | Proprietary | N/A (SaaS) | N/A | AWS Security Bulletins |
| **AWS GuardDuty** | Cloud | Proprietary | N/A (SaaS) | N/A | AWS Security Bulletins |
| **AWS CloudWatch** | Cloud | Proprietary | N/A (SaaS) | N/A | AWS Security Bulletins |
| **Boto3 (AWS SDK)** | 1.34+ | Apache-2.0 | Python 3.7+ | botocore, urllib3, requests | PyPI, Snyk |

### Client-Side Dependencies (Python SDK)
```plaintext
boto3==1.34.0
botocore==1.34.0
awscli==1.32.0
```

### Total Dependencies Summary
- **AWS Services**: 5 (managed by AWS)
- **Python SDK Packages**: ~15 (client-side)
- **License Risk**: **Low** (AWS SDKs are Apache-2.0)

### SBOM Export Commands
```bash
# Generate SBOM for AWS Python dependencies
pip list --format=json | jq '.[] | select(.name | contains("boto") or contains("aws"))' > aws-sbom.json

# Full SBOM with AWS dependencies
cyclonedx-py -r requirements-aws.txt -o aws-sbom.xml
```

---

### Stack SEC-4: Hybrid Multi-Cloud (Enterprise)

**Use Case**: Multi-cloud, vendor flexibility  
**Monthly Cost**: $5K-$20K  
**Deployment**: Mixed (cloud + self-hosted)

| Component | Version | License | Language | Key Dependencies | CVE Source |
|-----------|---------|---------|----------|------------------|------------|
| **NVIDIA NeMo Guardrails** | Latest | Apache-2.0 | Python 3.8+ | LangChain, Pydantic | GitHub |
| **Okta** | Cloud | Proprietary | N/A (SaaS) | N/A | Okta Trust |
| **HashiCorp Vault** | 1.15+ | MPL-2.0 | Go | None | HashiCorp Security |
| **Snyk** | Cloud | Proprietary | N/A (SaaS) | N/A | Snyk Security |
| **LangSmith** | Cloud | Proprietary | N/A (SaaS) | N/A | LangChain Security |
| **Private AI** | Cloud/Self | Proprietary | Python | Transformers, spaCy | Private AI Security |
| **Arize AI** | Cloud | Proprietary | N/A (SaaS) | N/A | Arize Security |

### Client-Side Dependencies
```plaintext
langchain==0.1.0
langsmith==0.1.0
nemoguardrails==0.8.0
okta-sdk-python==2.9.0
hvac==2.1.0  # HashiCorp Vault client
arize==7.10.0
```

### Total Dependencies Summary
- **Cloud Services**: 5 (managed)
- **Self-Hosted**: 2 (NeMo, Vault)
- **Python Packages**: ~60 (transitively)
- **License Mix**: OSS + Proprietary
- **License Risk**: **Medium** (mixed licenses)

### SBOM Export Commands
```bash
# Comprehensive SBOM for hybrid stack
pip-audit --format cyclonedx-json > hybrid-sbom.json

# Full dependency tree
pipdeptree --json > dependency-tree.json

# License report
pip-licenses --format=markdown > licenses.md
```

---

### Stack SEC-5: Kubernetes-Native (Container Platform)

**Use Case**: AKS, EKS, GKE deployments  
**Monthly Cost**: $2K-$10K  
**Deployment**: Kubernetes

| Component | Version | License | Deployment | Container Image | CVE Source |
|-----------|---------|---------|------------|-----------------|------------|
| **NVIDIA NeMo Guardrails** | 0.8+ | Apache-2.0 | Deployment | nvcr.io/nvidia/nemo-guardrails | Trivy, Grype |
| **HashiCorp Vault** | 1.15+ | MPL-2.0 | StatefulSet | hashicorp/vault:1.15 | Trivy, Grype |
| **Phoenix** | Latest | Apache-2.0 | Deployment | arizephoenix/phoenix:latest | Trivy, Grype |
| **Prometheus** | 2.48+ | Apache-2.0 | StatefulSet | prom/prometheus:v2.48.0 | Trivy, Grype |
| **Grafana** | 10.2+ | AGPL-3.0 | Deployment | grafana/grafana:10.2.0 | Trivy, Grype |

### Kubernetes Dependencies
```yaml
# Helm charts
- name: vault
  version: 0.27.0
  repository: https://helm.releases.hashicorp.com
  
- name: prometheus
  version: 25.8.0
  repository: https://prometheus-community.github.io/helm-charts
  
- name: grafana  
  version: 7.0.0
  repository: https://grafana.github.io/helm-charts
```

### Total Dependencies Summary
- **Container Images**: 5-10
- **Helm Charts**: 3-5
- **Kubernetes Resources**: ~20 manifests
- **License Risk**: **Medium** (AGPL-3.0 for Grafana)

### SBOM Export Commands
```bash
# Generate SBOM for container images
syft packages docker:hashicorp/vault:1.15 -o spdx-json > vault-sbom.json
syft packages docker:arizephoenix/phoenix:latest -o cyclonedx-json > phoenix-sbom.json

# Scan for vulnerabilities
trivy image hashicorp/vault:1.15 --format json > vault-vulns.json
grype hashicorp/vault:1.15 -o json > vault-cves.json

# Kubernetes manifest SBOM
kubectl-slice -f manifests/ -o sbom/
```

---

## License Compliance Matrix

### Open Source Licenses (Permissive)
| License | Products | Commercial Use | Attribution Required | Copyleft |
|---------|----------|----------------|---------------------|----------|
| **Apache-2.0** | NeMo, Phoenix, Boto3 | ✅ Yes | ✅ Yes | ❌ No |
| **MIT** | LangChain, LLM Guard, Azure SDKs | ✅ Yes | ✅ Yes | ❌ No |
| **MPL-2.0** | HashiCorp Vault | ✅ Yes | ✅ Yes | ⚠️ Partial |

### Open Source Licenses (Copyleft)
| License | Products | Commercial Use | Attribution Required | Copyleft |
|---------|----------|----------------|---------------------|----------|
| **AGPL-3.0** | Grafana | ✅ Yes | ✅ Yes | ✅ Strong |

### Proprietary/Commercial
| Vendor | Products | License Type | Compliance Requirement |
|--------|----------|--------------|----------------------|
| **Microsoft** | Entra ID, Key Vault, Azure AI | Microsoft Azure ToS | Azure subscription agreement |
| **AWS** | IAM, Bedrock, GuardDuty | AWS Customer Agreement | AWS service terms |
| **Okta** | Okta, Auth0 | Proprietary SaaS | Okta subscription |
| **DataDog** | LLM Observability | Proprietary SaaS | DataDog subscription |

---

## Vulnerability Management

### CVE Monitoring Tools
| Tool | Purpose | License | Installation |
|------|---------|---------|-------------|
| **pip-audit** | Python CVE scanner | Apache-2.0 | `pip install pip-audit` |
| **Trivy** | Container CVE scanner | Apache-2.0 | `brew install trivy` |
| **Grype** | Container/SBOM scanner | Apache-2.0 | `brew install grype` |
| **Snyk CLI** | Multi-language scanner | Proprietary | `npm install -g snyk` |
| **OWASP Dependency-Check** | Java/Python/Node scanner | Apache-2.0 | Download JAR |

### Vulnerability Scanning Commands
```bash
# Scan Python dependencies
pip-audit --format json > vulnerabilities.json

# Scan container image
trivy image python:3.11-slim --severity HIGH,CRITICAL

# Scan SBOM file
grype sbom:sbom.json -o table

# Continuous monitoring (Snyk)
snyk monitor --file=requirements.txt --project-name=ai-agent-security
```

### CVE Severity Levels
- **Critical**: Immediate patching required (0-day exploits, RCE)
- **High**: Patch within 7 days (privilege escalation, data exposure)
- **Medium**: Patch within 30 days (DoS, minor leaks)
- **Low**: Patch in next release cycle (info disclosure)

---

## SBOM Standards Compliance

### Supported Formats
1. **SPDX** (Software Package Data Exchange)
   - ISO/IEC 5962:2021 standard
   - Used by: Linux Foundation, GitHub
   
2. **CycloneDX**
   - OWASP-maintained
   - Security-focused (includes vulnerabilities)
   
3. **SWID** (Software Identification Tags)
   - ISO/IEC 19770-2:2015 standard
   - Used by: U.S. Government

### SBOM Generation Example
```bash
# SPDX 2.3 format
syft packages dir:. -o spdx-json=sbom-spdx.json

# CycloneDX 1.5 format
cyclonedx-py -r requirements.txt -o sbom-cyclonedx.xml

# Both formats
syft packages dir:. -o spdx-json,cyclonedx-json
```

---

## Compliance Checklists

### SOC 2 Compliance
- ✅ Maintain SBOM for all production dependencies
- ✅ Vulnerability scanning (weekly minimum)
- ✅ License compliance tracking
- ✅ Vendor risk assessment (annual)
- ✅ Change management for dependency updates

### ISO 27001 Compliance
- ✅ Asset inventory (SBOM)
- ✅ Vulnerability management process
- ✅ Patch management SLA
- ✅ Third-party risk management

### NIST Cybersecurity Framework
- ✅ Identify: Maintain current SBOM
- ✅ Protect: License compliance, secure configuration
- ✅ Detect: CVE monitoring, vulnerability scanning
- ✅ Respond: Patch management process
- ✅ Recover: Rollback procedures

---

## Maintenance Schedule

### Weekly
- Run `pip-audit` or equivalent CVE scanner
- Review new security advisories from vendors

### Monthly
- Update SBOM documentation
- Patch non-critical vulnerabilities
- Review license compliance

### Quarterly
- Vendor security review
- Dependency health assessment
- License audit

### Annually
- Full SBOM regeneration
- Third-party risk assessment
- Compliance certification renewal

---

## Additional Resources

- **NTIA SBOM**: https://www.ntia.gov/page/software-bill-materials
- **CISA SBOM**: https://www.cisa.gov/sbom
- **SPDX Specification**: https://spdx.dev/
- **CycloneDX**: https://cyclonedx.org/
- **OWASP Dependency-Check**: https://owasp.org/www-project-dependency-check/

---

**For product details, see**: [Product URI Reference](security-product-uris.md)
