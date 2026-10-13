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

document.addEventListener("turbo:load", () => {
  const overlay = document.querySelector("[data-sidebar-overlay]");
  const closeAll = () => {
    document.querySelectorAll(".left_sidebar, .right_sidebar")
      .forEach(el => el.classList.remove("is-open"));
    overlay?.classList.remove("is-open");
  };

  document.querySelectorAll("[data-toggle-sidebar]").forEach(btn => {
    btn.addEventListener("click", () => {
      const side = document.querySelector(`.${btn.dataset.toggleSidebar}_sidebar`);
      const willOpen = !side.classList.contains("is-open");
      closeAll();
      if (willOpen) {
        side.classList.add("is-open");
        overlay?.classList.add("is-open");
      }
    });
  });

  overlay?.addEventListener("click", closeAll);
});