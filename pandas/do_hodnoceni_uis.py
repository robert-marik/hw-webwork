import pandas as pd
import csv
df = pd.read_csv("MTK_2023_ZS_prez_totals.csv", header=6, )
df = df [df["login ID"] != "47155"]
# df = pd.read_csv("MTK_2023_ZS_kombi_totals.csv", header=6, )

jmena = pd.read_csv("export.csv", index_col=5, header=None)

vyplnene_hodnoceni = jmena.dropna().index
seznam = pd.read_csv("seznam.csv", index_col=2, sep=";")["Login"]

upraveno = []
for i,j in [[53,4],[80,6],[96,10],[112,15],[144,20]]:
# for i,j in [[144,20]]:    
    ids = df[df["summary"]>=i]["login ID"].values.astype(int)
    upravit = list(seznam[ids].values)
    # vynechat ty, co uz maji vyplnene hodnoceni
    # upravit = [i for i in upravit if i not in vyplnene_hodnoceni]
    upraveno = upraveno + upravit
    jmena.loc[upravit,4] = j


jmena = jmena.loc[list(set(upraveno)),:]
# jmena = jmena.loc[upraveno,:]

jmena = jmena.dropna()


jmena = jmena.astype(str)
jmena.to_csv("output.csv", header=False, index=False, quotechar='"', quoting=csv.QUOTE_ALL)
