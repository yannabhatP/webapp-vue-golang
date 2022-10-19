import  {reactive} from 'vue'

export const cart = reactive({
    product:[],
    addProduct(value){
        const {p_color,p_lang,p_switch} = value
        if(p_color && p_lang && p_switch){
            this.product.push(value)
            
        }else alert("Can't insert into Cart")
        
    },
    removeAllProduct(){
        this.product=[]
        this.total= 0
    }
})