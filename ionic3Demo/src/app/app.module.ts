//根模块 告诉ionic如何组装应用    很重要


//http请求
import { HttpClientModule } from '@angular/common/http';
import { HttpSerProvider  } from '../providers/http-serve/http-serve';
//http请求 


//引入angular 以及 ionic的系统模块
import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
//引入components模块
import { ComponentsModule } from '../components/components.module';
//引入根组件
import { MyApp } from './app.component';
//页面 自定义组件
import { AboutPage } from '../pages/about/about';//关于页面
import { ContactPage } from '../pages/contact/contact';//联系我们页面
import { HomePage } from '../pages/home/home';//Home页面
import{RegisterrPage}from'../pages/registerr/registerr';
import{ReplyPage}from'../pages/reply/reply'
import{LoginPage} from '../pages/login/login'
import { TabsPage } from '../pages/tabs/tabs';//底部tab
//ionic 打包成为APP以后配置启动画面 以及导行条的服务   （开发阶段不用编写）
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

@NgModule({
  declarations: [/*申明组件*/
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    LoginPage,
    RegisterrPage,
    ReplyPage
  ],
  imports: [/* 引入的模块 依赖的模块*/
    BrowserModule,
    ComponentsModule,//引入模块后对其进行注册
    IonicModule.forRoot(MyApp),
    HttpClientModule,
  ],
  bootstrap: [IonicApp],/*启动的模块 */
  entryComponents: [ /* 配置不会再模板中使用的组件*/
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    RegisterrPage,
    ReplyPage,
    LoginPage
  ],
  providers: [/*配置服务 */
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    HttpClientModule,//网络请求
    HttpSerProvider//网络请求服务
  ]
})
export class AppModule {}
