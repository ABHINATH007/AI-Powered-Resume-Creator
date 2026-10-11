# ResumeForge AI — Professional ATS Resume Builder & AI Matcher

> **ResumeForge AI** is an enterprise-grade full-stack web application designed to help job seekers build, optimize, and match applicant-tracking-system (ATS) resumes with artificial intelligence.

---

## 🌟 Features

### 1. 📝 Real-Time Interactive Resume Builder
- **Dynamic Multi-Section Builder**: Edit contact details, professional summary, work experience, education, technical skills, projects, and certifications with zero lag.
- **5 Recruiter-Approved Designer Templates**:
  - **Modern Tech**: Clean balanced layout with crisp accents, optimized for engineering & product.
  - **Clean Minimalist**: 99% ATS parse-safe ultra-readable typography with maximum whitespace.
  - **Executive Leadership**: Authoritative headers with metric highlights for senior managers and directors.
  - **Creative Portfolio**: Structured layout highlighting tech stacks and featured projects.
  - **Compact Single Page**: High-density 1-page fit format for concise presentation.
- **Live Reactive Preview Canvas**: Dual-pane real-time rendering supporting custom accent palettes and curated typography fonts (*Plus Jakarta Sans*, *Figtree*, *Merriweather*, *Space Grotesk*).
- **Completeness Meter & Auto-Save**: Real-time progress tracker and debounced cloud auto-save.

### 2. ⚡ AI Writing & Optimization Engine
- **AI Summary Generator (`POST /api/ai/summary`)**: Generates high-impact executive summaries tailored by target role, experience level, and competencies.
- **AI STAR Bullet Improver (`POST /api/ai/improve-bullet`)**: Transforms generic job descriptions into quantifiable accomplishments with strong action verbs and metrics.
- **AI Job Tailor (`POST /api/ai/tailor`)**: Pinpoints missing skills and generates customized alignment recommendations.

### 3. 🎯 Deep ATS Match & Skill Gap Analysis
- **In-App Resume vs. Job Description Matcher (`POST /api/ats/match`)**: Evaluates resumes using TF-IDF vectorization and cosine similarity against real job descriptions.
- **Keyword Clouds**: Visualizes matched keywords and missing keywords (with one-click instant injection into your resume).
- **Standalone ATS File Matcher (`/index.html`)**: Drag-and-drop PDF upload with instant parsing and analysis.

### 4. 📄 High-Fidelity PDF & Plain Text Exports
- **Server-Side ATS-Standard PDF (`/api/resumes/{id}/pdf`)**: Compiles resumes using OpenPDF into clean, selectable single-column vector PDFs.
- **Unsaved Draft PDF Generation (`POST /api/resumes/pdf`)**: Generates downloadable PDFs on the fly for guest visitors without requiring registration.
- **Clean Plain Text / Markdown Export (`/api/resumes/{id}/txt`)**: Generates ATS-ready plain text resumes.
- **Browser Print / HTML2PDF**: Client-side printable backup option.

### 5. 🔐 Multi-User Authentication & Cloud Persistence
- **Secure Session Auth**: BCrypt password hashing, session cookies, and role management.
- **Dashboard Overview (`/api/dashboard`)**: Displays saved resumes, average ATS score, total match scans, plan tier, and recent scan logs.
- **Resume Management**: Create, edit, clone/duplicate, and delete cloud resumes.
- **Settings & Account Management**: Edit profile preferences, change password, customize page size (A4 / US Letter), and manage accounts.
- **Tiered Pricing (`/api/plans`)**: Free Starter, Career Pro ($12/mo), and Executive Lifetime tiers.

---

## 🚀 Quick Start Guide

### Prerequisites
- **Java 17** or higher
- **Maven** (included via `./mvnw.cmd` wrapper)

### Running Locally
```powershell
# 1. Navigate to the backend directory
cd backend

# 2. Run the application
./mvnw.cmd spring-boot:run
```

The application will start on **http://localhost:8080**.

### 🌐 Accessing the Application
- **ResumeForge AI Studio**: [http://localhost:8080/resume-creator.html](http://localhost:8080/resume-creator.html)
- **ATS File Matcher**: [http://localhost:8080/index.html](http://localhost:8080/index.html)
- **H2 Database Console**: [http://localhost:8080/h2-console](http://localhost:8080/h2-console)
  - JDBC URL: `jdbc:h2:file:./data/resumeforge`
  - User: `sa`
  - Password: *(leave blank)*

### 🔑 Demo Credentials
The application is pre-seeded on startup with a demo user:
- **Email**: `demo@resumeforge.ai`
- **Password**: `demo123`
- Pre-loaded with a Senior Full-Stack Engineer sample resume and ATS score history.

---

## 🛠️ Technology Stack

| Layer | Technologies |
|---|---|
| **Backend** | Java 17, Spring Boot 3.4, Spring Security 6, Spring Data JPA, Hibernate |
| **Database** | H2 (File-persisted mode in `backend/data/resumeforge.mv.db`) |
| **NLP & Scoring** | Apache PDFBox 3.0, TF-IDF Vectorizer, Cosine Similarity, Custom Skill Catalog |
| **PDF Generation** | LibrePDF / OpenPDF 2.0 |
| **Frontend** | Vanilla JavaScript (ES6+), Vanilla CSS (Design tokens & flexbox/grid), HTML5 Semantic elements |
| **Fonts & Icons** | Plus Jakarta Sans, Figtree, Merriweather, Space Grotesk, FontAwesome 6 |

---

## 📡 API Reference Summary

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/auth/register` | Register new user account |
| `POST` | `/api/auth/login` | Sign in and establish session |
| `POST` | `/api/auth/logout` | Terminate session |
| `GET` | `/api/auth/me` | Get current authenticated user |
| `GET` | `/api/resumes` | List saved resumes for current user |
| `POST` | `/api/resumes` | Create new resume |
| `GET` | `/api/resumes/{id}` | Get resume by ID |
| `PUT` | `/api/resumes/{id}` | Update existing resume |
| `DELETE` | `/api/resumes/{id}` | Delete resume |
| `POST` | `/api/resumes/{id}/duplicate` | Clone resume |
| `GET` | `/api/resumes/{id}/pdf` | Download server-compiled ATS PDF |
| `POST` | `/api/resumes/pdf` | Download PDF generated from draft JSON |
| `GET` | `/api/resumes/{id}/txt` | Download clean plain-text resume |
| `POST` | `/api/ats/match` | Calculate match score between resume and JD |
| `POST` | `/api/ats/analyze-file` | Parse uploaded PDF and calculate match score |
| `POST` | `/api/ai/summary` | Generate executive resume summary |
| `POST` | `/api/ai/improve-bullet` | Enhance bullet point with STAR format |
| `POST` | `/api/ai/tailor` | Generate keyword suggestions for a specific role |
| `GET` | `/api/dashboard` | Dashboard metrics, saved resumes, recent scans |
| `GET` | `/api/stats` | Landing page platform statistics |
| `GET` | `/api/templates` | Available resume templates |
| `GET` | `/api/plans` | Subscription tiers and feature limits |
| `POST` | `/api/plans/subscribe` | Upgrade or modify subscription plan |
| `GET` | `/api/settings` | Get user preferences & settings |
| `PUT` | `/api/settings` | Update preferences |
| `PUT` | `/api/settings/password` | Change password |
| `DELETE` | `/api/settings/account` | Delete user account and all resumes |
