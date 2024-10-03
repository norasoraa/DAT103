package HVL.Scheduler;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Queue;

public class NSJFScheduler implements Scheduler {

    private Queue<Task> ready;
    private Task selected;

    NSJFScheduler() {
        this.ready = new ArrayDeque<>();
    }

    @Override
    public Optional<Integer> scheduled() {
        if (selected == null)
            return Optional.empty();
        return Optional.of(selected.getId());
    }

    @Override
    public List<Integer> ready() {
        return ready.stream().map(Task::getId).toList();
    }

    // Task 2: Complete the implementation of Non-preemptive Shortest Job First
    @Override
    public void addTask(Task task) {
        ready.add(task);
        List<Task> tasks = new ArrayList<>(ready);
        tasks.sort((t1, t2) -> Integer.compare(t1.getSize(), t2.getSize()));
        ready.clear();
        ready.addAll(tasks);
    }

    @Override
    public void schedule() {
        if (selected == null) {
            selected = ready.poll();
            if (selected == null) {
                return;
            }
            selected.start();
        } else {
            // Task 2: Complete the implementation of Non-preemptive Shortest Job First
            if (selected.isDone()) {
                selected.stop();
                selected = null;
                schedule();
            }
        }
    }
}
