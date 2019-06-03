<template>
  <v-app>
    <v-content>
      <v-container>
        <v-layout>
          <v-flex>
            <router-link to="/">Home</router-link> |
            <router-link to="/impressum">Impressum</router-link> |
            <router-link to="/copyleft">Copyleft</router-link> |
            <router-link to="/datenschutz">Datenschutz</router-link>
          </v-flex>
        </v-layout>
      </v-container>
      <router-view></router-view>
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
    color #2c3e50
    &.router-link-exact-active
      color #42b983
</style>
