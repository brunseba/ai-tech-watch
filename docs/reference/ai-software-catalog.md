# AI Software Catalog - Comprehensive URI Reference

Complete reference catalog of all AI/ML software, frameworks, platforms, and tools covered in the AI Technology Watch documentation.

## Overview

This document provides quick access to official websites, documentation, GitHub repositories, and pricing pages for **120+ products** across 11 categories:

1. **Agent Frameworks** (13 products) - LangChain, LlamaIndex, AutoGen, CrewAI, etc.
2. **Enterprise AI Platforms** (3 products) - OPEA, OpenShift AI, NVIDIA AI Enterprise
3. **LLM Providers** (6 products) - OpenAI, Azure OpenAI, Anthropic, Bedrock, etc.
4. **Security Products** (45 products) - Guardrails, IAM, Data Security, AppSec, Threat Detection, Observability
5. **Observability & Monitoring** (10 products) - LangSmith, Phoenix, Weights & Biases, Prometheus, Grafana
6. **Low-Code/No-Code Tools** (7 products) - Dify, Flowise, n8n, Langflow, etc.
7. **Infrastructure & Orchestration** (6 products) - Kubernetes, Docker, Terraform, Ansible
8. **ML Runtimes & Inference** (10 products) - PyTorch, TensorFlow, ONNX, vLLM, TensorRT, Triton
9. **Hardware Vendors** (7 products) - NVIDIA, AMD, Intel, Cerebras, Graphcore, SambaNova, Groq
10. **Model Registries & Hubs** (3 products) - Hugging Face, Ollama, ModelScope
11. **Data & Vector Stores** (8 products) - Pinecone, Weaviate, Chroma, Qdrant, Milvus, etc.

**Last Updated**: December 7, 2025

---

## Category 1: Agent Frameworks (Code-First)

Python/TypeScript frameworks for building AI agent applications.

| Product | Official Website | Documentation | GitHub | License | Maturity |
|---------|-----------------|---------------|--------|---------|----------|
| **LangChain** | https://www.langchain.com/ | https://python.langchain.com/docs/ | https://github.com/langchain-ai/langchain | MIT | 🟢 Production |
| **LangGraph** | https://www.langchain.com/langgraph | https://langchain-ai.github.io/langgraph/ | https://github.com/langchain-ai/langgraph | MIT | 🟢 Production |
| **LlamaIndex** | https://www.llamaindex.ai/ | https://docs.llamaindex.ai/ | https://github.com/run-llama/llama_index | MIT | 🟢 Production |
| **Haystack** | https://haystack.deepset.ai/ | https://docs.haystack.deepset.ai/ | https://github.com/deepset-ai/haystack | Apache 2.0 | 🟢 Production |
| **AutoGen** | https://microsoft.github.io/autogen/ | https://microsoft.github.io/autogen/docs/ | https://github.com/microsoft/autogen | MIT | 🟡 Experimental |
| **CrewAI** | https://www.crewai.com/ | https://docs.crewai.com/ | https://github.com/joaomdmoura/crewAI | MIT | 🟡 Growing |
| **Semantic Kernel** | https://github.com/microsoft/semantic-kernel | https://learn.microsoft.com/en-us/semantic-kernel/ | https://github.com/microsoft/semantic-kernel | MIT | 🟢 Production |

---

## Category 2: Agent Frameworks (Low-Code/No-Code)

Visual and low-code platforms for building AI agents.

| Product | Official Website | Documentation | GitHub | License | Best For |
|---------|-----------------|---------------|--------|---------|----------|
| **Dify** | https://dify.ai/ | https://docs.dify.ai/ | https://github.com/langgenius/dify | Apache 2.0 | Open-source LLMOps |
| **Flowise** | https://flowiseai.com/ | https://docs.flowiseai.com/ | https://github.com/FlowiseAI/Flowise | Apache 2.0 | Visual LangChain |
| **n8n** | https://n8n.io/ | https://docs.n8n.io/ | https://github.com/n8n-io/n8n | Fair-code (Sustainable Use) | Workflow automation |
| **Langflow** | https://www.langflow.org/ | https://docs.langflow.org/ | https://github.com/logspace-ai/langflow | MIT | Visual agent builder |
| **Microsoft Copilot Studio** | https://www.microsoft.com/en-us/microsoft-copilot/microsoft-copilot-studio | https://learn.microsoft.com/en-us/microsoft-copilot-studio/ | N/A | Proprietary | Microsoft ecosystem |
| **Botpress** | https://botpress.com/ | https://botpress.com/docs | https://github.com/botpress/botpress | MIT | Conversational AI |
| **VectorShift** | https://vectorshift.ai/ | https://docs.vectorshift.ai/ | N/A | Proprietary | No-code AI pipelines |

