# Click Buy
### Hi there, I'm Muharrem <img src = "https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width = "42"> 
#### Thank You for taking the time to view my repository 

## <h2> About This App <img src = "https://c.tenor.com/JsoERRQcZqYAAAAi/thumbs-up-joypixels.gif" width = "42"></h2>
This application is an e-commerce application and shows developers how to make Dependency Injection applications with the SwInject library. We started the application by first creating our models. In this part, we used quicktype.io. In this way, we have created a faster and more accurate model structure. The category model consists of a typealias. Because the incoming data consists of only a String array. After we created the models, we wrote our service. We created a WebRequest class to make the service easier to use and to write query URLs more easily. In this way, we can more easily control API endpoints and queries. While writing our ApiCall service, we first created a protocol containing our functions to comply with the Dependency Injection rules. Then, in our ApiCall class, we made our functions that retrieve products and categories that can query with URLSession. Then we moved on to our ViewModel classes. Here we first created a new structure in our product viewmodel. Because we won't need some values from API inside the application. Then, after inheriting the ProductViewModel class as ObservableObject, we got the web service from the protocol we created in the ApiCall class. We initialize it with the init function. In this way, it has become suitable for different service uses. In the fetchProduct function, we take the products with our web service and turn them into the structure we wrote with the help of the map method in DispatchQueue.main.async. As you can see here we are using a filterProducts function. It filters products for searches made with this search bar. In this way, the user can find products more easily. In the CategoryViewModel class, our process is quite short. We just call our service within the fetchCategories function and assign the data to the categoryList variable with DispatchQueue.main.async. Notice that we have used @Published keywords here. In this way, every data received is transmitted to the views in an up-to-date manner. The application consists of four basic screens. The first of these is of course a Home Screen. There is a welcome message in the upper left corner of this screen. In the right corner of this text, there is a shopping cart. This basket is managed by the CartButton structure under the Components folder. It takes the variable numberOfproduct into it. If this number is greater than 0, it starts to show this number on itself. In this way, the user can easily see how many products are in his cart. There is a search bar on the home screen. This bar is controlled by the SearchBar structure under the Components folder. Here we used a TextField. In this way, we made a search bar by customizing it ourselves. Each letter written with the onChange method is listened to and sent to the filterProducts function. In this way, the products are filtered. If we continue to the Main Screen, our categories from the API appear under the search bar. Categories are controlled by a button and a TabButton structure under the Components folder. The array from the API is assigned to the title variable here and thus our buttons are formed. In addition, when the user clicks the button, the fetchProduct function is run so that the products belonging to the clicked button can be retrieved from the API. On our home screen, there are product cards under the category buttons. These cards are used in the LazyVGrid structure. The cards are controlled in the ProductCard structure under the Components folder. The image, title, price and rate of the purchased product are displayed. There is also a button on the top left of the card. This button is for adding the product to the shopping bag. Adding and removing products are managed with the CartManager class under the Managers folder. Here, there are subtraction or addition functions according to the number of products. At the same time, the price of added or removed products is followed. Finally, there is the totalQuantities variable at the top of the shopping cart to show the number of products added, and the removeAllProduct function, which removes all products from the list and clears the total product amount. A user who clicks on the products on the main screen is directed to the detail page. Here, he can see the description of the product and can also add it tito the shopping cart from this screen. On the shopping cart screen, if a product has been added, there are pictures, title, price, number of added products, and a trash can icon to remove it from the list. At the bottom of the list, the total price of the products purchased is at the bottom, and the buy button is at the bottom. When this button is clicked, a temporary order received screen appears, and then a return to the main screen is provided by pressing the button. In this way, the shopping cart and the total amount are reset. Finally, the SWInject library was used to facilitate the use of Dependency Injection in the application. It is managed by the DInjectionManager structure agers folder. Here we registered the ApiCall class and the ViewModels and injected them into the screens.

<a href="https://fakestoreapi.com/" target="_blank">Visit Fake Store API</a><br>
<a href="https://github.com/Swinject/Swinject" target="_blank">Visit Swinject Library</a><br>



<h2> Used Technologies <img src = "https://media2.giphy.com/media/QssGEmpkyEOhBCb7e1/giphy.gif?cid=ecf05e47a0n3gi1bfqntqmob8g9aid1oyj2wr3ds3mg700bl&rid=giphy.gif" width = "42"> </h2>
<div class="row">
      <div class="column">
<img width ='72px' src 
     ='https://raw.githubusercontent.com/MuharremKoroglu/MuharremKoroglu/main/swift-icon.svg'>
  </div>
</div>

<h2> Used Language <img src = "https://media.giphy.com/media/Zd6jPg8hcp4Q3vrvjo/giphy.gif" width = "42"> </h2>
<div class="row">
      <div class="column">
<img width ='82px' src 
     ='https://raw.githubusercontent.com/MuharremKoroglu/Bitcoin/main/Flag_of_the_United_Kingdom.svg'>
  </div>
</div>

<h2> Images <img src = "https://media2.giphy.com/media/psneItdLMpWy36ejfA/source.gif" width = "62"> </h2>
  <div class="column">



https://github.com/MuharremKoroglu/ClickBuy/assets/68854616/f5a07d42-db80-4f88-b363-53c198286590





  </div>
<h2> Connect with me <img src='https://raw.githubusercontent.com/ShahriarShafin/ShahriarShafin/main/Assets/handshake.gif' width="100"> </h2>
<a href = 'mailto:muharremkoroglu245@gmail.com'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/MuharremKoroglu/MuharremKoroglu/main/gmail-logo-2561.svg"/></a> &nbsp;
<a href = 'https://www.linkedin.com/in/muharremkoroglu/'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/rahulbanerjee26/githubAboutMeGenerator/main/icons/linked-in-alt.svg"/></a> &nbsp;
<a href = 'https://muharremkoroglu.medium.com/'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/rahulbanerjee26/githubAboutMeGenerator/main/icons/medium.svg"/></a> &nbsp;
<a href="https://www.instagram.com/m.koroglu99/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/instagram.svg" alt="_._.adam._"  width="32px" align= 'center' /></a> &nbsp;
<a href = 'https://synta-x.com/'> <img align="center" width = '32px' align= 'center' src="https://raw.githubusercontent.com/MuharremKoroglu/MuharremKoroglu/main/internet-svgrepo-com%20(2).svg"/></a> &nbsp;



