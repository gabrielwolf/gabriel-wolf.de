<template>
  <div class="hello">
    <h1 class="mb-3">
      Ein Mensch.<br />
      Ein Archiv.<br />
      Ein Versuch.
    </h1>
    <p class="subheading font-weight-regular">
      Warum? Vieles aus gutem Grund. <br />
      Einiges ohne Absicht. <br />
      Manches zufällig. <br />
      Nichts umsonst.
    </p>
    <v-flex mb-5 xs12>
      <h2 class="mb-3 text-xs-center">Ein Zeitstrahl.</h2>
    </v-flex>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    msg: String
  }
};
</script>

<style scoped lang="stylus"></style>