---

## Category 3: Agent Frameworks (Managed Services)

Fully managed AI agent services.

| Product | Official Website | Documentation | Pricing | Cloud Provider |
|---------|-----------------|---------------|---------|----------------|
| **OpenAI Assistants API** | https://platform.openai.com/docs/assistants/overview | https://platform.openai.com/docs/api-reference/assistants | $0.03-$0.15/1K tokens | OpenAI |
| **Amazon Bedrock Agents** | https://aws.amazon.com/bedrock/agents/ | https://docs.aws.amazon.com/bedrock/latest/userguide/agents.html | $0.002/1K input tokens | AWS |
| **Google Vertex AI Agents** | https://cloud.google.com/vertex-ai | https://cloud.google.com/vertex-ai/docs | Pay-as-you-go | Google Cloud |

---

## Category 4: Enterprise AI Platforms

Comprehensive platforms for AI/ML lifecycle management.

| Product | Official Website | Documentation | License | Primary Focus |
|---------|-----------------|---------------|---------|---------------|
| **OPEA (Open Platform for Enterprise AI)** | https://opea.dev/ | https://opea-project.github.io/ | Apache 2.0 | GenAI/RAG Architecture |
| **Red Hat OpenShift AI** | https://www.redhat.com/en/technologies/cloud-computing/openshift/openshift-ai | https://access.redhat.com/documentation/en-us/red_hat_openshift_ai | Proprietary | Kubernetes MLOps |
| **NVIDIA AI Enterprise** | https://www.nvidia.com/en-us/data-center/products/ai-enterprise/ | https://docs.nvidia.com/ai-enterprise/ | Proprietary | GPU-optimized Runtime |

---

## Category 5: LLM Providers

Foundation model API providers.

| Product | Official Website | API Docs | GitHub SDK | Pricing |
|---------|-----------------|----------|------------|---------|
| **OpenAI** | https://openai.com/ | https://platform.openai.com/docs | https://github.com/openai/openai-python | $0.03-$30/1M tokens |
| **Azure OpenAI Service** | https://azure.microsoft.com/en-us/products/ai-services/openai-service | https://learn.microsoft.com/en-us/azure/ai-services/openai/ | https://github.com/Azure/azure-sdk-for-python | Same as OpenAI |
| **Anthropic Claude** | https://www.anthropic.com/ | https://docs.anthropic.com/ | https://github.com/anthropics/anthropic-sdk-python | $3-$75/1M tokens |
| **Amazon Bedrock** | https://aws.amazon.com/bedrock/ | https://docs.aws.amazon.com/bedrock/ | https://github.com/boto/boto3 | $0.002-$0.08/1K tokens |
| **Google Vertex AI (PaLM/Gemini)** | https://cloud.google.com/vertex-ai | https://cloud.google.com/vertex-ai/docs | https://github.com/googleapis/python-aiplatform | $0.25-$1.25/1K chars |
| **Mistral AI** | https://mistral.ai/ | https://docs.mistral.ai/ | https://github.com/mistralai/client-python | €0.25-€2/1M tokens |

---

## Category 6: Observability & Monitoring (AI-Specific)

LLM/agent-specific observability platforms.

