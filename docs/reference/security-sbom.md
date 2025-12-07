# AI Agent Security Stack - SBOM (Software Bill of Materials)

Comprehensive Software Bill of Materials for recommended AI agent security implementations across different deployment scenarios.

## Overview

This document provides SBOM information for security stack components to help with:
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

## Stack 1: Open-Source Foundation (Minimal Budget)

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

## Stack 2: Azure-Native (Enterprise)

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

## Stack 3: AWS-Native (Cloud-First)

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

## Stack 4: Hybrid Multi-Cloud (Enterprise)

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

## Stack 5: Kubernetes-Native (Container Platform)

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
