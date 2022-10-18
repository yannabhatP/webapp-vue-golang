import  {reactive} from 'vue'

export const cart = reactive({
    product:[],
    total:0,
    addProduct(value){
        const {p_color,p_lang,p_switch,p_price,p_quatity} = value
        if(p_color && p_lang && p_switch){
            this.product.push(value)
            this.total += p_price*p_quatity
        }else alert("Can't insert into Cart")
        
    },
    removeAllProduct(){
        this.product=[]
        this.total= 0
    }
})