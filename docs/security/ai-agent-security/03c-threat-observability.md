### Domain 5: Threat Detection & Response

**Purpose**: Detect and respond to AI-specific threats in real-time (jailbreaks, prompt injections, anomalous agent behavior).

**Why Critical**: Traditional security tools (SIEM, EDR) don't understand AI-specific attacks. Specialized threat detection is required.

#### Key Threat Detection Capabilities

1. **Jailbreak Detection**: Identify adversarial prompts bypassing guardrails
2. **Behavioral Monitoring**: Detect anomalous agent actions
3. **Prompt Injection Detection**: Real-time detection of malicious inputs
4. **Model Exfiltration**: Detect attempts to steal model weights
5. **Incident Response**: Automated response playbooks

---

#### Product 1: Cisco AI Defense

**Overview**: Enterprise AI security platform for threat detection and response.

**Key Features**:
1. **AI Firewall**: Inspect all LLM traffic for threats
2. **Jailbreak Detection**: Real-time detection of adversarial prompts
3. **Data Loss Prevention**: Block PII leakage in real-time
4. **Behavioral Analytics**: Detect anomalous AI agent behavior
5. **Multi-LLM Support**: Works with OpenAI, Anthropic, Bedrock, Azure

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud (Cisco-managed), hybrid |
| **Pricing** | Custom (starts ~$100K/year) |
| **Latency** | < 50ms per request |
| **Integration** | API proxy, SDK integration |

**Strengths**:
- ✅ Comprehensive (jailbreak, DLP, behavioral analytics)
- ✅ Low latency (< 50ms)
- ✅ Multi-LLM support (not locked to vendor)
- ✅ Enterprise-grade (Cisco backing)
- ✅ Incident response automation

**Limitations**:
- ❌ Expensive (enterprise pricing)
- ❌ Requires Cisco relationship
- ❌ Complex deployment (proxy architecture)

**Best For**:
- Large enterprises (5,000+ employees)
- Multi-LLM deployments
- Teams requiring comprehensive AI security

**Website**: https://www.cisco.com/

---

#### Product 2: Obsidian Security

**Overview**: SaaS security platform with AI/LLM security capabilities.

**Key Features**:
1. **AI Risk Detection**: Monitor AI app usage (ChatGPT, Copilot, etc.)
2. **Shadow AI Discovery**: Detect unauthorized AI tool usage
3. **Data Exfiltration**: Prevent sensitive data leakage to AI apps
4. **Compliance Monitoring**: Track AI usage against policies
5. **User Behavior Analytics**: Identify risky AI usage patterns

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud (Obsidian-managed) |
| **Pricing** | Custom (starts ~$50K/year) |
| **Integration** | SSO, CASB, API integrations |

**Strengths**:
- ✅ Shadow AI discovery (visibility into unauthorized tools)
- ✅ Data exfiltration prevention
- ✅ User behavior analytics
- ✅ SaaS-first (easy deployment)
- ✅ 60% false positive reduction (vs traditional DLP)

**Limitations**:
- ❌ SaaS-focused (not ideal for self-hosted LLMs)
- ❌ Expensive (enterprise pricing)
- ❌ Limited to monitoring (not blocking)

**Best For**:
- Enterprises using SaaS AI tools (ChatGPT, Copilot)
- Security teams concerned about Shadow AI
- Compliance-driven organizations

**Website**: https://obsidiansecurity.com/

---

#### Product 3: Calypso AI

**Overview**: AI security platform for government and defense.

**Key Features**:
1. **Model Security**: Protect ML models from adversarial attacks
2. **Data Governance**: Control data access to AI systems
3. **Explainability**: Audit AI decisions
4. **FedRAMP Ready**: Compliance for government use
5. **Multi-Classification**: Handle classified data (Secret, Top Secret)

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud, on-prem, air-gapped |
| **Pricing** | Custom (government contracts) |
| **Compliance** | FedRAMP, ITAR, CMMC |

