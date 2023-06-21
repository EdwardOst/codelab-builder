summary: How to Write a Codelab
id: how-to-write-a-codelab
categories: Demo
tags: talend
status: Published 
authors: Ed Ost
Feedback Link: https://talend.com

# How to Write a Codelab
<!-- ------------------------ -->
## Overview 
Duration: 1

### What You’ll Learn 
- how to set the amount of time each slide will take to finish 
- how to include code snippets 
- how to hyperlink items 
- how to include images 
- other stuff

<!-- ------------------------ -->
## Setting Duration
Duration: 2

To indicate how long each slide will take to go through, set the `Duration` under each Heading 2 (i.e. `##`) to an integer. 
The integers refer to minutes. If you set `Duration: 4` then a particular slide will take 4 minutes to complete. 

The total time will automatically be calculated for you and will be displayed on the codelab once you create it. 

<!-- ------------------------ -->
## Code Snippets
Duration: 3

To include code snippets you can do a few things. 
- Inline highlighting can be done using the tiny tick mark on your keyboard: "`"
- Embedded code

### JavaScript

```javascript
{ 
  key1: "string", 
  key2: integer,
  key3: "string"
}
```

### Java

```java
for (statement 1; statement 2; statement 3) {
  // code block to be executed
}
```

<!-- ------------------------ -->
## Hyperlinking and Embedded Images
Duration: 1
### Hyperlinking
[Youtube - Halsey Playlists](https://www.youtube.com/user/iamhalsey/playlists)

### Images

Local Image

![alt-text-here](assets/puppy.jpg)

External Image

`claat` throws an error when processing external images.  Use a regular html element image instead.

````
![external puppy image](https://www.banfield.com/-/media/Project/Banfield/Main/en/Wellness_at_Banfield/Puppy_Hub/Puppy_Hub_0-3_Months/0992_01_4x3L.jpg?h=1153&w=1536&rev=1187902491b444ddaed3186dddac7b64&hash=0EBAED4A670DF63314C9994D96AE80AA)
````


<!-- ------------------------ -->
## Other Stuff
Duration: 1

Checkout the official documentation here: [Codelab Formatting Guide](https://github.com/googlecodelabs/tools/blob/master/FORMAT-GUIDE.md)
