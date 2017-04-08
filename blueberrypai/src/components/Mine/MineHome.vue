<template>
    <div>
        <MineUnlogin v-if="!unlogin"></MineUnlogin>
    
        <MineLogin v-else></MineLogin>
    </div>
</template>
<script>
import MineLogin from "./MineLogin";
import MineUnlogin from "./MineUnlogin";

export default {
    name: 'minehome',
    components: {
        MineLogin,
        MineUnlogin
    },
   computed:{
        unlogin(){
          return this.$store.state.islogin
        }
   }
}
</script>
<style scoped>

</style>