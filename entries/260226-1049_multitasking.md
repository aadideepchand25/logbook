# Multitasking {#260226-1049}
---
## Process States
There are 3 different process states:
- Ready
- Running
- Blocked

A process can become blocked if it is waiting for another process

> A deadlock is when two or more processes rely on each other in a loop like fashion. This will never be resolved

Deadlocks can be avoided in many ways using things like:
- Bankers algorithm
  What banks use with other banks to avoid going bankrupt
- Forcing all processes to only be able to make one request and then process all of them simultaneously
- **Ignoring** - the simple solution is to just ignore requests whenever they cause a deadlock

## Scheduling
Scheduling is about deciding which processes (of which are ready) should be allowed to be run on the CPU next. In the old days when people had punchcards they wanted to run, scheduling was done manually by an operator (eg. would run professors' punchcards before students' punchcards)

Nowadays this task is handled by a dedicated scheduler. Properties of these schedulers include:
- Fariness
- Response Time
- Throughput
- Turnaround
- CPU utilization (minimising idle time)
- Deadlines:
  For some tasks, it is imperative for it to be completed before a deadline - hard deadline
  > For other tasks, that don't have hard deadlines, we say they have soft deadlines
- Predictability
  This ensures consistent timings, and allows us to make algorithms with an assumption of scheduler behaviour
- Adherence to policy

Some constraints that we can have on processes are:
1. Correct - Needed for any system
2. Within deadline - Needed for realtime systems
   - Soft real-time systems (multimedia)
   - Hard real-time systems (flight controls - where not processing in time, is as bad as an incorrect result)
3. Within power budget

### Scheduling Algorithms
Some scheduling algorithms include:
- First-come first-served
- Shortest job first
  Has a good throughput, as things that will take a long time, will take a long time. Short jobs are more affected by long jobs than long jobs are by short jobs.
  > Problems arise when implementing this, as it requires us to know how long a task will take to complete before it completes (halting problem). Can only be done with a good statistic approximation
- Round Robin
  Tries to be as fair as possible. Gives each task a small fixed time slot to execute in (called a quanta/time quantum). If a process does not finish in its time, it's preempted and put to the back of a circular cycle. It then context switches to the next process
  > When doing round robin, the quantum length is very important as short quantums will cause context switching overhead. Long quantum length can remove the main point of round robin. Typically values of 20-50ms are good.
- Shortest remaining time
  Same as shortest job first, but is preemptive and will context switch half way through a task if a new task that is shorter than the remaining time of the current task. This can cause a bunch of semi-processed tasks, and of those we pick the shortest remaining time one.
- Priority scheduling
- Lottery scheduling
  Does not guarantee any processes, and whatever task is done next is luck-based
