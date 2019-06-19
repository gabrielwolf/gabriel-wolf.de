<template>
  <v-app :dark="darkMode">
    <v-system-bar app color="primary" class="switch-bar"
      ><v-switch v-model="switchme" label="Kontrast"></v-switch>
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
    return { switchme: true };
  },
  computed: {
    darkMode() {
      return !!this.switchme;
    }
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
    color #1976d2
    text-decoration none

  .v-system-bar
    a
      color #fff

      &.router-link-exact-active
        color #fff

  .menu-bar
    bottom 0
    top auto

  .menu-bar > *
    margin auto

  .switch-bar
    padding 1.5rem 1.5rem 1.35rem 1.5rem

  .v-input__control
    margin auto

    label
      display none

  .download
    color #777

.theme--light.application
   background: linear-gradient(to bottom, #ddd 0%, #fff 100%);

/* Dark mode */

.theme--dark.application
  background: linear-gradient(to bottom, #111 0%, #000 100%);
  color #ddf !important

  .v-system-bar
    background #171717 !important
    a
      color #1976d2 !important
</style>
