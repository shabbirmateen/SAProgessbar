# SAProgessbar
SAProgressbar is very light weight library for progressView like story loading in social media platform, It is easy to implement and It is developed in SWift Language.

![Screen Recording SAProgressbar](https://github.com/shabbirmateen/SAProgessbar/assets/26703994/0aa0ea09-a05c-46a8-96ac-2e4df1be437d)


### **Getting Started**

An Sample project is included for demonstrating the functionality of SAProgressbar

### **Manual Installation**

Clone the repo and drag files from SAProgressbar/Source folder into your Xcode project.


### **Usage**

1.Take UIView and set parent class as SAProgressbar.

2.Create object of SAProgressbar


### **Code**

Set number of progressbar based on total sliding page or Image.
`saProgressbar.noOfBar = 5`

Set the timer in seconds for loading one progressbar
`saProgressbar.timeCount = 3`

### **Methods**

**.startLoading(page: 0)**: Call this method to start the loading and pass the page number 0 as argument, if you want to start from first page.
`saProgressbar.startLoading(page: 0)`

**.willBarChanged**: It is callback method to get notify that the progressbar will start loading
`saProgressbar.willBarChanged = { index in
            print("will bar changed at index: \(index)")
        }`

**.didBarChanged**: It is callback method to get notify that the progressbar has compteted loading 
`saProgressbar.didBarChanged = { index in
            print("did bar changed at index: \(index)")
        }`


### **Requirements**
- iOS 16+
- Xcode 15.2+

Copyright © 2024 Shabbir Ahmad. All rights reserved.
        
