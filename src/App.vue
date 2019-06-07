<template>
  <v-app>
    <v-system-bar
      app
      align-center
      justify-center
      row
      fill-height
      color="primary"
      class="switch-bar"
      ><v-switch light style="flex: inherit; margin-top: 0.45rem"></v-switch>
      <div style="padding-bottom: 1.5rem">
        <v-icon
          medium
          color="white"
          class="download-icon"
          style="display: inline-block; margin: auto"
          >mdi-download-network</v-icon
        >
      </div>
    </v-system-bar>
    <v-content>
      <v-container>
        <v-layout>
          <v-flex><router-view></router-view></v-flex>
        </v-layout>
      </v-container>
    </v-content>
    <v-system-bar
      app
      justify-space-around
      color="primary"
      class="menu-bar"
      height="39px"
    >
      <router-link to="/">Home</router-link>
      <router-link to="/impressum">Impressum</router-link>
      <router-link to="/copyleft">Copyleft</router-link>
      <router-link to="/datenschutz">Datenschutz</router-link>
    </v-system-bar>
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
    text-decoration none

  .v-system-bar
    a
      color #dedede

      &.router-link-exact-active
        color #fff

  .menu-bar
    bottom 0
    top auto

  .menu-bar > *
    margin auto

  .switch-bar
    padding 0
    height 45px !important
    > *
      vertical-align middle
      margin auto
</style>
