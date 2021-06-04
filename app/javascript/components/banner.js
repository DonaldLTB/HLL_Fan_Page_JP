import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["一緒に", "Together", "Zusammen", "все вместе", "Ensemble"],
    typeSpeed: 120,
    loop: true
  });
}

export { loadDynamicBannerText };