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

#### Product 9: Azure Monitor & Application Insights

**Overview**: Microsoft's comprehensive cloud monitoring solution with native Azure AI Services integration.

**Key Features for AI Agents**:

1. **Application Insights (AI Observability)**
   - **Distributed Tracing**: End-to-end trace across Azure OpenAI, Functions, App Service
   - **Dependency Tracking**: Automatic tracking of Azure OpenAI API calls
   - **Performance Monitoring**: Request rates, response times, failure rates
   - **Smart Detection**: AI-powered anomaly detection

2. **Logging & Diagnostics**
   - **Log Analytics**: Query logs using KQL (Kusto Query Language)
   - **Azure OpenAI Logs**: Request/response logging with PII filtering
   - **Diagnostic Settings**: Route logs to storage, Event Hub, or Log Analytics
   - **Custom Telemetry**: Track custom AI agent metrics

3. **Metrics & Dashboards**
   - **Pre-Built Metrics**: Token usage, latency, error rates
   - **Custom Metrics**: Define agent-specific KPIs
   - **Azure Dashboards**: Visual monitoring dashboards
   - **Workbooks**: Interactive reports with KQL queries

4. **Alerting & Actions**
   - **Metric Alerts**: Alert on token usage thresholds, latency spikes
   - **Log Alerts**: Complex queries with KQL
   - **Action Groups**: Webhook, email, SMS, Azure Functions
   - **Smart Detection Alerts**: Automatic anomaly notifications

5. **Cost Management**
   - **Cost Analysis**: Track Azure OpenAI costs per resource/tag
   - **Budget Alerts**: Notify when costs exceed thresholds
   - **Usage Metrics**: Token consumption by model/deployment

6. **Integration with Azure AI Services**
   - **Azure OpenAI Service**: Native diagnostic logs and metrics
   - **Azure AI Search**: Index operations, query latency
   - **Azure Cognitive Services**: Speech, Vision, Language metrics
   - **Azure Bot Service**: Bot conversations, LUIS queries

7. **Security & Compliance**
   - **PII Filtering**: Auto-redact PII in logs (preview)
   - **Audit Logs**: Azure Activity Log for resource changes
   - **RBAC**: Control access to monitoring data
   - **Data Residency**: Store logs in specific Azure regions

8. **Azure OpenAI-Specific Features**
   - **Request Logging**: Full request/response capture (opt-in)
   - **Token Tracking**: Prompt vs completion tokens
   - **Model Metrics**: Per-model performance analysis
   - **Abuse Monitoring**: Track rate limiting, content filtering

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary (Microsoft Azure) |
| **Deployment** | Azure Cloud (60+ regions) |
| **Pricing** | Pay-as-you-go: $2.30/GB ingested (first 5GB free), $0.12/GB retention |
| **Log Analytics** | $2.76/GB ingested (first 5GB free per workspace/month) |
| **Application Insights** | Included with App Service, Functions (pay for data ingestion) |
| **Integration** | Native: Azure OpenAI, AI Search, Functions, App Service, AKS, ML |

**Code Example 1: Azure OpenAI with Application Insights**
```python path=null start=null
import os
from azure.identity import DefaultAzureCredential
from azure.monitor.opentelemetry import configure_azure_monitor
from openai import AzureOpenAI
from opentelemetry import trace

# 1. Configure Application Insights (automatic telemetry)
connection_string = os.getenv("APPLICATIONINSIGHTS_CONNECTION_STRING")
configure_azure_monitor(connection_string=connection_string)
tracer = trace.get_tracer(__name__)

# 2. Azure OpenAI client with Managed Identity
credential = DefaultAzureCredential()
client = AzureOpenAI(
    azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT"),
    api_version="2024-02-15-preview",
    azure_ad_token_provider=lambda: credential.get_token(
        "https://cognitiveservices.azure.com/.default"
    ).token
)

# 3. Traced AI agent call (automatic tracking)
with tracer.start_as_current_span("ai_agent_query") as span:
    span.set_attribute("user.id", "user-123")
    span.set_attribute("model", "gpt-4")
    
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Explain AI safety"}]
    )
    
    # Add custom telemetry
    span.set_attribute("tokens.prompt", response.usage.prompt_tokens)
    span.set_attribute("tokens.completion", response.usage.completion_tokens)
    span.set_attribute("tokens.total", response.usage.total_tokens)

# All telemetry automatically sent to Application Insights!
```

**Code Example 2: KQL Query for Azure OpenAI Monitoring**
```kusto
// Azure OpenAI request logs (Log Analytics)
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.COGNITIVESERVICES"
| where Category == "RequestResponse"
| where TimeGenerated > ago(1h)
| extend model = tostring(parse_json(properties_s).model)
| extend prompt_tokens = toint(parse_json(properties_s).usage.prompt_tokens)
| extend completion_tokens = toint(parse_json(properties_s).usage.completion_tokens)
| summarize 
    TotalRequests = count(),
    AvgPromptTokens = avg(prompt_tokens),
    AvgCompletionTokens = avg(completion_tokens),
    P95Latency = percentile(DurationMs, 95)
  by model, bin(TimeGenerated, 5m)
| render timechart
```

