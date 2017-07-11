# PSAS Asset Tracking System (PATS)
This is a web app made with Shiny. 

You can find info about what the heck this thing is in `PATSspec.md`.
That needs to be updated though, since it assumes everything will be done through a Google form, which can't do what I want. 
Also, since I'm writing the web app in R anyways, I might as well make the parser part of that, rather than have it be a separate script. (i.e., I'll just format and save the data when a session closes or something.)

Basically, `index.yaml` holds the condensed information on what projects exist and what assets they contain. 
`data.yaml` (or something similar, if R's `yaml` package doesn't do well with pathological inputs)(actually, it looks like the `yaml` package does a pretty decent job of escaping pathological crap, even emojis...) holds the observations of each asset event.
(I already know CSV or something similar won't handle pathological inputs.)
`projects/` will hold the exploded markdown documents as described in the specifications. 

What I mean by "pathological inputs" is this... Say my data storage format uses symbol x to markup the "message" field. There's nothing stopping someone from eventually putting that in their message, which they inevitably will.

