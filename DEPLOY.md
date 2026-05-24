# How to Deploy lochan.online — GitHub + Vercel Guide

Complete step-by-step instructions to push your portfolio to GitHub and get it live on lochan.online via Vercel.

---

## Step 1 — Install Git (if you haven't already)

1. Go to https://git-scm.com/download/win
2. Download and run the installer (keep all default settings)
3. Open **Command Prompt** or **PowerShell** and verify:
   ```
   git --version
   ```
   You should see something like `git version 2.45.0`

---

## Step 2 — Configure Git (first time only)

Open Command Prompt and run these two commands with your details:

```
git config --global user.name "Lochan Yadav"
git config --global user.email "lochan.yadavgolla@gmail.com"
```

---

## Step 3 — Push Your Files to GitHub

Your GitHub repo is:
👉 https://github.com/yadavgollalochan-blip/Lochan-Projects

### 3a. Navigate to your portfolio folder

```
cd "C:\Users\lochan.yadav\Documents\Claude-global\SEO\Portfolio"
```

### 3b. Initialize Git and connect to your repo

```
git init
git remote add origin https://github.com/yadavgollalochan-blip/Lochan-Projects.git
```

> If the repo already has files and you get an error, use:
> `git remote set-url origin https://github.com/yadavgollalochan-blip/Lochan-Projects.git`

### 3c. Stage all files

```
git add .
```

### 3d. Commit your changes

```
git commit -m "feat: redesigned portfolio with light theme, tools, blog, 404, sitemap"
```

### 3e. Push to GitHub

```
git push -u origin main
```

> If your default branch is `master`, use `git push -u origin master` instead.
> If prompted, log in with your GitHub username and a **Personal Access Token** (not your password).

**To create a Personal Access Token:**
1. Go to https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Give it `repo` scope → Generate → Copy the token
4. Use it as your password when Git asks

---

## Step 4 — Deploy on Vercel

Your Vercel team page is:
👉 https://vercel.com/yadavgollalochan-blips-projects

### 4a. Log in and create a new project

1. Go to https://vercel.com and sign in with GitHub
2. Click **"Add New Project"**
3. Click **"Import Git Repository"**
4. Find **Lochan-Projects** in the list and click **Import**

### 4b. Configure the project

| Setting | Value |
|---|---|
| Framework Preset | **Other** (it's plain HTML, not a framework) |
| Root Directory | `.` (leave as default) |
| Build Command | *(leave blank)* |
| Output Directory | *(leave blank)* |

Click **Deploy** — Vercel will deploy in about 30 seconds.

### 4c. Add your custom domain (lochan.online)

1. In your Vercel project, go to **Settings → Domains**
2. Type `lochan.online` and click **Add**
3. Also add `www.lochan.online` if you want the www version to redirect
4. Vercel will show you **DNS records** to add

### 4d. Update DNS at your domain registrar

Go to wherever you bought lochan.online (GoDaddy, Namecheap, Cloudflare, etc.) and add these records:

**Option A — CNAME (recommended for most registrars):**
| Type | Name | Value |
|---|---|---|
| CNAME | www | cname.vercel-dns.com |
| A | @ | 76.76.21.21 |

**Option B — if your registrar supports ALIAS/ANAME:**
| Type | Name | Value |
|---|---|---|
| ALIAS | @ | cname.vercel-dns.com |
| CNAME | www | cname.vercel-dns.com |

DNS changes take 15 minutes to 48 hours to propagate. Vercel will show a green checkmark when the domain is verified.

---

## Step 5 — Future Updates (Every Time You Change Files)

After making any edits to your portfolio:

```
cd "C:\Users\lochan.yadav\Documents\Claude-global\SEO\Portfolio"
git add .
git commit -m "update: describe what you changed"
git push
```

Vercel automatically detects every push to GitHub and redeploys your site within ~30 seconds. No manual action needed.

---

## Step 6 — Submit to Google Search Console

Once your site is live at lochan.online:

1. Go to https://search.google.com/search-console
2. Add property → URL prefix → `https://lochan.online/`
3. Verify using the HTML tag method (Vercel makes this easy — add it as a `<meta>` tag in index.html)
4. Submit your sitemap: **Sitemaps → Add sitemap → `sitemap.xml`**

---

## File Structure Summary

```
Lochan-Projects/
├── index.html                          ← Main portfolio (redesigned)
├── blog.html                           ← Blog with AEO, GEO, Technical SEO articles
├── 404.html                            ← Custom 404 page
├── robots.txt                          ← Allows all crawlers, points to sitemap
├── sitemap.xml                         ← All pages with priority and changefreq
├── tool-01-meta-tag-extractor.html     ← Web-based SEO tool
├── tool-02-serp-preview.html           ← Web-based SEO tool
├── tool-03-seo-geo-audit.html          ← Web-based SEO tool
├── FAQs Auto-Builder 1/                ← FAQs tool folder
├── BankBazaar_Image_Scraper/           ← Python tool
├── broken links auditor/               ← Python tool
├── cannibalization_detector/           ← Python tool
├── internal_links_auditor/             ← Python tool
├── lighthouse_audit/                   ← Excel tracker
└── play_store_rankings/                ← Python tool
```

---

## Quick Troubleshooting

| Problem | Fix |
|---|---|
| `git push` rejected | Run `git pull origin main --rebase` first, then push again |
| Domain not connecting | Check DNS records at your registrar; wait up to 48hrs |
| 404.html not serving on 404 errors | In Vercel project → Settings → add a **Redirect**: Source: `**`, Destination: `/404.html`, Status: `404` |
| Vercel showing old files | Hard refresh (Ctrl+Shift+R) or check if the push actually went through on GitHub |
| Fonts/images broken | All your HTML uses CDN fonts (Google Fonts) — no local assets needed |

---

*Guide prepared by Claude · May 2026 · For: lochan.online*
