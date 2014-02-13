== readme.txt ==

== Running ==

Just from a shell would work:

$ ./hw2.rb 10

Will run a game, some experiments, and the driver function with your input converted to an int.

== Design Choices ==

I went with recursive solutions to the algorithms. They don't work very well because as far as
I know ruby doesn't have tail recursive optimizations, so the stack can be blown pretty quickly.

Converting these to non-stack blowing would be a good first step if we were to improve upon the
code.

== Hardest Part ==

I'm still working on learning ruby, so some of the syntax or collection methods may not have
been the best choices for each callpoint.

== Table of Results ==

See table.txt or it has been copied below:

----------------------------------------------------
| num_trials | p1 = greedy wins | p1 = zoomin wins |
|     10     |         5        |        1         |
|    100     |        72        |        26        |
|   1000     |       626        |       250        |
|  10000     |       N/A        |       N/A        |
| 100000     |       N/A        |       N/A        |
|1000000     |       N/A        |       N/A        |
|--------------------------------------------------|