**Strengths**:
- ✅ Government/defense focus (FedRAMP, ITAR)
- ✅ Air-gapped deployment (classified environments)
- ✅ Multi-classification support
- ✅ Model security (adversarial defense)

**Limitations**:
- ❌ Government-focused (overkill for commercial)
- ❌ Expensive (government pricing)
- ❌ Limited public documentation

**Best For**:
- Government agencies
- Defense contractors
- Classified AI deployments

**Website**: https://calypso.ai/

---

#### Product 4: HiddenLayer

**Overview**: AI security platform focused on model protection.

**Key Features**:
1. **Model Scanning**: Detect backdoors and vulnerabilities in ML models
2. **Adversarial Defense**: Protect against adversarial attacks
3. **Supply Chain Security**: Scan models from HuggingFace, AWS, etc.
4. **MLSecOps**: Integrate security into ML pipelines
5. **Threat Intelligence**: Track emerging AI threats

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud, self-hosted |
| **Pricing** | Custom (starts ~$75K/year) |
| **Integration** | ML platforms (SageMaker, Databricks, Azure ML) |

**Strengths**:
- ✅ Model-focused (detect backdoors, poisoning)
- ✅ Supply chain security (scan external models)
- ✅ MLSecOps integration
- ✅ Threat intelligence (emerging AI attacks)

**Limitations**:
- ❌ Model-focused (not application-level security)
- ❌ Expensive (enterprise pricing)
- ❌ Requires ML expertise to operate

**Best For**:
- Teams using external models (HuggingFace, AWS)
- ML security teams
- Enterprises concerned about model supply chain

**Website**: https://hiddenlayer.com/

---

#### Product 5: Robust Intelligence

**Overview**: AI security and validation platform.

**Key Features**:
1. **AI Firewall**: Real-time threat detection for AI apps
2. **Model Validation**: Test models for security and performance
3. **Stress Testing**: Adversarial testing and red teaming
4. **Continuous Monitoring**: Production AI monitoring
5. **Explainability**: Understand model decisions

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud, self-hosted |
| **Pricing** | Custom (starts ~$50K/year) |
| **Integration** | API proxy, Python SDK |

**Strengths**:
- ✅ AI Firewall (real-time threat detection)
- ✅ Model validation (pre-deployment testing)
- ✅ Stress testing (red teaming)
- ✅ Continuous monitoring (production)

**Limitations**:
- ❌ Expensive (enterprise pricing)
- ❌ Complex setup (proxy architecture)
- ❌ Overlaps with guardrails tools

**Best For**:
- Enterprises deploying production AI
- Teams requiring pre-deployment validation
- Red teaming and adversarial testing

**Website**: https://www.robustintelligence.com/

---

#### Product 6: AWS GuardDuty

**Overview**: AWS threat detection service with ML-powered anomaly detection.

**Key Features**:
1. **Anomaly Detection**: ML-based detection of unusual AWS activity
2. **CloudTrail Analysis**: Monitor API calls for suspicious behavior
3. **Network Monitoring**: VPC flow log analysis
4. **Threat Intelligence**: AWS curated threat feeds
5. **Automated Response**: EventBridge integration for automated remediation

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary (AWS) |
| **Deployment** | AWS Cloud |
| **Pricing** | $4.66/GB analyzed (CloudTrail), $1.17/GB (VPC flows) |
| **Integration** | Native AWS services (CloudTrail, VPC, S3) |

**Strengths**:
- ✅ Native AWS integration (zero setup)
- ✅ ML-powered anomaly detection
- ✅ Automated response (EventBridge)
- ✅ Threat intelligence (AWS feeds)

**Limitations**:
- ❌ AWS-only (not for other clouds)
- ❌ General threat detection (not AI-specific)
- ❌ Cost scales with data volume

**Best For**:
- AWS-native AI applications
- Teams using Amazon Bedrock
- Infrastructure-level threat detection

