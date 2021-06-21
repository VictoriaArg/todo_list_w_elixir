module.exports = {
  mode: 'jit',
  purge: [
    "../lib/**/*.eex",
    "../lib/**/*.leex",
    "../lib/**/*_view.ex",
    "../lib/**/views/*.ex"
  ],
     variants: {
      extend: {
       fontWeight: ['hover', 'focus']
      }
    }
}
