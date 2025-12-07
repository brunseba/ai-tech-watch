### Domain 3: Data Security

**Purpose**: Protect sensitive data in AI pipelines (training, inference, retrieval) from leakage and unauthorized access.

**Why Critical**: AI agents often process PII, PHI, payment data, and proprietary information that must be protected to comply with GDPR, HIPAA, PCI-DSS.

#### Key Data Security Capabilities

1. **PII Detection & Redaction**: Identify and mask personally identifiable information
2. **Data Encryption**: At-rest and in-transit encryption for vector databases
3. **Data Access Controls**: Row-level security in RAG systems
4. **Data Minimization**: Collect only necessary data
5. **Synthetic Data**: Generate fake data for testing

---

#### Product 1: Private AI

**Overview**: PII detection and redaction platform for text and documents.

**Key Features**:
1. **50+ PII Types**: Names, SSN, phone, email, credit cards, medical IDs, etc.
2. **Redaction Modes**: Mask, replace, anonymize, pseudonymize
3. **Multi-Language**: 50+ languages supported
4. **Document Support**: Text, PDFs, images (OCR)
5. **API & SDK**: REST API, Python SDK

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud (Private AI), self-hosted (Enterprise) |
| **Pricing** | Free tier (1,000 calls/month), $0.002/request (paid) |
| **Accuracy** | 95%+ PII detection accuracy |

**Strengths**:
- ✅ 50+ PII types (most comprehensive)
- ✅ Multi-language (50+ languages)
- ✅ Document support (PDFs, images)
- ✅ Multiple redaction modes
- ✅ Generous free tier (1,000/month)

**Limitations**:
- ❌ Cost scales with volume ($0.002/request)
- ❌ Vendor dependency (cloud-only for most)
- ❌ Requires API integration

**Best For**:
- GDPR/HIPAA compliance
- RAG applications with sensitive data
- Document processing workflows

**Website**: https://www.private-ai.com/

---

#### Product 2: Gretel.ai

**Overview**: Synthetic data generation platform for safe AI development.

**Key Features**:
1. **Synthetic Data Generation**: Generate realistic fake data
2. **Differential Privacy**: Mathematically proven privacy guarantees
3. **Data Anonymization**: Remove PII while preserving utility
4. **Quality Metrics**: Statistical similarity to original data
5. **API & SDKs**: Python SDK, REST API

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary + open-source SDK |
| **Deployment** | Cloud (Gretel), self-hosted (Enterprise) |
| **Pricing** | Free tier (100K records/month), $0.03-$0.10/1K records |
| **Accuracy** | 90%+ utility preservation |

**Strengths**:
- ✅ Differential privacy (provable guarantees)
- ✅ Synthetic data for testing (no real PII exposure)
- ✅ Quality metrics (validate data utility)
- ✅ Open-source SDK (transparency)
- ✅ Generous free tier (100K records/month)

**Limitations**:
- ❌ Complex setup (requires data science expertise)
- ❌ Cost scales with volume
- ❌ Synthetic data quality varies by use case

**Best For**:
- Testing/development environments
- Data science teams
- Sharing datasets externally (partners, contractors)

**Website**: https://gretel.ai/

---

#### Product 3: AWS Macie

**Overview**: AWS's data security service for discovering and protecting sensitive data.

**Key Features**:
1. **Automated Discovery**: Scan S3 buckets for PII/PHI
2. **Data Classification**: 100+ sensitive data types
3. **Risk Scoring**: Assess data exposure risk
4. **Alerts**: CloudWatch integration for real-time alerts
5. **Compliance**: GDPR, HIPAA, PCI-DSS reporting

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary (AWS) |
| **Deployment** | AWS Cloud |
| **Pricing** | $1.00 per 1GB scanned (discovery), $0.10/1K objects (monitoring) |
| **Integration** | S3, CloudWatch, EventBridge |

**Strengths**:
- ✅ Automated discovery (no manual tagging)
- ✅ 100+ sensitive data types
- ✅ Native AWS integration (S3, CloudWatch)
- ✅ Compliance reporting (GDPR, HIPAA)

**Limitations**:
- ❌ AWS S3 only (not for other clouds/databases)
- ❌ Cost scales with data volume ($1/GB)
- ❌ Discovery-focused (not real-time redaction)

**Best For**:
- AWS S3 users
- Data lake security
- Compliance audits (GDPR, HIPAA)

**Documentation**: https://aws.amazon.com/macie/

---

#### Product 4: Microsoft Purview

**Overview**: Microsoft's data governance and compliance platform.

**Key Features**:
1. **Data Map**: Automated data discovery across Azure, AWS, GCP, on-prem
2. **Sensitivity Labels**: Classify data (Public, Confidential, Restricted)
3. **Data Lineage**: Track data flow across systems
4. **Policy Enforcement**: Automated access controls based on classification
5. **Compliance Manager**: GDPR, HIPAA, SOC 2 assessments

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary (Microsoft) |
| **Deployment** | Azure Cloud |
| **Pricing** | $0.167/GB scanned (data map), $0.25/hour (scanning) |
| **Integration** | Azure, AWS, GCP, on-prem sources |

