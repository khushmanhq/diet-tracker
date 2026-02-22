# 🚀 Health & Fitness Tracker — Setup Guide

Total time: **~10 minutes**. Free forever. Works from any device, any browser.

---

## What you'll get
- Real cloud accounts (email + password login)
- Each person's data is private and separate
- Access from phone, laptop, anywhere
- Hosted for free on GitHub Pages

---

## Step 1 — Create a Supabase account

1. Go to **[supabase.com](https://supabase.com)**
2. Click **"Start your project"**
3. Sign up with GitHub or email (free, no credit card needed)

---

## Step 2 — Create a new project

1. Click **"New Project"**
2. Fill in:
   - **Name:** `fitness-tracker` (or anything you like)
   - **Database Password:** choose a strong password (save it somewhere)
   - **Region:** pick the one closest to you
3. Click **"Create new project"**
4. Wait ~1–2 minutes while it sets up

---

## Step 3 — Run the database setup

1. In your Supabase project, click **"SQL Editor"** in the left sidebar
2. Click **"New query"**
3. Open the file `supabase-setup.sql` (included with this app) in any text editor
4. **Select all** the text and **copy** it
5. **Paste** it into the Supabase SQL Editor
6. Click **"Run"** (green button, top right)
7. You should see `Success. No rows returned` — that's correct!

---

## Step 4 — Get your API keys

1. In your Supabase project, click **"Project Settings"** (gear icon, bottom of left sidebar)
2. Click **"API"** in the settings menu
3. You'll see two values you need:
   - **Project URL** — looks like `https://abcdefghijklm.supabase.co`
   - **anon public** key — a long string starting with `eyJ...`
4. Copy both (keep this tab open)

---

## Step 5 — Add your keys to the app

1. Open `health-fitness-tracker.html` in any **text editor** (Notepad, TextEdit, VS Code, etc.)
2. Find these two lines near the very top of the file (around line 10):

```
const SUPABASE_URL = 'PASTE_YOUR_SUPABASE_URL_HERE';
const SUPABASE_ANON_KEY = 'PASTE_YOUR_SUPABASE_ANON_KEY_HERE';
```

3. Replace `PASTE_YOUR_SUPABASE_URL_HERE` with your **Project URL**
4. Replace `PASTE_YOUR_SUPABASE_ANON_KEY_HERE` with your **anon public** key
5. **Save** the file

It should look like this when done:
```
const SUPABASE_URL = 'https://abcdefghijklm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

---

## Step 6 — Put it on GitHub Pages

### If you don't have a GitHub account yet:
1. Go to **[github.com](https://github.com)** and sign up (free)

### Create the repository:
1. Click the **"+"** icon top right → **"New repository"**
2. Name it: `fitness-tracker` (or anything)
3. Set it to **Public**
4. Click **"Create repository"**

### Upload the files:
1. Click **"uploading an existing file"** link on the new repo page
2. Drag and drop these two files:
   - `health-fitness-tracker.html`
   - `supabase-setup.sql`
3. Scroll down, click **"Commit changes"**

### Enable GitHub Pages:
1. Go to your repo → **Settings** tab
2. Scroll down to **"Pages"** in the left sidebar
3. Under **"Source"**, select **"Deploy from a branch"**
4. Branch: **main**, folder: **/ (root)**
5. Click **Save**
6. Wait ~1 minute, then your site will be live at:
   `https://YOUR-USERNAME.github.io/fitness-tracker/health-fitness-tracker.html`

---

## Step 7 — Share with friends & family

Just send them the GitHub Pages link. They:
1. Open the link in their browser
2. Click **Register**
3. Enter their name, email, and a password
4. Start tracking!

Each person has their own completely private account. You cannot see each other's data.

---

## ✅ Done! That's it.

Your app is now live, cloud-synced, and accessible from any device.

---

## FAQ

**Can I use it on my phone?**
Yes! Open the GitHub Pages URL in your phone's browser. For the best experience, tap the share button and "Add to Home Screen" to use it like an app.

**Is the data secure?**
Yes. Supabase uses Row Level Security — each user can only ever read and write their own data. Passwords are handled by Supabase Auth (industry-standard, never stored in plain text).

**What's the free tier limit?**
Supabase free tier includes:
- Up to 50,000 monthly active users
- 500 MB database storage
- Unlimited API requests

For 2–5 people, you will never hit any of these limits.

**What if I want to change my display name?**
Log in → go to Diet → Settings → change Display Name → Save Goals.

**Can I lose my data?**
Supabase free projects are paused after **7 days of inactivity** (no one logs in). Just log in once every week to keep it active. You can also upgrade to a paid plan ($25/month) to remove this limit, but for personal use the free tier works fine.

**How do I update the app in the future?**
If you get an updated `health-fitness-tracker.html` file, just re-upload it to your GitHub repo (drag & drop → commit). Your Supabase database and all data stays untouched.

---

## Troubleshooting

| Problem | Solution |
|---|---|
| App shows setup instructions instead of login | Your Supabase URL/key weren't pasted correctly. Re-check Step 5. |
| "Invalid API key" error | Make sure you copied the **anon public** key, not the **service_role** key |
| Can't register — email already exists | That email already has an account. Try signing in instead. |
| Data doesn't appear on second device | Make sure you're signing in with the same email and password |
| GitHub Pages shows a 404 | Wait 2–3 minutes after enabling Pages, then refresh |
