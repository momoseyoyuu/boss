import Vue from 'vue'
import Element, {
    Message,
    Container,
    Button,
    Col,
    Table,
    TableColumn,
    Pagination,
    Card,
    Row
} from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

Vue.use(Element)
Vue.use(Container)
Vue.use(Button)
Vue.use(Col)
Vue.use(Table)
Vue.use(TableColumn)
Vue.use(Pagination)
Vue.use(Card)
Vue.use(Row)
Vue.prototype.$messgae = Message