**Strengths**:
- ✅ Multi-cloud (Azure, AWS, GCP)
- ✅ Data lineage (end-to-end visibility)
- ✅ Policy automation (enforce access controls)
- ✅ Compliance dashboard

**Limitations**:
- ❌ Microsoft-centric (best with Azure)
- ❌ Complex setup (requires governance team)
- ❌ Expensive for large data estates

**Best For**:
- Multi-cloud data governance
- Enterprises with complex data estates
- Compliance-driven organizations

**Documentation**: https://azure.microsoft.com/en-us/products/purview/

---

#### Product 5: Immuta

**Overview**: Data access control platform with dynamic policy enforcement.

**Key Features**:
1. **Dynamic Data Masking**: Real-time PII masking based on user role
2. **Row-Level Security**: Filter data per user/role
3. **Policy Automation**: Define policies once, enforce everywhere
4. **Purpose-Based Access**: Grant access based on data usage purpose
5. **Multi-Database**: Snowflake, Databricks, Redshift, BigQuery, etc.

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud, self-hosted |
| **Pricing** | Custom (starts ~$50K/year) |
| **Integration** | 20+ databases/warehouses |

**Strengths**:
- ✅ Dynamic masking (real-time, role-based)
- ✅ Row-level security (fine-grained access)
- ✅ Purpose-based access (GDPR-friendly)
- ✅ Multi-database (not locked to vendor)

**Limitations**:
- ❌ Expensive (enterprise pricing)
- ❌ Complex setup
- ❌ Requires data governance expertise

**Best For**:
- RAG applications with sensitive databases
- Enterprises requiring row-level security
- GDPR compliance (purpose-based access)

**Website**: https://www.immuta.com/

---

### Domain 4: Application Security

**Purpose**: Secure the AI application codebase, dependencies, and deployment pipelines.

