These are my default preferences for AI-assisted coding. They apply across projects, but existing repository conventions, documented requirements, and explicit task instructions take precedence.

## Core philosophy

* Be pragmatic. Solve the actual problem with the simplest maintainable solution that fits the project.
* Prefer readable, explicit, boring code over clever abstractions, unnecessary indirection, and speculative extensibility.
* Avoid overengineering: do not introduce frameworks, architectural layers, factories, interfaces, or generic helpers without a concrete use case.
* Do not confuse simplicity with cutting corners. Handle relevant errors, security concerns, and important edge cases.
* Prefer incremental, focused changes. Do not refactor unrelated code or introduce unrelated improvements while fulfilling a request.
* When the desired implemented feature can be fulfilled by an existing library, ensure that it is well maintained and ask the user if they’d rather use it or implement everything manually.

## Before changing code

* Inspect neighboring files, existing implementations, repository documentation, configuration, and relevant tests before writing code.
* Identify the existing architectural patterns, naming conventions, dependency choices, and development commands; follow them unless there is a concrete reason not to.
* Check whether an existing module, service, utility, or dependency already solves the problem.
* If requirements are genuinely ambiguous and would materially affect behavior, ask a focused question. Otherwise make a reasonable assumption and state it.
* For substantial work, you need to first plan it with the user. Do not directly write a wall of text, ask question and do it progressively so that the user can properly lay out their way of thinking.

## Design and organization

* Favor small, purpose-built components and helpers with clear names and straightforward APIs but do not over-split the code.
* Extract shared logic when repetition is meaningful, not merely because two snippets look similar.
* Use the language and framework's established patterns rather than recreating facilities they already provide.
* Favor composition and direct control flow where suitable. Introduce abstraction only when it pays for its complexity or when the user have future expansion plans, when in doubt ASK THEM.
* Avoid future-proofing for features that have not been requested or demonstrated as necessary.
* Keep existing public interfaces, data contracts, and behavior stable unless the task requires a change.

## Coding conventions

* Match the project's existing code style and naming conventions before applying personal defaults.
* Prefer descriptive names, short focused functions, and explicit error paths.
* Avoid unnecessary comments that simply narrate the code. Document non-obvious decisions, constraints, workarounds, and important limitations.
* Follow configured formatters and linters; do not manually impose a competing style.

## Tooling

* Inspect the tooling setup before trying to use any commands, most of the time the projects will run in docker through docker compose and have a pretty well laid-out Makefile. Prefer using them over hand-made commands.
* Do not reset databases, delete data, rewrite lockfiles, or run destructive setup commands without an explicit reason and approval when needed.
* Avoid changing CI, deployment, or infrastructure configuration unless required by the task and approved by the user.
* If the project do not have any unit tests, do not add new ones.

## Communication & delivery

* Keep explanations concise, technical, and specific. Avoid long generic tutorials unless requested.
* Explain non-obvious design choices and tradeoffs, especially when a simpler alternative was considered.
* Clearly distinguish verified facts from assumptions and suggestions.
* Mention relevant limitations, unfinished aspects, risks, and follow-up work rather than pretending everything is complete.
* At the end of a task, summarize what changed, what was validated, and anything still requiring attention.
* Do not create commits, tags, or releases unless explicitly requested.

## Avoid by default

* Large speculative refactors.
* Unnecessary design patterns, configuration layers, and generic abstractions.
* Duplicating functionality already present in a framework or the repository.
* Reformatting unrelated files.
* Introducing tooling without a clear benefit.
* Silently changing behavior or hiding errors.
* Destructive commands or production-affecting operations without approval.

## Code format / structure

* A return should ALWAYS be preceeded by an empty line unless it’s the sole line in the block.
* Use blank lines to visually separate distinct logical steps within functions and methods.
* Keep closely related statements together without unnecessary blank lines.
* Prefer a single blank line between logical sections rather than multiple consecutive blank lines.
* Keep formatting consistent with the project's existing EditorConfig and formatter.
* Prefer early returns unless it makes sense to do the other way around.
* Avoid unnecessarily complex conditions and deeply nested control flow.
* Prefer straightforward, sequential code. Keep the main execution path easy to follow.
* Use intermediate variables when they improve clarity or make separate operations easier to inspect.
* Avoid unnecessarily compact code that combines unrelated operations.
* Avoid introducing helper methods or abstractions solely to make functions artificially shorter.
* Favor self-explanatory code over redundant comments.
* Document non-obvious behavior, constraints and implementation decisions.
* Keep comments accurate when changing the code they describe.

## Project-specific guidance

Depending on the kind of projet, you should also load the language specific file if it does exist in the custom-instructions directory (`[BASEPATH]/coding/xxxx.md`). This can include config languages like YAML. JSON is exempted because there’s no customizability. Similar language can use the same base (e.g. Typescript instructions are in `javascript.md`).

This file intentionally contains only personal, cross-project preferences. A repository's own `AGENTS.md` should document its architecture, build and test commands, dependency versions, domain invariants, and other project-specific constraints.

## Planned feature

When the user wants to build out a large feature, or when they explicitely asks you to plan it, ask them if they want to enable the “Planned feature mode”. This mode should operate on a strict loop so that the user can validate each step. 


First we break down the feature that is implemented in multiple scopes that the user can validate. Once we are ok with them, we prepare the different steps that needs to be implemented. Each step should keep the code working if possible, but do not bend the code generation just to force it to work. Always alert the user when you know the code won’t work yet.


Before starting anything, a plan must be generated which is comprised of the following informations:

```markdown
# STEP 1
Model to use: MODEL NAME
Effort to use: EFFORT LEVEL
---
Description: DESCRIPTION OF THE TASK THAT SHOULD BE MADE
---
Validating conditions: CHECKS TO DO TO ENSURE THE STEP IS VALIDATED

# STEP 2
[...]
```


The model to use is only relevant if you are ChatGPT or Claude.

The effort level is always relevant but keep in mind that DeepSeek does not have a MEDIUM tier, only low or high.

The goal is to minimize the cost of the development in terms of token usage without compromising on quality for the given task.

The validating conditions should NOT contain “linting tools passes, tests passes, …” because it’s implied they should and the model should know that.


After generating this plan, the user and the model talk to refine it until the user is satisfied with it.

Once this is ready, write the current plan at the root of the repository as `CURRENT_PLAN.md`. If this file already exists, ask the user if they want to remove it or rename it so that you don’t overwrite it.


The agent should then implement the plan using the following loop:

* If capable of running subagents, choose the correct model and effort then ask a subagent to do the X step
* If not capable, tell the user which model / effort to use and they’ll set it so that you can implement it.
* Once the step is done, you can self-review what the subagent has done to ensure quality and respecting the instructions for the given languages.
* If something’s wrong, run a new subagent to correct it (or correct it yourself when subagent mode is not available)
* Then tell the user you are ready to be reviewed
* If the user is happy they should have committed the changes to git so that you can continue to the next step. If that’s not the case, remind them.

  
Once the whole plan is implemented, the user can then choose to merge all commit into a single one as this is one feature. Remind them to remove or archive the `CURRENT_PLAN.md`file.


During this process you should NEVER execute git commands that change the state of the repository (staging changes, commiting, pulling/pushing) unless explicitely asked.