| Product | Official Website | Documentation | GitHub | Pricing |
|---------|-----------------|---------------|--------|---------|
| **LangSmith** | https://smith.langchain.com/ | https://docs.smith.langchain.com/ | N/A | Free tier / $39-$399/month |
| **LlamaCloud** | https://cloud.llamaindex.ai/ | https://docs.cloud.llamaindex.ai/ | N/A | Free tier / Custom |
| **Phoenix (Arize OSS)** | https://phoenix.arize.com/ | https://docs.arize.com/phoenix | https://github.com/Arize-ai/phoenix | Free (Apache 2.0) |
| **Arize AI** | https://arize.com/ | https://docs.arize.com/ | https://github.com/Arize-ai | Free tier / $500+/month |
| **Weights & Biases** | https://wandb.ai/ | https://docs.wandb.ai/ | https://github.com/wandb/wandb | Free / $50-$250/user/month |
| **MLflow** | https://mlflow.org/ | https://mlflow.org/docs/latest/index.html | https://github.com/mlflow/mlflow | Free (Apache 2.0) |
| **WhyLabs** | https://whylabs.ai/ | https://docs.whylabs.ai/ | https://github.com/whylabs/whylogs | Free tier / $500+/month |
| **Helicone** | https://www.helicone.ai/ | https://docs.helicone.ai/ | https://github.com/Helicone/helicone | Free tier / $20-$250/month |
| **LunaryAI** | https://lunary.ai/ | https://docs.lunary.ai/ | https://github.com/lunary-ai/lunary | Free (OSS) / $49-$249/month |
| **DataDog LLM Observability** | https://www.datadoghq.com/product/llm-observability/ | https://docs.datadoghq.com/llm_observability/ | N/A | $15-$31/host/month + add-on |

---

## Category 7: Infrastructure Monitoring (General)

General-purpose infrastructure and application monitoring.

| Product | Official Website | Documentation | GitHub | License |
|---------|-----------------|---------------|--------|---------|
| **Prometheus** | https://prometheus.io/ | https://prometheus.io/docs/ | https://github.com/prometheus/prometheus | Apache 2.0 |
| **Grafana** | https://grafana.com/ | https://grafana.com/docs/ | https://github.com/grafana/grafana | AGPL-3.0 |
| **OpenTelemetry** | https://opentelemetry.io/ | https://opentelemetry.io/docs/ | https://github.com/open-telemetry | Apache 2.0 |
| **Azure Monitor** | https://azure.microsoft.com/en-us/products/monitor | https://learn.microsoft.com/en-us/azure/azure-monitor/ | N/A | Proprietary |
| **AWS CloudWatch** | https://aws.amazon.com/cloudwatch/ | https://docs.aws.amazon.com/cloudwatch/ | N/A | Proprietary |
| **Google Cloud Monitoring** | https://cloud.google.com/monitoring | https://cloud.google.com/monitoring/docs | N/A | Proprietary |

---

## Category 8: Infrastructure & Orchestration

Container orchestration and infrastructure-as-code tools.

| Product | Official Website | Documentation | GitHub | License |
|---------|-----------------|---------------|--------|---------|
| **Kubernetes** | https://kubernetes.io/ | https://kubernetes.io/docs/ | https://github.com/kubernetes/kubernetes | Apache 2.0 |
| **Docker** | https://www.docker.com/ | https://docs.docker.com/ | https://github.com/docker | Apache 2.0 |
| **Terraform** | https://www.terraform.io/ | https://developer.hashicorp.com/terraform/docs | https://github.com/hashicorp/terraform | MPL-2.0 |
| **Ansible** | https://www.ansible.com/ | https://docs.ansible.com/ | https://github.com/ansible/ansible | GPL-3.0 |
| **Helm** | https://helm.sh/ | https://helm.sh/docs/ | https://github.com/helm/helm | Apache 2.0 |
| **ArgoCD** | https://argo-cd.readthedocs.io/ | https://argo-cd.readthedocs.io/en/stable/ | https://github.com/argoproj/argo-cd | Apache 2.0 |

---

## Category 9: ML Runtimes & Inference Engines

Frameworks and engines for model training and inference.

