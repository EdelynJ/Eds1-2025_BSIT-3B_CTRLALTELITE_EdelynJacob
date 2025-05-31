<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - FitLife</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        darkest: '#3B0016',
                        dark: '#6B0837',
                        medium: '#A53A6B',
                        light: '#E573A2',
                        pale: '#F7A1C4',
                    },
                    fontFamily: {
                        sans: ['Open Sans', 'sans-serif'],
                    },
                }
            }
        }
    </script>
</head>
<body class="min-h-screen flex items-center justify-center font-sans relative">
    <!-- Background Image with Overlay -->
    <div class="absolute inset-0 z-0">
        <img src="img/gym-bg.jpg" alt="Gym Background" class="w-full h-full object-cover">
        <div class="absolute inset-0 bg-darkest bg-opacity-70"></div>
    </div>
    
    <!-- Sign Up Form -->
    <div class="bg-white rounded-lg shadow-lg w-full max-w-xl p-8 relative z-10">
        <h2 class="text-4xl font-extrabold mb-2 text-center" style="color: #E573A2;">FitLife</h2>
        <div class="text-2xl text-center text-darkest mb-8 font-bold">Create Your Account</div>
        <form action="process_signup.php" method="POST">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                    <label class="block text-darkest mb-2 font-semibold" for="s_fullname">Full Name</label>
                    <input name="s_fullname" id="s_fullname" type="text"
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light"
                        placeholder="Enter your full name" required>
                </div>
                <div>
                    <label class="block text-darkest mb-2 font-semibold" for="s_username">Username</label>
                    <input name="s_username" id="s_username" type="text"
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light"
                        placeholder="Enter your username" required>
                </div>
                <div class="relative">
                    <label class="block text-darkest mb-2 font-semibold" for="s_password">Password</label>
                    <input name="s_password" id="s_password" type="password"
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light pr-10"
                        placeholder="Enter your password" required>
                    <button type="button" id="togglePassword" tabindex="-1" class="absolute right-3 top-9 text-gray-500 focus:outline-none">
                        <svg id="eyeIcon" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                        </svg>
                    </button>
                </div>
                <div>
                    <label class="block text-darkest mb-2 font-semibold" for="s_conf_password">Confirm Password</label>
                    <input name="s_conf_password" id="s_conf_password" type="password"
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light"
                        placeholder="Confirm your password" required>
                </div>
                <div>
                    <label class="block text-darkest mb-2 font-semibold" for="s_email">Email</label>
                    <input name="s_email" id="s_email" type="email"
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light"
                        placeholder="Enter your email" required>
                </div>
                <div>
                    <label class="block text-darkest mb-2 font-semibold" for="s_contact_number">Contact Number</label>
                    <input name="s_contact_number" id="s_contact_number" type="text"
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light"
                        placeholder="Enter your contact number" required>
                </div>
            </div>
            <div class="mb-4">
                <label class="block text-darkest mb-2 font-semibold" for="s_address">Address</label>
                <input name="s_address" id="s_address" type="text"
                    class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light"
                    placeholder="Enter your address" required>
            </div>
            <div class="mb-6">
                <label class="block text-darkest mb-2 font-semibold" for="s_gender">Gender</label>
                <select name="s_gender" id="s_gender" class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-light" required>
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                    <option value="X">Rather Not Say</option>
                </select>
            </div>
            <button type="submit"
                    class="w-full bg-light hover:bg-medium text-white font-semibold py-3 rounded-full text-lg transition mb-4 shadow-md">
                Create Account
            </button>
        </form>
        <p class="text-center text-gray-600">Already have an account? <a href="login.php" class="text-light hover:underline font-semibold">Log In</a></p>
    </div>
    <script>
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('s_password');
    const eyeIcon = document.getElementById('eyeIcon');
    if (togglePassword && passwordInput && eyeIcon) {
      togglePassword.addEventListener('click', function () {
        const type = passwordInput.type === 'password' ? 'text' : 'password';
        passwordInput.type = type;
        // Toggle eye icon (simple swap for demo)
        if (type === 'text') {
          eyeIcon.innerHTML = `<path stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.542-7a9.956 9.956 0 012.042-3.368M6.634 6.634A9.956 9.956 0 0112 5c4.478 0 8.268 2.943 9.542 7a9.956 9.956 0 01-4.293 5.411M15 12a3 3 0 11-6 0 3 3 0 016 0z' /><path stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M3 3l18 18' />`;
        } else {
          eyeIcon.innerHTML = `<path stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M15 12a3 3 0 11-6 0 3 3 0 016 0z' /><path stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z' />`;
        }
      });
    }
    </script>
</body>
</html> 