import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('defaults_by_year.csv')
df = df[df['ISSUE_YEAR'] >= 2009]


fig, ax1 = plt.subplots(figsize=(8, 5))

ax1.bar(df['ISSUE_YEAR'], df['LOANS'], color='lightsteelblue')
ax1.set_ylabel('Loans issued', color='steelblue')
ax1.set_xlabel('Vintage year')

ax2 = ax1.twinx()
ax2.plot(df['ISSUE_YEAR'], df['DEFAULT_RATE'] * 100, color='firebrick', marker='o', linewidth=2)
ax2.set_ylabel('Default rate (%)', color='firebrick')

plt.title('E-G loans, 36-month: volume grew 12x while defaults climbed')
fig.tight_layout()
plt.savefig('defaults_by_vintage.png', dpi=150)
