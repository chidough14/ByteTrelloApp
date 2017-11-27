export default {
    methods: {
        fetchBoardsData(){
            axios.get("boards")
                .then(response => {
                    this.boards=response.data.boards;

                });

        },
    }
}