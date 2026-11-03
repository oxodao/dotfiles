## React

Instead of chaining ternaries, it’s advisable to choose between an early return when it’s interesting, or to do it like this:

```tsx
 { condition1 && condition2 && <Component1 /> }
 { !condition1 && condition2 && <Component2 />}
 { !condition1 && !condition2 && <Componentt3 />}
```
