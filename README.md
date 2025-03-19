# A&E Attendance in England During COVID-19

A brief analysis of how COVID-19 impacted Accident & Emergency (A&E) attendance and standards of care across multiple regions in England. This project focuses on quantitative findings from Ordinary Least Squares (OLS) regression models, highlighting key insights and regional variations.

---

## Table of Contents

1. [Introduction](#introduction)  
2. [Key Findings](#key-findings)  
   - [Variations & Influencing Factors](#variations--influencing-factors)  
   - [Impact of COVID-19 on Attendance](#impact-of-covid-19-on-attendance)  
   - [Regional Variations](#regional-variations)  
   - [Changes in A&E Standards](#changes-in-ae-standards)  
3. [Insights & Recommendations](#insights--recommendations)  
4. [Limitations & Next-Steps](#limitations--next-steps)

---

## Introduction

During the COVID-19 pandemic, A&E departments across England experienced significant strain. This provided a unique context to study the relationship between infection rates, A&E attendance, and quality-of-care metrics (e.g., 4-hour wait time targets). 

**Objective**  
- Investigate how A&E attendance and care standards varied across four regions (North, Midlands, London, South).  
- Determine whether COVID-19 infection rates significantly influenced A&E usage and care quality.

**Method**  
- OLS regression was used to model A&E attendance and care standards.  
- Separate analyses by region to identify location-specific patterns.  
- Model diagnostics (R-squared, p-values, Durbin-Watson, etc.) were examined to assess fit and assumptions.

---

## Key Findings

### Variations & Influencing Factors
- **Emergency admissions** strongly correlated with overall A&E attendance (significant coefficient, p < 0.05).  
- **COVID-19 infection rate** and **4-hour wait proportion** were less consistently significant in certain regions.  
- Some models indicated **multicollinearity** and **non-normal residuals**, suggesting the need for more nuanced modeling.

### Impact of COVID-19 on Attendance
- **Negative correlation** between infection rates and A&E attendance in multiple models (people possibly avoiding A&E to reduce exposure).  
- **Longer wait times** correlated positively with attendance in some regions, implying healthcare system stress.  
- **Low R-squared** in London (0.031) indicates additional variables may explain A&E usage patterns there.

### Regional Variations
- Significant differences in **A&E attendance** across regions. For example, the North showed noticeably higher attendance.  
- The Midlands and South presented moderate but comparable patterns, while London’s factors were less explained by these models.  
- Region-specific dummy variables were often statistically significant, highlighting **place-based** differences.

### Changes in A&E Standards
- **Standards of care** (4-hour benchmark) generally **decreased** with rising COVID-19 infection rates.  
- Regional coefficients (e.g., North, South) signaled that COVID-19’s impact on care standards varied by location.  
- Overall, higher infection rates correlated with worse performance on wait-time metrics, although specific effects differed by region.

---

## Insights & Recommendations

1. **Resource Allocation**  
   - Direct more staff and supplies to **high-infection regions** to maintain care quality.  
   - Focus on **workflow optimization** in facilities where 4-hour wait times regularly exceed targets.

2. **Public Health Measures**  
   - Strengthen **vaccination campaigns** and safety measures to control infection rates and indirectly reduce A&E strain.  
   - Increase **public awareness** of when to attend A&E vs. alternative care pathways.

3. **Region-Specific Policies**  
   - **London** likely requires unique interventions given its low model fit.  
   - **North** and **South** might benefit from targeted approaches to staffing, given more substantial impacts from infection rates.

4. **Enhanced Data & Models**  
   - Address **autocorrelation** and **residual non-normality** via time-series or panel analysis.  
   - Add **demographic**, **health policy**, or **infrastructure** variables for more robust modeling.

---

## Limitations & Next Steps

- **Data Normality & Autocorrelation**: Tests (Omnibus, Durbin-Watson) flagged potential OLS assumption violations.  
- **Unmodeled Factors**: Lockdown policies, population density, and hospital management changes were not included.  
- **Region-Specific Discrepancies**: London’s low R-squared suggests unaccounted variables (e.g., socioeconomic, commuting patterns).

**Next Steps**  
- Consider **time-series methods** or **machine-learning** models for potentially more accurate results.  
- Incorporate broader data sources (e.g., demographic profiles, local policy measures).  
- Conduct **ongoing monitoring** to adapt resource allocation in real-time during health crises.

---

**Note:** This repository contains summarized regression outputs, plots, and associated diagnostic stats. Additional details on data cleaning, modeling steps, and code can be found in the project files.

---
