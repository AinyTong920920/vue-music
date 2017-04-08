<template>
    <div id="mine">
        <MineHome></MineHome>
    </div> 
</template>
<script>
    import MineHome from "./MineHome";
    export default {

    name: 'minePage',
    props: {},
    components: {
        MineHome
    },
    data() {
        return {
           
        }
    }

}

</script>
<style scoped>
    div{
        color:mediumseagreen;
        font-size: 100px;
    }
</style>