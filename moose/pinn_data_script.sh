#!/bin/bash

# Prevent system sleep while this script runs
caffeinate -s bash -c "

mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.3 n=0.05 nu=0.1 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=100
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.1 n=0.05 nu=0.1 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=101
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.07 n=0.05 nu=0.1 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=102
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.06 n=0.05 nu=0.1 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=103
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.16 n=0.05 nu=0.1 hm=0.6 base=2D_r0_05 prefix=104
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.14 n=0.05 nu=0.1 hm=0.7 base=2D_r0_05b prefix=105
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.5 n=0.05 nu=0.1 hm=0.2 base=2D_r0_05b prefix=106
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.05 nu=0.1 hm=0.15 base=2D_r0_05b prefix=107
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1.2 n=0.05 nu=0.1 hm=0.25 base=2D_r0_10 prefix=108
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.85 n=0.05 nu=0.1 hm=0.35 base=2D_r0_10b prefix=109
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.05 nu=0.1 hm=0.45 base=2D_r0_10b prefix=110
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=3 n=0.05 nu=0.1 hm=0.1 base=2D_r0_10b prefix=111
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.66 n=0.05 nu=0.1 hm=0.3 base=2D_r0_20 prefix=112
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.5 n=0.05 nu=0.1 hm=0.4 base=2D_r0_20b prefix=113
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.4 n=0.05 nu=0.1 hm=0.5 base=2D_r0_20b prefix=114
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.33 n=0.05 nu=0.1 hm=0.6 base=2D_r0_20b prefix=115
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.85 n=0.05 nu=0.1 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=116
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3 n=0.05 nu=0.1 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=117
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=4 n=0.05 nu=0.1 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=118
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.4 n=0.05 nu=0.1 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=119
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.85 n=0.05 nu=0.1 hm=0.35 base=2D_r0_05b prefix=120
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.22 n=0.05 nu=0.1 hm=0.45 base=2D_r0_05 prefix=121
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.05 nu=0.1 hm=0.1 base=2D_r0_05 prefix=122
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3.33 n=0.05 nu=0.1 hm=0.3 base=2D_r0_05 prefix=123
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=5 n=0.05 nu=0.1 hm=0.4 base=2D_r0_10b prefix=124
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=4 n=0.05 nu=0.1 hm=0.5 base=2D_r0_10 prefix=125
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3.33 n=0.05 nu=0.1 hm=0.6 base=2D_r0_10 prefix=126
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.85 n=0.05 nu=0.1 hm=0.7 base=2D_r0_10 prefix=127
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.5 n=0.05 nu=0.1 hm=0.2 base=2D_r0_20b prefix=128
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3.33 n=0.05 nu=0.1 hm=0.15 base=2D_r0_20 prefix=129
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2 n=0.05 nu=0.1 hm=0.25 base=2D_r0_20 prefix=130
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.42 n=0.05 nu=0.1 hm=0.35 base=2D_r0_20 prefix=131
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3.33 n=0.05 nu=0.1 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=132
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=15 n=0.05 nu=0.1 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=133
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.05 nu=0.1 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=134
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3.75 n=0.05 nu=0.1 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=135
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=6 n=0.05 nu=0.1 hm=0.5 base=2D_r0_05b prefix=136
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.05 nu=0.1 hm=0.6 base=2D_r0_05 prefix=137
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=4.28 n=0.05 nu=0.1 hm=0.7 base=2D_r0_05b prefix=138
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=15 n=0.05 nu=0.1 hm=0.2 base=2D_r0_05b prefix=139
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=6.66 n=0.05 nu=0.1 hm=0.15 base=2D_r0_10b prefix=140
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4 n=0.05 nu=0.1 hm=0.25 base=2D_r0_10 prefix=141
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.85 n=0.05 nu=0.1 hm=0.35 base=2D_r0_10b prefix=142
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.22 n=0.05 nu=0.1 hm=0.45 base=2D_r0_10b prefix=143
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=20 n=0.05 nu=0.1 hm=0.1 base=2D_r0_20b prefix=144
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=6.66 n=0.05 nu=0.1 hm=0.3 base=2D_r0_20 prefix=145
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=5 n=0.05 nu=0.1 hm=0.4 base=2D_r0_20b prefix=146
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4 n=0.05 nu=0.1 hm=0.5 base=2D_r0_20b prefix=147
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=5 n=0.05 nu=0.1 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=148
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4.28 n=0.05 nu=0.1 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=149
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=15 n=0.05 nu=0.1 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=150
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=20 n=0.05 nu=0.1 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=151
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=1.2 n=0.05 nu=0.1 hm=0.25 base=2D_r0_05b prefix=152
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.85 n=0.05 nu=0.1 hm=0.35 base=2D_r0_05b prefix=153
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.66 n=0.05 nu=0.1 hm=0.45 base=2D_r0_05 prefix=154
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3 n=0.05 nu=0.1 hm=0.1 base=2D_r0_05 prefix=155
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=5 n=0.05 nu=0.1 hm=0.3 base=2D_r0_10b prefix=156
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3.75 n=0.05 nu=0.1 hm=0.4 base=2D_r0_10b prefix=157
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3 n=0.05 nu=0.1 hm=0.5 base=2D_r0_10 prefix=158
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.5 n=0.05 nu=0.1 hm=0.6 base=2D_r0_10 prefix=159
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=4.28 n=0.05 nu=0.1 hm=0.7 base=2D_r0_20b prefix=160
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=15 n=0.05 nu=0.1 hm=0.2 base=2D_r0_20b prefix=161
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=20 n=0.05 nu=0.1 hm=0.15 base=2D_r0_20 prefix=162
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=12 n=0.05 nu=0.1 hm=0.25 base=2D_r0_20 prefix=163
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.85 n=0.05 nu=0.1 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=164
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.66 n=0.05 nu=0.1 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=165
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3 n=0.05 nu=0.1 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=166
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=1 n=0.05 nu=0.1 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=167
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=4.5 n=0.05 nu=0.1 hm=0.4 base=2D_r0_05b prefix=168
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3.6 n=0.05 nu=0.1 hm=0.5 base=2D_r0_05b prefix=169
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3 n=0.05 nu=0.1 hm=0.6 base=2D_r0_05 prefix=170
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=2.57 n=0.05 nu=0.1 hm=0.7 base=2D_r0_05b prefix=171
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=15 n=0.05 nu=0.1 hm=0.2 base=2D_r0_10b prefix=172
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=20 n=0.05 nu=0.1 hm=0.15 base=2D_r0_10b prefix=173
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=12 n=0.05 nu=0.1 hm=0.25 base=2D_r0_10 prefix=174
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=8.57 n=0.05 nu=0.1 hm=0.35 base=2D_r0_10b prefix=175
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.518 sy=0.08 n=0.05 nu=0.1 hm=0.45 base=2D_r0_20b prefix=176
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=158.652 sy=3.14 n=0.05 nu=0.1 hm=0.1 base=2D_r0_20b prefix=177
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=23.138 sy=0.27 n=0.05 nu=0.1 hm=0.3 base=2D_r0_20 prefix=178
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=177.128 sy=1.92 n=0.05 nu=0.1 hm=0.4 base=2D_r0_20b prefix=179
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=73.432 sy=1.12 n=0.05 nu=0.1 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=180
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=83.518 sy=1.16 n=0.05 nu=0.1 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=181
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=161.724 sy=2.03 n=0.05 nu=0.1 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=182
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.938 sy=8.95 n=0.05 nu=0.1 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=183
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=125.17298 sy=9.74 n=0.05 nu=0.1 hm=0.15 base=2D_r0_05b prefix=184
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=168.884 sy=9.55 n=0.05 nu=0.1 hm=0.25 base=2D_r0_05b prefix=185
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.034 sy=5.2 n=0.05 nu=0.1 hm=0.35 base=2D_r0_05b prefix=186
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=33.366 sy=1.22 n=0.05 nu=0.1 hm=0.45 base=2D_r0_05 prefix=187
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=76.098 sy=12.73 n=0.05 nu=0.1 hm=0.1 base=2D_r0_10b prefix=188
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.806 sy=6.56 n=0.05 nu=0.1 hm=0.3 base=2D_r0_10b prefix=189
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=74.168 sy=3.76 n=0.05 nu=0.1 hm=0.4 base=2D_r0_10b prefix=190
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=185.734 sy=9.39 n=0.05 nu=0.1 hm=0.5 base=2D_r0_10 prefix=191
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=21.538 sy=1.13 n=0.05 nu=0.1 hm=0.6 base=2D_r0_20b prefix=192
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=7.56 n=0.05 nu=0.1 hm=0.7 base=2D_r0_20b prefix=193
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1.5 n=0.05 nu=0.1 hm=0.2 base=2D_r0_20b prefix=194
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.52 sy=0.24 n=0.05 nu=0.1 hm=0.15 base=2D_r0_20 prefix=195
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.94 sy=7.16 n=0.05 nu=0.1 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=196
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.03 sy=5.2 n=0.05 nu=0.1 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=197
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.81 sy=4.37 n=0.05 nu=0.1 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=198
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=52.98 n=0.05 nu=0.2 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=199
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.1 n=0.17 nu=0.2 hm=0.3 base=2D_r0_05 prefix=200
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.07 n=0.17 nu=0.2 hm=0.4 base=2D_r0_05b prefix=201
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.06 n=0.17 nu=0.2 hm=0.5 base=2D_r0_05b prefix=202
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.05 n=0.17 nu=0.2 hm=0.6 base=2D_r0_05 prefix=203
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.14 n=0.17 nu=0.2 hm=0.7 base=2D_r0_10 prefix=204
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.5 n=0.17 nu=0.2 hm=0.2 base=2D_r0_10b prefix=205
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.17 nu=0.2 hm=0.15 base=2D_r0_10b prefix=206
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.4 n=0.17 nu=0.2 hm=0.25 base=2D_r0_10 prefix=207
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.85 n=0.17 nu=0.2 hm=0.35 base=2D_r0_20 prefix=208
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.17 nu=0.2 hm=0.45 base=2D_r0_20b prefix=209
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=3 n=0.17 nu=0.2 hm=0.1 base=2D_r0_20b prefix=210
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1 n=0.17 nu=0.2 hm=0.3 base=2D_r0_20 prefix=211
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.5 n=0.17 nu=0.2 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=212
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.4 n=0.17 nu=0.2 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=213
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.33 n=0.17 nu=0.2 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=214
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.28 n=0.17 nu=0.2 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=215
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3 n=0.17 nu=0.2 hm=0.2 base=2D_r0_05b prefix=216
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=4 n=0.17 nu=0.2 hm=0.15 base=2D_r0_05b prefix=217
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.4 n=0.17 nu=0.2 hm=0.25 base=2D_r0_05b prefix=218
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.71 n=0.17 nu=0.2 hm=0.35 base=2D_r0_05b prefix=219
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.22 n=0.17 nu=0.2 hm=0.45 base=2D_r0_10b prefix=220
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.17 nu=0.2 hm=0.1 base=2D_r0_10b prefix=221
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3.33 n=0.17 nu=0.2 hm=0.3 base=2D_r0_10b prefix=222
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.5 n=0.17 nu=0.2 hm=0.4 base=2D_r0_10b prefix=223
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=4 n=0.17 nu=0.2 hm=0.5 base=2D_r0_20b prefix=224
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3.33 n=0.17 nu=0.2 hm=0.6 base=2D_r0_20b prefix=225
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.85 n=0.17 nu=0.2 hm=0.7 base=2D_r0_20b prefix=226
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.17 nu=0.2 hm=0.2 base=2D_r0_20b prefix=227
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3.33 n=0.17 nu=0.2 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=228
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2 n=0.17 nu=0.2 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=229
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.42 n=0.17 nu=0.2 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=230
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.11 n=0.17 nu=0.2 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=231
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=15 n=0.17 nu=0.2 hm=0.1 base=2D_r0_05 prefix=232
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.17 nu=0.2 hm=0.3 base=2D_r0_05 prefix=233
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3.75 n=0.17 nu=0.2 hm=0.4 base=2D_r0_05b prefix=234
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3 n=0.17 nu=0.2 hm=0.5 base=2D_r0_05b prefix=235
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.17 nu=0.2 hm=0.6 base=2D_r0_10 prefix=236
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=4.28 n=0.17 nu=0.2 hm=0.7 base=2D_r0_10 prefix=237
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=15 n=0.17 nu=0.2 hm=0.2 base=2D_r0_10b prefix=238
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=20 n=0.17 nu=0.2 hm=0.15 base=2D_r0_10b prefix=239
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4 n=0.17 nu=0.2 hm=0.25 base=2D_r0_20 prefix=240
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.85 n=0.17 nu=0.2 hm=0.35 base=2D_r0_20 prefix=241
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.22 n=0.17 nu=0.2 hm=0.45 base=2D_r0_20b prefix=242
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.17 nu=0.2 hm=0.1 base=2D_r0_20b prefix=243
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=6.66 n=0.17 nu=0.2 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=244
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=5 n=0.17 nu=0.2 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=245
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4 n=0.17 nu=0.2 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=246
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.17 nu=0.2 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=247
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4.28 n=0.17 nu=0.2 hm=0.7 base=2D_r0_05b prefix=248
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=15 n=0.17 nu=0.2 hm=0.2 base=2D_r0_05b prefix=249
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=20 n=0.17 nu=0.2 hm=0.15 base=2D_r0_05b prefix=250
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=12 n=0.17 nu=0.2 hm=0.25 base=2D_r0_05b prefix=251
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.85 n=0.17 nu=0.2 hm=0.35 base=2D_r0_10b prefix=252
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.66 n=0.17 nu=0.2 hm=0.45 base=2D_r0_10b prefix=253
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3 n=0.17 nu=0.2 hm=0.1 base=2D_r0_10b prefix=254
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=1 n=0.17 nu=0.2 hm=0.3 base=2D_r0_10b prefix=255
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3.75 n=0.17 nu=0.2 hm=0.4 base=2D_r0_20b prefix=256
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3 n=0.17 nu=0.2 hm=0.5 base=2D_r0_20b prefix=257
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.5 n=0.17 nu=0.2 hm=0.6 base=2D_r0_20b prefix=258
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.14 n=0.17 nu=0.2 hm=0.7 base=2D_r0_20b prefix=259
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=15 n=0.17 nu=0.2 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=260
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=20 n=0.17 nu=0.2 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=261
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=12 n=0.17 nu=0.2 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=262
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=8.57 n=0.17 nu=0.2 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=263
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.66 n=0.17 nu=0.2 hm=0.45 base=2D_r0_05 prefix=264
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3 n=0.17 nu=0.2 hm=0.1 base=2D_r0_05 prefix=265
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=1 n=0.17 nu=0.2 hm=0.3 base=2D_r0_05 prefix=266
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.75 n=0.17 nu=0.2 hm=0.4 base=2D_r0_05b prefix=267
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3.6 n=0.17 nu=0.2 hm=0.5 base=2D_r0_10 prefix=268
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3 n=0.17 nu=0.2 hm=0.6 base=2D_r0_10 prefix=269
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=2.57 n=0.17 nu=0.2 hm=0.7 base=2D_r0_10 prefix=270
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=9 n=0.17 nu=0.2 hm=0.2 base=2D_r0_10b prefix=271
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=20 n=0.17 nu=0.2 hm=0.15 base=2D_r0_20 prefix=272
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=12 n=0.17 nu=0.2 hm=0.25 base=2D_r0_20 prefix=273
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=8.57 n=0.17 nu=0.2 hm=0.35 base=2D_r0_20 prefix=274
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=6.66 n=0.17 nu=0.2 hm=0.45 base=2D_r0_20b prefix=275
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.518 sy=0.36 n=0.17 nu=0.2 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=276
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=158.652 sy=1.04 n=0.17 nu=0.2 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=277
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=23.138 sy=0.2 n=0.17 nu=0.2 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=278
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=177.128 sy=1.54 n=0.17 nu=0.2 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=279
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=73.432 sy=0.93 n=0.17 nu=0.2 hm=0.6 base=2D_r0_05 prefix=280
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=83.518 sy=0.99 n=0.17 nu=0.2 hm=0.7 base=2D_r0_05b prefix=281
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=161.724 sy=7.1 n=0.17 nu=0.2 hm=0.2 base=2D_r0_05b prefix=282
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.938 sy=11.94 n=0.17 nu=0.2 hm=0.15 base=2D_r0_05b prefix=283
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=125.17298 sy=5.84 n=0.17 nu=0.2 hm=0.25 base=2D_r0_10 prefix=284
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=168.884 sy=6.82 n=0.17 nu=0.2 hm=0.35 base=2D_r0_10b prefix=285
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.034 sy=4.05 n=0.17 nu=0.2 hm=0.45 base=2D_r0_10b prefix=286
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=33.366 sy=5.51 n=0.17 nu=0.2 hm=0.1 base=2D_r0_10b prefix=287
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=76.098 sy=4.24 n=0.17 nu=0.2 hm=0.3 base=2D_r0_20 prefix=288
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.806 sy=4.92 n=0.17 nu=0.2 hm=0.4 base=2D_r0_20b prefix=289
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=74.168 sy=3 n=0.17 nu=0.2 hm=0.5 base=2D_r0_20b prefix=290
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=185.734 sy=7.82 n=0.17 nu=0.2 hm=0.6 base=2D_r0_20b prefix=291
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=21.538 sy=0.97 n=0.17 nu=0.2 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=292
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=26.49 n=0.17 nu=0.2 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=293
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=2 n=0.17 nu=0.2 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=294
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.52 sy=0.14 n=0.17 nu=0.2 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=295
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.94 sy=5.11 n=0.17 nu=0.2 hm=0.35 base=2D_r0_05b prefix=296
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.03 sy=4.05 n=0.17 nu=0.2 hm=0.45 base=2D_r0_05 prefix=297
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.81 sy=19.69 n=0.17 nu=0.2 hm=0.1 base=2D_r0_05 prefix=298
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=17.66 n=0.17 nu=0.2 hm=0.3 base=2D_r0_05 prefix=299
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.07 n=0.33 nu=0.2 hm=0.4 base=2D_r0_10b prefix=300
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.06 n=0.33 nu=0.2 hm=0.5 base=2D_r0_10 prefix=301
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.05 n=0.33 nu=0.2 hm=0.6 base=2D_r0_10 prefix=302
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.04 n=0.33 nu=0.2 hm=0.7 base=2D_r0_10 prefix=303
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.5 n=0.33 nu=0.2 hm=0.2 base=2D_r0_20b prefix=304
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.33 nu=0.2 hm=0.15 base=2D_r0_20 prefix=305
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.4 n=0.33 nu=0.2 hm=0.25 base=2D_r0_20 prefix=306
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.28 n=0.33 nu=0.2 hm=0.35 base=2D_r0_20 prefix=307
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.33 nu=0.2 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=308
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=3 n=0.33 nu=0.2 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=309
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1 n=0.33 nu=0.2 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=310
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.75 n=0.33 nu=0.2 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=311
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.4 n=0.33 nu=0.2 hm=0.5 base=2D_r0_05b prefix=312
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.33 n=0.33 nu=0.2 hm=0.6 base=2D_r0_05 prefix=313
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.28 n=0.33 nu=0.2 hm=0.7 base=2D_r0_05b prefix=314
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1 n=0.33 nu=0.2 hm=0.2 base=2D_r0_05b prefix=315
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=4 n=0.33 nu=0.2 hm=0.15 base=2D_r0_10b prefix=316
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.4 n=0.33 nu=0.2 hm=0.25 base=2D_r0_10 prefix=317
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.71 n=0.33 nu=0.2 hm=0.35 base=2D_r0_10b prefix=318
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.33 n=0.33 nu=0.2 hm=0.45 base=2D_r0_10b prefix=319
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.33 nu=0.2 hm=0.1 base=2D_r0_20b prefix=320
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3.33 n=0.33 nu=0.2 hm=0.3 base=2D_r0_20 prefix=321
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.5 n=0.33 nu=0.2 hm=0.4 base=2D_r0_20b prefix=322
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2 n=0.33 nu=0.2 hm=0.5 base=2D_r0_20b prefix=323
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3.33 n=0.33 nu=0.2 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=324
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.85 n=0.33 nu=0.2 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=325
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.33 nu=0.2 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=326
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=13.33 n=0.33 nu=0.2 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=327
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2 n=0.33 nu=0.2 hm=0.25 base=2D_r0_05b prefix=328
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.42 n=0.33 nu=0.2 hm=0.35 base=2D_r0_05b prefix=329
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.11 n=0.33 nu=0.2 hm=0.45 base=2D_r0_05 prefix=330
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.33 nu=0.2 hm=0.1 base=2D_r0_05 prefix=331
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.33 nu=0.2 hm=0.3 base=2D_r0_10b prefix=332
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3.75 n=0.33 nu=0.2 hm=0.4 base=2D_r0_10b prefix=333
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3 n=0.33 nu=0.2 hm=0.5 base=2D_r0_10 prefix=334
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.5 n=0.33 nu=0.2 hm=0.6 base=2D_r0_10 prefix=335
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=4.28 n=0.33 nu=0.2 hm=0.7 base=2D_r0_20b prefix=336
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=15 n=0.33 nu=0.2 hm=0.2 base=2D_r0_20b prefix=337
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=20 n=0.33 nu=0.2 hm=0.15 base=2D_r0_20 prefix=338
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=12 n=0.33 nu=0.2 hm=0.25 base=2D_r0_20 prefix=339
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.85 n=0.33 nu=0.2 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=340
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.22 n=0.33 nu=0.2 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=341
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.33 nu=0.2 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=342
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.33 nu=0.2 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=343
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=5 n=0.33 nu=0.2 hm=0.4 base=2D_r0_05b prefix=344
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4 n=0.33 nu=0.2 hm=0.5 base=2D_r0_05b prefix=345
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.33 nu=0.2 hm=0.6 base=2D_r0_05 prefix=346
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.85 n=0.33 nu=0.2 hm=0.7 base=2D_r0_05b prefix=347
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=15 n=0.33 nu=0.2 hm=0.2 base=2D_r0_10b prefix=348
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=20 n=0.33 nu=0.2 hm=0.15 base=2D_r0_10b prefix=349
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=12 n=0.33 nu=0.2 hm=0.25 base=2D_r0_10 prefix=350
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=8.57 n=0.33 nu=0.2 hm=0.35 base=2D_r0_10b prefix=351
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.66 n=0.33 nu=0.2 hm=0.45 base=2D_r0_20b prefix=352
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3 n=0.33 nu=0.2 hm=0.1 base=2D_r0_20b prefix=353
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=1 n=0.33 nu=0.2 hm=0.3 base=2D_r0_20 prefix=354
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.75 n=0.33 nu=0.2 hm=0.4 base=2D_r0_20b prefix=355
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3 n=0.33 nu=0.2 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=356
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.5 n=0.33 nu=0.2 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=357
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.14 n=0.33 nu=0.2 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=358
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=7.5 n=0.33 nu=0.2 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=359
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=20 n=0.33 nu=0.2 hm=0.15 base=2D_r0_05b prefix=360
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=12 n=0.33 nu=0.2 hm=0.25 base=2D_r0_05b prefix=361
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=8.57 n=0.33 nu=0.2 hm=0.35 base=2D_r0_05b prefix=362
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=6.66 n=0.33 nu=0.2 hm=0.45 base=2D_r0_05 prefix=363
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3 n=0.33 nu=0.2 hm=0.1 base=2D_r0_10b prefix=364
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=1 n=0.33 nu=0.2 hm=0.3 base=2D_r0_10b prefix=365
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.75 n=0.33 nu=0.2 hm=0.4 base=2D_r0_10b prefix=366
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.6 n=0.33 nu=0.2 hm=0.5 base=2D_r0_10 prefix=367
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=3 n=0.33 nu=0.2 hm=0.6 base=2D_r0_20b prefix=368
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=2.57 n=0.33 nu=0.2 hm=0.7 base=2D_r0_20b prefix=369
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=9 n=0.33 nu=0.2 hm=0.2 base=2D_r0_20b prefix=370
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=12 n=0.33 nu=0.2 hm=0.15 base=2D_r0_20 prefix=371
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=12 n=0.33 nu=0.2 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=372
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=8.57 n=0.33 nu=0.2 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=373
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=6.66 n=0.33 nu=0.2 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=374
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=30 n=0.33 nu=0.2 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=375
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.518 sy=0.12 n=0.33 nu=0.2 hm=0.3 base=2D_r0_05 prefix=376
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=158.652 sy=0.78 n=0.33 nu=0.2 hm=0.4 base=2D_r0_05b prefix=377
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=23.138 sy=0.16 n=0.33 nu=0.2 hm=0.5 base=2D_r0_05b prefix=378
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=177.128 sy=1.28 n=0.33 nu=0.2 hm=0.6 base=2D_r0_05 prefix=379
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=73.432 sy=0.8 n=0.33 nu=0.2 hm=0.7 base=2D_r0_10 prefix=380
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=83.518 sy=3.49 n=0.33 nu=0.2 hm=0.2 base=2D_r0_10b prefix=381
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=161.724 sy=9.47 n=0.33 nu=0.2 hm=0.15 base=2D_r0_10b prefix=382
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.938 sy=7.16 n=0.33 nu=0.2 hm=0.25 base=2D_r0_10 prefix=383
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=125.17298 sy=4.17 n=0.33 nu=0.2 hm=0.35 base=2D_r0_20 prefix=384
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=168.884 sy=5.3 n=0.33 nu=0.2 hm=0.45 base=2D_r0_20b prefix=385
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.034 sy=18.22 n=0.33 nu=0.2 hm=0.1 base=2D_r0_20b prefix=386
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=33.366 sy=1.83 n=0.33 nu=0.2 hm=0.3 base=2D_r0_20 prefix=387
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=76.098 sy=3.18 n=0.33 nu=0.2 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=388
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.806 sy=3.93 n=0.33 nu=0.2 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=389
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=74.168 sy=2.5 n=0.33 nu=0.2 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=390
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=185.734 sy=6.71 n=0.33 nu=0.2 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=391
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=21.538 sy=3.41 n=0.33 nu=0.2 hm=0.2 base=2D_r0_05b prefix=392
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=35.32 n=0.33 nu=0.2 hm=0.15 base=2D_r0_05b prefix=393
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1.2 n=0.33 nu=0.2 hm=0.25 base=2D_r0_05b prefix=394
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.52 sy=0.1 n=0.33 nu=0.2 hm=0.35 base=2D_r0_05b prefix=395
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.94 sy=3.98 n=0.33 nu=0.2 hm=0.45 base=2D_r0_10b prefix=396
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.03 sy=18.22 n=0.33 nu=0.2 hm=0.1 base=2D_r0_10b prefix=397
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.81 sy=6.56 n=0.33 nu=0.2 hm=0.3 base=2D_r0_10b prefix=398
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=13.24 n=0.33 nu=0.3 hm=0.4 base=2D_r0_10b prefix=399
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.06 n=0.33 nu=0.3 hm=0.5 base=2D_r0_20b prefix=400
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.05 n=0.33 nu=0.3 hm=0.6 base=2D_r0_20b prefix=401
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.04 n=0.33 nu=0.3 hm=0.7 base=2D_r0_20b prefix=402
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.15 n=0.33 nu=0.3 hm=0.2 base=2D_r0_20b prefix=403
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.33 nu=0.3 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=404
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.4 n=0.33 nu=0.3 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=405
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.28 n=0.33 nu=0.3 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=406
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.22 n=0.33 nu=0.3 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=407
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=3 n=0.33 nu=0.3 hm=0.1 base=2D_r0_05 prefix=408
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1 n=0.33 nu=0.3 hm=0.3 base=2D_r0_05 prefix=409
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.75 n=0.33 nu=0.3 hm=0.4 base=2D_r0_05b prefix=410
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.6 n=0.33 nu=0.3 hm=0.5 base=2D_r0_05b prefix=411
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.33 n=0.33 nu=0.3 hm=0.6 base=2D_r0_10 prefix=412
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.28 n=0.33 nu=0.3 hm=0.7 base=2D_r0_10 prefix=413
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1 n=0.33 nu=0.3 hm=0.2 base=2D_r0_10b prefix=414
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.33 n=0.33 nu=0.3 hm=0.15 base=2D_r0_10b prefix=415
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.4 n=0.33 nu=0.3 hm=0.25 base=2D_r0_20 prefix=416
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.71 n=0.33 nu=0.3 hm=0.35 base=2D_r0_20 prefix=417
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.33 n=0.33 nu=0.3 hm=0.45 base=2D_r0_20b prefix=418
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=6 n=0.33 nu=0.3 hm=0.1 base=2D_r0_20b prefix=419
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=3.33 n=0.33 nu=0.3 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=420
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.5 n=0.33 nu=0.3 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=421
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2 n=0.33 nu=0.3 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=422
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.66 n=0.33 nu=0.3 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=423
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.85 n=0.33 nu=0.3 hm=0.7 base=2D_r0_05b prefix=424
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.33 nu=0.3 hm=0.2 base=2D_r0_05b prefix=425
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=13.33 n=0.33 nu=0.3 hm=0.15 base=2D_r0_05b prefix=426
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=8 n=0.33 nu=0.3 hm=0.25 base=2D_r0_05b prefix=427
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.42 n=0.33 nu=0.3 hm=0.35 base=2D_r0_10b prefix=428
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.11 n=0.33 nu=0.3 hm=0.45 base=2D_r0_10b prefix=429
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.33 nu=0.3 hm=0.1 base=2D_r0_10b prefix=430
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.66 n=0.33 nu=0.3 hm=0.3 base=2D_r0_10b prefix=431
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3.75 n=0.33 nu=0.3 hm=0.4 base=2D_r0_20b prefix=432
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3 n=0.33 nu=0.3 hm=0.5 base=2D_r0_20b prefix=433
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.5 n=0.33 nu=0.3 hm=0.6 base=2D_r0_20b prefix=434
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.14 n=0.33 nu=0.3 hm=0.7 base=2D_r0_20b prefix=435
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=15 n=0.33 nu=0.3 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=436
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=20 n=0.33 nu=0.3 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=437
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=12 n=0.33 nu=0.3 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=438
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=8.57 n=0.33 nu=0.3 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=439
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.22 n=0.33 nu=0.3 hm=0.45 base=2D_r0_05 prefix=440
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.33 nu=0.3 hm=0.1 base=2D_r0_05 prefix=441
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.33 nu=0.3 hm=0.3 base=2D_r0_05 prefix=442
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.5 n=0.33 nu=0.3 hm=0.4 base=2D_r0_05b prefix=443
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=4 n=0.33 nu=0.3 hm=0.5 base=2D_r0_10 prefix=444
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.33 nu=0.3 hm=0.6 base=2D_r0_10 prefix=445
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.85 n=0.33 nu=0.3 hm=0.7 base=2D_r0_10 prefix=446
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.33 nu=0.3 hm=0.2 base=2D_r0_10b prefix=447
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=20 n=0.33 nu=0.3 hm=0.15 base=2D_r0_20 prefix=448
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=12 n=0.33 nu=0.3 hm=0.25 base=2D_r0_20 prefix=449
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=8.57 n=0.33 nu=0.3 hm=0.35 base=2D_r0_20 prefix=450
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=6.66 n=0.33 nu=0.3 hm=0.45 base=2D_r0_20b prefix=451
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=3 n=0.33 nu=0.3 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=452
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=1 n=0.33 nu=0.3 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=453
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.75 n=0.33 nu=0.3 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=454
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.6 n=0.33 nu=0.3 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=455
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.5 n=0.33 nu=0.3 hm=0.6 base=2D_r0_05 prefix=456
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.14 n=0.33 nu=0.3 hm=0.7 base=2D_r0_05b prefix=457
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=7.5 n=0.33 nu=0.3 hm=0.2 base=2D_r0_05b prefix=458
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=10 n=0.33 nu=0.3 hm=0.15 base=2D_r0_05b prefix=459
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=12 n=0.33 nu=0.3 hm=0.25 base=2D_r0_10 prefix=460
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=8.57 n=0.33 nu=0.3 hm=0.35 base=2D_r0_10b prefix=461
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=6.66 n=0.33 nu=0.3 hm=0.45 base=2D_r0_10b prefix=462
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=30 n=0.33 nu=0.3 hm=0.1 base=2D_r0_10b prefix=463
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=1 n=0.33 nu=0.3 hm=0.3 base=2D_r0_20 prefix=464
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.75 n=0.33 nu=0.3 hm=0.4 base=2D_r0_20b prefix=465
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.6 n=0.33 nu=0.3 hm=0.5 base=2D_r0_20b prefix=466
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.5 n=0.33 nu=0.3 hm=0.6 base=2D_r0_20b prefix=467
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=2.57 n=0.33 nu=0.3 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=468
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=9 n=0.33 nu=0.3 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=469
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=12 n=0.33 nu=0.3 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=470
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=7.2 n=0.33 nu=0.3 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=471
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=8.57 n=0.33 nu=0.3 hm=0.35 base=2D_r0_05b prefix=472
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=6.66 n=0.33 nu=0.3 hm=0.45 base=2D_r0_05 prefix=473
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=30 n=0.33 nu=0.3 hm=0.1 base=2D_r0_05 prefix=474
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=10 n=0.33 nu=0.3 hm=0.3 base=2D_r0_05 prefix=475
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.518 sy=0.09 n=0.33 nu=0.3 hm=0.4 base=2D_r0_10b prefix=476
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=158.652 sy=0.62 n=0.33 nu=0.3 hm=0.5 base=2D_r0_10 prefix=477
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=23.138 sy=0.13 n=0.33 nu=0.3 hm=0.6 base=2D_r0_10 prefix=478
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=177.128 sy=1.1 n=0.33 nu=0.3 hm=0.7 base=2D_r0_10 prefix=479
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=73.432 sy=2.8 n=0.33 nu=0.3 hm=0.2 base=2D_r0_20b prefix=480
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=83.518 sy=4.65 n=0.33 nu=0.3 hm=0.15 base=2D_r0_20 prefix=481
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=161.724 sy=5.68 n=0.33 nu=0.3 hm=0.25 base=2D_r0_20 prefix=482
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.938 sy=5.11 n=0.33 nu=0.3 hm=0.35 base=2D_r0_20 prefix=483
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=125.17298 sy=3.24 n=0.33 nu=0.3 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=484
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=168.884 sy=23.88 n=0.33 nu=0.3 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=485
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.034 sy=6.07 n=0.33 nu=0.3 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=486
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=33.366 sy=1.37 n=0.33 nu=0.3 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=487
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=76.098 sy=2.54 n=0.33 nu=0.3 hm=0.5 base=2D_r0_05b prefix=488
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.806 sy=3.28 n=0.33 nu=0.3 hm=0.6 base=2D_r0_05 prefix=489
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=74.168 sy=2.14 n=0.33 nu=0.3 hm=0.7 base=2D_r0_05b prefix=490
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=185.734 sy=23.48 n=0.33 nu=0.3 hm=0.2 base=2D_r0_05b prefix=491
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=21.538 sy=4.55 n=0.33 nu=0.3 hm=0.15 base=2D_r0_10b prefix=492
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=21.19 n=0.33 nu=0.3 hm=0.25 base=2D_r0_10 prefix=493
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.85 n=0.33 nu=0.3 hm=0.35 base=2D_r0_10b prefix=494
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.52 sy=0.08 n=0.33 nu=0.3 hm=0.45 base=2D_r0_10b prefix=495
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.94 sy=17.91 n=0.33 nu=0.3 hm=0.1 base=2D_r0_20b prefix=496
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.03 sy=6.07 n=0.33 nu=0.3 hm=0.3 base=2D_r0_20 prefix=497
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.81 sy=4.92 n=0.33 nu=0.3 hm=0.4 base=2D_r0_20b prefix=498
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=10.59 n=0.33 nu=0.4 hm=0.5 base=2D_r0_20b prefix=499
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.05 n=0.5 nu=0.4 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=500
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.04 n=0.5 nu=0.4 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=501
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.15 n=0.5 nu=0.4 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=502
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.2 n=0.5 nu=0.4 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=503
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.4 n=0.5 nu=0.4 hm=0.25 base=2D_r0_05b prefix=504
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.28 n=0.5 nu=0.4 hm=0.35 base=2D_r0_05b prefix=505
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.22 n=0.5 nu=0.4 hm=0.45 base=2D_r0_05 prefix=506
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1 n=0.5 nu=0.4 hm=0.1 base=2D_r0_05 prefix=507
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1 n=0.5 nu=0.4 hm=0.3 base=2D_r0_10b prefix=508
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.75 n=0.5 nu=0.4 hm=0.4 base=2D_r0_10b prefix=509
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.6 n=0.5 nu=0.4 hm=0.5 base=2D_r0_10 prefix=510
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_10 prefix=511
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.28 n=0.5 nu=0.4 hm=0.7 base=2D_r0_20b prefix=512
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1 n=0.5 nu=0.4 hm=0.2 base=2D_r0_20b prefix=513
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.33 n=0.5 nu=0.4 hm=0.15 base=2D_r0_20 prefix=514
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.8 n=0.5 nu=0.4 hm=0.25 base=2D_r0_20 prefix=515
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.71 n=0.5 nu=0.4 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=516
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.33 n=0.5 nu=0.4 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=517
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=6 n=0.5 nu=0.4 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=518
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2 n=0.5 nu=0.4 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=519
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.5 n=0.5 nu=0.4 hm=0.4 base=2D_r0_05b prefix=520
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2 n=0.5 nu=0.4 hm=0.5 base=2D_r0_05b prefix=521
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.66 n=0.5 nu=0.4 hm=0.6 base=2D_r0_05 prefix=522
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.42 n=0.5 nu=0.4 hm=0.7 base=2D_r0_05b prefix=523
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.5 nu=0.4 hm=0.2 base=2D_r0_10b prefix=524
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=13.33 n=0.5 nu=0.4 hm=0.15 base=2D_r0_10b prefix=525
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=8 n=0.5 nu=0.4 hm=0.25 base=2D_r0_10 prefix=526
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=5.71 n=0.5 nu=0.4 hm=0.35 base=2D_r0_10b prefix=527
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.11 n=0.5 nu=0.4 hm=0.45 base=2D_r0_20b prefix=528
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.5 nu=0.4 hm=0.1 base=2D_r0_20b prefix=529
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.66 n=0.5 nu=0.4 hm=0.3 base=2D_r0_20 prefix=530
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.25 n=0.5 nu=0.4 hm=0.4 base=2D_r0_20b prefix=531
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3 n=0.5 nu=0.4 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=532
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=533
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.14 n=0.5 nu=0.4 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=534
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=7.5 n=0.5 nu=0.4 hm=0.2 base=2D_r0_00 contact_penalty=1e4 prefix=535
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=20 n=0.5 nu=0.4 hm=0.15 base=2D_r0_05b prefix=536
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=12 n=0.5 nu=0.4 hm=0.25 base=2D_r0_05b prefix=537
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=8.57 n=0.5 nu=0.4 hm=0.35 base=2D_r0_05b prefix=538
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_05 prefix=539
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.5 nu=0.4 hm=0.1 base=2D_r0_10b prefix=540
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.5 nu=0.4 hm=0.3 base=2D_r0_10b prefix=541
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.5 n=0.5 nu=0.4 hm=0.4 base=2D_r0_10b prefix=542
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2 n=0.5 nu=0.4 hm=0.5 base=2D_r0_10 prefix=543
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.5 nu=0.4 hm=0.6 base=2D_r0_20b prefix=544
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.85 n=0.5 nu=0.4 hm=0.7 base=2D_r0_20b prefix=545
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.5 nu=0.4 hm=0.2 base=2D_r0_20b prefix=546
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=13.33 n=0.5 nu=0.4 hm=0.15 base=2D_r0_20 prefix=547
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=12 n=0.5 nu=0.4 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=548
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=8.57 n=0.5 nu=0.4 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=549
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=550
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=30 n=0.5 nu=0.4 hm=0.1 base=2D_r0_00 contact_penalty=1e4 prefix=551
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=1 n=0.5 nu=0.4 hm=0.3 base=2D_r0_05 prefix=552
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.75 n=0.5 nu=0.4 hm=0.4 base=2D_r0_05b prefix=553
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.6 n=0.5 nu=0.4 hm=0.5 base=2D_r0_05b prefix=554
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_05 prefix=555
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.14 n=0.5 nu=0.4 hm=0.7 base=2D_r0_10 prefix=556
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=7.5 n=0.5 nu=0.4 hm=0.2 base=2D_r0_10b prefix=557
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=10 n=0.5 nu=0.4 hm=0.15 base=2D_r0_10b prefix=558
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=6 n=0.5 nu=0.4 hm=0.25 base=2D_r0_10 prefix=559
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=8.57 n=0.5 nu=0.4 hm=0.35 base=2D_r0_20 prefix=560
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_20b prefix=561
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=30 n=0.5 nu=0.4 hm=0.1 base=2D_r0_20b prefix=562
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=10 n=0.5 nu=0.4 hm=0.3 base=2D_r0_20 prefix=563
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.75 n=0.5 nu=0.4 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=564
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.6 n=0.5 nu=0.4 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=565
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=566
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.42 n=0.5 nu=0.4 hm=0.7 base=2D_r0_00b contact_penalty=1e4 prefix=567
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=9 n=0.5 nu=0.4 hm=0.2 base=2D_r0_05b prefix=568
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=12 n=0.5 nu=0.4 hm=0.15 base=2D_r0_05b prefix=569
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=7.2 n=0.5 nu=0.4 hm=0.25 base=2D_r0_05b prefix=570
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=5.14 n=0.5 nu=0.4 hm=0.35 base=2D_r0_05b prefix=571
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_10b prefix=572
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=30 n=0.5 nu=0.4 hm=0.1 base=2D_r0_10b prefix=573
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=10 n=0.5 nu=0.4 hm=0.3 base=2D_r0_10b prefix=574
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=7.5 n=0.5 nu=0.4 hm=0.4 base=2D_r0_10b prefix=575
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.518 sy=0.07 n=0.5 nu=0.4 hm=0.5 base=2D_r0_20b prefix=576
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=158.652 sy=0.52 n=0.5 nu=0.4 hm=0.6 base=2D_r0_20b prefix=577
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=23.138 sy=0.11 n=0.5 nu=0.4 hm=0.7 base=2D_r0_20b prefix=578
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=177.128 sy=3.85 n=0.5 nu=0.4 hm=0.2 base=2D_r0_20b prefix=579
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=73.432 sy=3.74 n=0.5 nu=0.4 hm=0.15 base=2D_r0_00 contact_penalty=1e4 prefix=580
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=83.518 sy=2.79 n=0.5 nu=0.4 hm=0.25 base=2D_r0_00 contact_penalty=1e4 prefix=581
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=161.724 sy=4.06 n=0.5 nu=0.4 hm=0.35 base=2D_r0_00b contact_penalty=1e4 prefix=582
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.938 sy=3.98 n=0.5 nu=0.4 hm=0.45 base=2D_r0_00b contact_penalty=1e4 prefix=583
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=125.17298 sy=14.62 n=0.5 nu=0.4 hm=0.1 base=2D_r0_05 prefix=584
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=168.884 sy=7.96 n=0.5 nu=0.4 hm=0.3 base=2D_r0_05 prefix=585
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.034 sy=4.55 n=0.5 nu=0.4 hm=0.4 base=2D_r0_05b prefix=586
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=33.366 sy=1.1 n=0.5 nu=0.4 hm=0.5 base=2D_r0_05b prefix=587
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=76.098 sy=2.12 n=0.5 nu=0.4 hm=0.6 base=2D_r0_10 prefix=588
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.806 sy=2.81 n=0.5 nu=0.4 hm=0.7 base=2D_r0_10 prefix=589
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=74.168 sy=7.52 n=0.5 nu=0.4 hm=0.2 base=2D_r0_10b prefix=590
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=185.734 sy=31.31 n=0.5 nu=0.4 hm=0.15 base=2D_r0_10b prefix=591
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=21.538 sy=2.73 n=0.5 nu=0.4 hm=0.25 base=2D_r0_20 prefix=592
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=15.13 n=0.5 nu=0.4 hm=0.35 base=2D_r0_20 prefix=593
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_20b prefix=594
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.52 sy=0.36 n=0.5 nu=0.4 hm=0.1 base=2D_r0_20b prefix=595
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.94 sy=5.97 n=0.5 nu=0.4 hm=0.3 base=2D_r0_00b contact_penalty=1e4 prefix=596
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.03 sy=4.55 n=0.5 nu=0.4 hm=0.4 base=2D_r0_00b contact_penalty=1e4 prefix=597
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.81 sy=3.93 n=0.5 nu=0.4 hm=0.5 base=2D_r0_00b contact_penalty=1e4 prefix=598
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=8.83 n=0.5 nu=0.4 hm=0.6 base=2D_r0_00b contact_penalty=1e4 prefix=599
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.05 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13b prefix=600
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.04 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13b prefix=601
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.15 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13 prefix=602
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.2 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13 prefix=603
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.4 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13b prefix=604
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.28 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13b prefix=605
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.22 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13 prefix=606
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13 prefix=607
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=1 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13b prefix=608
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.75 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=609
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.6 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13 prefix=610
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13 prefix=611
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.28 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13b prefix=612
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13b prefix=613
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.33 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13 prefix=614
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=0.8 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13 prefix=615
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.71 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13b prefix=616
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.33 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13b prefix=617
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=6 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13 prefix=618
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13b prefix=619
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2.5 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=620
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=2 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13b prefix=621
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.66 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13 prefix=622
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=1.42 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13b prefix=623
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=10 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13b prefix=624
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=13.33 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13b prefix=625
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=8 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13 prefix=626
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=50 sy=5.71 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13b prefix=627
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.11 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13b prefix=628
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=5 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13b prefix=629
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.66 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13 prefix=630
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=1.25 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=631
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=3 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13b prefix=632
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13b prefix=633
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=2.14 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13b prefix=634
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=7.5 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13 prefix=635
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=20 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13b prefix=636
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=12 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13b prefix=637
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=8.57 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13b prefix=638
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=90 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13 prefix=639
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13b prefix=640
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13b prefix=641
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.5 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=642
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13 prefix=643
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=3.33 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13b prefix=644
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=2.85 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13b prefix=645
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=10 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13b prefix=646
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=13.33 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13 prefix=647
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=12 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13 prefix=648
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=8.57 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13b prefix=649
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13b prefix=650
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=130 sy=30 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13 prefix=651
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=1 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13 prefix=652
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.75 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=653
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.6 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13b prefix=654
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=0.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13 prefix=655
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=2.14 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13 prefix=656
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=7.5 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13b prefix=657
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=10 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13b prefix=658
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=6 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13 prefix=659
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=8.57 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13 prefix=660
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13b prefix=661
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=30 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13b prefix=662
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=170 sy=10 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13 prefix=663
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.75 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=664
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.6 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13b prefix=665
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.5 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13b prefix=666
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=0.42 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13b prefix=667
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=9 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13b prefix=668
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=12 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13b prefix=669
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=7.2 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13b prefix=670
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=5.14 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13b prefix=671
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=6.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13b prefix=672
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=30 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13b prefix=673
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=10 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13b prefix=674
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=210 sy=7.5 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=675
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.518 sy=0.07 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13b prefix=676
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=158.652 sy=0.52 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13b prefix=677
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=23.138 sy=0.11 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13b prefix=678
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=177.128 sy=3.85 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13b prefix=679
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=73.432 sy=3.74 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13 prefix=680
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=83.518 sy=2.79 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13 prefix=681
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=161.724 sy=4.06 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13b prefix=682
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.938 sy=3.98 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13b prefix=683
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=125.17298 sy=14.62 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13 prefix=684
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=168.884 sy=7.96 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13 prefix=685
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.034 sy=4.55 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=686
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=33.366 sy=1.1 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13b prefix=687
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=76.098 sy=2.12 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13 prefix=688
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.806 sy=2.81 n=0.5 nu=0.4 hm=0.7 base=2D_r0_13 prefix=689
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=74.168 sy=7.52 n=0.5 nu=0.4 hm=0.2 base=2D_r0_13b prefix=690
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=185.734 sy=31.31 n=0.5 nu=0.4 hm=0.15 base=2D_r0_13b prefix=691
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=21.538 sy=2.73 n=0.5 nu=0.4 hm=0.25 base=2D_r0_13 prefix=692
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=15.13 n=0.5 nu=0.4 hm=0.35 base=2D_r0_13 prefix=693
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=10 sy=0.66 n=0.5 nu=0.4 hm=0.45 base=2D_r0_13b prefix=694
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=24.52 sy=0.36 n=0.5 nu=0.4 hm=0.1 base=2D_r0_13b prefix=695
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=200.94 sy=5.97 n=0.5 nu=0.4 hm=0.3 base=2D_r0_13b prefix=696
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=122.03 sy=4.55 n=0.5 nu=0.4 hm=0.4 base=2D_r0_13b prefix=697
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=100.81 sy=3.93 n=0.5 nu=0.4 hm=0.5 base=2D_r0_13b prefix=698
mpiexec -n 4 ~/projects/moose/modules/combined/combined-opt -i ind_2D_l.i --input-params ref=1 refi=0 E=145.74 sy=8.83 n=0.5 nu=0.4 hm=0.6 base=2D_r0_13b prefix=699
"

echo "All jobs completed!"
