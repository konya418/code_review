### p-hacking by testing multiple outcomes

Recall from our hypothetical study that after listening to "When I'm 64" or "Kalimba", participants complete a survey where they report their perceived age. The survey could have also collected data on many other outcomes. Besides perceived age, imagine that the survey also collected participants reports of their motivation, creativity, mood and stress level. It is plausible that music could effect any of these 5 outcomes. What would happen if researchers tested the effect of music on all 5 of these outcomes and then only reported the result with the lowest p-value?

#### Run simulations: testing multiple outcomes

Using the controls you can see the results form many independently ran studies, or the results of one study at a time. To see how testing multiple outcomes influences false-positives, you can choose the number of outcomes to test along with the correlation between the different outcomes. If you run a simulation with 5 outcomes each study would have 5 p-values (one for each outcome). p-hackeR only reports the lowest p-value from each study. 

Collect Data to see how likely a false positive is! Remember that without any p-hacking we would only expect a false postie 5% of the time. See how testing multiple outcomes increases the rate of false posties. 

