// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("turbo:load", () => {
    const sidebar = document.querySelector(".left_sidebar");
    if (!sidebar) return;

    sidebar.addEventListener("click", (e) => {
        const link = e.target.closest(".left_sidebar-link");
        if (!link) return;

        // 既存のactiveを全部外す
        sidebar.querySelectorAll(".left_sidebar-link.active")
               .forEach((el) => el.classList.remove("active"));
        // クリックされたものに付ける
        link.classList.add("active");
    });
});