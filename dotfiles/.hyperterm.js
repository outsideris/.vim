module.exports = {
   config: {
    // default font size in pixels for all tabs
    fontSize: 24,

    // font family with optional fallbacks
    fontFamily: '"DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color (hex)
    //cursorColor: '#add877',

    // color of the text
    //foregroundColor: '#c4e2f2',

    // terminal background color
    //backgroundColor: '#002b36',

    // border color (window, tabs)
    //borderColor: '#335E69',

    // custom css to embed in the main window
    //css: `
    //  .active_1gcgehd:before {
    //    border: 1px solid #002b36 !important;
    //  }      
    //`,

    // custom padding (css format, i.e.: `top right bottom left`)
    //termCSS: `
    //  * {
    //    -webkit-font-feature-settings: "liga" on, "calt" on, "dlig" on !important;      
    //    text-rendering: optimizeLegibility !important;
    //    font-weight: 700;
    //  }
    //  .cursor-node {
    //    width: .125rem !important;
    //  }
    //  `,

    // custom padding
    //padding: '.5rem',

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    //colors: [
    //  '#26292c',
    //  '#f69648',
    //  '#add877',
    //  '#f6f080',
    //  '#60a7ca',
    //  '#7d72c8',
    //  '#e05178',
    //  '#ffffff',
    //  '#262721',
    //  '#dc412f',
    //  '#b5d839',
    //  '#ff9c5a',
    //  '#ff9c5a',
    //  '#7d72c8',
    //  '#e05178',
    //  '#ffffff'
    //]
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hypersolar`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};

