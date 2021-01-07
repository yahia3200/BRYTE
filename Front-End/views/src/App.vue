<template>
<router-view/>
</template>

<script>
  const plugin = document.createElement("script");
    plugin.setAttribute(
      "src",
      "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"
    );
    plugin.async = true;
    document.head.appendChild(plugin);
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Reem+Kufi&display=swap');
*{
  padding:0;
  margin:0;
  -webkit-box-sizing: border-box;
    box-sizing: border-box;
  font-family: Roboto;
}
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/**Special Class to the element in the route */
.router-link-exact-active {
  color: #42b983;
}
</style>
