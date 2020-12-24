<template>
    <div>
        <h1>loop</h1>
    </div>
</template>

<script>
export default {
    created() {
        this.loop();
    },
    data() {
        return {
            allLoop:[],
        }
    },
    methods: {
        loop(){
            axios.get('/loop')
                .then(({data}) => (this.allLoop = data))
                .catch()
        }
    },
}
</script>

<style scoped>

</style>
