import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('grade_returns.csv')

colors = ['tab:green' if r > 0 else 'tab:red' for r in df['NET_RETURN']]

plt.figure(figsize=(8, 5))
plt.bar(df['GRADE'], df['NET_RETURN'] * 100, color=colors)
plt.axhline(0, color='black', linewidth=0.8)
plt.title('Net return per dollar lent, by credit grade (2007-2018)')
plt.ylabel('Net return (%)')
plt.xlabel('Grade (A = safest)')
plt.tight_layout()
plt.savefig('pricing_vs_risk.png', dpi=150)