**Documentation**: https://aws.amazon.com/guardduty/

---

#### Product 7: Vectra AI

**Overview**: Network-based threat detection with AI-powered analytics.

**Key Features**:
1. **Network Traffic Analysis**: Detect threats in network traffic
2. **AI-Powered Detection**: ML models for anomaly detection
3. **Attack Chain Reconstruction**: Visualize multi-stage attacks
4. **Automated Response**: SOAR integration
5. **Cloud Support**: AWS, Azure, GCP

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud, on-prem, hybrid |
| **Pricing** | Custom (starts ~$100K/year) |
| **Integration** | SIEM, SOAR, cloud platforms |

**Strengths**:
- ✅ Network-level detection (east-west traffic)
- ✅ AI-powered (ML anomaly detection)
- ✅ Multi-cloud support
- ✅ Attack chain visualization

**Limitations**:
- ❌ Network-focused (not application-level)
- ❌ Expensive (enterprise pricing)
- ❌ Not AI-specific (general threat detection)

**Best For**:
- Enterprises with mature security operations
- Network-level threat detection
- Multi-cloud environments

**Website**: https://www.vectra.ai/

---

### Domain 6: Observability & Compliance

**Purpose**: Monitor AI agent behavior, track metrics, and maintain audit trails for compliance.

**Why Critical**: AI agents are non-deterministic—observability is essential for debugging, compliance, and continuous improvement.

#### Key Observability Capabilities

1. **Tracing**: End-to-end traces of agent reasoning and actions
2. **Logging**: Comprehensive logs of inputs, outputs, tool calls
3. **Metrics**: Latency, cost, token usage, success rates
4. **Evaluation**: Test agent performance and quality
5. **Audit Trails**: Compliance-ready logs for GDPR, HIPAA, SOC 2

---

#### Product 1: LangSmith

**Overview**: LangChain's native observability and evaluation platform.

**Key Features**:
1. **Tracing**: End-to-end traces for LangChain agents
2. **Datasets**: Create test datasets for evaluation
3. **Evaluation**: Custom evaluators for agent quality
4. **Debugging**: Step-by-step agent execution replay
5. **Annotations**: Human feedback on agent outputs

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud (LangSmith-managed), self-hosted (Enterprise) |
| **Pricing** | Free (5K traces/month), $39-$399/month (paid) |
| **Integration** | Native LangChain integration |

**Strengths**:
- ✅ Native LangChain integration (zero setup)
- ✅ Evaluation framework (test agent quality)
- ✅ Debugging tools (replay agent execution)
- ✅ Human feedback (annotations)
- ✅ Generous free tier (5K traces/month)

**Limitations**:
- ❌ LangChain-focused (limited support for other frameworks)
- ❌ Cloud-first (self-hosted requires Enterprise)
- ❌ Limited compliance features (no HIPAA/SOC 2 out-of-box)

**Best For**:
- LangChain applications
- Teams prioritizing evaluation and debugging
- Rapid prototyping

**Website**: https://smith.langchain.com/

---

#### Product 2: Arize AI

**Overview**: ML observability platform for production AI systems.

**Key Features**:
1. **Drift Detection**: Monitor model performance degradation
2. **Explainability**: SHAP-based feature importance
3. **Embedding Analysis**: Visualize LLM embeddings
4. **Real-Time Monitoring**: Production dashboards
5. **Root Cause Analysis**: Diagnose performance issues

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary + free tier |
| **Deployment** | Cloud (Arize-managed) |
| **Pricing** | Free (10K predictions/month), $500+/month (paid) |
| **Integration** | Python SDK, REST API, Spark, Databricks |

**Strengths**:
- ✅ Production-focused (drift detection, monitoring)
- ✅ Explainability (SHAP integration)
- ✅ Embedding analysis (LLM-specific)
- ✅ Real-time dashboards

