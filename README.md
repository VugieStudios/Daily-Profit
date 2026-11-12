# 💰 DAILY PROFIT: Mini-Tycoon

A mobile-friendly daily business-sim web game. Every player gets the same scenario each day (UTC), makes three calls — **stock, price, marketing** — and watches a 10-second day play out, including a 4:00 PM breaking-news twist.

## Features
- 30 unique scenarios, rotated deterministically by UTC date (Day #1 = 1 Nov 2026)
- A surprise **1 PM decision** each day (yes/no) that changes how the afternoon plays out
- One ranked run per day, streaks and career net worth saved in `localStorage`
- **Leaderboard** (top 10 + your rank) and **How others played** (price spread, medians, 1 PM split)
- **Share image**: a 1080×1350 score card drawn on canvas, shareable to WhatsApp/Instagram or saved
- Results with star rating, simulated percentile, hour-by-hour chart and a tap-to-reveal perfect strategy
- Wordle-style share card copied to the clipboard
- Retry via simulated rewarded ad, banner ad slots, and a Pro Pass demo (archive, instant retries, no banners, VIP crown)
- Web Audio sound effects — no audio files

## Play
Open `index.html` in a browser, or enable **GitHub Pages** (Settings → Pages → Deploy from branch → `main` / root).

## Leaderboard setup (Supabase, free)
Without setup the leaderboard runs in **DEMO** mode with simulated players (clearly labelled).
1. Create a project at [supabase.com](https://supabase.com).
2. Open **SQL Editor**, paste `supabase/setup.sql`, click **Run**.
3. Go to **Project Settings → API** and copy the *Project URL* and the *anon public* key.
4. In `index.html`, fill in `const LEADERBOARD={url:'…',anonKey:'…'}` and push.

The anon key is meant to be public; the database rules only allow reading and adding today's run.
Scores are computed in the browser, so a determined cheater could submit a fake score — fine for a launch, worth a server-side check later.

## Configuration
- **Ad slots:** paste your ad network tag into the `adSlot()` placeholders.
- **Promo codes:** edit `PROMO_CODES` in `index.html` (`pro_on` / `pro_off`). These are client-side and visible in the source — fine for testing, not for real paid promotions.
- **Payments:** the Pro checkout is a demo; wire `#btnPay` to a real hosted checkout before charging.

Built with Tailwind CSS (CDN) and vanilla JavaScript in a single file.