**Why Critical**: AI applications depend on 10-50+ libraries (LangChain, LlamaIndex, transformers, etc.), each a potential vulnerability. Supply chain attacks are a top threat (OWASP #5).

#### Key AppSec Capabilities

1. **Dependency Scanning**: Detect vulnerabilities in libraries
2. **SBOM Generation**: Software Bill of Materials for transparency
3. **Code Scanning**: Static analysis for security issues
4. **Container Security**: Secure Docker images
5. **CI/CD Integration**: Automated security checks

---

#### Product 1: Snyk

**Overview**: Developer-first security platform for code, dependencies, containers, and IaC.

**Key Features**:
1. **Dependency Scanning**: Detects vulnerabilities in 10M+ packages
2. **Automated Fixes**: One-click PRs to fix vulnerabilities
3. **Container Scanning**: Docker image vulnerability detection
4. **IaC Security**: Terraform, Kubernetes YAML scanning
5. **IDE Integration**: VS Code, JetBrains, Eclipse

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary + free tier |
| **Deployment** | Cloud (Snyk-managed) |
| **Pricing** | Free (open-source projects), $25-$89/developer/month |
| **Integration** | GitHub, GitLab, Bitbucket, CI/CD tools |

**Strengths**:
- ✅ Developer-friendly (IDE integration, automated fixes)
- ✅ 10M+ package vulnerability database
- ✅ Multi-language (Python, JavaScript, Java, Go, etc.)
- ✅ CI/CD integration (GitHub Actions, Jenkins, etc.)
- ✅ Free for open-source projects

**Limitations**:
- ❌ Cost scales with developers ($25-$89/dev/month)
- ❌ Cloud-only (no self-hosted)
- ❌ Some false positives

**Best For**:
- Development teams prioritizing speed
- Open-source projects (free)
- Teams using GitHub/GitLab

**Website**: https://snyk.io/

---

#### Product 2: GitHub Advanced Security

**Overview**: GitHub's native security features for code scanning and secret detection.

**Key Features**:
1. **Dependabot**: Automated dependency updates and vulnerability alerts
2. **Code Scanning**: CodeQL engine for semantic analysis
3. **Secret Scanning**: Detect API keys, tokens in code
4. **Security Advisories**: GitHub's vulnerability database
5. **Pull Request Integration**: Block PRs with vulnerabilities

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary (GitHub) |
| **Deployment** | GitHub Cloud, GitHub Enterprise Server |
| **Pricing** | Free (public repos), $49/user/month (private repos) |
| **Integration** | Native GitHub integration |

**Strengths**:
- ✅ Native GitHub integration (zero setup)
- ✅ CodeQL (powerful semantic analysis)
- ✅ Free for public repos
- ✅ Automated dependency updates (Dependabot)
- ✅ Secret scanning (prevents credential leaks)

**Limitations**:
- ❌ GitHub-only (not portable)
- ❌ Cost for private repos ($49/user/month)
- ❌ Limited customization vs standalone tools

**Best For**:
- GitHub users (especially public repos)
- Teams prioritizing native integration
- Open-source projects

**Documentation**: https://docs.github.com/en/code-security

---

#### Product 3: GitLab Security Dashboard

**Overview**: GitLab's built-in security features for SAST, DAST, dependency scanning.

**Key Features**:
1. **SAST**: Static Application Security Testing
2. **DAST**: Dynamic Application Security Testing
3. **Dependency Scanning**: Detects vulnerable dependencies
4. **Container Scanning**: Docker image vulnerabilities
5. **License Compliance**: Track open-source licenses

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary (GitLab) |
| **Deployment** | GitLab Cloud, self-hosted |
| **Pricing** | Free tier (basic features), Ultimate: $99/user/month |
| **Integration** | Native GitLab integration |

**Strengths**:
- ✅ All-in-one (SAST, DAST, dependency, container scanning)
- ✅ Self-hosted option (GitLab self-managed)
- ✅ Native CI/CD integration
- ✅ License compliance (track OSS licenses)

**Limitations**:
- ❌ GitLab-only (not portable)
- ❌ Advanced features require Ultimate tier ($99/user/month)
- ❌ SAST/DAST quality varies by language

**Best For**:
- GitLab users
- Teams requiring self-hosted security
- All-in-one DevSecOps platform

**Documentation**: https://docs.gitlab.com/ee/user/application_security/

---

#### Product 4: Checkmarx

**Overview**: Enterprise SAST/DAST platform for application security.

**Key Features**:
1. **Checkmarx One**: Unified platform (SAST, SCA, IaC, API security)
2. **AI-Powered Analysis**: Reduce false positives
3. **Remediation Guidance**: Fix recommendations
4. **IDE Plugins**: Real-time scanning in IDE
5. **Compliance**: OWASP, PCI-DSS, HIPAA

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud, self-hosted |
| **Pricing** | Custom (starts ~$100K/year for enterprise) |
| **Integration** | 20+ CI/CD tools, IDEs |

**Strengths**:
- ✅ Enterprise-grade (Fortune 500 adoption)
- ✅ AI-powered (reduced false positives)
- ✅ Comprehensive (SAST, SCA, IaC, API)
- ✅ Compliance reporting

**Limitations**:
- ❌ Expensive (enterprise pricing)
- ❌ Complex setup
- ❌ Overkill for small teams

**Best For**:
- Large enterprises (1,000+ developers)
- Regulated industries (finance, healthcare)
- Teams requiring compliance reporting

**Website**: https://checkmarx.com/

---

#### Product 5: Veracode

**Overview**: Cloud-based application security platform.

**Key Features**:
1. **Static Analysis**: SAST for 100+ languages
2. **Dynamic Analysis**: DAST for web apps
3. **SCA**: Software Composition Analysis (dependencies)
4. **Manual Penetration Testing**: Human-driven testing (add-on)
5. **Security Labs**: Training for developers

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary |
| **Deployment** | Cloud (Veracode-managed) |
| **Pricing** | Custom (starts ~$50K/year) |
| **Integration** | CI/CD, IDEs, issue trackers |

**Strengths**:
- ✅ 100+ languages supported
- ✅ Manual pen testing (hybrid approach)
- ✅ Security training (developer education)
- ✅ Cloud-based (no infrastructure)

**Limitations**:
- ❌ Expensive (enterprise pricing)
- ❌ Cloud-only (no self-hosted)
- ❌ Slower than modern tools (longer scan times)

**Best For**:
- Enterprises requiring manual pen testing
- Teams prioritizing developer training
- Regulated industries

**Website**: https://www.veracode.com/

---

#### Product 6: FOSSA

**Overview**: Open-source license compliance and vulnerability management.

**Key Features**:
1. **License Compliance**: Track 200+ OSS licenses
2. **Vulnerability Scanning**: Detect CVEs in dependencies
3. **SBOM Generation**: Automated Software Bill of Materials
4. **Policy Enforcement**: Block non-compliant licenses
5. **Attribution Reports**: Generate license attribution for legal

**Specifications**:

| Dimension | Details |
|-----------|----------|
| **License** | Proprietary + free tier |
| **Deployment** | Cloud, self-hosted (Enterprise) |
| **Pricing** | Free (open-source), $5-$15/developer/month (paid) |
| **Integration** | GitHub, GitLab, Bitbucket, CI/CD |

**Strengths**:
- ✅ License compliance (200+ licenses)
- ✅ SBOM generation (automated)
- ✅ Policy enforcement (block non-compliant)
- ✅ Free for open-source projects

**Limitations**:
- ❌ Focused on licenses (not full AppSec)
- ❌ Less comprehensive than Snyk/Checkmarx
- ❌ Cost scales with developers

**Best For**:
- License compliance (GPL, MIT, Apache)
- Teams requiring SBOM
- Open-source projects

**Website**: https://fossa.com/

---


---

**Previous**: [Guardrails & Identity Management](03a-guardrails-iam.md)  
**Next**: [Threat Detection & Observability](03c-threat-observability.md) - 7 threat detection + 8 observability products
