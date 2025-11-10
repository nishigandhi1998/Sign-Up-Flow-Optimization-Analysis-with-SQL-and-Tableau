# 🚀 Sign-Up Flow Optimization Analysis with SQL & Tableau  
**Data-Driven Insights to Improve User Conversion and Onboarding Experience**

![SQL](https://img.shields.io/badge/Tool-SQL-blue?logo=mysql)
![Tableau](https://img.shields.io/badge/Tool-Tableau-orange?logo=tableau)
![Analysis Type](https://img.shields.io/badge/Type-Funnel%20Optimization-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 🧭 Project Overview
This project analyzes **user registration behavior** to uncover friction points in the **sign-up process** of 365 Company’s platform.  
By combining **SQL** for data extraction and **Tableau** for visualization, the analysis identifies where users drop off, which sign-up methods perform best, and how UX improvements can directly enhance **visitor-to-free-user conversion rates**.

---

## 🎯 Objective
To evaluate the **effectiveness of the current sign-up flow**, quantify failures by method and device, and propose actionable optimizations to increase conversions and improve the overall **user experience (UX)**.

---

## 🧩 Business Context
365 Company noticed stagnating user conversions despite offering multiple sign-up options (Email, Google, LinkedIn, Facebook).  
The business needed a **data-driven approach** to pinpoint where users abandon the process and how to fix those issues efficiently.

---

## ⚙️ Tools & Techniques
| Category | Tools / Techniques |
|-----------|--------------------|
| **Data Extraction & Querying** | SQL (MySQL Workbench) |
| **Visualization** | Tableau Desktop / Tableau Public |
| **Analysis** | Descriptive Statistics, Funnel Analysis, Hypothesis Testing |
| **Business Insight** | A/B Testing, Opportunity Sizing, Conversion Rate Analysis |

---

## 📊 Key Findings

### 🔹 Overall Performance
- **Desktop sign-up fail rate:** 1.16%  
- **Mobile sign-up fail rate:** 3.24% → *mobile users are 3× more likely to fail.*  
- **Most failures by OS:** Android (2,309)  
- **Most successful retries:** Android (4,077)

---

### 🔹 Sign-Up Method Comparison
| Method | Success Rate | Fail Rate | Notes |
|---------|---------------|-----------|-------|
| **Google** | **91%** | 3.2% | Most popular & reliable |
| **LinkedIn** | 87% | - | Stable conversion performance |
| **Facebook** | 69% | 7.6% | Frequent “unknown” API errors (349) |
| **Email** | **65%** | 6.2% | High error rate; **25% login fails** post-sign-up |

---

### 🔹 Mobile & Email Friction
- **85% of email input errors** came from mobile users.  
- 1,273 out of 1,508 total email failures occurred on mobile.  
- Common issues: tiny form fields, password complexity, and input autocorrect problems.  

### 🔹 External Factors
- **778 users** closed the Google OAuth pop-up mid-process → *external, user-driven failure event.*

---

## 💡 Actionable Insights

| Problem Area | Observation | Recommendation |
|---------------|--------------|----------------|
| **Mobile Email UX** | High input & password error rate | Simplify email form and reduce password complexity |
| **Social Sign-Up Visibility** | Users default to email | Highlight Google & LinkedIn options more prominently |
| **OAuth Pop-Up** | Premature closure | Add in-app guidance or fallback login option |
| **Facebook Integration** | 349 unknown errors | Investigate API issue and improve error logging |
| **Password Recovery** | Multi-step process | Simplify to 1-click password reset flow |

---

## 📈 Quantified Opportunity
- **Expected Conversion Lift:** +10% (3.2% → 3.52%)  
- **Additional Free Users:** +3,587  
- **Paid Conversions per 10K Visitors:** +14  
- **Revenue Gain per 10K Visitors:** **≈ $420** (at $30 ARPU)  
- **Scalable Revenue Impact:** Significant when extrapolated to total visitor volume  

---

## 🧪 A/B Testing Plan
| Parameter | Value |
|------------|--------|
| **Hypothesis** | Highlighting social sign-ups increases conversion |
| **Test Type** | Two-Sample A/B (Parallel) |
| **Metric** | Visitor → Free Conversion Rate |
| **Baseline Conversion** | 3.2% |
| **Target Uplift (MDE)** | +10% |
| **Significance Level (α)** | 0.05 |
| **Statistical Power (1−β)** | 0.8 |
| **Sample Size Estimate** | ~50,000 visitors per variant |

---

## 📊 Tableau Dashboard Components
**Dashboard Views:**
1. **Funnel Overview** – Visitor → Attempt → Success (by device & OS)  
2. **Sign-Up Method Breakdown** – Google, LinkedIn, Facebook, Email  
3. **Error Distribution** – Error types & frequencies  
4. **Mobile UX Analysis** – Email input error visualization  
5. **A/B Test Simulation** – Expected lift and revenue forecast  

---

## 🧠 Business Recommendations
1. **Promote high-success social sign-ups (Google, LinkedIn)** at the top of the form.  
2. **Redesign mobile email fields** — optimize for small screens and reduce password friction.  
3. **Fix technical errors** — investigate Facebook and Google OAuth integrations.  
4. **Simplify password recovery** to improve reactivation.  
5. **Run structured A/B tests** to validate improvements and monitor key funnel metrics.  

---

## 📈 Business Impact Summary
| Metric | Before | After (Expected) | Outcome |
|---------|---------|------------------|----------|
| Visitor → Free Conversion | 3.2% | 3.52% | +10% relative lift |
| Free → Paid Conversion | 0.43% | 0.45% | +14 new paid users / 10K visitors |
| Incremental Revenue | - | +$420 / 10K visitors | Sustained growth potential |

---

## 💬 Executive Takeaway
> **Streamlining the sign-up experience is not just a UX improvement — it’s a growth lever.**  
> Data analysis revealed that mobile and email friction are the biggest bottlenecks, while social logins like Google and LinkedIn drive efficiency.  
> Implementing the recommended optimizations can produce measurable revenue and engagement growth.

---

## 🧰 Skills Demonstrated
**SQL** · **Tableau** · **Data Visualization** · **Funnel Analysis** · **A/B Testing** · **Business Analytics** · **Statistical Validation** · **Data Storytelling** · **Conversion Optimization**

--- 

### ⭐ If you found this project interesting  
Give it a ⭐ on GitHub and connect with me to discuss Data analytics !

## 🤝 For more details or collaboration opportunities, feel free to connect with me on 
👤 **Nishi** — Data Analyst  
📍 *Passionate about transforming raw data into business impact through analytics and visualisation.*
🔗 [LinkedIn](https://www.linkedin.com/in/nishigandhianalyst/) | [Email](nishigandhi1998@gmail.com) | | [TABLEAU PUBLIC](https://public.tableau.com/views/Sign_up_flow_optimization/SignupFlowStory?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


---

© 2025 Nishi — All Rights Reserved  
*Sign-Up Flow Optimisation Analysis with SQL & Tableau Project*

