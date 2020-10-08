---
layout: post
section-type: post
crosspost_to_medium: true
title: "Going For Go For Web APIs"
image: img/posts/go-web-api/Go-lang.jpg
category: Experience
tags: [ 'programming', 'golang', 'go',  'web servers', 'OnThisDay' ]
---
I have been working on a slack app, [OnThisDay](https://github.com/thealphadollar/OnThisDay) for quite a long now, and I had
halted work for a brainstorm session (with myself) and also to study for my mid-semester examinations. While I had framed
the algorithm in my subconscious, I almost forgot to begin the work with it. And then came the KOSS's workshop on WebServers 
using Go :wink:

![Ugly Go]({{"img/posts/go-web-api/Go-lang.jpg" | absolute_url}})

[_Kshitij Saraogi_](https://github.com/kshitij10496) was our instructor and this article is in the form of a conversation between
me and him; and it could be the actual one, you never know. Also, I'd recommend that if the article instills interest (and a zeal to understand better) for Go Servers,
please have a look at the project mentioned, and go through the [server file]().

> Never underestimate the smartness of a stupid student! 

---
**"Wait a sec! I do not what an API is, Kshitij?"**<br/>
API stands for Application Programming Interface; and as the name suggests, it is an interface
to which the user can communicate and carry out applications. In our usage, we can understand API as a path on the server
(eg. "https://example.com/path/to/endpoint) where can send request (technical term is the same) and receive a response.

**What do we mean by a web server here?**<br/>
A server is a PC which can be accessed for information / operations by other computers (called clients) on a same network.
A web server in our application implies an interface that can be accessed as a website (sort of); with a URI (Uniform Resource Identifier) and in a browser (or with a request).

**One more question; Are we going to learn to host the WebAPI?**<br/>
No, we will be going to the stage at which we would have a simple server running on local host port '8080'. For hosting from our own system,
we need to dive into topics such as [port forwarding](https://en.wikipedia.org/wiki/Port_forwarding) and [ngrok](https://ngrok.com/).

---
Nowhere can it be easier to set up a minimalistic server using Go. I've set up a simple server with two endpoints: "init"
which serves a static webpage with a button, and "redirect" that accepts code from Slack Web API and then raises another request
with appropriate parameters for authentication (not important for this article).
 
First and foremost we need to define the package in the go file and specify the imports in the following snippet's format. The important
package is "net/http" which is the package that handles all http related operations as we shall see.

```go
package main

import (
    "fmt"
    "net/http"
)
```

Package name is the unique name that identifies (and builds at once) all the files of the same program (or project). Just as
C (or C++), GoLang must have a main function which is executed at first. We create a `OAutherver()` function inside it.

```go
func main() {
    OAuthServer()
}
```

OAuthServer contains mainly three portions; a multiplexer, designation of handlers and the main server launching and listening. 
We define a [port](https://en.wikipedia.org/wiki/Port_(computer_networking)) to serve the webapp at (Here it'll be 8080). The 
inbuilt functions of `net/http` are self explanatory. Also, we need the multiplexer to route (divert) traffic coming to the same
port to different destinations based on the called URI.

```go
func OAuthServer() {
    PORT := ":8080" 
    mux := http.DefaultServeMux
    mux.HandleFunc("/init", InitHandler) // A simple button (for testing)
    mux.HandleFunc("/redirect", RedirectHandler) // Redirected to code here, IMP
    http.ListenAndServe(PORT, mux)
}
```

The above code setups a skeletal server with the two aforementioned endpoints calling the functions InitHandler and RedirectHandler.
These methods are two functions which are invoked whenever their respective endpoints. An example function follows,

```go
func InitHandler(w http.ResponseWriter, r *http.Request) {
    // serves the test webpage to init the process
    http.ServeFile(w, r, "src/test.html")
}
```

The function simply returns the plain HTML file ("src/test.html") to the client (the PC) that accessed the endpoint. In this method one can host a 
simple website using GoLang and http multiplexer. Now, all that is left to do is write the logic (and code) for RedirectHandler and run you
`.go` file to have the server at `localhost:8080/init`.

One important observation here is that the handler function always take two arguments: a response and a request. Response is
your output (in a way) to the user and you'll understand that it is used to handle your "talks" with the user. Similarly, when
the user access your endpoint, he "talks" to your server and that query for information is received as a request **pointer**.

Below is the entire code with the two endpoints and much more log handling as well as print commands which are easy to understand
with little efforts and using google.

```go
package main

import (
    "fmt"
    "log"
    "net/http"
)

const PORT = ":8080"

func main() {
    log.Println("Launching the OAuth Sever on port " + PORT[1:])
    OAuthServer()
    log.Fatal("Server shutdown!")
}

func OAuthServer() {
    // using mux instead of direct http handling
    mux := http.DefaultServeMux
    mux.HandleFunc("/init", InitHandler)
    log.Println("Init handler setup.")
    mux.HandleFunc("/redirect", RedirectHandler)
    log.Println("Redirect handler setup,")
    log.Println("Listening on the port...")
    err := http.ListenAndServe(PORT, mux)
    if err != nil {
        log.Println("Failed to start the server!")
        log.Fatal("%+v", err)
    }
}

func InitHandler(w http.ResponseWriter, r *http.Request) {
    // serves the test text
    log.Println("InitHandler accessed!")  // not printed in browser
    fmt.Fprintln(w, "This line printed in browser!")
    // further logic here
}

func RedirectHandler(w http.ResponseWriter, r *http.Request) {
    // Handles redirect
    
    log.Println("RedirectHandler accessed!")  // not printed in browser
    fmt.Fprintln(w, "This line printed in browser!")
    // further logic here
}
```

Most of the code above is very easy and understand and, in these few lines we have created our first server. If this is your
first time hearing about go, I'd suggest you to learn to install it, and run the above code.
 
> see the magic with your own eyes, it looks more magnificent.

---

I did not intend this as a tutorial and do not consider it so; it is just an introduction to how easy it is to use GoLang to 
create servers and is to seed curiosity. 

If you have got some time and enthusiasm, check the [project](github.com/thealphadollar/OnThisDay) which this article is based on.
