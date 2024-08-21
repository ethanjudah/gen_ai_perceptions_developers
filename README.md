# gen_ai_perceptions_developers


IMPACT OF GENERATIVE AI ON DEVELOPERS USING A TOPIC MODELLING AND SENTIMENT ANALYSIS OF REDDIT DATA


1 ABSTRACT

The aim of this research is to understand developer perceptions of the recent innovation of Generative AI. To do this, this study answers how generative AI is perceived by developers, has it proven effective in augmenting processes and to what extent its implementation has brought about challenges in accuracy and security. The methodology utilised in this study includes LDA topic modelling and sentiment analysis to uncover latent topics and their sentiment throughout popular developer subreddits using Reddit data. The findings reveal an overwhelmingly positive perception of GenAI, with minimal evidence of negativity, although concerns for the future do exist, particularly job security. The implications of this study include a positive adoption in accordance with adoption frameworks with the view that as inflated expectations and hype realign with reality, a wider and more nuanced perspective of the technology will be apparent. Furthermore, GenAI is likely to alleviate talent shortages within specialised roles by lowering entry barriers, while simultaneously also displacing high skilled roles, requiring upskilling. 

2 Objectives

This research aims to understand the software developers' view of GenAI and its influence on their roles. The objectives are to understand:
1) How is GenAI perceived by developers? 
2) Has GenAI proven effective in augmenting processes?
3) To what extent has GenAI's implementation surfaced challenges, particularly in accuracy and security?


3 METHODOLOGY 

The section discusses the fundamental techniques and models applied to analyse this study’s corpus of Reddit data. The primary tool for this analysis is topic modelling, an unsupervised machine-learning technique that efficiently identifies concealed topics within the text corpus, as well as sentiment analysis.
While other methods of topic modelling exist, such as Non-Negative Matrix Factorization (NMF) this study opts to use Latent Dirchlet Allocation (LDA) for the following reasons. Firstly, the LDA model does not limit each document to a single topic (Axelborn and Berggren, 2023), instead documents are multinomial distributions of all topics. This contrasts a single topic per document association, allowing multiple topics to be assigned to a document, a feature that favours in this research. Using the LDA model offers a distinct advantage for Reddit data. Its probabilistic nature enables a more detailed, nuanced articulation of latent topics within the corpus by attributing probabilities to words in each topic (Arun et al., 2010).

3.1 Data Sources

Expanding beyond the traditional research approach of survey-based data and case studies, this study exploits Reddit’s robust social media platform as the primary data source. Reddit's unique advantage lies in its superior data categorization and filtering capabilities, unlike twitter data (Boon-Itt and Skunkan, 2020; Bian et al., 2016), which enhance the relevance and reliability of data to respond effectively to the chosen communities in question (Ford et al., 2022; Okon et al., 2020).

3.1.1 Data collection

Data collection was conducted by selecting popular subreddits: r/programming, r/coding, r/webdev, r/experienceddevs, r/developersindia, r/machinelearning, r/linux, r/python, r/datascience, r/javascript, r/artificialintelligence, r/GithubCopilot and r/rlanguage. Subreddits were chosen based on these characteristics: 
-	Subreddit has been active in the last 9 months. 
-	Subreddit contains conversations about AI and GenAI tools. 
-	Subreddit has 30k+ members. 

Based on prior research findings, these conditions assured a range of insights (Peter, 2015; Hickey et al., 2023).
The research purposefully selected subreddits that promoted substantive programming conversations. While this does potentially exclude vital insights that could be learned from other interested parties, this is sufficient for this study which focused on insights offered by experienced viewpoints. 
To acquire data for this study, the research utilized the archived Reddit API through PullPush.io, covering the period from 30th November 2022 to 1st August 2023. This timeframe was used because it corresponds with the public release of ChatGPT, a period that amplified awareness and use of large language models (LLMs) and GenAI tools.

3.1.2 Data Extraction

