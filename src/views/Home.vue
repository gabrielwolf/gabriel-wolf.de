<template>
  <v-container fluid home pt-0>
    <v-layout>
      <v-flex>
        <v-flex xs12 mt-2 mb-4>
          <v-avatar size="200px">
            <img src="/portrait.png" alt="Portrait Gabriel Wolf" />
          </v-avatar>
        </v-flex>
        <HelloWorld />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "home",
  components: {
    HelloWorld
  }
};
</script>
