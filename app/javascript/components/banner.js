import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["一緒に", "Together", "Zusammen", "все вместе", "Ensemble"],
    typeSpeed: 121,
    loop: true
  });
}

export { loadDynamicBannerText };