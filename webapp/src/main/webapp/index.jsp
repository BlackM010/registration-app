<form action="action_page.php">
  <div class="container">
<div style="display: flex; justify-content: space-between; align-items: center;">
    <div>
        <h1>Hey Welkom Terug Mamadou Barriy</h1>
        <p>Please fill in this form to create an account.</p>
    </div>

    <!-- Theme toggle knop -->
    <button id="themeToggle" type="button" 
            style="padding:8px 12px; border-radius:6px; border:1px solid #ccc; cursor:pointer;">
        🌙 Donker
    </button>
</div>
<hr>
     
    <label for="Name"><b>Enter Name</b></label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>
    <br>
    
    <label for="mobile"><b>Enter mobile</b></label>
    <input type="text" placeholder="Enter moible number" name="mobile" id="mobile" required>
    <br>

    <label for="email"><b>Enter Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>
    <br>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
    <br>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
    <hr>
    <br>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="registerbtn">Register</button>
  </div>
  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const toggleBtn = document.getElementById('themeToggle');
    const THEME_KEY = 'preferred-theme';

    // Laad het opgeslagen thema of standaard naar 'light'
    let saved = localStorage.getItem(THEME_KEY) || 'light';
    document.body.setAttribute('data-theme', saved);
    updateBtn(saved);

    toggleBtn.addEventListener('click', () => {
        let current = document.body.getAttribute('data-theme');
        let next = current === 'dark' ? 'light' : 'dark';
        document.body.setAttribute('data-theme', next);
        localStorage.setItem(THEME_KEY, next);
        updateBtn(next);
    });

    function updateBtn(mode) {
        if (mode === 'dark') {
            toggleBtn.textContent = '🌞 Licht';
        } else {
            toggleBtn.textContent = '🌙 Donker';
        }
    }
});
</script>

   <h1> Dankjewel en succes verder </h1>
   <h1> Tot ziens </h1>
  
</form>
