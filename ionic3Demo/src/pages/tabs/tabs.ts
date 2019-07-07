import { Component } from '@angular/core';

import { AboutPage } from '../about/about';
import { ContactPage } from '../contact/contact';
import { HomePage } from '../home/home';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  // tab1Root = HomePage;
  // tab2Root = AboutPage;
  // tab3Root = ContactPage;
  tabRoots:Object[];

  constructor() {
    this.tabRoots=[{
      root: HomePage,
        tabTitle: '浏览',
        tabIcon: 'home'
    },{
      root: ContactPage,
        tabTitle: '收藏',
        tabIcon: 'notifications'
    },{
      root: AboutPage,
        tabTitle: '我的',
        tabIcon: 'document'
    }
    ];

  }
}
