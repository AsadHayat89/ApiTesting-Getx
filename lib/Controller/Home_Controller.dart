import 'package:api_testing/Model/Product.dart';
import 'package:api_testing/Model/User.dart';
import 'package:api_testing/services/remote_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxBool Loading=false.obs;
  var user=<Product>[].obs;
@override
  void onInit() {
    // TODO: implement onInit
  fetchData();
  super.onInit();
  }
void fetchData() async {
  Loading.value=true;
var User=await RemoteService.fetchNEwproduct("https://jsonplaceholder.typicode.com/users");
if(User!=null)
  {
    print("asda total are: ${User.length}" );
    user.value=User;
    Loading.value=false;
  }
}

}