| Product | Official Website | Documentation | GitHub | Primary Use |
|---------|-----------------|---------------|--------|-------------|
| **PyTorch** | https://pytorch.org/ | https://pytorch.org/docs/ | https://github.com/pytorch/pytorch | Training & Inference |
| **TensorFlow** | https://www.tensorflow.org/ | https://www.tensorflow.org/api_docs | https://github.com/tensorflow/tensorflow | Training & Inference |
| **ONNX Runtime** | https://onnxruntime.ai/ | https://onnxruntime.ai/docs/ | https://github.com/microsoft/onnxruntime | Inference optimization |
| **vLLM** | https://vllm.ai/ | https://docs.vllm.ai/ | https://github.com/vllm-project/vllm | LLM inference |
| **TensorRT** | https://developer.nvidia.com/tensorrt | https://docs.nvidia.com/deeplearning/tensorrt/ | https://github.com/NVIDIA/TensorRT | NVIDIA GPU inference |
| **TensorRT-LLM** | https://github.com/NVIDIA/TensorRT-LLM | https://nvidia.github.io/TensorRT-LLM/ | https://github.com/NVIDIA/TensorRT-LLM | NVIDIA LLM inference |
| **OpenVINO** | https://www.intel.com/content/www/us/en/developer/tools/openvino-toolkit/ | https://docs.openvino.ai/ | https://github.com/openvinotoolkit/openvino | Intel CPU/GPU inference |
| **Ray** | https://www.ray.io/ | https://docs.ray.io/ | https://github.com/ray-project/ray | Distributed computing |
| **Triton Inference Server** | https://developer.nvidia.com/triton-inference-server | https://docs.nvidia.com/deeplearning/triton-inference-server/ | https://github.com/triton-inference-server/server | Model serving |
| **ONNX** | https://onnx.ai/ | https://onnx.ai/onnx/ | https://github.com/onnx/onnx | Model interchange format |

---

## Category 10: Hardware Vendors

AI accelerator hardware manufacturers.

| Vendor | Official Website | Documentation | Primary Products |
|--------|-----------------|---------------|------------------|
| **NVIDIA** | https://www.nvidia.com/en-us/data-center/ | https://docs.nvidia.com/ | A100, H100, L40S GPUs |
| **AMD** | https://www.amd.com/en/graphics/instinct-server-accelerators | https://www.amd.com/en/technologies/infinity-hub.html | MI300X, MI250 GPUs |
| **Intel** | https://www.intel.com/content/www/us/en/products/docs/accelerator-engines/ | https://www.intel.com/content/www/us/en/developer/tools/openvino-toolkit/ | Xeon CPUs, Gaudi accelerators |
| **Cerebras** | https://www.cerebras.net/ | https://www.cerebras.net/product-system/ | CS-2 Wafer-Scale Engine |
| **Graphcore** | https://www.graphcore.ai/ | https://docs.graphcore.ai/ | IPU (Intelligence Processing Unit) |
| **SambaNova** | https://sambanova.ai/ | https://sambanova.ai/technology/ | DataScale systems |
| **Groq** | https://groq.com/ | https://wow.groq.com/groqcloud/ | LPU (Language Processing Unit) |

---

## Category 11: Model Registries & Hubs

Repositories for pre-trained models and datasets.

| Product | Official Website | Documentation | GitHub | Focus |
|---------|-----------------|---------------|--------|-------|
| **Hugging Face** | https://huggingface.co/ | https://huggingface.co/docs | https://github.com/huggingface | Transformers, Datasets |
| **Ollama** | https://ollama.com/ | https://github.com/ollama/ollama/tree/main/docs | https://github.com/ollama/ollama | Local LLM deployment |
| **ModelScope** | https://modelscope.cn/ | https://modelscope.cn/docs/intro | https://github.com/modelscope/modelscope | Chinese AI models |

---

## Category 12: Vector Databases & Stores

Specialized databases for embedding storage and semantic search.

| Product | Official Website | Documentation | GitHub | License |
|---------|-----------------|---------------|--------|---------|
| **Pinecone** | https://www.pinecone.io/ | https://docs.pinecone.io/ | N/A | Proprietary |
| **Weaviate** | https://weaviate.io/ | https://weaviate.io/developers/weaviate | https://github.com/weaviate/weaviate | BSD-3-Clause |
| **Chroma** | https://www.trychroma.com/ | https://docs.trychroma.com/ | https://github.com/chroma-core/chroma | Apache 2.0 |
| **Qdrant** | https://qdrant.tech/ | https://qdrant.tech/documentation/ | https://github.com/qdrant/qdrant | Apache 2.0 |
| **Milvus** | https://milvus.io/ | https://milvus.io/docs | https://github.com/milvus-io/milvus | Apache 2.0 |
| **pgvector** | https://github.com/pgvector/pgvector | https://github.com/pgvector/pgvector#readme | https://github.com/pgvector/pgvector | PostgreSQL License |
| **FAISS** | https://faiss.ai/ | https://faiss.ai/ | https://github.com/facebookresearch/faiss | MIT |
| **LanceDB** | https://lancedb.com/ | https://lancedb.github.io/lancedb/ | https://github.com/lancedb/lancedb | Apache 2.0 |