Applying a filtering algorithm to the data extracted from Reddit, posts within selected dates that included the following keywords were collected:

![image](https://github.com/user-attachments/assets/2a73b32c-eaa7-4697-8d9f-3547f708bd3f)
Table 1 – Keyword search terms 

These keywords were chosen as they target posts relevant to GenAI's coding capabilities and discussions detailing various tools, ensuring a focused dataset. This leads to reliable analysis, which included developer perspectives but excluded those who demonstrate a no interest in code generation or GenAI tools in their professional roles on reddit.

3.2 Cleaning & Pre-processing

The raw data, consisting of 2034 posts compiled in Excel, was reformatted into a .csv file for analysis within RStudio. The steps involved in the cleaning and pre-processing stage were:
i.	Text Cleaning and Processing: To ensure data consistency and eliminate potential noise (superfluous characters, HTML tags), punctuation and white spaces from each post were removed. All text is converted to lower case. 
ii.	Tokenization: This process converted each unique post into independent words/'tokens.' The tokens then build a Document Term Matrix (DTM) and the Term Frequency-Inverse Document Frequency (TF-IDF) calculation, facilitating further analysis.
iii.	Removal of Stop Words: High-frequency but low-impact words (like “The,” "It,” "and,” etc.) that contribute little to overall meaning were filtered out. 
iv.	Removal of Empty Data Rows and Duplicates: Rows without entries and duplicate entries.

3.3 Topic Modelling 

3.3.1 DTM and TF-IDF

A Document-Term Matrix (DTM) characterizes a mathematical representation that outlines the frequency of terms within distinct posts across a dataset (Afzal and Kumar, 2019). Each post is systematically aligned on separate matrix rows with corresponding terms arranged in columns (Afzal and Kumar, 2019; Anandarajan et al., 2019). This structure illustrates the prevalence and distribution of specific terms within distinct posts (Golino et al., 2022).
The study incorporated the TF-IDF approach to decrease any consequences of dataset size and noise (Dzisevič and Šešok, 2019). This method identifies and eliminates redundant, low-weight terms while elevating crucial, impactful words. The TF-IDF approach diverts from a simplistic frequency-based understanding of a term to appreciate its semantic value by analyzing its relevance and uniqueness within a document.

3.3.2 LDA

The complexities of topic modelling are managed through implementing the Latent Dirichlet Allocation (LDA) method (Maier et al., 2021; Zhai et al., 2012; Chauhan and Shah, 2021). The LDA modelling approach follows the data cleaning and pre-processing procedures by determining the optimal number of topics. LDA involves an iterative algorithm to yield topic-word and document-topic distributions and intermittently refines these distributions until a convergence point is achieved (Bolelli, Ertekin, and Giles, 2009). 2000 iterations of Gibbs sampling are used (Tong & Zhang, 2016; Steyvers and Griffiths 2007) where the groups converged. Specifically, each iterative step propels the model towards optimimal number of topics per document and the associated words defining each topic. The LDA process operates as a generative probabilistic model where each topic is modelled as an infinite mixture over an underlying set of topic probabilities (Girolami and Kabán, 2003; Onan, Korukoglu, and Bulut, 2016). It finds the best possible set of topics that could have produced the given corpus of Reddit data. Coherence score is also used to evaluate the quality of topics generated by LDA. This is calculated based on the occurrence of words together in a post. A high score means the topic is well defined and can be used as a proxy for topic quality (Syed & Spruit, 2017).

3.3.2.1 Phi

Phi creates a probability distribution of terms across different topics, thus, making it a critical element in this methodology as it enables the appropriate categorization of text within the relevant topics (Rao et al., 2017). This process not only ensures that topics remain tangible, but also aids in preserving the semantic meaning of the terms compiled to represent topic.
Phi inherently involves comparative analysis of the term-topic matrix that it produces. This matrix contains significant metadata that aids in the discerning of topic density between the documents used. Moreover, frequency of concurrent terms within a topic can be observed, thus, promoting insightful conclusions about the prevailing topics within the corpus.

3.3.2.2 Theta

Theta is conceived as a representation of topic distribution across documents. Theta is instrumental in understanding which topics dominate individual documents (Haghighi et al., 2018). Thus, documents can be accurately assigned to their dominant topics through Theta.

3.3.3 Coherence Score

Coherence Score (Aletras and Stevenson, 2013; Kaplan et al., 2010) is crucial in this methodology. Its utility lies in its capability to assess and quantify the coherence level of topic distribution, adding robustness to the topic modelling. When words bearing similar meanings frequently appear in comparable contexts, a topic is deemed coherent, making this score a powerful metric for topic quality.

Given that manual interpretation of a large corpus can lead to inaccuracies or biases, leveraging an automated calculation like the Coherence Score helps bypass such pitfalls. However, reliance on this alone only reveals a partial understanding of the number of topics in the corpus. It serves a complementary function to the entire analysis process.
Combined with manual observation of the topics, ‘k’, is confirmed as the optimal number of topics for all documents. Taking this step ensures that the topics derived maintain a high level of quality, assisting in accurately classifying text, even if absolute coherence within topics is unobtainable. This practice, while requiring careful application, greatly improves the interpretability of topics, a parameter that is indispensable to overall quality and accuracy (Stephens et al., 2012).  

3.3.4 Topic Labelling

This research employs an approach which involves identification and labelling of topics. This method leveraged the top 30 most relevant terms in each topic to establish an understandable representation of their content. These serve as a foundation for defining labels for topics. To ensure accuracy and contextuality, terms are cross-referenced with relevant posts from each topic. This process validates the appropriateness of the chosen labels which is instrumental in the overall topic identification and labelling methodology.

3.4 Sentiment Analysis

Sentiment analysis is a method deployed to evaluate each post by determining its positive, negative, or neutral stance, aligning with research-specific objectives. This analysis assesses subjective text, including opinions, moods, and emotions (Li, 2013). Each word within a post is assigned a corresponding sentiment value, based on its context. The accumulation of these individual word sentiment scores yields the overall sentiment score for each post: posts laden with negative words most likely receive a negative rating, those skewed with positive words accumulate a positive score, and posts displaying an even distribution of positive and negative words are categorized as neutral. Word-specific sentiment scores from individual posts are collected and accumulated to provide a comprehensive sentiment score for each topic. In addition, specific lexicons like NRC are instrumental in categorizing text into different emotional categories, such as joy, anger, and fear (Mohammad and Turney, 2013).

3.4.1 Lexicon-Based Approach

3.4.1.2 Application of NRC Lexicon

The three lexicons the R's Tidytext package offers include AFINN, Bing, and NRC, aiding sentiment evaluation (Silge and Robinson, 2017). The AFINN rating system rates words on a continuum from -5 (extremely negative) to +5 (extremely positive) (Oh and Yi, 2021; Gratz et al., 2022). Bing Lexicon categorizes words into positive and negative sentiments (Liu, 2012). However, this study employs the NRC Lexicon due to its unique ability to dissect text into eight separate emotional categories apart from the essential positive and negative values (Sharma, 2018). This multi-emotion classification complements the goal of obtaining an in-depth understanding of developers' perceptions. These emotions and sentiment are assigned to negative, positive or neutral shown by table 2. 

	
![image](https://github.com/user-attachments/assets/0e686ff8-c0a9-43cd-82b8-f4aa0bb77322)
Table 2 NRC emotion classification


Contrasting other methods like the VADER lexicon - prominent in social media post analysis - restricted within the -1 to 1 range, the NRC lexicon paves the path for extensive analysis (Kim, 2022). For instance, the NRC lexicon proves invaluable to test hypotheses dependent on emotional reactions towards GenAI. For instance, the 'trust' emotion and its corresponding polarity become instrumental in testing Hypothesis 3, validating its use. By recognizing the context of emotions within a topic, the lexicon assesses a topic's sentiment, either positive or negative. Each post's detailed sentiment and emotional profiling enable an integrated portrayal of its overall sentiment and emotion. 

In progressing towards an overall sentiment and emotional classification for each topic, this methodology aggregates post scores for each topic and normalises them to reach values between 0 and 1. To obtain this the following steps were taken: 
1)	Calculate sentiment score of each post by unnesting posts and finding score of words in the post relative to each other. 
2)	Calculate the weight for each topic: weight = 1/number of posts per topic 
3)	Calculate weighted sentiment for all posts in the topic: S' = Σ (Sentiment Score of Post * Weight of Topic)
4)	Normalised weighted scores = original weighted sentiment value/ sum of all sentiment in the topic 
This normalisation serves as a countermeasure against the potential bias that larger posts with abundant emotional words might create as well as topics with more posts, inducing score distortions. This results in comprehensive sentiment scores for each topic, delivering an accurate and meaningful representation and interpretation of topic sentiment scores which can be compared.