**Limitations**:
- ❌ ML-focused (less agent-specific)
- ❌ Cost scales with predictions
- ❌ Steep learning curve

**Best For**:
- Production ML/LLM systems
- Data science teams
- Enterprises requiring drift detection

**Website**: https://arize.com/

---

#### Product 3: Phoenix (Arize Open-Source)

**Overview**: Open-source LLM observability by Arize AI.

**Key Features**:
1. **LLM Tracing**: Trace LLM calls and agent actions
2. **Embedding Visualization**: UMAP/t-SNE visualization
3. **Evaluation**: Built-in evaluators (relevance, hallucination)
4. **Local Deployment**: Run locally (no cloud required)
5. **Framework Support**: LangChain, LlamaIndex, OpenAI

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Apache 2.0 (open-source) |
| **Deployment** | Self-hosted (local or server) |
| **Pricing** | Free (open-source) |
| **Integration** | LangChain, LlamaIndex, OpenAI, Anthropic |

**Strengths**:
- ✅ Open-source (full control, free)
- ✅ Local deployment (no cloud dependency)
- ✅ Multi-framework (LangChain, LlamaIndex, OpenAI)
- ✅ Embedding visualization
- ✅ Built-in evaluators

**Limitations**:
- ❌ Self-managed (no SLA)
- ❌ Less feature-rich than commercial tools
- ❌ No built-in compliance features

**Best For**:
- Teams prioritizing open-source
- Local/self-hosted deployments
- Budget-conscious startups

**GitHub**: https://github.com/Arize-ai/phoenix

---

#### Product 4: WhyLabs

**Overview**: AI observability platform with drift detection and data quality monitoring.

**Key Features**:
1. **Data Quality**: Monitor input data quality
2. **Drift Detection**: Detect data and model drift
3. **PII Detection**: Real-time PII monitoring
4. **Explainability**: Feature importance and SHAP
5. **Privacy-Preserving**: No data leaves your infrastructure

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary + open-source (whylogs) |
| **Deployment** | Cloud, self-hosted (whylogs) |
| **Pricing** | Free (1M records/month), $500+/month (paid) |
| **Integration** | Python SDK, Spark, Databricks, SageMaker |

**Strengths**:
- ✅ Privacy-preserving (data stays local)
- ✅ Data quality monitoring
- ✅ Drift detection
- ✅ PII detection (built-in)
- ✅ Open-source core (whylogs)

**Limitations**:
- ❌ ML-focused (less agent-specific)
- ❌ Complex setup (requires integration)
- ❌ Cost scales with data volume

**Best For**:
- Teams prioritizing data privacy
- Data quality monitoring
- Regulated industries (HIPAA, GDPR)

**Website**: https://whylabs.ai/

---

#### Product 5: Helicone

**Overview**: LLM observability platform for OpenAI, Anthropic, and others.

**Key Features**:
1. **Request Logging**: Log all LLM API calls
2. **Cost Tracking**: Monitor token usage and costs
3. **Caching**: Cache LLM responses (reduce costs)
4. **Rate Limiting**: Prevent quota exhaustion
5. **User Analytics**: Track usage per user/team

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary + open-source (proxy) |
| **Deployment** | Cloud (Helicone), self-hosted (OSS proxy) |
| **Pricing** | Free (100K requests/month), $20-$250/month (paid) |
| **Integration** | OpenAI, Anthropic, Azure OpenAI, proxy-based |

**Strengths**:
- ✅ Simple setup (proxy-based, 1-line change)
- ✅ Cost tracking (token usage)
- ✅ Caching (reduce costs by 30-50%)
- ✅ Generous free tier (100K requests/month)
- ✅ Open-source proxy available

**Limitations**:
- ❌ Proxy-based (adds latency ~10-50ms)
- ❌ Limited to LLM APIs (not full agent tracing)
- ❌ No built-in evaluation