---

## Category 13: Security - Guardrails (Input/Output Safety)

| Product | Official Website | Documentation | GitHub | Pricing |
|---------|-----------------|---------------|--------|---------|
| **NVIDIA NeMo Guardrails** | https://www.nvidia.com/en-us/ai-data-science/products/nemo/ | https://docs.nvidia.com/nemo/guardrails/ | https://github.com/NVIDIA/NeMo-Guardrails | Free (Apache 2.0) |
| **Guardrails AI** | https://www.guardrailsai.com/ | https://docs.guardrailsai.com/ | https://github.com/guardrails-ai/guardrails | Free (Apache 2.0) |
| **LangChain Guardrails** | https://python.langchain.com/ | https://python.langchain.com/docs/guides/safety/ | https://github.com/langchain-ai/langchain | Free (MIT) |
| **OpenAI Moderation API** | https://platform.openai.com/docs/guides/moderation | https://platform.openai.com/docs/api-reference/moderations | N/A (API) | Free |
| **Azure Content Safety** | https://azure.microsoft.com/en-us/products/ai-services/ai-content-safety | https://learn.microsoft.com/en-us/azure/ai-services/content-safety/ | N/A | $0.25/1K transactions |
| **Amazon Bedrock Guardrails** | https://aws.amazon.com/bedrock/guardrails/ | https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails.html | N/A | $0.75-$1.00/1K tokens |
| **LLM Guard** | N/A | https://llm-guard.com/ | https://github.com/protectai/llm-guard | Free (MIT) |
| **Patronus Lynx** | https://www.patronus.ai/ | https://docs.patronus.ai/ | https://huggingface.co/PatronusAI/Lynx-8B | Free (OSS) / $0.01/1K (Cloud) |
| **Got It AI** | https://www.got-it.ai/ | https://docs.got-it.ai/ | N/A | ~$50K/year |
| **HuggingFace Guardrails Arena** | https://huggingface.co/spaces/ai-safety-arena/guardrails-arena | N/A | https://github.com/guardrails-ai | Free |

---

## Category 14: Security - Identity & Access Management

| Product | Official Website | Documentation | GitHub | Pricing |
|---------|-----------------|---------------|--------|---------|
| **AWS IAM** | https://aws.amazon.com/iam/ | https://docs.aws.amazon.com/iam/ | N/A | Free (pay for resources) |
| **Microsoft Entra ID (Azure AD)** | https://www.microsoft.com/en-us/security/business/identity-access/microsoft-entra-id | https://learn.microsoft.com/en-us/entra/identity/ | N/A | Free-$9/user/month |
| **Managed Identities** | https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/ | https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/overview | N/A | Free |
| **Okta** | https://www.okta.com/ | https://developer.okta.com/docs/ | https://github.com/okta | $2-$15/user/month |
| **Auth0** | https://auth0.com/ | https://auth0.com/docs | https://github.com/auth0 | Free-$240/month |
| **HashiCorp Vault** | https://www.vaultproject.io/ | https://developer.hashicorp.com/vault/docs | https://github.com/hashicorp/vault | Free (OSS) / Custom (Enterprise) |
| **Azure Key Vault** | https://azure.microsoft.com/en-us/products/key-vault | https://learn.microsoft.com/en-us/azure/key-vault/ | N/A | $0.03/10K operations |
| **Ping Identity** | https://www.pingidentity.com/ | https://docs.pingidentity.com/ | https://github.com/pingidentity | ~$100K+/year |

---

## Category 15: Security - Data Security

| Product | Official Website | Documentation | GitHub | Pricing |
|---------|-----------------|---------------|--------|---------|
| **Private AI** | https://www.private-ai.com/ | https://docs.private-ai.com/ | https://github.com/privateai | Free tier / $0.002/request |
| **Gretel.ai** | https://gretel.ai/ | https://docs.gretel.ai/ | https://github.com/gretelai | Free tier / $0.03-$0.10/1K records |
| **AWS Macie** | https://aws.amazon.com/macie/ | https://docs.aws.amazon.com/macie/ | N/A | $1/GB scanned |
| **Microsoft Purview** | https://azure.microsoft.com/en-us/products/purview/ | https://learn.microsoft.com/en-us/purview/ | N/A | $0.167/GB scanned |
| **Immuta** | https://www.immuta.com/ | https://documentation.immuta.com/ | N/A | ~$50K/year |

