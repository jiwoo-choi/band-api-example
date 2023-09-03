const withNextra = require("nextra")({
  theme: "nextra-theme-docs",
  themeConfig: "./theme.config.tsx",
});
const env = process.env.NODE_ENV
const IS_PRODUCTION = env === 'production';

const PRODUCTION_OPTIONS = {
  output: 'export',
  // distDir: 'docs',
  assetPrefix: "/band-api-example",
}
module.exports = withNextra({
  images: {
    unoptimized: true,
  },
  ...(IS_PRODUCTION ? PRODUCTION_OPTIONS : {})
});
