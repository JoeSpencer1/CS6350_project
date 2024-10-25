import numpy as np
import matplotlib.pyplot as plt

# Bar chart comparing NNs with more training data

categories = ['$E_{r}$', '$\\sigma_{y}$']

Ti_s = [3.781387369465043, 26.63319746795029]
Ti_s_err = [0.007701496481774658, 0.0588322758771942]
Ti_p = [50.94761079532808, 399.7790657298666]
Ti_p_err = [14.375848786703617, 0.601115578129517]
Ti_0 = [7.561156998300032, 53.23155592000453]
Ti_0_err = [0.018713689280871974, 0.13891819694826926]

bar_width = 0.3
bar_positions1 = np.arange(len(categories)) - bar_width
bar_positions2 = bar_positions1 + bar_width
bar_positions3 = bar_positions1 + bar_width * 2
fig, ax = plt.subplots()
ax.bar(bar_positions1, Ti_s, yerr=Ti_s_err, width=bar_width, color='darkred', label='self training data')
ax.bar(bar_positions2, Ti_p, yerr=Ti_p_err, width=bar_width, color='darkorange', label='peer training data')
ax.bar(bar_positions3, Ti_0, yerr=Ti_0_err, width=bar_width, color='darkblue', label='PINN models only')
ax.set_xticks(bar_positions2)
ax.set_xticklabels(categories)
ax.set_yscale('log')
ax.set_yticks([1, 5, 20, 100, 500])
ax.set_yticklabels([1, 5, 20, 100, 500])
ax.set_ylabel('Average error (%)')
ax.legend()
plt.subplots_adjust(bottom=0.18)
plt.suptitle('Error in PINN predictions', y=0.1, fontsize=16)
plt.savefig('figures/midterm_compare.pdf', dpi=800, bbox_inches='tight')
plt.show()