+++
title = "Deepfakes"
author = ["Marcus Crane"]
date = 2017-02-05
tags = ["deepfakes", "future", "technology"]
draft = false
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [An overview](#an-overview)
- [What are deepfakes?](#what-are-deepfakes)
- [What is machine learning?](#what-is-machine-learning)
- [So how do deepfakes work?](#so-how-do-deepfakes-work)
- [Is this bad?](#is-this-bad)
- [What next?](#what-next)

</div>
<!--endtoc-->

I dug this post up from an older version of my site. It was written two years ago during the emergence of deepfakes. Any mention of machine learning may not be accurate but I've left them as is. In all likehood, I would know less now then I did back then when I had much more time to follow ML trends.

I've made some slight rewordings, fixed typos and revived any links I could using the [Wayback Machine](https://web.archive.org/) but otherwise, the post is 99% intact from when I first wrote it. I didn't realise just how much I had written about this at the time. I'm kind of glad since this was before the subreddit was banned. A lot of it is now lost to time.


## An overview {#an-overview}

Just under 2 weeks ago, an article from The Verge titled [Fake celebrity porn is blowing up on Reddit, thanks to artificial intelligence](https://www.theverge.com/2018/1/24/16929148/fake-celebrity-porn-ai-deepfake-face-swapping-artificial-intelligence-reddit) was posted on [Hacker News](https://news.ycombinator.com/item?id=16226495). If you'd just glimpsed the headline, you might assume it's a bunch of shitstirrers up to no good with Photoshop but unfortunately, it's arguably worse.

In the past, machine learning had been mainly kept within the realm of computer science due to its inherent complexity. As time marches on, new tools and libraries have popped up that make machine learning easier than ever to dive into for professionals and hobbyists alike. It was only a matter of time before someone decided to apply it to subjects considered taboo, and now we can see the results with a new crop of "fake" pornography. Now, I say "fake" to point out that this pornography isn't real but with results often being indistinguishable from reality itself, it kinda renders the term "fake" well... pointless.

I felt like the downsides were glaringly obvious at first but after discussing this topic with a few non-technical coworkers, they seemed to have missed the forest for the trees. Their responses typically focused on the "cool tech" and "sweet custom porn" rather than realising that perhaps this is **the** Pandora's box which we can't go back from.

Given my feelings on the matter, which can be summed up as "Oh fuck", this is my attempt at rounding up both my own thoughts and those posted in the various discussion threads that followed. Before we begin, I should explain a bit more about this technology and how it works. This isn't a master class on machine learning by any means. It's designed to be ["as simple as possible, but not simpler"](https://quoteinvestigator.com/2011/05/13/einstein-simple/), mainly because my understanding of the concepts involved is surface level at best. For anything deeper, you should seek out other sources.


## What are deepfakes? {#what-are-deepfakes}

[deepfakes](https://www.reddit.com/user/deepfakes) is the name of a user on reddit who "pioneered" this new wave of computer-generated celebrity pornography. To further promote discussion, and share generated works, he created a subreddit named after himself – [/r/deepfakes](https://reddit.com/r/deepfakes). The term **deepfake** has since been coined to refer to the creations that followed and it's the term I'll be using going forward.


## What is machine learning? {#what-is-machine-learning}

While the term "machine learning" might invoke visions of [Skynet](https://en.wikipedia.org/wiki/Skynet%5F(Terminator)), it's worth noting that said machines aren't truly conscious like us humans. You'd think the ability to be self-aware and/or concious would be essential to learning, right? At its simplest, learning requires little more than a series of inputs (sound, sight, touch) which we then process in order to produce an output. When you first meet someone, you may forget their face but over time, you learn to recognise them as memories form. As time progresses, you can also identify them in different contexts such as an office, an airport or at a beach. In a rough sense, you've trained your brain to subconsciously identify their facial features so that it can recall which memories they've appeared in before.

Another crucial part of learning is the ability to weigh up how confident we are in our judgements. If we aren't confident enough in a decision, we'll opt either to do nothing or pursue an alternative choice. For instance, each time you meet a friend, your brain is thinking "Ah, I'm 99% sure that's my friend Sarah". On the flipside, I'm short sighted but silly enough to not wear my glasses. Because of that, I might recognise the general facial features of someone across the street but without moving closer, I don't have enough visual information to be sure. My own brain is thinking "I'm only 40% confident that's Pat" and decides to not call it a definite match.

It's a bit hand wavy but in essence, those are the two important elements. A machine "learns" by being fed data continuously and having its output judged. A facial detection network may be trained on photos of a single person, just like in our memory analogy, and then asked to identify if they are present in a handful of photos. It would respond Yes or No along with its level of confidence which can be checked against the actual answer. Those results are then fed back into the machine and it continues to improve itself as time goes on. The next training step of such an example might be continuously seeing if wanted criminals appear in live CCTV footage of an airport.


## So how do deepfakes work? {#so-how-do-deepfakes-work}

How does this all relate to deepfakes? Well, it's a type of neural network. A what now, you say? It's essentially what I just described, which is a network that takes an output, does some unknown (hidden) calculations in the middle and returns an output. There are many different networks, with different numbers of inputs and outputs but in the case of deepfakes, we're only dealing with one of each. There's a [breakdown](https://web.archive.org/web/20180206231055/https://www.reddit.com/r/deepfakes/comments/7pgcg4/detailed%5Fexplanation%5Fof%5Fthe%5Falgorithm/) of how it functions but I felt it wasn't detailed enough for the casual observer.

Similar to our facial detection example from just before, deepfakes uses two [autoencoder](https://en.wikipedia.org/wiki/Autoencoder) networks. One is trained on numerous photos of a celebrity while the other is trained on numerous photos of a "porn star" or performer which is the term I'll be using. The photos first are cropped so that only faces are displayed. Those faces are then fed into the networks as inputs. Photos of the celebrity go into Network A and photos of the performer go into Network B. You may like to read through [this](https://hackernoon.com/autoencoders-deep-learning-bits-1-11731e200694) article too, in order to get a better idea of autoencoders.

I struggled to understand the next step for quite some time as any mention of it was quite vague, however [this](https://arxiv.org/pdf/1706.02932v2.pdf) paper, mentioned by deepfakes [here (dead link)](https://www.reddit.com/r/deepfakes/comments/7jqvny/release%5Fface%5Fswap%5Fmodel%5Ftool/dreu4rl/) as his inspiration seems to shed some light. The rough version seems to be that the input faces are encoded into a compressed representation. The image below helps to illustrate this.

{{< figure src="/ox-hugo/celebs.png" link="/ox-hugo/celebs.png" >}}

This isn't an accurate depiction of how deepfakes goes about its encoding, but serves as a useful mental model to understand how a representation may look. Notice how despite the celebrities above being different shapes and sizes, they can all be deconstructed into a spherical texture with eyes, nose and mouth roughly in the same positions.

{{< figure src="/ox-hugo/cats.png" link="/ox-hugo/cats.png" >}}

Similarly, here is another example with cats. Despite the large variation in not only fur colour, but even the directions they're facing, they all map fairly equally into a spherical structure. For a computer, this isn't a useful visualisation so instead these representations will all just be stored as data points. [One explanation (dead link)](https://www.reddit.com/r/deepfakes/comments/7pgcg4/detailed%5Fexplanation%5Fof%5Fthe%5Falgorithm/dshkv3o/) suggests that eg; a right eyebrow might be interpreted as "a line from X to Y" for one celebrity while another may see the right eyebrow as "a curve [...] along points W, X, Y and Z". One of the biggest annoyances with networks is that it can be quite confusing to understand how they're working and sometimes even [their own creators (dead link)](https://www.reddit.com/r/deepfakes/comments/7jqvny/release%5Fface%5Fswap%5Fmodel%5Ftool/dra7ayi/) have no idea why decisions are being made.

So what happens with this representation? It actually just recreates the original image to the best of its ability. It won't always be accurate to start with but over the course of many hours training its internal model, both networks begin to reliably decode the representations back into their respective faces. As more training iterations are performs, the network is exposed to different lighting conditions, facial expressions and so on. An error function measures the resulting image against the original so that it can continue to try different decoding variation, in the pursuit of accuracy. Do note too that the networks share the same facial encoder while each has a uniquely trained facial decoder.

Once the user has determined that both models are sufficiently trained, the network is fed a video. Don't forget that videos are little more than a series of images. Each frame is cropped to just the face and fed into the network of the performer. As the encoders are shared, it's able to build an intermediate representation of any general face. The trick this time is that the decoders are switched midway. Since the celebrity decoder is uniquely trained, it can't help but reconstruct the representation into the face of the celebrity while still inheriting the details (expression, facial structure) of the performer. The result is that the performers face is morphed to look exactly like that of the celebrity.

Without much in the way of deeply detailed explanations to go on, this is my best attempt however I can't speak much on the final conversation process. To illustrate the result, here is the original [Gal Gadot](https://en.wikipedia.org/wiki/Gal%5FGadot) conversion posted by deepfakes himself. **As indicated earlier, the following is pornography and is definitely not safe for work**.

<Original link was [https://www.pornhub.com/embed/ph5a27755783e28 (NSFW!!)](https://www.pornhub.com/embed/ph5a27755783e28) but it has since died. The video was a pornstar with Gal Gadot's face. Not really her face but overlaid on the body of someone else. The scary thing is you couldn't easily distinguish that it wasn't fake!>

I chose the clip above because it provides a good indication of what works but also what can go wrong. There's a number of instances where the result is miserable, such as 1:09 where multiple facial expressions flash one after the other. Often times, the edges of the overlaid face can clearly be seen, giving an idea of which elements have been replaced. All in all though, the result can be frighteningly accurate, just with the small amount of code that the creator referred to as ["embarassingly simple" (dead link)](https://www.reddit.com/r/deepfakes/comments/7jqvny/release%5Fface%5Fswap%5Fmodel%5Ftool/dr8hk8e/).


## Is this bad? {#is-this-bad}

Well, that's really up to your own personal beliefs, isn't it? It would seem to be a moral issue at best, as technically it doesn't seem to be illegal. An interviewee in [this Wired story](https://www.wired.com/story/face-swap-porn-legal-limbo/) sums it up as far as US law is concerned: "There are all sorts of First Amendment problems because it’s not their real body.". The assumption seems to be that any such creations could be considered art, not unlike a painting or a photoshop edit, which is legally understandable, but still feels a bit ethically shady.

The obvious societal issue here is that it's presumably the next step in being able to objectify others? Rejected by your crush? Bust out the ol' [Human Pokedex](https://facebook.com) and scrape enough data to generate your own virtual fantasy. They might object but that's ok, right? You're not actually there to respect their wishes, it's their body you're after and that's all, right?

Anyway, there's no point preaching to the choir on this. Those who get off on this stuff can easily justify it to themselves because "lol it's not actually them, its fake!!". I wouldn't be surprised if there's a teenager in awe right now who becomes the real life [Robert Daly](https://en.wikipedia.org/wiki/USS%5FCallister).


## What next? {#what-next}

While it's easy to think one man has started this all, he does [have a point (dead link)](https://www.reddit.com/r/deepfakes/comments/7jqvny/release%5Fface%5Fswap%5Fmodel%5Ftool/drbv6io/) in that this really was inevitable. There are other projects that are more concerning, not for where they could lead, but for what they can do right now.

This post has already gone on long enough so here's a few proof of concepts off the top of my head that give an indication of where we're headed

-   [Face2Face](https://youtu.be/ohmajJTcpNk?t=160)
-   [Disney's FaceDirector](https://youtu.be/o-nJpaCXL0k?t=212)
-   [Adobe VoCo](https://youtu.be/I3l4XLZ59iw?t=199)
-   [Synthesizing Obama: Learning Lip Sync from Audio](https://youtu.be/9Yq67CjDqvw?t=107)
