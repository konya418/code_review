### p-hacking by comparing different subsets

Imagine we changed our hypothetical study to include a new condition. Participants come into the lab and listen to either "When I'm 64", "Kalimba" or the "Hot Potato" by the Wiggles. After listening to one of the three conditions, participants complete a questionnaire where they report their perceived age. 

When analyzing the data, researchers could subset their data to make many different comparisons: 
- Compare "When I'm 64" to "Kalimba" and ignore "Hot Potato". 
- Compare "Kalimba" to "Hot Potato" and ignore "When I'm 64"
- Compare "When I'm 64" to "Hot Potato" and ignore "Kalimba"
- Compare the 'linear trend' of all three conditions

Researchers could plausibly argue for using any of the above comparisons. What would happend if we tested all four comparisons and only reported the lowest p-value? 

#### Run simulations: testing different data sub-sets

Using the controls you can see the results form many independently ran studies, or the results of one study at a time. p-hackeR will test the 4 different ways to subset the a treatment variable with 3 conditions and report the lowest p-value.  

Collect Data to see how likely a false positive is! Remember that without any p-hacking we would only expect a false postie 5% of the time. See how comparing different subsets of data increases the rate of false postives. 
