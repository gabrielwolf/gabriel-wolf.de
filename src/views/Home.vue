<template>
  <v-container fluid home pt-0>
    <v-layout>
      <v-flex>
        <v-flex xs12 mt-2>
          <v-avatar size="200px">
            <img src="/portrait.png" alt="Portrait Gabriel Wolf" />
          </v-avatar>
          <h1 class="ma-3">
            Ein Mensch.<br />
            Ein Archiv.<br />
            Ein Versuch.
          </h1>
          <p class="subheading font-weight-regular">
            Warum? Vieles aus gutem Grund.<br />
            Einiges ohne Absicht.<br />
            Manches zufällig.<br />
            Nichts umsonst.
          </p>
          <h2 class="mb-3 text-xs-center">Ein Zeitstrahl.</h2>
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
