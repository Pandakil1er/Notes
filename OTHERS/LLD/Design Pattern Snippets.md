---
title: "Design Pattern Snippets"
created: "2026-06-20 13:54:25"
modified: "2026-07-06 01:23:30"
tags: []
draft: false
---
# Strategy Pattern
**Design Principle** : Identify the aspects of your  application that vary and separate  them from what stays the same.  
**Design Principle** : Program to an interface, not an  implementation.

| Relationship       | Concept                                                                    | Keyword Example (Java/C#)       | Real-World Analogy                 |
| ------------------ | -------------------------------------------------------------------------- | ------------------------------- | ---------------------------------- |
| **IS-A**           | **Inheritance**: A specialized version of a base class.                    | `extends`                       | A `Car` **is a** `Vehicle`.        |
| **HAS-A**          | **Composition/Aggregation**: A class contains another class as a field.    | Declaring an instance variable. | A `Car` **has an** `Engine`.       |
| **Implementation** | **Interface fulfillment**: A class promises to provide specific behaviors. | `implements`                    | A `Car` **implements** `Drivable`. |

**Design Principle** : Favor composition over inheritance. 

**The Strategy Pattern** defines a family of algorithms(algorithm means implementation of behaviour),  encapsulates each one, and makes them interchangeable.   Strategy lets the algorithm vary independently from  clients that use it.
![[Pasted image 20260622022022.png]]

# Observer Pattern
**The Observer Pattern** defines a one-to-many  dependency between objects so that when one  object changes state, all of its dependents are  notified and updated automatically. 
**Design Principle** Strive for loosely coupled designs  between objects that interact. 
  The Observer Pattern defnies  a one-to-many relationship  between objects.
  Subjects update Observers  using a common interface.   Observers of any concrete type  can participate in the pattern  as long as they implement the  Observer interface. 
  Observers are loosely coupled  in that the Subject knows  nothing about them, other  than that they implement the  Observer interface.   You can push or pull data from  the Subject when using the  pattern (pull is considered more  “correct”).
  Swing makes heavy use of the  Observer Pattern, as do many  GUI frameworks.
  You’ll also fnid the pattern in  many other places, including  RxJava, JavaBeans, and RMI,  as well as in other language  frameworks, like Cocoa, Swift,  and JavaScript events. 
  The Observer Pattern is related  to the Publish/Subscribe Pattern,  which is for more complex  situations with multiple Subjects  and/or multiple message types. 
  The Observer Pattern is a  commonly used pattern, and  we’ll see it again when we learn  about Model-View-Controller. 
![[Pasted image 20260626051755.png]]
# Publish-Subscribe Pattern
https://java-design-patterns.com/patterns/publish-subscribe/
Defines a one-to-many dependency between objects, enabling automatic notification of multiple subscribers when a publisher's state changes or an event occurs.

### [Defining the Message](https://java-design-patterns.com/patterns/publish-subscribe/#defining-the-message)

We start with a simple message class encapsulating the information sent from publishers to subscribers.

```java
public record Message(Object content) {
}
```

### [Defining Topics](https://java-design-patterns.com/patterns/publish-subscribe/#defining-topics)

A Topic represents an event category that subscribers can register to and publishers can publish messages to. Each topic has:

- A unique identifier or name (e.g., WEATHER, TEMPERATURE, CUSTOMER_SUPPORT).
- A collection of subscribers listening to this topic.

Subscribers can dynamically subscribe or unsubscribe.

```java
@Getter
@Setter
@RequiredArgsConstructor
public class Topic {

  private final String topicName;
  private final Set<Subscriber> subscribers = new CopyOnWriteArraySet<>();

  public void addSubscriber(Subscriber subscriber) {
    subscribers.add(subscriber);
  }

  public void removeSubscriber(Subscriber subscriber) {
    subscribers.remove(subscriber);
  }

  public void publish(Message message) {
    for (Subscriber subscriber : subscribers) {
      CompletableFuture.runAsync(() -> subscriber.onMessage(message));
    }
  }
}
```

### [Publisher Implementation](https://java-design-patterns.com/patterns/publish-subscribe/#publisher-implementation)

The Publisher maintains a collection of topics it can publish to.

- Before publishing, a topic must be registered.
- Upon publishing, it forwards messages to subscribers of the corresponding topic.

```java
public class PublisherImpl implements Publisher {

    private static final Logger logger = LoggerFactory.getLogger(PublisherImpl.class);
    private final Set<Topic> topics = new HashSet<>();

    @Override
    public void registerTopic(Topic topic) {
        topics.add(topic);
    }

    @Override
    public void publish(Topic topic, Message message) {
        if (!topics.contains(topic)) {
            logger.error("This topic is not registered: {}", topic.getName());
            return;
        }
        topic.publish(message);
    }
}
```

### [Defining Subscribers](https://java-design-patterns.com/patterns/publish-subscribe/#defining-subscribers)

Subscribers implement an interface that handles incoming messages.

- Each subscriber processes messages according to specific logic.
- Subscribers can be registered to multiple topics.

```java
public interface Subscriber {
    void onMessage(Message message);
}
```

Subscriber examples:

- WeatherSubscriber: handles alerts for weather events or temperature changes.
- CustomerSupportSubscriber: handles support tickets by sending emails.
- DelayedWeatherSubscriber: simulates delayed processing for demonstrating asynchronous behavior.
![[Pasted image 20260627005610.png]]

# Decorator Pattern
**Design Principle** Classes should be open  for extension, but closed for  modification. 
While it may seem like a contradiction,  there are techniques for allowing code to be  extended without direct modification. Be careful when choosing the areas of code  that need to be extended; applying the  Open-Closed Principle EVERYWHERE is  wasteful and unnecessary, and can lead to  complex, hard-to-understand code. 
**The Decorator Pattern** attaches additional  responsibilities to an object dynamically.   Decorators provide a felxible alternative to  subclassing for extending functionality. 
![[Pasted image 20260627161222.png]]

# Factory Pattern
**Simple Factory**
![[Pasted image 20260706012255.png]]
**The Factory Method Pattern** defines an interface  for creating an object, but lets subclasses decide which  class to instantiate. Factory Method lets a class defer  instantiation to subclasses.
![[Pasted image 20260706012328.png]]