**Code Example 3: Cost Alert (Bicep)**
```bicep
// Alert when Azure OpenAI costs exceed $1000/day
resource costAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'azure-openai-cost-alert'
  location: 'global'
  properties: {
    description: 'Alert when daily Azure OpenAI costs exceed $1000'
    severity: 2
    enabled: true
    scopes: [
      azureOpenAIAccount.id
    ]
    evaluationFrequency: 'PT1H'
    windowSize: 'PT1H'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'TokenUsageThreshold'
          metricName: 'TokenTransaction'
          operator: 'GreaterThan'
          threshold: 20000000  // ~$1000 for GPT-4
          timeAggregation: 'Total'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
```

**Strengths**:
- ✅ **Native Azure Integration**: Zero-config for Azure OpenAI, Functions, App Service
- ✅ **Azure OpenAI Specific**: Request/response logging, token tracking, model metrics
- ✅ **Application Insights**: Automatic distributed tracing across Azure services
- ✅ **KQL Queries**: Powerful log analytics with Kusto Query Language
- ✅ **Cost Management**: Built-in cost tracking and budget alerts
- ✅ **Smart Detection**: AI-powered anomaly detection (no configuration)
- ✅ **PII Filtering**: Automatic PII redaction in logs (preview)
- ✅ **Workbooks**: Pre-built Azure OpenAI monitoring templates
- ✅ **Enterprise SLA**: 99.9% availability, 24/7 support
- ✅ **Data Residency**: Keep logs in specific Azure regions (compliance)

**Limitations**:
- ❌ **Azure-Only**: Optimized for Azure services (limited multi-cloud)
- ❌ **Cost at Scale**: $2.30-$2.76/GB can add up (10GB/day = $700/month)
- ❌ **Learning Curve**: KQL requires expertise
- ❌ **No Agent-Specific Features**: General observability (vs LangSmith's agent focus)
- ❌ **Retention Costs**: $0.12/GB/month for long-term retention

**Best For**:
- **Azure OpenAI Users**: Native integration with automatic telemetry
- **Azure-Native Stacks**: Functions, App Service, AKS workloads
- **Enterprise Compliance**: Data residency, PII filtering, audit trails
- **Cost-Conscious**: Built-in cost tracking and alerts
- **Multi-Service Monitoring**: Unified observability for all Azure resources

**Azure OpenAI Monitoring Checklist**:
1. **Enable Diagnostic Settings**: Route logs to Log Analytics workspace
2. **Configure Application Insights**: Add to Functions/App Service
3. **Set Up Cost Alerts**: Alert at 80% of monthly budget
4. **Create Dashboards**: Token usage, latency, error rates
5. **Enable Smart Detection**: Automatic anomaly alerts
6. **Configure PII Filtering**: Redact sensitive data in logs
7. **Set Up Workbooks**: Use Azure OpenAI pre-built templates
8. **Monitor Abuse**: Track rate limiting, content filtering events

**Integration with Azure AI Services**:
- ✅ **Azure OpenAI**: Request/response logs, token metrics, model performance
- ✅ **Azure AI Search**: Query latency, index operations, cost tracking
- ✅ **Azure Cognitive Services**: API call tracking, error rates
- ✅ **Azure Bot Service**: Conversation analytics, LUIS metrics
- ✅ **Azure Machine Learning**: Model training, inference metrics
- ✅ **Azure Key Vault**: Secret access auditing (via diagnostic logs)

**Pricing Breakdown (Example: 10GB logs/month)**:
- **Log Analytics Ingestion**: 10GB * $2.76/GB = $27.60/month (first 5GB free: $13.80)
- **Retention (90 days)**: 10GB * $0.12/GB/month * 3 = $3.60/month
- **Total**: ~$17.40/month for 10GB logs

**vs Competitors**:
| Feature | Azure Monitor | DataDog | LangSmith |
|---------|--------------|---------|----------|
| **Azure OpenAI Native** | ✅ Yes | ❌ Limited | ❌ No |
| **Cost Tracking** | ✅ Built-in | ❌ Manual | ✅ Yes |
| **Agent-Specific** | ❌ No | ❌ No | ✅ Yes |
| **Multi-Cloud** | ❌ Azure-only | ✅ Yes | ✅ Yes |
| **Pricing** | $2.30/GB | $15-$31/host | $39-$399/month |
| **Setup Complexity** | Low (Azure) | Medium | Low |

**Real-World Use Case**:
**Company**: Financial Services AI Chatbot (Azure-Native)
- **Challenge**: Monitor 1M Azure OpenAI requests/day, track costs, detect anomalies
- **Solution**:
  - Application Insights for Functions (AI agent runtime)
  - Diagnostic logs to Log Analytics (Azure OpenAI)
  - Daily cost alerts at $500 threshold
  - KQL queries for token usage by user/department
  - Smart Detection for latency spikes
- **Result**:
  - 100% Azure OpenAI visibility (all requests logged)
  - $1.2K/month cost optimization (identified inefficient prompts)
  - 40% faster incident response (automated alerts)
  - Compliance achieved (audit logs, PII filtering)

**Recommendation**: Use **Azure Monitor + Application Insights** for Azure-native AI agents (seamless integration, cost-effective). Supplement with **LangSmith** for agent-specific debugging if using LangChain.

**Documentation**:
- [Azure Monitor](https://learn.microsoft.com/en-us/azure/azure-monitor/)
- [Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)
- [Azure OpenAI Monitoring](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/monitoring)
- [KQL Reference](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/)

---

---

**Previous**: [Data Security & Application Security](03b-data-appsec.md)  
**Next**: [Product Comparison Tables](04-product-comparisons.md) - Quick reference decision guides
