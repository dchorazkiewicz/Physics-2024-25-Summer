# Statistics

## What is a probability?

Probability is a measure of the likelihood of an event occurring. It is a value between 0 and 1, where 0 indicates an impossible event and 1 indicates a certain event.

In mathematical terms, the probability of an event $A$ is calculated as:

$$
P(A) = \frac{\text{Number of favorable outcomes}}{\text{Total number of possible outcomes}}
$$

For example, if we roll a fair six-sided die, the probability of rolling a 4 is:

$$
P(4) = \frac{1}{6}
$$

### Simulating Probability in Python
To better understand probabilities, we can use simulations. For instance, we can simulate rolling a die multiple times to estimate the probability of a specific outcome.

Here is a Python simulation to estimate the probability of rolling a 4 on a six-sided die:

```python
import random

# Function to simulate rolling a die 'n' times
def simulate_die_rolls(n):
    # Generate a list of 'n' random die rolls (values between 1 and 6)
    rolls = [random.randint(1, 6) for _ in range(n)]
    # Calculate the proportion of rolls that resulted in a 4
    return rolls.count(4) / n

# Simulate 10,000 die rolls
n_rolls = 10000
# Estimate the probability of rolling a 4
estimated_probability = simulate_die_rolls(n_rolls)
# Print the estimated probability
print(f"Estimated probability of rolling a 4: {estimated_probability}")
```

By increasing the number of simulations ($n$), we get a more accurate estimate of the true probability.

### The Law of Large Numbers
The Law of Large Numbers states that as the number of trials increases, the experimental probability (from simulations) will converge to the theoretical probability.

For example, if we simulate the die rolls with a very large number of trials, we expect the estimated probability to approach $\frac{1}{6}$. Let's modify the simulation to observe this behavior:

```python
import matplotlib.pyplot as plt

def simulate_convergence(n_trials):
    results = []
    cumulative_4s = 0
    for i in range(1, n_trials + 1):
        if random.randint(1, 6) == 4:
            cumulative_4s += 1
        results.append(cumulative_4s / i)
    return results

# Simulate 100,000 trials
n_trials = 100000
convergence_results = simulate_convergence(n_trials)

# Plot the convergence
plt.plot(range(1, n_trials + 1), convergence_results)
plt.axhline(1/6, color='red', linestyle='--', label='Theoretical Probability')
plt.xlabel('Number of Trials')
plt.ylabel('Estimated Probability')
plt.title('Convergence to Theoretical Probability')
plt.legend()
plt.show()
```

This plot illustrates how the estimated probability stabilizes around the theoretical probability of $\frac{1}{6}$ as the number of trials increases.
