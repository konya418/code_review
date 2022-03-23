The most common statistical framework in social science assumes that research has a false-positive rate of 5%. In the 2011 paper [False-Positive Psychology: Undisclosed Flexibility in Data Collection and Analysis Allows Presenting Anything as Significant](https://journals.sagepub.com/doi/full/10.1177/0956797611417632),  Simmons, Nelson and Simonsohn show that despite this assumption, subtle flexibility in data analysis can drastically increase the rate of false positive findings. 

Research degrees of freedom are small choices that can be made in the data analysis process that lead to inflated false positive rate. The four most visible researcher degrees of freedom are:

- testing multiple outcome variables
- collecting additional data after an initial analysis
- flexability around interactions 
- comparing different subsets of data

How bad can these subtle researcher degrees of freedom be? p-hackeR is a simulation application that will let you explore the extent to which p-hacking can influence the rate of false-positive findings. p-hackeR will run simulations from a distribution of thousands of independent studies or will let you explore the likelihood of a false positive one study at a time. 

### Running Example

Imagine you are running a randomized study to see if listening to different songs causes participants to feel younger or older. You randomly assign participants to a treatment condition where they listen to either "When I'm 64" by the Beatles or a control condition where they listen to "Kalimba" the music played while a Microsoft program is loading. After participants listen to one of the two songs they fill out a questionnaire where they report their perceived age. 

All of the data in p-hackeR is simulated so that there is no differences between the treatment variable and outcome variable. Any result with a p-value below .05 indicates a false positive, because we know the data has been simulated.

### no p-hacking

We'll start with an example of what would happen without any p-hacking. When the there is no effect, p-values follow a uniform distribution. Under this distribution, 5% of p-values will be below .05. Put another way, if we know there is no effect of a treatment, we would expect a 5% of results to be false positives. 

In our hypothetical study, if 10,000 different research groups performed the same study and analyzed their data in the same way, we would expect 500 of the research groups to incorrectly conclude that music can change perceived age.

#### Run simulations: no p-hacking
Using the controls you can see the results form many independently ran studies, or the results of one study at a time. Collect Data to see how likely a false positive is! Without any p-hacking we would only expect a false postie 5% of the time


