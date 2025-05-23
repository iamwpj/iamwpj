# Papers

Papers written for a [Cybersecurity MS, from Iowa State University](https://iowastateonline.iastate.edu/programs-and-courses/cybersecurity/cyber-security-master-of-engineering-in-cyber-security/). I take the work seriously -- they're not publishable, but they are indicative of my thoughts and skills.

## Exploration of WireGuard 

> WireGuard: a software layer virtual private network you can use in the modern era. WireGuard is built into the Linux kernel and supports necessary extensible options with features like pre-shared keys, a configurable access control layer, and flexibility of functioning on top of virtual interfaces. Can we trust the network layer authentication (Layer 2) provided by the routing and handshake in WireGuard?

[WireGuard: Trusting Network Layer Authentication in a New Protocol](./WireGuard:%20Trusting%20Network%20Layer%20Authentication%20in%20a%20New%20Protocol.pdf)

## Ethics of data brokers

> Consumers feel the omnipresence of data sharing — one Amazon search turns to a deluge of ads on Facebook. A baby registry spawns fliers for minivans. Moving to a new home garners alarming calls about the perils of not having proper mortgage insurance. Is my phone listening to me? During the process of navigating online you are alerted that sites are tracking you (“Please accept these cookies to continue!”). These are raw facts collected about you, but analyzed information can be so much more, it has become a traded good. It exists as a nearly completely unregulated commodity. Categories with names like “Group O: Singles and Starters” contain subsets such as “O55 - Family Troopers: Families and single parent households living near military bases” shroud the concept that entire swaths of potential customers have been distilled to a homogeneous set of likely similar (and accurate) data points. The commodity marketplace already exists and it has an entire framework of regulations to draw on. Rather than inventing a complicated set of policies – one which would allow for exploitable loopholes! – the focus can be redirected at the process of exchanging data for money (or other data).

[They Only Want You For Your Data: Data brokers are turning everything about us into a commodity market.pdf](./They%20Only%20Want%20You%20For%20Your%20Data.pdf)

## Using a CNN AI model to detect generated images

> Detecting generated images is an increasingly preva- lent need in forensics. Convolutional neural networks (CNN) are a model of AI training that predates the more popular usage of transformers in popular language models today (e.g., GPT-1 and newer). I will continue to expand the application of CNN models to image assessment by training a model that contains two categories: real and synthetic human faces. This model will then be utilized to assess a variety of images generated from various methods (unknown to the trained model) of image generation. By asses a naive implementation (one without in-depth filtering or other image contexts), I am attempting to establish the feasibility of a long-term solution to more simple pre-trained models that can be used to AI generated image detection.

[A Naive CNN Application to AI Generated Image Detection](./A%20Naive%20CNN%20Application%20to%20AI%20Generated%20Image%20Detection.pdf)

_See more in the [supporting repository](https://github.com/iamwpj/naive-cnn-identifier)._

## Standardizing Data For Kafka Consumers

> Scaling publish and subscribe systems face a variety of issues. When these systems are integrated into a tiered data pipeline, data reliability can become one of the culprits. Different systems that rely on data from a pipeline will either have to rely on a local parser to assert or correct the data field types for a contained record or rely on the client to correctly format a record before sending it. The alternative to these two options is a separate service to define data types and reform data into a standardized format. These service create complexity and add latency to a streaming pipeline.

[Standardizing Data For Kafka Consumers](./Standardizing%20Data%20For%20Kafka%20Consumers.pdf)

_See more in the [supporting repository](https://github.com/iamwpj/kafka-types)_

## Zero-shot Log-based Anomaly Detection with LLM

> Properly analyzing logs in a large distributed environment is complicated. Modern log environments require a multi-step process to collect, parse, index, and ultimately analyze logs. This process requires human intervention throughout — a burden of labor and knowledge. Today tools like machine learning seek to solve this problem, but that introduces further reliance on the log processing step; ultimately making more work for engineers.
> 
> Implementing an large language model (LLM) to perform zero-shot anomaly detection (not requiring correct parsing, index, and known good states — all the trappings of existing systems). The objective in this research is to address the shortcomings of existing complex solutions that rely on time and knowledge, fail to handle log formatting changes, and have too strict of tolerances for known states. LLMs are a solution that is evolving significantly and can technically align with the requirements to find zero-shot anomalies in logs, while side-stepping the issues found in current solutions. There are studies that explore LLM-informed anomaly detection in adjacent fields, but for system and application logs this topic has not yet been sufficiently explored.
> 
> Finally, looking forward to the future, standard systems must be developed. This should affect both system design and analysis of log sequences themselves. By taking this step during the early phases of LLM integration, engineers and researchers can keep the apace with the advancements in LLM infrastructure as it becomes available and ultimately ensure that all logs are eventually audited.

[Zero-shot Log-based Anomaly Detection with LLM](./Zero-shot%20Log-based%20Anomaly%20Detection%20with%20LLM.pdf)

_See more in the [supporting repository](https://github.com/iamwpj/bigstick)_