3.5 Hypothesis Testing

The sentiment analysis strategy employed here is fundamental to hypothesis testing. It has proved its validity in previous research through consistent and accurate results. Furthermore, its theoretical grounding in quantifying subjective elements like emotions and sentiment validates the robust approach to hypothesis testing.

•	After assigning sentiment scores to each topic and superset, hypotheses can be addressed focusing on specific topics that reflect developers' perspectives about GenAI's implications. Testing Hypothesis 1 involves a detailed analysis of the sentiment score associated with the topic concerning topics about improvement to roles and augmenting abilities. A substantial leaning towards positivity in the polarity validates Hypothesis H1, while a negative score dismisses it.

•	Hypothesis 2 adopts a similar method, requiring an examination of the topic directed primarily towards the perceived usefulness of GenAI. The sentiment score compiled for this topic effectively mirrors the developers' stance on the utility and efficacy of GenAI, giving it significant importance in the testing process. If a negative sentiment score characterizes this topic, it translates to the perception of GenAI's tools and technology as unhelpful and unproductive. Diving deeper to examine the emotional assignments associated with this topic illuminates the intensity and intricacy of the sentiments towards GenAI.

•	Testing Hypothesis 3 depends on all-encompassing understanding of the topic that encapsulates concerns surrounding GenAI and prospects for its improvement. Analysing these topics allows for pinpointing the prevailing apprehensions and improvement suggestions by scrutinizing original posts relating to relevant topics. Topics that show some negative sentiment, complemented by negative emotions as per the NRC model and evidence of supporting posts, pave the way for a thorough exploration into the insights they hold.


