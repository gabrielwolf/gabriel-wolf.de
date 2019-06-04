<template>
  <v-app>
    <v-system-bar app status fixed color="primary" justify-space-around>
      <router-link to="/">Home</router-link>
      <router-link to="/impressum">Impressum</router-link>
      <router-link to="/copyleft">Copyleft</router-link>
      <router-link to="/datenschutz">Datenschutz</router-link>
    </v-system-bar>
    <v-content>
      <v-container>
        <v-layout>
          <v-flex><router-view></router-view></v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  name: "App",
  data() {
    return {};
  }
};
</script>

<style lang="stylus">
*
  word-wrap break-word
  word-break break-word;
  hyphens auto;

h1
  margin-bottom 3rem

h2
  margin-bottom 2rem

h3
  margin-bottom 1rem

#app
  font-family 'Saira', Helvetica, Arial, sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale
  text-align center

  a
    font-weight bold
    color #42b983
    &.router-link-exact-active
      color #42b983

  .v-system-bar a
    margin auto
    color #eee !important
    text-decoration none
</style>