---

## Category 16: Security - Application Security

| Product | Official Website | Documentation | GitHub | Pricing |
|---------|-----------------|---------------|--------|---------|
| **Snyk** | https://snyk.io/ | https://docs.snyk.io/ | https://github.com/snyk | Free (OSS) / $25-$89/dev/month |
| **GitHub Advanced Security** | https://github.com/features/security | https://docs.github.com/en/code-security | N/A | Free (public) / $49/user/month |
| **GitLab Security** | https://about.gitlab.com/solutions/dev-sec-ops/ | https://docs.gitlab.com/ee/user/application_security/ | https://gitlab.com/gitlab-org | $99/user/month |
| **Checkmarx** | https://checkmarx.com/ | https://checkmarx.com/resource/documents/ | N/A | ~$100K/year |
| **Veracode** | https://www.veracode.com/ | https://docs.veracode.com/ | N/A | ~$50K/year |
| **FOSSA** | https://fossa.com/ | https://docs.fossa.com/ | https://github.com/fossas | Free (OSS) / $5-$15/dev/month |

---

## Category 17: Security - Threat Detection & Response

| Product | Official Website | Documentation | GitHub | Pricing |
|---------|-----------------|---------------|--------|---------|
| **Cisco AI Defense** | https://www.cisco.com/ | https://www.cisco.com/c/en/us/products/security/ai-defense.html | N/A | ~$100K/year |
| **Obsidian Security** | https://obsidiansecurity.com/ | https://docs.obsidiansecurity.com/ | N/A | ~$50K/year |
| **Calypso AI** | https://calypsoai.com/ | https://docs.calypsoai.com/ | N/A | Custom (Gov) |
| **HiddenLayer** | https://hiddenlayer.com/ | https://docs.hiddenlayer.com/ | https://github.com/hiddenlayerai | ~$75K/year |
| **Robust Intelligence** | https://www.robustintelligence.com/ | https://docs.robustintelligence.com/ | N/A | ~$50K/year |
| **AWS GuardDuty** | https://aws.amazon.com/guardduty/ | https://docs.aws.amazon.com/guardduty/ | N/A | $4.66/GB (CloudTrail) |
| **Vectra AI** | https://www.vectra.ai/ | https://docs.vectra.ai/ | N/A | ~$100K/year |

---

## Category 18: Security - Observability & Compliance

| Product | Official Website | Documentation | GitHub | Pricing |
|---------|-----------------|---------------|--------|---------|
| **LangSmith** | https://smith.langchain.com/ | https://docs.smith.langchain.com/ | N/A | Free tier / $39-$399/month |
| **Arize AI** | https://arize.com/ | https://docs.arize.com/ | https://github.com/Arize-ai | Free tier / $500+/month |
| **Phoenix (Arize OSS)** | https://phoenix.arize.com/ | https://docs.arize.com/phoenix | https://github.com/Arize-ai/phoenix | Free (Apache 2.0) |
| **WhyLabs** | https://whylabs.ai/ | https://docs.whylabs.ai/ | https://github.com/whylabs/whylogs | Free tier / $500+/month |
| **Helicone** | https://www.helicone.ai/ | https://docs.helicone.ai/ | https://github.com/Helicone/helicone | Free tier / $20-$250/month |
| **LunaryAI** | https://lunary.ai/ | https://docs.lunary.ai/ | https://github.com/lunary-ai/lunary | Free (OSS) / $49-$249/month |
| **Weights & Biases** | https://wandb.ai/ | https://docs.wandb.ai/ | https://github.com/wandb/wandb | Free / $50-$250/user/month |
| **DataDog LLM Observability** | https://www.datadoghq.com/product/llm-observability/ | https://docs.datadoghq.com/llm_observability/ | N/A | $15-$31/host/month + add-on |
| **Azure Monitor** | https://azure.microsoft.com/en-us/products/monitor | https://learn.microsoft.com/en-us/azure/azure-monitor/ | N/A | $2.30/GB ingested |
| **Application Insights** | https://azure.microsoft.com/en-us/products/monitor | https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview | N/A | Included (pay for ingestion) |

