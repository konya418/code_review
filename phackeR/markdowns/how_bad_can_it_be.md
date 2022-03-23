### p-hacking by maximizing researcher degrees of freedom

What would happen if we combined the different ways to p-hack, how high could the false positive rate be? 

We could imagine how easy it would be to set up such a study. Imagine 40 participants come into the lab and are randomly assigned to listen to either "When I'm 64", "Kalimba" or "Hot Potato". After listening to one of the three songs they complete a questionnaire where they report their gender, motivation, creativity, perceived age, mood and stress level. After all 40 participants have completed the study we begin data analysis

For each of the 5 outcomes we make the following comparisons: 

- Compare "When I'm 64" to "Kalimba" and ignore "Hot Potato" controlling for gender
- Compare "When I'm 64" to "Kalimba" and ignore "Hot Potato" including a  gender by music interaction
- Compare "Kalimba" to "Hot Potato" and ignore "When I'm 64" controlling for gender
- Compare "Kalimba" to "Hot Potato" and ignore "When I'm 64" including a  gender by music interaction
- Compare "When I'm 64" to "Hot Potato" and ignore "Kalimba" controlling for gender
- Compare "When I'm 64" to "Hot Potato" and ignore "Kalimba" including a  gender by music interaction
- Compare the 'linear trend' of all three conditions controlling for gender
- Compare the 'linear trend' of all three conditions including a  gender by music interaction

If any p-values are below .05 we stop data collection and report the comparison with the lowest p-value. If all p-values are below .05, we collect data from an additional 20 participants and repeat all analyses on all 60 participants. If additional data is collected, we report the comparison with the lowest p-value. 

#### Run simulations: choose any combination of p-hacking

Using the controls you can see the results form many independently ran studies, or the results of one study at a time. You can include any combination of p-hacking approaches. 

Collect Data to see how likely a false positive is! Remember that without any p-hacking we would only expect a false postie 5% of the time. See how much p-hacking can influence the rate of false-positives. 
