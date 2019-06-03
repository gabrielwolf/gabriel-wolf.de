<template>
  <v-container fluid copyleft pt-0>
    <v-layout>
      <v-flex>
        <h1 class="mb-3">Copyleft</h1>
        <a
          rel="license"
          href="https://creativecommons.org/licenses/by/4.0/deed.de"
          ><img
            alt="Creative Commons Lizenzvertrag"
            src="cc-by-icon.svg"
            class="mb-3"/></a
        ><br />
        <p text-xs-justify>
          Alle Werke dieser Seite sind unter einer
          <a
            rel="license"
            href="https://creativecommons.org/licenses/by/4.0/deed.de"
            >Creative Commons Namensnennung 4.0 International Lizenz</a
          >
          lizensiert.
        </p>
        <p
          :class="{
            'mb-2': $vuetify.breakpoint.smAndDown,
            'mb-0': $vuetify.breakpoint.mdAndUp
          }"
        >
          Das heißt, sie dürfen frei verwendet werden, solange der Name des
          Urhebers mit angegeben wird.
        </p>
        <p>
          Gabriel Wolf: gabriel-wolf.de // der&#8209;herr&#8209;pianist.de //
          wolfzeit.com
        </p>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script></script>
