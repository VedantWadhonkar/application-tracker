# Application Tracker: database + login setup (10 minutes, free)

## 1. Supabase project banayein
1. https://supabase.com par free account banayein, **New project** dabayein (region: Mumbai / ap-south-1).
2. **SQL Editor -> New query**, `schema.sql` ka poora content paste karke **Run** karein.
   Isse `applications` table banti hai, aur Row Level Security lagta hai: har user sirf apna data dekhta hai.

## 2. Keys config.js mein daalein
**Project Settings -> API** se `Project URL` aur `anon public` key copy karke `config.js` mein paste karein.
(anon key public hoti hai, safe hai. `service_role` key kabhi mat daalna.)

## 3. Login settings
**Authentication -> Providers -> Email** on rakhein.
- Dosto ko turant login karwana ho to **Confirm email** off kar dein. On rakhenge to sign up ke baad email confirm karna padega.
- **Authentication -> URL Configuration**: *Site URL* mein apna GitHub Pages link daalein, jaise `https://vedantwadhonkar.github.io/<repo>/`. Add the same under *Redirect URLs*.
- Google login optional: Providers -> Google enable karein, phir `config.js` mein `GOOGLE_LOGIN: true`.

## 4. Deploy
Ye files ek hi folder mein GitHub repo par daalein:
`index.html, config.js, sw.js, manifest.webmanifest, icon-192.png, icon-512.png, apple-touch-icon.png`
(`schema.sql` aur `SETUP.md` upload karna zaroori nahi.) GitHub Pages on karein.
Phone par link kholein -> browser menu -> **Add to Home Screen**: ab ye app ki tarah chalega.

## Kaise kaam karta hai
- Har dost apna account banata hai aur sirf apna data dekhta hai.
- Data phone/laptop dono par sync hota hai. Offline mein bhi chalta hai, internet aate hi sync ho jata hai.
- Purana data jo is browser mein tha, pehle login par import karne ka option milega.
