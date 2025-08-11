<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Registratie — DevOps Demo</title>

  <!-- Optioneel: mooi lettertype -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

  <style>
    :root {
      --bg: #f6f7fb;
      --panel: #ffffff;
      --text: #0f172a;
      --muted: #64748b;
      --primary: #2563eb;
      --primary-contrast: #ffffff;
      --input-bg: #ffffff;
      --input-border: #cbd5e1;
      --ring: rgba(37, 99, 235, .35);
      --shadow: 0 10px 25px rgba(2, 6, 23, .08);
      --grad: radial-gradient(1200px 600px at 10% -10%, #cae2ff40, transparent 60%),
              radial-gradient(1000px 500px at 90% 10%, #ffd3e740, transparent 60%);
    }

    [data-theme="dark"] {
      --bg: #0b1220;
      --panel: #0f172a;
      --text: #e5e7eb;
      --muted: #94a3b8;
      --primary: #60a5fa;
      --primary-contrast: #0b1220;
      --input-bg: #0b1220;
      --input-border: #334155;
      --ring: rgba(96, 165, 250, .45);
      --shadow: 0 10px 25px rgba(0, 0, 0, .45);
      --grad: radial-gradient(1200px 600px at 10% -10%, #1b2a4740, transparent 60%),
              radial-gradient(1000px 500px at 90% 10%, #401b2a40, transparent 60%);
    }

    * { box-sizing: border-box; }
    html, body { height: 100%; }
    body {
      margin: 0;
      font-family: "Inter", system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji";
      color: var(--text);
      background: var(--bg);
      background-image: var(--grad);
      background-attachment: fixed;
    }

    .wrap {
      min-height: 100%;
      display: grid;
      place-items: center;
      padding: clamp(16px, 3vw, 32px);
    }

    .card {
      width: min(840px, 100%);
      background: var(--panel);
      border: 1px solid var(--input-border);
      border-radius: 18px;
      box-shadow: var(--shadow);
      overflow: hidden;
    }

    .header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      padding: clamp(18px, 3vw, 28px);
      border-bottom: 1px solid var(--input-border);
    }

    .title {
      margin: 0;
      font-size: clamp(18px, 2.4vw, 24px);
      font-weight: 700;
      letter-spacing: .2px;
    }

    .subtitle {
      margin: 6px 0 0 0;
      color: var(--muted);
      font-size: .95rem;
      font-weight: 500;
    }

    .theme-toggle {
      display: inline-flex;
      align-items: center;
      gap: .5rem;
      padding: 10px 14px;
      border: 1px solid var(--input-border);
      border-radius: 999px;
      background: var(--input-bg);
      color: var(--text);
      cursor: pointer;
      transition: transform .08s ease, box-shadow .2s ease;
      box-shadow: 0 4px 12px rgba(2, 6, 23, .06);
    }
    .theme-toggle:active { transform: scale(.98); }

    .content {
      padding: clamp(18px, 3vw, 28px);
      display: grid;
      gap: 18px;
    }

    .grid {
      display: grid;
      gap: 14px;
      grid-template-columns: 1fr 1fr;
    }
    @media (max-width: 720px) { .grid { grid-template-columns: 1fr; } }

    label {
      display: block;
      margin: 2px 0 8px;
      font-size: .9rem;
      color: var(--muted);
      font-weight: 600;
      letter-spacing: .2px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 100%;
      padding: 12px 14px;
      border: 1px solid var(--input-border);
      background: var(--input-bg);
      color: var(--text);
      border-radius: 10px;
      outline: none;
      transition: box-shadow .2s ease, border-color .2s ease, background .2s ease;
    }

    input:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 4px var(--ring);
    }

    .hint { color: var(--muted); margin: 0; }

    .actions {
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 12px;
      margin-top: 6px;
    }

    .btn {
      appearance: none;
      border: 0;
      border-radius: 10px;
      padding: 12px 18px;
      font-weight: 700;
      letter-spacing: .2px;
      cursor: pointer;
      transition: transform .06s ease, box-shadow .2s ease, background .2s ease;
    }
    .btn:active { transform: translateY(1px); }

    .btn-primary {
      background: var(--primary);
      color: var(--primary-contrast);
      box-shadow: 0 8px 18px rgba(37, 99, 235, .25);
    }
    .btn-primary:hover { box-shadow: 0 12px 24px rgba(37, 99, 235, .3); }

    .legal, .signin {
      color: var(--muted);
      font-size: .95rem;
    }
    .signin a, .legal a { color: var(--primary); text-decoration: none; }
    .signin a:hover, .legal a:hover { text-decoration: underline; }

    .footer {
      padding: clamp(16px, 3vw, 22px);
      border-top: 1px solid var(--input-border);
      text-align: center;
      color: var(--muted);
    }
  </style>
</head>

<body>
<div class="wrap">
  <div class="card">

    <!-- Header met titel en thema-toggle -->
    <div class="header">
      <div>
        <h1 class="title">Hey Welkom Terug, Mamadou Barriy</h1>
        <p class="subtitle">Vul het formulier in om een account aan te maken.</p>
      </div>
      <button id="themeToggle" class="theme-toggle" type="button" aria-label="Schakel thema">
        🌙 Donker
      </button>
    </div>

    <!-- Formulier -->
    <form action="action_page.php" method="post" novalidate>
      <div class="content">

        <div class="grid">
          <div>
            <label for="Name">Voor‑ en achternaam</label>
            <input type="text" id="Name" name="Name" placeholder="Bijv. Mamadou Barry" required />
          </div>

          <div>
            <label for="mobile">Mobiel nummer</label>
            <input type="text" id="mobile" name="mobile" placeholder="Bijv. +32 470 12 34 56" required />
          </div>

          <div>
            <label for="email">E‑mail</label>
            <input type="email" id="email" name="email" placeholder="Bijv. mamadou@example.com" required />
          </div>

          <div></div> <!-- lege cel om grid mooi te houden -->
        </div>

        <div class="grid">
          <div>
            <label for="psw">Wachtwoord</label>
            <input type="password" id="psw" name="psw" placeholder="Kies een sterk wachtwoord" required />
          </div>

          <div>
            <label for="psw-repeat">Herhaal wachtwoord</label>
            <input type="password" id="psw-repeat" name="psw-repeat" placeholder="Herhaal het wachtwoord" required />
          </div>
        </div>

        <p class="legal">
          Door een account te maken ga je akkoord met onze
          <a href="#">Voorwaarden</a> &amp; <a href="#">Privacy</a>.
        </p>

        <div class="actions">
          <button class="btn btn-primary" type="submit">Account aanmaken</button>
          <p class="signin">Al een account? <a href="#">Inloggen</a></p>
        </div>

      </div>
    </form>

    <!-- Footer -->
    <div class="footer">
      <strong>Dankjewel en veel succes verder • Tot ziens!</strong>
    </div>
  </div>
</div>

<!-- Thema‑toggle logica -->
<script>
  (function () {
    const btn = document.getElementById('themeToggle');
    const KEY = 'preferred-theme';

    function setTheme(mode) {
      document.body.setAttribute('data-theme', mode);
      localStorage.setItem(KEY, mode);
      btn.textContent = mode === 'dark' ? '🌞 Licht' : '🌙 Donker';
    }

    // initialiseren: gebruiker, OS‑voorkeur, of light als fallback
    const stored = localStorage.getItem(KEY);
    const prefersDark = window.matchMedia &&
                        window.matchMedia('(prefers-color-scheme: dark)').matches;
    setTheme(stored ? stored : (prefersDark ? 'dark' : 'light'));

    btn.addEventListener('click', () => {
      const next = document.body.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
      setTheme(next);
    });
  })();
</script>
</body>
</html>
