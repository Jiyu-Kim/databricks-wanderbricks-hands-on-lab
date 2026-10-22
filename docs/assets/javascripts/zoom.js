// Click a screenshot to view it enlarged; click again, press Esc, or use the close button to return.
(() => {
  // Screenshots are captured at 2880px wide; avatars, icons, and SVG illustrations are skipped.
  const MIN_WIDTH = 800;
  const ko = document.documentElement.lang === "ko";
  const label = { open: ko ? "크게 보기" : "View larger", close: ko ? "닫기" : "Close" };

  const isZoomable = (img) =>
    img.closest(".md-content") &&
    !img.closest("a") &&
    !/\.svg($|\?)/i.test(img.currentSrc || img.src) &&
    img.naturalWidth >= MIN_WIDTH;

  const mark = (img) => {
    if (!isZoomable(img)) return;
    img.classList.add("wb-zoomable");
    img.tabIndex = 0;
    img.setAttribute("role", "button");
    img.setAttribute("aria-label", `${label.open}: ${img.alt}`);
  };

  document.querySelectorAll(".md-content img").forEach((img) => {
    if (img.complete) mark(img);
    else img.addEventListener("load", () => mark(img), { once: true });
  });

  let opener = null;

  const close = () => {
    const box = document.querySelector(".wb-lightbox");
    if (!box) return;
    box.remove();
    document.documentElement.classList.remove("wb-lightbox-open");
    if (opener) opener.focus();
  };

  const open = (img) => {
    opener = img;
    const box = document.createElement("div");
    box.className = "wb-lightbox";
    box.setAttribute("role", "dialog");
    box.setAttribute("aria-modal", "true");
    box.setAttribute("aria-label", img.alt);

    const big = document.createElement("img");
    big.src = img.currentSrc || img.src;
    big.alt = img.alt;

    const btn = document.createElement("button");
    btn.className = "wb-lightbox__close";
    btn.type = "button";
    btn.setAttribute("aria-label", label.close);
    btn.textContent = "×";

    box.append(big, btn);
    if (img.alt) {
      const cap = document.createElement("p");
      cap.className = "wb-lightbox__caption";
      cap.textContent = img.alt;
      box.append(cap);
    }
    box.addEventListener("click", close);
    document.body.append(box);
    document.documentElement.classList.add("wb-lightbox-open");
    btn.focus();
  };

  document.addEventListener("click", (e) => {
    const img = e.target.closest("img.wb-zoomable");
    if (img) open(img);
  });

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") return close();
    const img = e.target.closest && e.target.closest("img.wb-zoomable");
    if (img && (e.key === "Enter" || e.key === " ")) {
      e.preventDefault();
      open(img);
    }
  });
})();
