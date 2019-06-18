<template>
  <v-container fluid home pa-0>
    <v-layout>
      <v-flex>
        <v-flex xs12 mt-2>
          <v-avatar size="200px">
            <img
              src="/portrait.jpg"
              alt="Portrait Gabriel Wolf"
              class="portrait-light"
            />
            <img
              src="/portrait-dark.jpg"
              alt="Portrait Gabriel Wolf"
              class="portrait-dark"
            /> </v-avatar
          ><br /><br />
          <a tyrget="_blank" href="https://paypal.me/gabrielwolf23"
            >paypal.me/gabrielwolf23</a
          >
          <h1 class="ma-3">
            Ein Mensch.<br />
            Ein Archiv.<br />
            Ein Versuch.
          </h1>
          <h2 class="mb-3 text-xs-center">
            Ein Zeitstrahl.
          </h2>
        </v-flex>
        <Timeline />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
// @ is an alias to /src
import Timeline from "@/components/Timeline.vue";

export default {
  name: "home",
  components: {
    Timeline
  }
};
</script>

<style lang="stylus" scoped>
.theme--light .portrait-light
  display none

.theme--dark .portrait-dark
  display none

.teaser-text
  color #1976d2
</style>