**Best For**:
- OpenAI/Anthropic users
- Cost-conscious teams
- Simple observability (logging + cost tracking)

**Website**: https://www.helicone.ai/

---

#### Product 6: LunaryAI

**Overview**: Open-source LLM observability and evaluation platform.

**Key Features**:
1. **Tracing**: End-to-end traces for LLM applications
2. **Evaluation**: Built-in evaluators (hallucination, relevance)
3. **Prompt Management**: Version control for prompts
4. **User Feedback**: Collect user ratings
5. **Analytics**: Cost, latency, and usage metrics

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Apache 2.0 (open-source) |
| **Deployment** | Cloud (Lunary), self-hosted |
| **Pricing** | Free (self-hosted), $49-$249/month (cloud) |
| **Integration** | LangChain, LlamaIndex, OpenAI, Anthropic |

**Strengths**:
- ✅ Open-source (self-hosted option)
- ✅ Prompt management (version control)
- ✅ User feedback collection
- ✅ Multi-framework support
- ✅ Affordable cloud option ($49/month)

**Limitations**:
- ❌ Smaller community vs LangSmith
- ❌ Less feature-rich than enterprise tools
- ❌ Self-hosted requires DevOps

**Best For**:
- Teams prioritizing prompt management
- Open-source advocates
- Budget-conscious startups

**GitHub**: https://github.com/lunary-ai/lunary

---

#### Product 7: Weights & Biases

**Overview**: ML experiment tracking and collaboration platform.

**Key Features**:
1. **Experiment Tracking**: Log hyperparameters, metrics, artifacts
2. **Model Versioning**: Track model versions and lineage
3. **Collaboration**: Share experiments with team
4. **Reports**: Create interactive reports and dashboards
5. **Sweeps**: Automated hyperparameter optimization

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary + free tier |
| **Deployment** | Cloud (W&B), self-hosted (Enterprise) |
| **Pricing** | Free (individuals), $50-$250/user/month (teams) |
| **Integration** | PyTorch, TensorFlow, HuggingFace, LangChain |

**Strengths**:
- ✅ Industry-leading experiment tracking
- ✅ Collaboration features (team dashboards)
- ✅ Model versioning
- ✅ Free for individuals
- ✅ Extensive integrations

**Limitations**:
- ❌ ML training-focused (less agent-specific)
- ❌ Cost scales with team size
- ❌ Self-hosted requires Enterprise tier

**Best For**:
- ML research teams
- Experiment tracking and collaboration
- Model versioning and governance

**Website**: https://wandb.ai/

---

#### Product 8: DataDog LLM Observability

**Overview**: DataDog's LLM monitoring solution (part of APM).

**Key Features**:
1. **LLM Tracing**: Distributed tracing for LLM calls
2. **Cost Tracking**: Monitor token usage and costs
3. **Latency Monitoring**: P50, P95, P99 latencies
4. **Error Tracking**: Track LLM errors and failures
5. **APM Integration**: Correlate LLM calls with application metrics

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud (DataDog) |
| **Pricing** | $15-$31/host/month (APM), LLM observability add-on |
| **Integration** | OpenAI, Anthropic, LangChain, Python, Node.js |

**Strengths**:
- ✅ Enterprise-grade (DataDog reliability)
- ✅ APM integration (full-stack observability)
- ✅ Cost and latency tracking
- ✅ Multi-framework support

**Limitations**:
- ❌ Expensive (DataDog pricing + LLM add-on)
- ❌ Requires existing DataDog subscription
- ❌ Less agent-specific features vs LangSmith

**Best For**:
- Enterprises already using DataDog
- Full-stack observability (APM + LLM)
- Teams requiring enterprise SLA

**Documentation**: https://docs.datadoghq.com/llm_observability/

---

---

**Previous**: [Data Security & Application Security](03b-data-appsec.md)  
**Next**: [Product Comparison Tables](04-product-comparisons.md) - Quick reference decision guides
