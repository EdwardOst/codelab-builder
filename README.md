Build a set of Code Labs from markdown and deliver in a containerized nginx web site.  It is based on this
[example from CodeLab issues](https://github.com/googlecodelabs/tools/issues/635#issuecomment-990122500).

Usage

* Clone the repo or just copy-paste the dockerfile.
* Create a docs dir with a subdirectory for each code lab group.
* Add code lab markdown file to each docs subdirectory.
* Each subdirectory may also have supporting assets like images, possibly in subfolders.
* Subdirectories serve as a grouping mechanism for related code labs.  There can potentially be multiple markdown files per subdirectory.
* Subdirectories also serve to isolate resources used by each code lab to avoid collisions.
* When deployed each codelab has its own directory unrelated to the subdirectory path; so there is no possibility of collision and the subdirectory names play no role.
* Run docker build.
    * This image will copy in the docs folder and build HTML from the markdown using `claat`.
    * It also builds the codelabs dashboard landing page based on the googlecodelabs/tools github repo
    docker build -t codelab .
* The dockerfile exposes port 80.  So pap it explicitly or let docker assign a random external port when running.
    docker run --name codelab -p 80:80/tcp codelab 
* Browse to localhost or random port assigned.
