<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Registratie — DevOps Demo</title>

  <!-- Favicon (inline SVG) -->
  <link rel="icon" href='data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64"><defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop stop-color="%233b82f6"/><stop offset="1" stop-color="%2367e8f9"/></linearGradient></defs><rect width="64" height="64" rx="12" fill="url(%23g)"/><path d="M20 43h2l4-10 6 14 4-9 2 5h6" stroke="%23fff" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round"/></svg>' />

  <!-- Webfont -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    :root{
      --bg:#f6f7fb;
      --panel:#ffffff;
      --text:#0f172a;
      --muted:#64748b;
      --primary:#2563eb;
      --primary-contrast:#ffffff;
      --input-bg:#ffffff;
      --input-border:#cbd5e1;
      --ring:rgba(37,99,235,.35);
      --shadow:0 14px 38px rgba(2,6,23,.09);
      --grad: radial-gradient(1200px 600px at 10% -10%, #cae2ff40, transparent 60%),
              radial-gradient(1000px 500px at 90% 10%, #ffd3e740, transparent 60%);
      --card-blur: saturate(1.1) blur(8px);
    }
    [data-theme="dark"]{
      --bg:#0b1220;
      --panel:#0f172a;
      --text:#e5e7eb;
      --muted:#94a3b8;
      --primary:#60a5fa;
      --primary-contrast:#0b1220;
      --input-bg:#0b1220;
      --input-border:#334155;
      --ring:rgba(96,165,250,.45);
      --shadow:0 18px 42px rgba(0,0,0,.5);
      --grad: radial-gradient(1200px 600px at 10% -10%, #1b2a4740, transparent 60%),
              radial-gradient(1000px 500px at 90% 10%, #401b2a40, transparent 60%);
    }

    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      font-family:"Inter",system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial,"Apple Color Emoji","Segoe UI Emoji";
      color:var(--text);
      background:var(--bg);
      background-image:var(--grad);
      background-attachment:fixed;
    }

    .wrap{
      min-height:100%;
      display:grid;
      gap:24px;
      align-content:center;
      justify-items:center;
      padding:clamp(16px,3vw,32px);
    }

    /* Header */
    .nav{
      width:min(1040px,100%);
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:16px;
    }
    .brand{
      display:flex;
      align-items:center;
      gap:12px;
      text-decoration:none;
      color:inherit;
    }
    .brand svg{width:36px;height:36px}
    .brand-title{
      font-weight:800;
      letter-spacing:.2px;
      font-size:clamp(18px,2.2vw,22px);
    }
    .toggle{
      display:inline-flex;align-items:center;gap:.6rem;
      padding:10px 14px;border:1px solid var(--input-border);
      background:var(--input-bg);border-radius:999px;color:var(--text);
      box-shadow:0 6px 16px rgba(2,6,23,.08);cursor:pointer;
      transition:transform .08s ease, box-shadow .2s ease;
    }
    .toggle:active{transform:scale(.98)}

    /* Card */
    .card{
      width:min(1040px,100%);
      background:color-mix(in srgb, var(--panel) 92%, transparent);
      border:1px solid var(--input-border);
      border-radius:22px;
      box-shadow:var(--shadow);
      backdrop-filter:var(--card-blur);
      overflow:hidden;
    }
    .hero{
      display:flex;flex-wrap:wrap;gap:14px;align-items:flex-start;justify-content:space-between;
      padding:clamp(20px,3vw,28px);
      border-bottom:1px solid var(--input-border);
    }
    .hero h1{margin:0 0 6px;font-size:clamp(22px,3vw,28px)}
    .hero p{margin:0;color:var(--muted)}

    .content{
      padding:clamp(18px,3vw,28px);
      display:grid;gap:22px;
    }
    .grid{
      display:grid;gap:14px;grid-template-columns:1fr 1fr;
    }
    @media (max-width:820px){ .grid{ grid-template-columns:1fr; } }

    label{display:block;margin:2px 0 8px;color:var(--muted);font-size:.95rem;font-weight:600}
    .field{display:grid;gap:6px}
    input[type="text"], input[type="password"], input[type="email"]{
      width:100%;padding:12px 14px;border:1px solid var(--input-border);
      background:var(--input-bg);color:var(--text);border-radius:12px;outline:none;
      transition:box-shadow .2s ease, border-color .2s ease, background .2s ease;
    }
    input:focus{border-color:var(--primary);box-shadow:0 0 0 4px var(--ring)}
    .help{color:var(--muted);font-size:.85rem;margin:0}

    .actions{
      display:flex;align-items:center;justify-content:space-between;gap:12px;flex-wrap:wrap;
    }
    .btn{
      appearance:none;border:0;border-radius:12px;padding:12px 18px;font-weight:800;letter-spacing:.2px;
      cursor:pointer;transition:transform .06s ease, box-shadow .2s ease, background .2s ease;
    }
    .btn:active{transform:translateY(1px)}
    .btn-primary{
      background:var(--primary);color:var(--primary-contrast);box-shadow:0 10px 22px rgba(37,99,235,.25);
    }
    .btn-primary:hover{box-shadow:0 14px 28px rgba(37,99,235,.32)}
    .legal,.signin{color:var(--muted);font-size:.95rem}
    .legal a,.signin a{color:var(--primary);text-decoration:none}
    .legal a:hover,.signin a:hover{text-decoration:underline}

    /* Features / About */
    .features{display:grid;gap:16px;grid-template-columns:repeat(3,1fr);padding:0 clamp(18px,3vw,28px) 24px}
    .feature{
      background:var(--panel);border:1px solid var(--input-border);border-radius:16px;padding:18px;
      display:grid;gap:8px;box-shadow:0 10px 24px rgba(2,6,23,.06);
    }
    .feature svg{width:28px;height:28px}
    .feature h3{margin:4px 0 0;font-size:1.05rem}
    .feature p{margin:0;color:var(--muted);font-size:.92rem}
    @media (max-width:820px){ .features{grid-template-columns:1fr} }

    .footer{padding:18px;border-top:1px solid var(--input-border);text-align:center;color:var(--muted)}
    .error{color:#ef4444;font-size:.85rem;margin-top:2px;display:none}
    .error.show{display:block}
  </style>
</head>

<body>
<div class="wrap">

  <!-- Bovenbalk met logo en thema toggle -->
  <header class="nav" aria-label="Hoofdnavigatie">
    <a class="brand" href="#">
      <!-- Inline logo -->
      <svg viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <defs>
          <linearGradient id="lg" x1="0" y1="0" x2="1" y2="1">
            <stop stop-color="#2563eb"/><stop offset="1" stop-color="#60a5fa"/>
          </linearGradient>
        </defs>
        <rect width="64" height="64" rx="14" fill="url(#lg)"/>
        <path d="M18 40h3l5-11 6 13 5-10 2 5h7" stroke="#fff" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      <span class="brand-title">DevOps Demo — Registration</span>
    </a>

    <button id="themeToggle" class="toggle" type="button" aria-label="Schakel thema">🌙 Donker</button>
  </header>

  <!-- Kaart met formulier -->
  <section class="card" aria-labelledby="formTitle">
    <div class="hero">
      <div>
        <h1 id="formTitle">Welkom Bij ORBIS</h1>
        <p>Vul het formulier in om een account aan te maken.</p>
      </div>
    </div>

    <form action="action_page.php" method="post" novalidate>
      <div class="content">

        <div class="grid">
          <div class="field">
            <label for="Name">Voor‑ en achternaam</label>
            <input type="text" id="Name" name="Name" placeholder="Bijv. Mamadou Barry" required />
            <small class="help">Gebruik je volledige naam.</small>
            <small class="error" id="errName">Vul je naam in.</small>
          </div>

          <div class="field">
            <label for="mobile">Mobiel nummer</label>
            <input type="text" id="mobile" name="mobile" placeholder="+32 470 12 34 56" pattern="^\\+?\\d[\\d\\s]{7,}$" required />
            <small class="help">Internationaal formaat aanbevolen (bv. +32 ...).</small>
            <small class="error" id="errMobile">Voer een geldig mobiel nummer in.</small>
          </div>

          <div class="field">
            <label for="email">E‑mail</label>
            <input type="email" id="email" name="email" placeholder="mamadou@example.com" required />
            <small class="help">We delen je e‑mail niet met derden.</small>
            <small class="error" id="errEmail">Voer een geldig e‑mailadres in.</small>
          </div>

          <div class="field">
            <label for="psw">Wachtwoord</label>
            <input type="password" id="psw" name="psw" placeholder="Kies een sterk wachtwoord" minlength="6" required />
            <small class="help">Minimaal 6 tekens, gebruik bij voorkeur cijfers & symbolen.</small>
            <small class="error" id="errPsw">Wachtwoord is te kort.</small>
          </div>

          <div class="field">
            <label for="psw-repeat">Herhaal wachtwoord</label>
            <input type="password" id="psw-repeat" name="psw-repeat" placeholder="Herhaal het wachtwoord" required />
            <small class="error" id="errMatch">Wachtwoorden komen niet overeen.</small>
          </div>
        </div>

        <p class="legal">
          Door een account te maken ga je akkoord met onze
          <a href="#">Voorwaarden</a> & <a href="#">Privacy</a>.
        </p>

        <div class="actions">
          <button class="btn btn-primary" type="submit">Account aanmaken</button>
          <p class="signin">Al een account? <a href="#">Inloggen</a></p>
        </div>
      </div>
    </form>

    <!-- Feature blok: over dit project -->
    <div class="features" aria-label="Projectstack">
      <div class="feature">
        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path d="M4 4h16v16H4z" stroke="currentColor" opacity=".3"/>
          <path d="M7 12h10M7 8h10M7 16h6" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
        <h3>Jenkins CI/CD</h3>
        <p>Automatische build & deploy naar Tomcat bij wijzigingen in Git.</p>
      </div>
      <div class="feature">
        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <circle cx="12" cy="12" r="9" stroke="currentColor" opacity=".3"/>
          <path d="M7 13h10l-3 4H10l-3-4Zm3-6h4l3 4H7l3-4Z" fill="currentColor"/>
        </svg>
        <h3>Maven</h3>
        <p>Java 17 build, test en packaging naar <code>webapp.war</code>.</p>
      </div>
      <div class="feature">
        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <rect x="3" y="7" width="18" height="10" rx="2" stroke="currentColor" opacity=".3"/>
          <path d="M6 10h12v4H6z" fill="currentColor"/>
        </svg>
        <h3>Apache Tomcat</h3>
        <p>Servetcontainer op poort 8080 met Manager‑deploy plugin.</p>
      </div>
    </div>

    <div class="footer">
      <strong>Dankjewel en veel succes verder • Tot ziens!</strong>
    </div>
  </section>
</div>

<!-- Thema toggle + basisvalidatie -->
<script>
  (function () {
    const btn = document.getElementById('themeToggle');
    const KEY = 'preferred-theme';
    function setTheme(mode){
      document.body.setAttribute('data-theme', mode);
      localStorage.setItem(KEY, mode);
      btn.textContent = mode === 'dark' ? '🌞 Licht' : '🌙 Donker';
    }
    const stored = localStorage.getItem(KEY);
    const prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
    setTheme(stored ? stored : (prefersDark ? 'dark' : 'light'));
    btn.addEventListener('click', ()=> setTheme(document.body.getAttribute('data-theme')==='dark'?'light':'dark'));
  })();

  // Client-side validatie (optioneel)
  (function () {
    const form = document.querySelector('form');
    const f = id => document.getElementById(id);
    form.addEventListener('submit', (e) => {
      let ok = true;

      const name = f('Name');
      const mobile = f('mobile');
      const email = f('email');
      const psw = f('psw');
      const rep = f('psw-repeat');

      const show = (id, cond) => {
        const el = document.getElementById(id);
        if(!el) return;
        el.classList.toggle('show', cond);
        if(cond) ok = false;
      };

      show('errName', !name.value.trim());
      const mobileOk = /^\+?\d[\d\s]{7,}$/.test(mobile.value.trim());
      show('errMobile', !mobileOk);
      show('errEmail', !email.checkValidity());
      show('errPsw', psw.value.length < 6);
      show('errMatch', psw.value !== rep.value);

      if(!ok){
        e.preventDefault();
        // focus op eerste fout
        const firstErr = document.querySelector('.error.show');
        if(firstErr){
          const input = firstErr.previousElementSibling;
          if(input && input.focus) input.focus();
        }
      }
    });
  })();
</script>
</body>
</html>