---

## Quick Reference by Category

### Open Source Frameworks & Tools
- **Agent Frameworks**: LangChain, LlamaIndex, Haystack, AutoGen, CrewAI, Semantic Kernel
- **Low-Code**: Dify, Flowise, n8n, Langflow, Botpress
- **Observability**: Phoenix, MLflow, Prometheus, Grafana, OpenTelemetry
- **Infrastructure**: Kubernetes, Docker, Terraform, Ansible, Helm, ArgoCD
- **ML Runtimes**: PyTorch, TensorFlow, ONNX, Ray
- **Vector DBs**: Chroma, Qdrant, Milvus, FAISS, LanceDB, pgvector
- **Security**: NeMo Guardrails, Guardrails AI, LLM Guard, HashiCorp Vault, LunaryAI

### Cloud-Native (Azure)
- **Enterprise**: Azure OpenAI Service, OpenShift AI (with Azure)
- **Monitoring**: Azure Monitor, Application Insights
- **Security**: Microsoft Entra ID, Azure Content Safety, Azure Key Vault, Microsoft Purview

### Cloud-Native (AWS)
- **LLM**: Amazon Bedrock, Bedrock Agents, Bedrock Guardrails
- **Monitoring**: AWS CloudWatch
- **Security**: AWS IAM, AWS Secrets Manager, AWS Macie, AWS GuardDuty

### Cloud-Native (Google Cloud)
- **LLM**: Vertex AI (PaLM/Gemini), Vertex AI Agents
- **Monitoring**: Google Cloud Monitoring

### Multi-Cloud Commercial
- **Agent Platforms**: OpenAI Assistants, Copilot Studio
- **Observability**: LangSmith, LlamaCloud, Arize AI, Weights & Biases, WhyLabs, Helicone, DataDog
- **Security**: Okta, Auth0, Snyk, Private AI, Gretel.ai, Immuta
- **Vector DBs**: Pinecone, Weaviate

### Hardware Vendors
- NVIDIA, AMD, Intel, Cerebras, Graphcore, SambaNova, Groq

---

## Additional Resources

### Standards & Frameworks
- **OWASP Top 10 for LLM**: https://owasp.org/www-project-top-10-for-large-language-model-applications/
- **NIST AI RMF**: https://www.nist.gov/itl/ai-risk-management-framework
- **ISO/IEC 42001:2023**: https://www.iso.org/standard/81230.html
- **EU AI Act**: https://artificialintelligenceact.eu/

### Community Resources
- **LangChain Community**: https://github.com/langchain-ai/langchain
- **HuggingFace Hub**: https://huggingface.co/
- **NVIDIA AI Foundation**: https://www.nvidia.com/en-us/ai-data-science/foundation-models/
- **Linux Foundation AI & Data**: https://lfaidata.foundation/
- **CNCF (Cloud Native Computing Foundation)**: https://www.cncf.io/
- **MLOps Community**: https://mlops.community/
- **AI Safety Arena**: https://huggingface.co/ai-safety-arena

---

## Notes

- **Scope**: This catalog covers 120+ products mentioned across all AI Technology Watch documentation sections
- **Pricing**: All pricing is approximate and subject to change. Check official websites for current rates
- **Availability**: Some products require enterprise licenses or custom pricing
- **GitHub**: "N/A" indicates proprietary/closed-source products without public repositories
- **Free Tier**: Many cloud products offer free tiers with usage limits
- **Licenses**: Open source licenses vary (MIT, Apache 2.0, GPL, AGPL, MPL, etc.) - check individual projects
- **Maturity**: 🟢 = Production-ready, 🟡 = Experimental/Growing, 🔴 = Early stage

**Related Documentation**:
- [Agent Framework Comparisons](../architecture/agent-frameworks-comparison.md)
- [Enterprise Platform Analysis](../architecture/enterprise-ai-platforms/index.md)
- [Security Product Comparisons](../security/ai-agent-security/04-product-comparisons.md)
- [AI Software SBOM](ai-software-sbom.md)