4.0 RESULTS

4.1 Frequent Terms
The study commenced with an initial dataset of 2034 posts, which, upon cleaning and pre-processing, resulted in 1962 unique posts. Notably, 72 posts were removed due to duplication or lack of content following removal of stop words to enhance the data's relevancy and precision. 
To explore and understand the data further, the contribution of posts from subreddits can be observed through figure 1. r/MachineLearning collected the most posts with over 33% of posts coming from this subreddit, while over 82% of the posts originated from the top 5 subreddits shown in figure 1. r/coding, r/Githubcopilot and r/Rlanguage contributed only 9, 4 and 3 posts respectively.

<img width="468" alt="image" src="https://github.com/user-attachments/assets/eecd69c3-d646-4f78-9d7f-db0193b07778">

Figure 1 - Number of posts collected from each subreddit

A Document Term Matrix (DTM) was utilised to identify the 10 most recurrent terms in the corpus, illustrated by Figure 2. However, it is vital to consider not just the frequency of the terms but also their contextual relevance to the topic under discussion.



![image](https://github.com/user-attachments/assets/633f8fcc-3a26-4d60-9f0c-b560f1920646)

(1) states that term frequency measures the proportion of a term within a document, representing the importance of that terms to that document.


Visualization of The Top 10 Frequent Terms.

<img width="452" alt="image" src="https://github.com/user-attachments/assets/4c54502e-3367-41ff-b92a-578ff4b41808">

Figure 2

Figure 3 expands on this concept, presenting a word cloud of the 100 most frequent terms in the corpus, aligning size proportionally to frequency. Colours here function solely for visual differentiation without any connotation to relevance or sentiment.


Word cloud representing the 100 most frequent terms.

<img width="301" alt="image" src="https://github.com/user-attachments/assets/e73af35e-6bd1-4871-b14b-25112e632b41">
Figure 3


4.2 LDA

Figure 4 shows the coherence scores corresponding to topics, where k ranges from 2 to 20. 5 is pinpointed as optimal, showing a peak coherence score of 0.076, signifying 5 latent topics within the corpus. In this context, the coherence score serves as a substantive measure of the semantic quality of the topics.

Best Topic by Coherence Score

<img width="491" alt="image" src="https://github.com/user-attachments/assets/35321051-106d-450c-97a9-f4d17c0c811a">

Figure 4

The concerns around overfitting or under-segmentation due to a seemingly high number of topics are critical.  Therefore, decisions regarding the number of topics are not arbitrary and are substantiated with comprehensive evaluations involving both coherence scores and manual topic reviews.
Although figure 4 shows that the highest coherence score is 20, the scores of k=6-10 are lower than k=5, showing that there is no higher peak until 11 is reached. Furthermore, the scores between 12-16 are also lower than k=5. Although k=11 and k=16 show higher coherence score, the difference is marginal (0.004). Thus, choosing 11 or 16 topics does not bring any significant improvement in topic coherence, therefore, k=5 is an adequate choice. In fact, choosing higher number of topics with little added coherence may bring extra complications to the analysis, making the topics too segmented where overlapping topics are clear. 


4.1.3 Topics Labels 

After conducting LDA to identify latent topics within the corpus, the next step involves topic labelling. LDA, a probabilistic model, assigns sets of words to each topic grounded on their statistical co-occurrence. However, it is difficult to interpret the meaning of a topic based solely on a list of words. Therefore, labelling topics is critical in understanding the true meaning of each topic.
Through manual observation, topics are labelled by reviewing their top 30 most relevant terms and corresponding examples of associated posts. Aside from the leading 10 relevant terms displayed in Table 3, other significant terms play an influential role in topic labelling, albeit not visible. In order to evaluate and validate the labels chosen, a combination of iterative labelling and coherence score is used. Coherence score measures how well topics explain the words within posts, therefore, a high coherence score implies more accurate topic labels. Labels are refined and continually improved as more information is evaluated; that is the top words and examples posts. 


Top 10 words in topic, relevant quotes and resulting topic label

<img width="358" alt="Screenshot 2024-08-21 at 12 13 45" src="https://github.com/user-attachments/assets/90660e47-ade7-4291-a16a-c8fdd211d07a">

<img width="356" alt="Screenshot 2024-08-21 at 12 14 01" src="https://github.com/user-attachments/assets/3f07e0d2-8bb7-4b6e-9e7d-8e2edee8c7e2">

Table 3

4.3 Sentiment Analysis 

The purpose of sentiment analysis is to understand perceptions held about the discovered topics which they are discussing within relevant subreddits. This study chose to find the sentiment of posts in relation to the post itself, rather than the NRC dictionary which preassigns scores to words. This relies on deeper analysis which considers the context of the entire post, leading to a more critical understanding of its sentiment. Therefore, instead of assigning scores at the word level, scores are calculated for the entire post by considering the tone and sentiment within the post. This method handles nuances of language better by understanding the context in which words are used.  
Displaying an array of emotions and sentiments, Figure 6 exhibits normalised, aggregated scores for each topic present. The weighting, aggregation and normalisation processes are outlined in section 3.4, explaining how figures 5 and 6 were created. Subsequent figures will expand upon these scores.

Weighted Aggregate Sentiment Score for Posts in each Topic

<img width="452" alt="image" src="https://github.com/user-attachments/assets/017118b0-34f7-41cc-b95a-f33c542591cf">

Figure 5

Normalised Aggregated Scores for each Topic 

![image](https://github.com/user-attachments/assets/3fec0734-09d8-4b27-9819-76102292f91d)

Figure 6

4.2.1 Emotion Analysis 

Figure 7 illustrates an interesting emotional landscape within the corpus. There is a heavy positive skew within the data, paired with relatively high levels of trust and anticipation, which are considered positive emotions as per table 2. 

<img width="441" alt="image" src="https://github.com/user-attachments/assets/b6a68f69-9617-4cb9-8cd8-9fc3ef163a46">

Figure 7

Conversely, negative sentiment is also present, although much less significant than its positive counterpart by 1.6 times. Negative emotions such as anger, disgust, sadness and surprise register modestly, whereas fear, although still modest, shows slightly greater presence in the corpus. 
This initial exploration, while interesting, fails to delve into sentiment's variance within each topic — a shortcoming that can conceal nuances within the data. Therefore, to forge a more robust understanding of sentiment, each topic is examined in detail using the NRC emotion framework, providing insights about its emotional landscape. Figures 8-13 attempt to elucidate these details.


<img width="441" alt="image" src="https://github.com/user-attachments/assets/75c77b8b-2113-4ac6-a68b-cae5b03bb1ce">

Figure 8 Topic 1


![image](https://github.com/user-attachments/assets/a97dae11-c75b-4a8e-9641-9478045254b9)

Figure 9 Topic 2


![image](https://github.com/user-attachments/assets/2c08f7eb-b892-4b39-85da-cb75ec7e3979)

Figure 10 Topic 3

 
![image](https://github.com/user-attachments/assets/2775a038-596e-4de1-aa2c-ad494030b713)

Figure 11 Topic 4


![image](https://github.com/user-attachments/assets/830886c3-37cc-4c66-89bb-623f91e32be2)

Figure 12 Topic 5



5.0 DISCUSSION

![image](https://github.com/user-attachments/assets/74cd98d6-9ed8-4414-a343-8167e2416bd7)

Table 4


5.2 Discussion Evaluation 

Following further analysis, it is observed that topics follow similar patterns in sentiment and emotion scores which can be attributed to several factors. Firstly, by looking at authors posts, the same individuals are posting multiple times across different topics. Authors are likely to hold similar views across topics, rather than having differing views. Thus, when a user expresses positivity about one topic, they tend to exhibit a similar attitude towards others.
Secondly, the relatively short time frame which this study used limits the external influences on sentiment, resulting in consistent attitude across topics. The lack of longitudinal study limits the research to a snapshot in time, in this case following the release of ChatGPT, popularising GenAI. Due to this, it is likely that its novelty has significantly impacted perceptions. Furthermore, the shape of the topics is inherently similar, reflecting the interconnected nature of discussions around GenAI. 
Additionally, the skew to positive sentiment in these topics is connected to the novelty of the GenAI. High levels of hype surround the emerging technology, leading to inflated expectations that have yet to align with the reality of its capabilities, leading to band wagoning effects which can explain the existence of such homogenous sentiment. This is supported by the position of GenAI from industry analyst perspectives, placing it on the peak of inflated expectations (Gartner, 2023). As practice catches up to innovation, GenAI’s limitations will become apparent as it enters the mainstream and as hype no longer exceeds experience. Here it is likely that sentiment will align with reality rather than expectations, changing the emotional landscape attached to it which may exhibit more critical perspectives to its application to use cases. 
Lastly, vendors' such as OpenAI’s marketing agendas contribute to the uniformity of sentiment as they aim to maximise profits, which is often unchecked by the practical use cases of the technology. As these mature and evolve, it is likely that sentiments may undergo changes and diversify as expectations are aligned with GenAI’s true abilities. 


6.0 CONCLUSION


The aim of this study was to understand developers’ perceptions of GenAI, particularly relating to its impact on roles. Previous research focussed on survey-based data from specific locations or businesses. Therefore, this research uses Reddit data to expand the potential reach, and diversity among the sample to answer these research questions:

1) How is GenAI perceived by developers? 
2) Has GenAI proven effective in augmenting processes?
3) To what extent has GenAI's implementation surfaced challenges, particularly in accuracy and security?
   
Depending on secondary data from several developer specific subreddits through Reddit API, this study employed LDA topic modelling and sentiment analysis as its methodology. Overall, analysis shows that the perception of developers to GenAI is overwhelmingly positive, with some, although very little, evidence of negative views and fears towards the future. Throughout analysis, it can be observed that the effect on developers is largely similar across topics. With respect impacts on efficiency and productivity, it is shown that GenAI is perceived as having a positive impact on developer roles. Despite this, there is evidence that these views are not fully homogenous, with some fearing that these improvements will be so great that it will go beyond augmentation and result in job replacement. However, GenAI has been found to be promising and useful, with it exhibiting similar characteristics as previous innovation points such a SO, which revolutionised development. These views are critical in GenAI’s acceptance among developers, in accordance with TAM. Finally, despite these positive views, there is evidence that developers do experience challenges and concerns regarding accuracy and security. Minimal evidence of negative perception does not intrinsically mean no negative views are held, but rather when it is linked with trust and anticipation, it suggests these views may be improvements, not dismissal of GenAI.
These findings are concurrent with previous research into the effects of AI on developers and professionals in general, which suggests that the overall perception is positive, with some less significant evidence of concerns over job loss and security. However, this study expands on this literature to encapsulate GenAI which has seen immense popularity.
Overall, GenAI has the potential to significantly transform and revolutionise development in a similar way previous inflection points such as CASE or SO have, through productivity, efficiency and speed. Similarly, it holds promise in its ability to reduce barriers to entry for novice developers, reducing the talent shortage which is apparent within the industry. Despite some fears of its augmentation leading to job loss, which are expected from section 2.0, GenAI is generally perceived as a positive phenomenon which will continue to benefit developers and democratise coding. 


6.1 LIMITATIONS 

One limitation of this study is the limited sample size. 1962 posts are used in this analysis, but this limits generalisability of the findings as well as limiting the statistical power of the research. Drawing conclusions from this study around the effects of GenAI on developers is crucial and is a starting point to understand the effects across more occupations. This small sample size reduces the extent to which these results can be extrapolated for larger populations, increasing it would offer greater power to the LDA model. 
Another limitation of this study is the subjectivity involved in topic labelling. Topics are defined based off a subjective methodology of manually observation of most frequent words and relevant posts from each topic. This can lead to subjectivity bias and a lack of objectivity, making it hard to replicate and validate since it is heavily reliant on individual judgement. Furthermore, since this research employed only one labeller, the researcher, no consensus was found to eliminate these issues. Multiple label validators may alleviate this. 

6.2 FUTURE RESEARCH 

Future research should aim to validate and expand on these findings by taking a longer time period of study. The novelty of GenAI and the effects this has had on homogenising developer perspectives has meant that the true effects of the technology on their roles has not been realised, instead this study has found the sentiment of the technology at this time where popularity is high. As the reality of applications of GenAI catch up to its hype and inflated expectations, better insights into developer perspectives can be found which are less influenced by the reasons for the similar patterns found, outlined in section 5.2. Future studies, therefore, should give sufficient time for these effects to dissipate and for views on GenAI’s different aspects to no longer be interwoven. 






For more infomation, background, and deeper analysis on this project, please reach out to me on ethanjudah@hotmail.com
