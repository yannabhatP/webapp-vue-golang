import  {reactive} from 'vue'

export const profile = reactive({
    account:null,
    login(data){
        this.account = data
    },
    logout(){
        this.account= null
    }
})