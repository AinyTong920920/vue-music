<template>
  <div class="main-nav clearFix">
  
    <ul class="clearFix"
        id="nav">
      <li v-for="navli in Nav"
          @click="toggleOn(navli.req)">
        <router-link :to="navli.req"
                     v-bind:class="{'on':isActive==navli.req}"
                     class="navs">{{navli.nav}}
           </router-link>
      </li>
    </ul>
  
  </div>
</template>
<script>

export default {

  name: 'mnav',
  props: {
    Nav: {
      type: Array
    }
  },
  data() {
    return {
      isActive: this.$route.path,
    }
  },
  methods: {
    toggleOn(req) {
      var thispath=this.$route.path.split('/')[1];
      this.isActive='/'+thispath.split('/')[0];
    }
  },
  computed: {

  }

}
</script>
<style scoped>

</style>