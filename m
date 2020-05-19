Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8F11DA65A
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 02:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgETATb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 20:19:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:51749 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgETATb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 20:19:31 -0400
IronPort-SDR: 3Y0Xz5iCgLamayhPJOlI46PooljBrGekwNxF49ySfqpq6dhBKpaXdJJgyc911S1/32FhpnhNlZ
 FsDFiv6L/OiQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 16:52:28 -0700
IronPort-SDR: kc7YTQUTA3Rdv665ows+5jHSjVmHKsYsKw/z26Uv1Q4wMsx8fEtHD9paLfALo91DcNXeE/4IiY
 b1SY6pj8+s+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,411,1583222400"; 
   d="gz'50?scan'50,208,50";a="264484455"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 May 2020 16:52:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jbC25-0000dm-7h; Wed, 20 May 2020 07:52:25 +0800
Date:   Wed, 20 May 2020 07:52:03 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 3/5] Input: EXC3000: add EXC80H60 and EXC80H84 support
Message-ID: <202005200711.7Owi0jTC%lkp@intel.com>
References: <20200519182447.73405-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20200519182447.73405-4-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on v5.7-rc6 next-20200519]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sebastian-Reichel/EXC3000-Updates/20200520-023207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: openrisc-randconfig-r024-20200519 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=openrisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/input/touchscreen/exc3000.c:48:13: error: 'SZ_4K' undeclared here (not in a function)
48 |   .max_xy = SZ_4K - 1,
|             ^~~~~
drivers/input/touchscreen/exc3000.c:52:13: error: 'SZ_16K' undeclared here (not in a function)
52 |   .max_xy = SZ_16K - 1,
|             ^~~~~~
In file included from arch/openrisc/include/asm/bitops.h:25,
from include/linux/bitops.h:29,
from drivers/input/touchscreen/exc3000.c:10:
drivers/input/touchscreen/exc3000.c: In function 'exc3000_read_frame':
drivers/input/touchscreen/exc3000.c:99:25: warning: comparison between pointer and integer
99 |  if (data->info->max_xy == SZ_16K - 1)
|                         ^~
include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
|                                                    ^~~~
>> drivers/input/touchscreen/exc3000.c:99:2: note: in expansion of macro 'if'
99 |  if (data->info->max_xy == SZ_16K - 1)
|  ^~
drivers/input/touchscreen/exc3000.c:99:25: warning: comparison between pointer and integer
99 |  if (data->info->max_xy == SZ_16K - 1)
|                         ^~
include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
|                                                             ^~~~
>> drivers/input/touchscreen/exc3000.c:99:2: note: in expansion of macro 'if'
99 |  if (data->info->max_xy == SZ_16K - 1)
|  ^~
drivers/input/touchscreen/exc3000.c:99:25: warning: comparison between pointer and integer
99 |  if (data->info->max_xy == SZ_16K - 1)
|                         ^~
include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
69 |  (cond) ?              |   ^~~~
include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
|                            ^~~~~~~~~~~~~~
>> drivers/input/touchscreen/exc3000.c:99:2: note: in expansion of macro 'if'
99 |  if (data->info->max_xy == SZ_16K - 1)
|  ^~

vim +/if +99 drivers/input/touchscreen/exc3000.c

  > 10	#include <linux/bitops.h>
    11	#include <linux/device.h>
    12	#include <linux/i2c.h>
    13	#include <linux/input.h>
    14	#include <linux/input/mt.h>
    15	#include <linux/input/touchscreen.h>
    16	#include <linux/interrupt.h>
    17	#include <linux/module.h>
    18	#include <linux/of.h>
    19	#include <linux/timer.h>
    20	#include <asm/unaligned.h>
    21	
    22	#define EXC3000_NUM_SLOTS		10
    23	#define EXC3000_SLOTS_PER_FRAME		5
    24	#define EXC3000_LEN_FRAME		66
    25	#define EXC3000_LEN_POINT		10
    26	
    27	#define EXC3000_MT1_EVENT		0x06
    28	#define EXC3000_MT2_EVENT		0x18
    29	
    30	#define EXC3000_TIMEOUT_MS		100
    31	
    32	static const struct i2c_device_id exc3000_id[];
    33	
    34	struct eeti_dev_info {
    35		const char *name;
    36		int max_xy;
    37	};
    38	
    39	enum eeti_dev_id {
    40		EETI_EXC3000,
    41		EETI_EXC80H60,
    42		EETI_EXC80H84,
    43	};
    44	
    45	static struct eeti_dev_info exc3000_info[] = {
    46		[EETI_EXC3000] = {
    47			.name = "EETI EXC3000 Touch Screen",
    48			.max_xy = SZ_4K - 1,
    49		},
    50		[EETI_EXC80H60] = {
    51			.name = "EETI EXC80H60 Touch Screen",
    52			.max_xy = SZ_16K - 1,
    53		},
    54		[EETI_EXC80H84] = {
    55			.name = "EETI EXC80H84 Touch Screen",
    56			.max_xy = SZ_16K - 1,
    57		},
    58	};
    59	
    60	struct exc3000_data {
    61		struct i2c_client *client;
    62		const struct eeti_dev_info *info;
    63		struct input_dev *input;
    64		struct touchscreen_properties prop;
    65		struct timer_list timer;
    66		u8 buf[2 * EXC3000_LEN_FRAME];
    67	};
    68	
    69	static void exc3000_report_slots(struct input_dev *input,
    70					 struct touchscreen_properties *prop,
    71					 const u8 *buf, int num)
    72	{
    73		for (; num--; buf += EXC3000_LEN_POINT) {
    74			if (buf[0] & BIT(0)) {
    75				input_mt_slot(input, buf[1]);
    76				input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
    77				touchscreen_report_pos(input, prop,
    78						       get_unaligned_le16(buf + 2),
    79						       get_unaligned_le16(buf + 4),
    80						       true);
    81			}
    82		}
    83	}
    84	
    85	static void exc3000_timer(struct timer_list *t)
    86	{
    87		struct exc3000_data *data = from_timer(data, t, timer);
    88	
    89		input_mt_sync_frame(data->input);
    90		input_sync(data->input);
    91	}
    92	
    93	static int exc3000_read_frame(struct exc3000_data *data, u8 *buf)
    94	{
    95		struct i2c_client *client = data->client;
    96		u8 expected_event = EXC3000_MT1_EVENT;
    97		int ret;
    98	
  > 99		if (data->info->max_xy == SZ_16K - 1)
   100			expected_event = EXC3000_MT2_EVENT;
   101	
   102		ret = i2c_master_send(client, "'", 2);
   103		if (ret < 0)
   104			return ret;
   105	
   106		if (ret != 2)
   107			return -EIO;
   108	
   109		ret = i2c_master_recv(client, buf, EXC3000_LEN_FRAME);
   110		if (ret < 0)
   111			return ret;
   112	
   113		if (ret != EXC3000_LEN_FRAME)
   114			return -EIO;
   115	
   116		if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
   117			return -EINVAL;
   118	
   119		if (buf[2] != expected_event)
   120			return -EINVAL;
   121	
   122		return 0;
   123	}
   124	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--huq684BweRXVnRxX
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICO9oxF4AAy5jb25maWcAlFxbc9w2sn7Pr5hyXnZrK4ku8STeU34AQZCDDElQBDiS/MKS
5bFXFUty6ZLd/PvTDd4AssEZV7lKnu4PDRBAXwHyxx9+XLHXl8f7m5e725uvX/9efdk/7J9u
XvafVp/vvu7/bxWrVaHMSsTS/Azg7O7h9X+/PH7bPzzdPd+u3v68/vlktd0/Pey/rvjjw+e7
L6/Q+u7x4Ycff4B/PwLx/hsIevr36vHp9M+fvmL7n77c3q7+kXL+z9W7n89/PgEgV0Ui04bz
RuoGOO//7knwo9mJSktVvH93cn5yMmAzVqQD68QRsWG6YTpvUmXUKMhhyCKThZixLllVNDm7
jkRTF7KQRrJMfhCxB4ylZlEmjgDL6qK5VNUWKHYqUju1X1fP+5fXb+MzY9tGFLuGVWmTyVya
9+dnOHNdlyovJfRnhDaru+fVw+MLSuhbZ4qzrJ+EN28ocsNqdx6iWmZxo1lmHHwsElZnptko
bQqWi/dv/vHw+LD/55txIPqSlcQA9LXeydJZsI6Af7nJgD5IKJWWV01+UYtauJLGZ62U1k0u
clVdN8wYxjckrtYikxExGFbDPu3nG+Z/9fz68fnv55f9/TjfqShEJbldnrJSkbMPXJbeqEua
wzey9Fc5VjmThU/TMh8JG1bEsIYtDtnOdJWs0qKjDU/o9heLqE4T7c/E/uHT6vHz5Bmp0eaw
rLIbQDV/IA47ZSt2ojB6kdlElWIxZ3qYXnN3v396pmbYSL5tVCFgCs0otFDN5gNu51wV7qMC
sYTeVCw5saJtKwmDn0hyJlemm6YSGvrNYcdb2d30zMbobMZKiLw0IKygN2MP2KmsLgyrronR
dZhxLH0jrqDNjCztk7d2sax/MTfPf65eYIirGxju88vNy/Pq5vb28fXh5e7hy2Q+oUHDuJUr
i9RRZx3jNuYCNAf4Jsxpducj0zC91YYZ7S4FEmG7ZezaNiCnxWKupuz+ObV0HlrLwa50VjN2
F+eIKRjsLjy81Cpj7hRWvF5pYvfBXDfAmy9KSxyeBH424gr2HvUk2pNgZU5IOIF+PygQ5jTL
xl3ucAohwOyKlEeZtFo0TIT/IIMR2bb/cczKdnggxV3yRrAYd/79aP7RzidgxGRi3p+duHSc
y5xdOfzTs3GmZGG24BwSMZFxet5Our79z/7TKzj01ef9zcvr0/7ZkrsnIbjDEqaVqktvu4Gh
5ym5yaJs2zUglqZlNJpvXG+bMFk1Pmf0KwnYL7CAlzI2tEepjNuWdk4toJSxXuJXcc6W+Als
pQ+ioiEleDazKD4WO8kD3rNFgJCAdnaAqEy8yekFg5ehFEHx7YBhhrlNMVIA/wUWhuptI/i2
VLCh0DgbVTkW3M6yjUusYFcmhA2wWrEApeXM+GvRLxZaKMfOZWi0djaQqtz4C3+zHKRpVVdc
OOFOFTfpB9eLAyECwplnH+Im+xBYTOBdfaCGhm2UJzf78KszVqXQOfh6DVGlAueQQ/jYJKpC
dwh/clZw4S3UBKbhP3RA1sZdQ+yxgxBVxqdrZxh2C3Q/Whs4/p5gbQAB+7LyVikVJkdPgL2B
xaPHgVPf8h09bUMRxzrbqHDw3Z4lcqPW1O0/YhAzJTXZcVIbceV0iD9BbZ0HLpU7Ii3TgmWJ
s3PsYFyCjYFcgt6A8Rp/Mqnc0UnV1DB+2raxeCdh8N3EUJoDoiNWVdKN17aIvc71nNJ40ztQ
7Qyhphi5E97Kz9cEV9f6ae+Z80jEsWtiS3568mvvfbukr9w/fX58ur95uN2vxF/7B/DfDHwB
Rw8OoZfrHI5s0fe2y9tpb2Mpb3NgTsQMhKRbb09mLCJnXGc1lSzoTEXT9jD3VSr6sIVqtKmT
BEL5kgEMJhHyLDBtXvZjRG4tJeamMpG8D1pG553IzIvhwExxYU2lF736CWMPVqUoKqmdAAA9
eoQrVsSSOT3luROc9DH95lJAvOzH5VKVCjxgzsrJmDCDSDKWgh7XJWKIHEHXjiJA+MO3bdNZ
C0wmwK47DLs7yqfH2/3z8+PT6uXvb20c6IQW/UNXp9vm9OzkZBQHyQh4keaykkaYDbiRdDMy
+0my2S4EzE1sIrT/bez99eb5eSXlSj48vzy93mK9wu2rb2stpyy0aZLk1N0pFCI7JXYLAQRz
ekBULHdkrkcPe1jGyoYP74dYTueeX4Us6vTkhBgjMM7enkyg5z50IoUW8x7E+A5+U2HqQj4u
7Dpdgg+rmlhfHZw5vWGxumzS0rMCeWzLOP2yxvuPr1++QNqwevw2WdI/6rxs6lIVTV20/icG
twc616nmfHwCRjYg0Pu08Qy5METHPWtpc3tFoZun2//cvexvkfXTp/03aA+mcf4kdjpYxTet
gm6U2s51EpbepswN6AWkBo6fwobnZ5E0jUqSxni2okmZ2YgKl6ZiRTqvj1nlBvNlBAebZzNn
R4CK6wyScPAljcgS63oco5caWzXLwKRnuEm9+hbY8nZQ6HjpItfWdQZ6KKlxtfvp483z/tPq
z9a7fHt6/Hz3tU2fx2oKwJqtqAqRkQu4JGZ4gqxOwY5ggYzz92++/Otfb+aW+sAqDlEhmgGI
SoSzm62/1jn65dPJnE4nGaM/jgmau7Qdqy5IcttiYI4pmIq7KiGddXTNIfUdiolZtoiUdNTT
sXG1IRsgo54WgT71ssml1uAixwyjkTk6DS9/rAvYbJBTX+eRyujxm0rmPW6LcVGwY90m+Rko
VO24wQj3np9raK4lbO+LWmjjczALiXRKEjMZUSmLESk4MDKb6ViNOfWscw/4AOpHZ6o2e26N
Y2Ori3S2ibDLiK7ytJ2g2UuoKbPTAFOqSpYNfvzm6eUO9/nKgKlzTBYMwUhrRiH0xaTGNUhc
VcWICDIaXkM+5CWfU4QQWl3REfcEKTn1TFMUixO91F+pLiFtElTRcgpFjyKdlIRBwkM8s9IJ
ORW5TJnHGMdkWCVHFrW5Gadk5jpWmpaJZcNY6i1Ew4JKr3LIq68giIvI1likg8dtrn5f0+Ny
tFdeXbJKLHaWxTk9SmQESxappBtBSF+5U09nC3WxOKNbBqk5NacikRQZz0PWv9MDcrSUGlEf
REw0y9XC/KLZSWisfAsCZCxE9bop1ViaczQTUFK1oVoMcUJ3KDba7JG9vY58KzJkui0/Si7e
3zvHEl5/oyHoCkj97tXFqZOEFu2xHMSFsrCuyjW8NnLB2MKeHsUWhAjHOYY508bVJd10pNtZ
E//b376+3Hz8ureHoSubtr448xfJIskNhjvOLsgS7tW6OpDmlXRPCjpyjpncvRsOVSKGaJXc
CKEB2dHm+/vHp79X+c3DzZf9PRk8QipnvLoFEiCOiwXWHPz8rzuFc6vu/YYuMwjVSmOjMptz
/DoJ53jIGMm0mgiDPwZXCDNpPxotlIHs2S87bXVOiO0PGXJ4ADRPYLrj6v2vJ+/WzrgyAa4H
M0aqVJk7uxJ+tJaFICXaJ4L5Yvr9bz3pQ6lUNlbhP0R17Pw6T1Tm/rbBnn3q8cypC5PhQcpQ
/ahvh+E4VaGwgb8tT2CGsG0LDWMPosJygT36IRqnWB8WBd/krCuudFsvvLuGBFS4RQVhIIJJ
MdTziYKgwY6XlXCPrvQ2guzLiMJGpr0+FvuX/z4+/UlmeLDptjAAR5NaCngXRvkI9D6e7QGX
xnM/ugRaoLXJtNsV/FwqzCPbKGrjXSWVo434CzQhVROSLb463VkixodVwgJdWgj4aIhSMsmv
w5hWJZeEwE6R2tAxUzuSEpXeX9KtuHZH3JGo3voVz/moGvDDzvxIuYpLexIh/AzAIYeWSrb7
cqzNlm1FG4+yKXg5RKlNpSBJqyaNExlhViGCKtR3UGL+jdqsJxKs2A7DAudRAwzSrkhpasYA
UhbuRQT7u4k3fE7EY4c5tWLVZNlkKWeUFEM0kddXU0Zj6gIyagLv9ZS3DzI/+NfXENZDuiXJ
46NW2M5IX34d0/0mqp4RxjE6Bgf3Q8M27u60JEgzA7tntsEt0W796UgsZyD6HYRMCS/RCaZE
cjSwIukox0DlNU2/hLz0UilK0Ma4m2Mka6S7Bm3gXEcZfQI2QHYiZdQCDoBiRwwSTyBQOdxp
GphZeajLQi0jrgWjFWtAyAyCTSUXRx5zer54nFKrFHm2YrhSBQByKD2gX69FkB3KIgIGtRAb
BQZXTWZywu6f7f2bjx+f3rhPnMdvtXc3odyt/V+d+cTbF4lvAXse6EVCr6PFtIed6HqamNGz
g4q1bgJL3TLDer3uFfveG3Yuy7VnHZAofS3wpLiW4N5nzewDyvJsmqVoaSaDAEqz9g6zkVrE
bek8Fua6FBMm2dfEGAPFM5Q9hW48d2PeEOsIK2ZTcmvuZwueu15vEBle/FLmOm92Z6Tjw95F
um6yS8LWDlyIYanizAiYXISAFQvWPErPENif/ZYf02VLxV5DlzWhB7wQCr3zLr52HFZpSrzT
qrVMrj2ObVJurm11HKKOvPQODwGRyMy4h8UDyXUqY4GnkjFkBwPIHWh3Z/dpj8E25Jgv+6fZ
vd5ZJ1Sg37FwTmWxncSCPjN812wODd8dnWMzRSdQc6TSCbVaCdq+wmZR3gMk9m4UNIaY/0C7
ZsijKGa3Dw7JwEqvO7suD6+C+XVKj91e3qSnwcXh1gIFPQ5o9+ChQVtVmoza4HCNAmfmapPL
0dwEOBD4ZdI3LF5/LGdFTIcqHi4xtBv1QJvzs/PDKFnxwyDYJpFUugkcsPj7oZgWfsglL495
BM0C91p9lDxClJnMmbc6o4aP5IKZ6W8iye8YOdOg1RWLhcfqfI6vdy0R9Ia0rgNf+rWIgd6q
rL+F4AnqPBV0LRjZ5FU6ZCR4UKWSxJ6p3U8atXdWwkJhcu1d/yAiaL2QN23p8HA63cnvZt4n
tQvkyWw9aUCoiv7AKG7S5KJWJqRx2O0fImTX7QzguW+QvWGajuqQiRFXkNnWA4Lsia335wBM
zRVdLLGSr4slQBPXJeEVPBFHQJLLeNG32G3XlgntPr8neQ55cHdXg05ZN39lK8nPq9vH+493
D/tPq/tHLNg/uyfnbuNm6qtoFG7tKdLr7+Xm6cv+JdyNYVWKOTq+y3G4uw7dR07HNyCGudhg
811orMLaa4RHt8gCp7kk9mBoM2JDEYYLndoDQkyBFz4DzoKCJ98zxiI5JrAb8VhEnITYy/jO
+XzHpPVO6egmMKKjsUTgtyybl7l/acLTqPubl9v/LCqu4Rt7KoJ54+FeWzykR8dC53f1F9FZ
rYPOkYCrPIco9nh4UUTXJpBcBhrMEr+DDcLOm25w3HqPeBt6Hd2grI+FYux9NFbsvmthY328
bMEDIRcB1UdLxbDhu5ZmI7Ly+K24OXqPtKWl49H2xt2x8OwslAEQWFGkgUMGCv09czepryxD
j9/9bY1IVUePo0iOqCAM6GAASEAvi+P3xsJJG4Xemu+xxQuh9hx8tHfs4IJlgXCaAvPvsMWY
zh+NXYjbCbQJnVoGwLaQfHyD4OsbBHrunRfRkzuuS9j6/MyH9lfBlyp0bi10miq7rN08oJDl
v48o/CV4PlAxW0r9dZKht6toOaE0qc2yZpB5Fo/SJ7k65k8Lso09nl3svJXNqkBFw82u5k93
oHtbF5yInrKXmrcpc2hmYMkAI8t5ZaTldFFe8EB5gIRcr4sxhnZ1LWZeOJ4A+jiXyJg93CTx
8BofiME97EJ24uEWE4H++Ys0W+qyYpcLXAjta7y2uwCBHUIdf/R35xZ0sFPSv9ZLakqr4/qw
Oq4PqeM6oI4h2YM6BiT7yramlS048FFbgpBO4ajuZbkOq9P6CH1yMKKWa1qpPRjazMMoVQYK
9h4qEIl6GHzy9tXww9j8iMcMRGQeRleLghYNx/qA5Zj3uKCp62VVXYd01UfM7NP6ewyUCy5K
E1D3JW0mfe66r+DFgj/sX46yBQAtbKGlSSsW1Rm+tUiO55BMypu2J4ohJRyy2SVcfyiZNCKa
G8ceVA4nna5JDaa0GP+EItAqJq9+eJ+ywV9NDi6D4fHThM6r69L9ro4l+rfWmMnd3QM/G55J
KvJAVsYK4bVt8lIxnxJVZ+vff50KbanwuAvqNc0ZO7J2z9tS70JY7v5o12f6u5FpDnNcKFVO
7pl2/B08VKf0k4C6w9n32ez1KM3883CKABsubX4/OTu9oFmsend+fkrzoorn/S20+xAgzMF7
LKUoYhqR6ktZ0qzgc4ggJzdbmrHVH2iG4iJThh7ABQ90A2vz7vzknGbqP9jp6clbmgnqLDPh
HCrZdZ4szEhr0p27lxxG7jFaIzVK7YzWcA+z38oZ936cuTrCMu+8Hd+UYmWZCWQQ++/q7K0L
z1hJvSpebpQ3sDUELiUrXD3sSNTXmiaIYsNnkpAITfW8D8tBy481UJq7USXNmAZVLi9Xkcxo
3+fCcO5RtUn5aBQJ8SmwBOSwm7jCsS30kA5CCIbkeWD8bgcxfdWGguIsHhJn9xoVDwghcMu+
9YzvSG2KrPuP/ZyGxNVi1HGq06QNzgPyusGRtjxnvEXR5zrDB3BsAHDxun/d3z18+aV7I2fy
bmyHb3h0EapKWP7G0B9XGPiJDpZXLAAcVXi4+L0PNb0xrvti4PLIqvDBmeXrZHnkOlmWb8RF
sOzbAqJgRbGb2tAFZ+QKk1APbhhOyaLc9NCTxzp8+GcB8Fd4Lz0MLatg3bNdlouDo9Pb6CCG
b9Q2WAyziIsDi8NVHD64sYjk4ggQZ1tK60cZ1BJtNsvrXsolmeOtuXnDjHyvcdwxmhoO8dGS
8XMXd5/vbucX+CAcnQ0ASPgyerhYahGGyyIW9Pu2Pcba0pCNQkBy6UcsSKvPHXfeEewXkZw3
rzrq7G5d36/eBavOAyBQM+hHBtZ3ERD8OtkwhWUyfzgU67/L03Ns9kx/SAkhwvInr1INxW2+
xU+Gzlk8n8SkHd2ej5Icb/Ydeg7xE8kw4DhJBmeFjEkOvgY5mxnGJ2+PMbz5h0cqk4EiPUX0
QE1Ze0kwmgvIZQU2ci5As7zMCMGzoSHRv83WDw2/iEsIltMpt9RtRMPtx3NmVBibnlMxap5T
Z9vMiu3OmwmOwTv35AhzRUyUTIhZaq+Kde94zTrwaSDACp+NpmN0fn/O6AzMVFcM718OXDLX
MvG+xxVzKqiPC41fplP4nVwnsYU4hdlPFbhdj9T+v/QFLhcXeHHGgcSBC3AOpKCusDv8vPsk
Kyme+nBsALbci/2WW6AXLO2EDsvwczo7SI2N/yHfPg/s3+hzJnoXep1vjsiUKqPJJYkeY1+J
dzugGWM9wN1k9k544HUtq5uenUEK5P/OLraUWeJkqWBg+hdFvG1dBG47bjT11r3d53ZW2+us
Djk7x7IkHiLOWAV3v86KvxolcvwGQdNWM52suiqdp6wS+wFZ9/2QK5fffR0S+7DqTDHa+3mx
P6IKv0Kqrxv/e3zRhfsDv1dnKsHy7lMmk7f88ASh/Wi2/5Lw6mX/7H9F1w5va1JRTGOGuFIl
5MOFDNVEZzInDPeNZGftWF6xWFLvV3HXlMMPLFR7XwEAUsSpfAk56aXf+I/Td+fv+powEFbx
/q+72/0qfrr7y/veA4J3s753V9wvZSBRZ5xRr/BzW+LY+RI4y3gTSYPva7mvpiAvyQQlP63C
8nlDNLBEiIyZwW9jkspiYfy336jPkyFPJhL/JrE/+ny+HLnXmc/DwtjJyQlJbKRmNCMgSyWd
kfAeov3yTvtGOX1ISKzyoDHuRybwI4ki9grmQKsStHu0X4AWhaACW+BspF/wQRJZp8fbrN4o
xoKZC4m1B9Ii+3/Onmy5bVzZX9HTrXOqTioiZVn0Qx4gLhLG3ExQEp0XlcbxnLjGjl22U5P5
+9sNgCQANqy5d6qSibqb2Jfe0J21qXOdjeBjGifUNWKSCPOdLiDGqA1yc6wff96/Pz+/f599
U4P3zd0i2KWYr1uR2PoIBd8xjw1Moffwh25g0exzq/MIOBKVFO21SDxSs0JP26DXhLdzg3I0
gxO3qa2IEz3MZyYd8aW0tuaV+dBrwDoBM5ru2go7lx2vTd2650BHY3Gzcx7MH3iT5nTEsAMv
mPEqXf7Ue0fGmfsSGeae7Jp7pasr59H7VT0G1bFuiisiTrKxczn1jCxOa/SrM6STHoImhba9
7cduLKjHY8gak0v1WNgoFrHWIo79ON/k5qnHkz3M9f3tOWbYYTKGimEyaipob+4yRTJqdCHs
Z4p4osm3QuOMM55Xe9ugl7bbtqrynhGbqDMml9vwZR3HrEkmH8jgfA93+otZNYQOGT7cqdiC
U1/Qvt/pvi1qmwPuYcA47Er6UADJvExY/kGCAVltxptCBsKSmTkmzc8eXp/+Or3ezx6fT9/u
X41oPgcZAtDaQT1IBoBJMH77iASZqWFDbUY07PErjDSih8HsK0kAk5fnLv9NfEKF/BvOLLdz
w15mpVwuQzwk68ySIQJNLNkEfYs2fO+ZVH3JNqkzsQiXt4n6FrZfAYuUrEOSMXFbxj2xTClC
VDfEy613/c1unJfpxgq+pH4feRhPYIdg3MIaVBQm091/ayYZSQqGMVQbtSQyc8kgKkvLWIUL
Uu8rzaiW042jbtKfb/qasWI8m2DjQKvgUIkd7rofl9LWgeJvvObgTm84aUGRFII3mSYxb1CJ
2607/9dFa0bHbBM5hcObqDHU2svp9c0Olga0rFnJWG3CLsIM4+agqkxDn0woTISMBP8BSvmp
YQguFYLyU2DYf9wijrtSx6ImA+ZP6TEsbFXmt+Z0T/suh2QH/5wV6mmYjNTdvp5+vD1KZfIs
P/09GaR1fg0L3BkH1YmnCQjk5BGa2fmCyqwlLWilQ9dkyZEmFSJLzNREha7CnKDKSUoBsCEc
H+wXJU1PTuWGFZ+bqvicPZ7evs/uvj+8THlJuTQy7pb+W5qkse+YQAI4KobMRNaXUJhUuVQy
KjEZy7TFFteY7eL6KNNdHAO7vw42/BB74axzqJ8HBCwkYGULfFvXTjGsAD4imcLhumT2CkHo
ruXOjMHQm1tegipKVpY7di3S0s624p85FUfv9PKCAr0GYpA9RXW6w1DOJt8g21ghn9X1Idt8
k1Jvb4UdX28E6rewNA5GpWm/zH9Fc/kfRZKnRv4zE4EzKSfSDLhsElQUlycJQFztx7mPAHdm
XFR6mPvHPz7dPf94P8kXpVCUV9LCakSuKrGaNgHBH4SZwwO/j23VslxmwVCx/mxs2siAyogN
wsjuvjx5QmzchLl8ePvzU/XjU4wd86lRsIikijeG58xavdrC+O5fgosptJUxEvssOWcHyayp
BCZSMjruoofjCXGeGZSfpXF8FAfURBWOf5aHBEOv+S4QdpBfuM0wS1nbel51Up7++gwXyunx
8f5xJhv8h9p5MACvz4+Pk6GVBRadGdtqAG9q01wwgKfalXHkgAktpRFJ7e6Htzt3C0s6/Etw
WikyEGGo2qrEBHCTbuZ1kjSz/1H/D2d1XMyeVMxEcuVLMru5N2ia0Qe/se/OF2wWsltz+xwB
wPGQy0jwYosBKJ29IgnW6VprUcO5i8vgAlQnlzUeiNrku3TNvUMmS8at5qXY3oIgsd5Rh2bS
Ghd3ZQXqAZ5qV/LWE2SnymRYU4xNZBZwTFmT39Ko62r9mwVIbktWcKsB8vmsFeUGYBaTDb9L
M+4E/C4SkzOv0GcdGNM9shVmGFaFQBHfgqFkbGU6Ar5EZs54cgBH1kXR6srylepRcPhRJvge
XSJLaHRURxe3VHA64Hi5y3P8QZT21bmT8bfKzOEVECWJDjLbByqltV66ejT3fEiQNGt/PHTZ
gTN4aBGt2EmAX0DbQZzs6RIw2wvOFiovaKOVsjs5ozdtwXp6JZX7Ip2Jny8vz6/vhjUDoEcd
aHhkmBFIBpY0CbYHKzedhGVsDcKpcKGxA1C+7Ia9dgTK+bHMWgYu8ziTGCST8Ha9icXs/nCE
W7JnPwnJMlx2x6SuaHVMsiuKW9yylEwRi6tFKC7mBncL10ZeiV2TojDZC+xjbXUirqJ5yMgU
Tlzk4dVc+tYOXyhYSFkngEcVVSOOLZAsl0aSmx6x3gar1dwc3h4j23E1pz1xtkV8uViG9HCI
4DKiUcK3EzpMXATCdZKRce/rfc1KbsezDt2XvCq0dlojz/7mLmsFh/0UGqKHBubphsW3E3DB
ustotTQr1ZirRdzRbj6aAFjjY3S1rVNBD58mS9NgPr8gV6fTD5UY9f7X6U0n6XmS+a3evp9e
gdF7R8EZ6WaPwPjNvsE6fnjBf5qruEVBiKzr/1HudLnkXCxQr0Sp+tFLn6HAUQ9JHfiPd+Da
4CoEBuT1/lEmhp5M2r6q0Y5rmfHds7p/7fJBeca4x9uK/Nza+krgiAXvuedJw2SmjqKyot81
jCeYW7ihtq2wTOTy88SMDS4hWjFtFirhGIrNSZcxNlG3TaUB+hdM0Z//mb2fXu7/M4uTT7CE
/m2ugf46EJ5MlNtGoT/K3QFoSt02fGuaaXtYvDVsNNil4QicdFaKNawkIyBLgrzabByZQ8IF
GjilxpQeqLZfzG/OPIqaq3lzpiOLSTCXfyuM3SmBWcD1F07bGG6QtWC0z4yiaerp8hlFO6cL
zsd5dZCWKX/xydZfrrPMh30rXfMsXkRHjQYhuCGVrgKJaqlV1xEfB1ls9tfD+3eg//FJZNns
x+kdZIzZA6bm++N0Z51UshC2jTlple9bg/g43ZvvmBB0UzXciFOGRUF9fXuw6ju3TXc/396f
n2YyvyrVHixjXTjpV5VWl1efnn88/u2Wa4aPxwGZSJESjCrcEWOZlP4Aqfb3092fs8+zx/v/
nu4oYS+ZMNcKNgpCKhNqkra+h8lAgfplRhsAi0QeahRfoVGBJbNr2Af0F0sz/2cyspROs6W/
MfWCZK2shE/2b9dKrKH6iBHHiSF04OyplTXE8bI1I20M9/pE6jSQGc9T2+yO0FrusOkXvZPZ
hPVV58uEIZaB22zjTtm30uxZVSb0gzjJpZpG7Sbd7FhjrZgB6PXdS292LOdfTUMPzxwH2TZl
E99/hOGNmY753j0285GyqXYlSEhrXk7L1xSsTCrH0XXEYrqQvRQU7UzANhVaE9csx2i21MJl
se0fiwBgZKzHNTWSUN6CXW6mzURLnSmJb9raKleksdNMvAyrnGpXuzPa5LQHcMe9XBxNJeDi
ob7fp63h9a2lSEvLUOaTB437xlKX4AtRZZyc8ibJA3CTD7//RD5MwCl7933GjBx2hH/McmF5
rCwXUsnhN7NKCtQ1KwrjTAAECBprGpE2Seo4QePjwzVsVZGFU4SWPl0ocCj8ZnidaXv9Ab5o
V8sFdRAOBPsoSi/nl/Np2cDEAsO35TW+yvQ+LLWori5Wq39AIu2+H5NFq6sl2SHZ3q7zP8xA
KvVM9oNu38QsmjytQATGCmrT66MoqMOypxKFiI3XpZNSTLxHGCFJbXVaT7LnbSqA2dmLeLXo
uunIOQTmbT4+e/+HG2E4YDFVZummvNmncNA1IEmxGJVfsXVhavmqJbN5mF8X7GtV0gXDsQ4r
mtHIJqbhO2AC7dR5EnIs11FE5nI1PlbXQGVdFOsLOtgFbE48Oz3OMDIxsqsMmFbY6+upnsRs
z81swyYKCuZ2gsBNiqnqhpmilSAlHUp4LDj9invOclCSkGNZ46udkkE16MXjdnxa0qaqNq5H
lkZtd+yQchLFo3DZdTQKTawkpmANSBmWkbzYF7QvsvkZfMPKqrO+yztxkPwLzXzmXXY4Uyoc
XLab2bWIogta9YSoZQDF+nz1jEIrPTMerID5t3oi4lg/lD963yQYhZSs1UUQuLRtqrIq6Oks
rXphDXab9P+2VqLFlZX0ExZx5Tsm9Sd1Wgrks8gWITuIV5RZJhzyK3RN9jq13sSo/PJF+WuK
s71ooKMgTJMtavAFRkOiBCvEzlEddJt16mrXiS/T9IYuEtNSZjlr6AkTVYzeHh19nItWrier
PW2BeR7ON+i2rGo4+sxvk0N87PINnZ3C+HbPreMMfh6bLfc4EyIWtjz0gxTIjGIP/Gtpp8RS
kONhGXiyfg8Ei3PXhVIQm4VrlTHr+GQp9ftS8o9SajKlTjSX7IQLiTGdL8e3Kk82grdrZj23
0QUcMXOVJf6OcGlO9rWop0HvOhC3vGX0KU06kv2VpI7VGkFbjqqr1Hp0IxHK58+uSp5cBeeU
GFxvb22fWgkwRD1xAMj4E1Oftw3fbNBXUSKUUYXzGfz0emuIzDhpGciuR6tUVkinEksPpXkV
hFOKIWWyXOvPRhZi1SGL5gCjFQFUT3qc7vYMi90+LOIiigIbGnPgNphdrmYkbMIEGI+xzHEn
19EiCkO3hxa+jaMg8IyB/P4icupC4OXKbpUCXtmUGe/SxAbxuM5hXTpTIRmFY3dgt96m5qjt
bYN5EMSexuZda9elmQy3sh4czDeekhRD4A7mKN/4v1L41pnG4ba3waVMNcpyeyTLDgrA2DbD
gjIE5Wi+6DzV30wr6IUhpyP61vMONd58H/RTSjxWPcA4B/POjD8FcgSsfR4Lm7AXdKwO6wN4
Azs8bPBv46jIbbG4rmkLu8gJh5ft89v7p7eHb/eznVgP9g2kur//BlIU+ochpn88x76dXjCc
2GilGe8XRy8jcYeHgnXw9+v94/3b22z9+nz69vsJpLXR9KtMiT9kQlyzEe/PUMy9LgER34zH
AlrgO1u80TxSa2TEatHaFVcNKLij86KeO3CRUKWXe1PO2cPRs86vp5BBZ6qtdS8/373WMF7W
O4PBkT/VI6wnG5Zl6JiBj25cDD7UVK//jLMFEUK+5bl2YnBaJAXD5NtI0mvR0bP4EYd8UOe/
Oa3FxxUiJWvsMfjSZdf5a+3JBJw5aXnsvgTz8OJjmtsvq8vIJvmturVePSpouieBOCNP5oz4
HAnVB9fp7bpyNLw9DK5amvs2COrlMqT5Npsoiv4J0RUxlCNJe72m23kDd8fyTCuQZnWWJgwu
z9Ak+oF2cxktP6bMr689Pj8DicsC0hRy5Xui7QyEbcwuLwLa48Akii6CM1Oh9sqZvhWRL0uV
RbM4QwPH4GqxvDpDFNMm0ZGgboIw+JimTA+tm+LepcGIAahsOFOdaKsDA37mDNWuPDv/FRxI
tDrLmLIF7Isz09EW4bGtdvEWIB9Tdu3ZRsWsRgblzJC3wHqgKwVFZZxsH+DhWMOw6JSpTBHI
UJyWsKggR7hVjyxOY09iTpOK18AknaPashKuWdoD0CC7xuCg54hqzEi7o1eQJlPPg+BmB66e
jLWteo/zqS4Fg/kagejyUacgL5jmPhPPkhUIOYYFaILTuv6xfRYFPbcWTQP3WeBRoluEbQE8
d9G13tp6gmO7WJ0rbAcnIu9i3vhKW+9CECYWZ8qRVKFngJBHrsoUZJoyWgSRr6b4NorbggUX
lGpiSrgJgrm/qLYV9UTZ6aW86K3PH1BYthyTIGFX88WFH7cMPbjbktXmqykTuWVFLbbc16gU
hAYPZsNy1vkGRmH9j+os2i5eWPERTGS2+423YuerZ1NVCaeYOauPPEnTmi4fZB1YUR2NFJfi
dnUZ0MjNrvyaevt/3WZhEJ7bFmlux62wcZSmyaSQh9HxEM3nniYqAu+Cgos8CKJ54GsB3OHL
OanAs6gKEQSeZQkHRAaCbcHrC28l8seZOnjRXe7yYys8PeFl2jkuGmYV16uAygtsHcxpKd9l
exZ7AkJOu+zml7465L8bvtlSGu4J4YGXdEUtvnZbLJad7itZlzpIzy2OpJU6sA+uC7z68CVZ
JTgZwnTSbA689sLTcBHL3e45ZgAdzufdB8efovAuE4U+t58wr7bw7GWep3baTRsr3CuRpmuD
cHFuLYm2yOwgVRa2iy7JQKxWd2txuZyvPOfS17S9DEPPTHzNqib23TFVztcNP+6zpee8bapt
oW9ZT/n8Riw76+DXrCMXFEvRFNy99STIOpUkRBRrB5KZsaZ7iLvMJDxMtMOySx8EE0joQhaW
5UzDaBZfIcnp06hlr1vZnl6/yUgF/HM1c/1TUyvslfyJf8vHOg64Zg3K0E82FOaxFqFL60SF
UkDtRgDklPJQ1SFCtEoQ3zbxhx+yWjbDaZwSgE34rp+00djOinSas0vr2qixGz3CCZ2VUg5+
P72e7lBlOGr8+gXcWhrXPXVK70reXUXHur01mHP1hsALVHl7v4TLS3vkQFQolcNz4kQYGa28
x42gH03IuApwJJWeDGj4rKolrXZ5AptQOofKHMOjiSDdW+/H4Pe1AuhHuK8Pp0fChqN6Ih/C
xaaHiUZEof30ZABCBXWTyugC/dtzyxhqUAaXy+WcHfcMQL7M4yZ9hrYJSv40iWLlX+dpW8F8
jSkk10PFfjSpykaawMWXCwrbwILgRTqQkBWlXZuWiUc/ZBIyUacwiHuvzd3qGR2C1mpdG0YR
rSfQZIb38kTFXj7/+ITFAESuGKk8J/TzuihsdE7zFppCu7lOgcYUuqUKnnFPdJWeIo7LzmOZ
6CmCSy5WHo2JJtIH528t25wbfk16jkybVmpxlpJ5UsVrdCbyY16fK0RS8RIj6p0jjdGbQcbQ
4RsObIIb2NCmxn3yNVgsycPbOU2cyS3itsmVgdudd9SoWxZ8Ay6/wgyI6oYcz0o4g+sGzgT6
rJQoTxysuvZl1dZus/HUS3fkeeqCow4qyUkrPqDX2kVBGlObjJnOCtvDxMV5AMl8f3BZ4vls
3JcjXrWO4kDYofeNNWyunYJjgBW8pvpxi+FPbbn3SBD3aMEUDrk2pfeh+FeDBhYdyGR2oFQT
X+72lU+1i3R7aNvRn8+pL0q0i8XXOrzwqLNgu+W31orqIfhA3HDmnHIO45iqOWl2oj1iPJwh
gpYy10C9U7uZGYUJeyvVrzKOsgV2o3hI2BZIzUCsCESPlN7t4ufj+8PL4/0vaCtWLuNOUC2A
E2StGDEZJjwtNwYHrgt1/ExGqKrQAedtfLGQErCDqGN2tbwILCOlhfpFb6Gehpe4uz+kaVJP
IrQQQwn+01KKvIvrPCFPrQ8H1uyxDmaGTJY9RiC/mEtNzkG+qda8nQJhXAaLH1Q28LsYDmuc
zXGJ/f32fv80+x2DZeloKv96en57f/x7dv/0+/03NJ9/1lSf4I7GMCv/tpdDjKt+Ot9JKvim
lNHkbCHNQU6fOjkEImfmGwjETmuT61E+AtLhIavGXTXXaeFMkYGspKXHrgWG0tM6wYs2dbai
9jfTY5/+gj3/Ay4rQH2G+YPxPWmvgwkzLOsa4ilYbW5ZJY7AYk/4per9u1pOunBjAu2CM8HN
88i7Jux6RbujeFWJ0tNh0yNQP1L+YDthODuv/+5Iguv4DMnaNaoY/SO6tPDwPDUdMkTU5KOC
rfkkF35Yx68SzQV3XvWN4McHfCltMrNYBB7LRFV1bal54Of0gZV6UFiLvmiKX8YP45yjq++1
vP49DMtAJQU9ukE9yTT2x4jTO3No2n/xeeLp/fl1cvrUbQ0Nf777k2x2Wx+DZRThizw3akcf
I27y/dAcdWCPU9UHPNSIo4wFbmx2gFv3kkGPh3u2g8+0pGlUAf+iq1CIoS9qwRK3iN1cEMgW
q9DQbAzwrg7nV3bdEm6/3ezBRVyHCzGnzfo9keBuvkqXoAuW825aKWogCXDN8oKJKVwng5vA
YVa3JduwZtrdArkgNv0kFherPFh6EJEPcTX3IUJq9NKbHZeazB3l4Yqr23Lx1AAZmQhfperQ
RctgyIECQq8tkvSf8ObGfjSg1smUeEh5YML0enOg0oFiPrJ0KjjT0+nlBa5x6V4yuSPkd6uL
TnkXj9Mh4Ur4dCoZw1iZ0OTAamdgjlmL/5sHlhbUbP5Hz7UVXUOMxzY/JE7teQWy5T52oMU6
ugRR3B2ktPwahCtLZSiHmRVsmYSwFKr1jtw9ioxXtGzfz1XskT4kXnEJvu6i73Kmn2r13KN/
DgcmTkLvf72cfnxz4hCrUqcuVza6rJ2B2xxgZtwxVotrOpcSHnr7JBn1RecUVsdZtJxMTVvz
OIz0ejFudKeDanFnybTjk26Hc6cK1vCvVcmc5qyT1XwZRlNoEAHU7fE6uVqugv/l7FqaG8eR
9F/RaaM7diaaAEgCPOyBIimJZVJiE5Qs90XhdamnHeGyK2xXT9X8+sWDD4BI0N17qLKdXxLP
BJAJJBL17clX5/HQ3P5OkWE/MYV7NVQt4w1JQjIX/IbRKI6crlJzqNt/NI4Cp1h68vYXC3A6
sjuNxxFGbjMpIAFv95s4npWzu63iIHSLeVszMvfrGwaJKwt21Q/qRveYzy0apkj0z38/9ppw
fS+MHFOKbtH4gAnHIcPm9xOCbo3t7wnoFaGxChPCtyVYCaAoZhH50/2fV7t0WuuWlwprq2ya
zvU+z5ws6xJEPoBZdTEBFahXXo237uuYPKCPjZ1K7MkXk1lbjRALoo9StU/ZbAi6WmxzEP/H
5JK1kC5sc3maLDJ9P0yAsgD+gjLkbYUigE4GbRZETUvPFptRBZKvvl1SMyayuluXNZa9rNlk
iEDoPEuj/Ng0lRkS0KDO42tY2BD1bcpN3nyRHNBM0WsKaZ7Jp57EAJpd8TizBEfez/WkoWFr
S1JGS/d9JG0yeSlJriBBbG0/9UWQkSJYEkYp8PXAInvUvK1v0lkAJapl4IMkmbWuDEhVbA+X
4gSNwIGFrw0HhqGKFlHfC9VEoHjrXzGd3eefl086ksFVUysi8Kmybs59B30xqcL62xwLYa2l
x20B1Vl6GdEAdLabsRjH2RaC0dltEqGaiF4nxEWUsJmeAwMgV2FM3Q8knTGXv1dqxxpNGagO
WBDJqiNxhOBvzyiMKAXX8YFJR/Y59NxxBHuIG0kqjeEvMCWQ5A0sQnBCFFmeHRaULOcgeXAE
eeiYHJREULMISCgv4DtMwxCo1ySkbidpTxnTfrQQjKg7tpWsyv1snITIlYe2E3NG5NKPGUdB
gN2cHL10FjFT/Xk5ldZOgCb2u21QgOC9DqX12X23ZAzlmNMQwY4qFgtkVEwMtXQINl04TCDy
AZYnnA1BN0IsDuLJDpnRTgwgwSEcyjLvRO1gsbR5oOna4ogxlLMAKBBcUwNQ03BCA4ic0Rgj
sArqfH+5Bt25WSq/OvKToTLcjHMeY7DlZCxPvJioWgnkeu5WXxtILn0j7LAg2kD5SYjhDRR5
amKJCI049PW2ihDj0PaDwYEDbh1njpBY3iEFwMCBvu9PKvZuLXflLkYE6OVSbnrcWkF9Rqhj
FKrYpyyEfas0LJbbFmG4B1V8ty3sWtFzjLt3Th301BeB6SqIer0hLT5wxjY4xHqCwNxDjCKo
sxSEl9pEcXiLHmLPXTCbB753NPDIVTcOYsiisVhQApVCQfHSlCs5EgpVXyAEUTDAlMESx9B8
rQCSeIAQkHEFRIGnIHGcwFqKXdhFEaizhsjFxRGBLoujEJCMOiZuOauawlRYhGoKKSEGzODP
2AeSI2yUxXQZMCUKKjjwq9qjTRkMi6OgTgiUWxJhArarAEJoKCoAKHiTMUpiUDYkFOJl2dh3
md7xKDn8itPImHVisADdKwFKgZIJQBhmGGpVCSWgCT5yNCpeBFTfDYsSo4WaeuaK1PPVs8DF
pv6C6dKcsZYhDMwH9cbVYS0s+82m4QC0582xvZQNb4DClC2JMKxXCIgF8bJuWLYNj8JgeTIs
eRUzBF7wmoQIC1MsBoaoXCMo8wLSreNYpd0BXqIIQ0D/97MzIOUCwQElgMKmkQhsKT2NsQ9m
exKGIZwwi03bcZSTcyEWCEBLEFZJKExdYDoWSERiCi4qxyxP4Ks4JgcOgAzPeVMgDI6X36oY
LSba3Na9EuR8y3cdgjfJDQ7PBV+Dg3xfyF7gGbDS5XUhFknqNnpRZygMgMlEABh5gPgWB8DM
KKNqhLReQBKwTTW6JsnSiOFdx6m9QTB9X8fxcsMKpRxhljPPpfCJjVOGP+AR9WeLhkC5T+W5
NjTFCATcZzIYCIZXfxpCde92dRYtyWNXNyjAQIKSDiyIig4u9wKZzXwAA1j2uokQgZI8dQgv
Gpq3jFBKttC3EmJo2Q6UPAmCDp4sDpxDnaUg+GK/xbI0DQqGSkyUHbj+aTAGQxQbPDGmu407
DjVS7DZug+u94Ymu1Iq0cgjyHYKulLfTuYsVddFui728tCG3MA+bzSUvqvTuUvPpJbSBebZ7
M5DtN4UGqny0Rl4RlzGyGo/zbM+aF9r1bXuQofiL5nJbgqE9If5NWrb6RU6oECanenGVNykY
9nj4wEkSwMciQjlKBhk/Tf33QUZTiaytv+Y4cC18X9RSQSjtk4gBlL4QwLcqVPwoJ+YBpXFK
AWQ9nemkXbbLD6Aoy3ABB87LtXW9hK+tUc2HIMW+gHHrrE7NdKZd8wwIR698U3//9vygntD0
vo+3yWf3KSRlOAKZUTmh5tW4gYaNyVWGinCP5xVn2mFGAyg3FRNAXjjITOf2CdpVWW5dSJWQ
qHSUBOBaouDhIH+WoDqTmOWvzyksD2xJn7srTTT7IqJqw9GFySqkIhNofhxR0wIciUkAEeft
rM5kzgAxwvbn/cacU8NxU84qtKTGkCE5ggT4BHkOE1SrZYic9b1iL8+ujMXa6cQa6TmEUndp
Ul5mVtaSKtKEPStkotrtwu4qxhphts8aWBOdplDkOPAJ2XAwM5dNfXACPsI0wVEwFy1JZbFd
2uEMBsyChdDuQg+zJKBOWvJEdV5JRfbs20w4tDml0C4m9saUohb7DUZr+J3HjXwouDvahXPP
5gaK2lB2qXM3DJVsFwWeUEQKzqIuYgv4DfN4Vyp0H3UxeC4iUV5kzgMMil6GND4vxDaWPHXk
sagVenPHhJj5RqQ0HsxM0/U5CoIPMhQaKfjCgcSUn5stm1aIAas7JNq7L/2waf35qJWvSKeq
j56MR0/Tac1uuDA2I9gpTx/igT5Ixk14O3tFZ7GnAO6x4EjFyBnksi6iksQ3OfS45cJlpOe2
jaSz2Jtc73IFFM5ytDKp7jolEDH3EcuK7G4rYQC7EjPB0mkLWLhvK4Qpmd0BUZ1fk4jMBKJ3
NXNq/Wt99nYIcBqhFuze0Q8iepZm86U3VfQ6sozCgTZvX2FIJAkFaMyhhbYDZU8lyFn2Zgzz
daD3a5mH6B0yhnYq1eykgjBIt0bzdQITsY+b7W+wI468k0sxZJr2E8jG6cvbLE9ICAlwq7zW
mmmCNC9Q+ZTU8WN3w28kzb2RJkDHrT0dqi7dWpPyxCIvRR71PVZ+rEHnjIlZGiTKHhnZzQlh
4hMqwxYexRaPUkHABKTyzcCDJJunV9ChFPKIJPA6ZjDtxQ8okKbBolV2qHV7W+ALjGDsKZjS
tBfznOQU+L4X1Q9q1g+CD7JxzANDprReDRbB9XbyMS33YK9H+/LAHg+FGRM0PI0hkO4jEkUR
nIs3JuXEUvIqIQG8sWhxxZgi6Lx8YgKuhRigUCAogoupMEj3MVkYxWdITNUCHHkRc2m2IXN7
3kD0IuaDYhpD6RlWAoiJRR8eLpCTFsTE4hAsk4Ls8zgbTAJY659x4WVRVjy2T/wMpLDKPa8p
qAfMmRLiaUfan/C5WNYg0YqeOaluGIsg7yOT5VeaYHAelNaPFS7IQjBc1sFichBXAzaw3u5Z
LGmzOf4m35EFEz8xFvikQYFsWdIUTwKnfVtDNeW4btIAbB4JcbjleFQzGlNYnni1lS9ILJeU
C4MpiD2rowAZDmGbYuKSB2soJh/N9FLTxiReLo62KzCByzMYK38hJ2mcfJwTIuAwcF0bHYwt
lBC+7eEw+bLWVgfYpSfP7cmJY1STga+15g18nk0GuUHZH7pyU5rRLtrMed5RkOAg41VpPn/V
yivL2SEv7FdeS/lyzwiB3SpY2iz6mCX+iOXT6cOM+GF/9yFPur87QEwGyy5tm4HFbKxSzrDF
5Wadf5TLuW6W8yi1dyuURZvV9cLHqitO8+fTWxl4pBTCUh86z8309rIrz9Euhwd6X6YlTEZK
8eGiXeTDAL7uLfI27eClUTZ41xZp/VsKxySSuW8PbVMdtwtZlNuj0PN9aNeJT8GgkKLhhjdJ
Z/2g74mW3j7W97zgyaxUC8UC6oZ+tVBPrqKw5/XhfMlP4DZwkZepup+iL7ZPhyNfrp8f71cP
L6/AMwb6qyyt1WPl/cc/bFS0bHXYXrqTj0GGReqEfennaFP58o4H5Hnrg+RM5oMO+66VceRb
PyKayrjQeyrzQr2NZHa1Jp7CCouM1jKaUtpAgRMmvmniN761jhw0Pc1Pc6tdA9pir8u9fLgr
3W/NoB0qsc3tXgz/KR9RC2fqlrQanrwlZD2mqHjTsyhR2nRyEkexnZCMgizPVFSZoEfIFZMK
JcMLFUhADBv5yurBOrCXXMeq8IR5qJUYAh77os7jLWrobVWLsS5qLP59yKduRwFMRlHneVoH
sEX218okhXeJUccQ1MPu+nlV19kvXD4d2IdSMQMK1vzC9euvprWuRs7Yc+akr8dUGVJ4q2GE
zbC0Y1HngI4J09NmeXRFGlGPv1yfTZpSGsRQqOIhiY0we/C8XnpndZituuv3+7dV+fz2/vrt
iwoHInH2fbWpe7lZ/cS71f/ev10//2w+P/P3PpzPFvKtWSMSo0r44eXLF7lTpz9++Sr37eZ9
Vab7w6XOO2s+mRD73qUxBO6fHx6fnu5ff0zxit6/PYuf/xCcz28v8pdH/CD++vr4j9Xvry/P
76Kebz/PZ205X7UnFWyJF5UYl87E3XWp/WqqnoDkgond0kla8fzw8lkV5fN1+K0v1Eo+LvOi
gvb8cX36Kn7ISEpjgJj02+fHF+Orr68vD9e38cMvj98tadcl6U7pMbePt3ogT2nosUpGjoSB
N+d6vJDvh0TZfLpWdBzMyTVvSBg45IwTEjC3fBmPSAhvGE0MFcGwTtKXpDoRHKRlhgkUqUgz
HfMUkRC7JRD2AKVLJZAMBDL4+2WrwZTXzdlNWSnS625zEagjJG3Ox062JnH9aZrGszgNiun0
+Pn6svCdWCsp8hxYao51x5C/MgKNYrcmghxDey0aveEBMq889oJQsfhEY9suH2tHEWgemvjZ
kbhTE6EQaGgFgNteI06DwFE4ulvMgtClJonpxWlQY4hqP9wwyMSZYPs43+g+OYzvrVE+H86q
AajTANkZR0zdUjNSuz4vpIF9re95o8iQIupvT41H8+JJMgmdplPkxCXfMAb08Y4z7WGshfv+
y/X1vp85jYjLswIfTjgO4Q3wicHzmtDE4LmbYTAsNdrhFPvuxw4MUZwsp0Aphm2dkeGjatLY
85bVlMUHKSTLWZx4HGNYhenHfZfUCMHeCSNHh9DSmiQ4TsFHaZyWc+FtQIImI0uVaT9F4R45
w7QS4gYq2L08RwwY25un+7c//CKa5nJTeWlmlofgnotlI0Mcxp5J5fGLUBT+vEqtbdQn7AWw
yUXPEpTOh5wG2Kg9KgXkF52qUN++vgrtQ562gqnKhYpGeMeHr4Uev1Ja2MhvqfjykgSyl1ut
0T2+PVyFMvd8ffn2NteL5tP9jlMSQBvbvWxEmCbArOx4kxlhhf4f+pqurjByndIOMYrnmK1V
dse92rXSFfz29v7y5fE/11V30u33NldTFb+MN9lUpvuEgQlVDqlw6T6U4WQJNFccN12KvGjC
GPWAyuTxfalAz5d1h4Ozp0ASiz01URjxYti8QzTDEPEUVL4RiDz5nTMcWH4SFhZZjw7ZWOjF
6nMlPoz4Eko7D5qFIWeBrwXk+LM8jJx+Rp7KbLIgQNaWvIOCLmdzJk/J+swxjBb+xtpkQivy
NSRjLY/Fp57G6o5pYr1sZA81jCLqq3DZJQj25TKYWrFS+PrpXJEAtRuPxNUoR6K1Qk97KHwd
DI/ZDCGmgVnEnF7erqv8tF5tBlN4sDnV9ubbu5jo7l8/r356u38Xc/Hj+/XnyWqeZiO55cO7
dcAS68ZOT/Zc9tLoKUiC7+5HggxaAz0aC1vhu72Lp6lonpQcGZ5w+wpmLOcE2UsH1AAP6vHe
/169X1/F6vcuQ817myJvzzd24YbpMsN57lS2lMPPX8I9YyHovTCh40ItSP/k3t6y0hWWQwhb
XCNqx91S2XUEHNES+60S/Uxiu+Ka6EpFtEMh6Nw8dD9mbN6/6ziwHZ5G3gQyXw1RAeUrgBWr
vrtY4LGZh+4MYCfQ4XNsrnCSeCo4Ops2j+Ls540cAVXToO6nxbKIzKBZR6eRyuE3T1onCsf3
mXDoKuEkHMGsf4QYm4uzyp2LhXDGJ4YbUFcZjDNFCw0qKqG0jVHMu9VP3rFod3YjVBGvqElw
VmpRPUzBNhNkn/QriTZPzfuJILcpVRzqQG5O7cJZKfbnDpJ3MQJBN+5hsJHIGbR5uZZNXkM7
YSaezQpfrqkkA8lJOnym2DN4Lg0btWXzZNNNAr/DKcEiQ8Fc3sQYJqamqPsox2J9bQFqiIoZ
ue0qzIjTwpoM26LjfA07EKpOyJFYxOWRziF3FhUpuFm/mHiXDzlTsPmw0c2GnfWtp/vnBz1B
UqcoacdFSfYvr+9/rNIv19fHh/vnX25eXq/3z6tuGli/ZGrhy7vTwhATsiqf2fN03qGN5A1V
uz6SiObjZZ0Jg9edrqtt3hES+FfxngHyMTPgOHUTnj/iPR/RgbN0pUcWYXwRDeItTs9yCuFz
6DFx5O4zlDz/O1Nb4rnp3g9D5h+GasLFwWikq4xt1eG//mZpukz6tfoHjtJVQuJufOeP/3p8
v38ydavVy/PTj15f/aWpKnuECAK0jooai1XCs44qMHE3aXiRDUH5h62a1e8vr1qVcvQ6kpzv
PjlitF/vQAfHEUxmq8B+3WAE0GbjQbrFWuFYR6I7EWiyfx6Qlr5veq22nG2ryB0eggx6QasE
u7XQnok7T8Vx5Gj05RlHQeQfMsoqw35xlasDmSlPu0N75CS1iSnPDh2enfDviqrYF+PGij6A
LIUUv/5+/3Bd/VTsowBj9LPxOgO02TesJUEC7xtrhQI7Ita9vDy9rd7l5v6f16eXr6vn67+9
tsOxru8umwKw4RxTTSW+fb3/+sfjw5vrgJK35tN7bS3fwy2F/lVajgXybL0RU9Z5eAMI6gHJ
pCIG1rMki7N0ILlspIdewTtuo/obXlQbCRp9IrCbmvdv2tjfSPpmDUI6OVHamss3z5tDddje
XdpiM8t2o5xNzCvcDng4FW1aVYfsf8Tq6cJVkd5cmt0d13GSZ+0l32K6CMs7v2zKtpbP0Pja
rJHeDnb+26K+yFvYvrpb2Hh43B/prF6cE2Ljc/2Qk1DOYjtZ7YBQITN4zUDfnxu1XZews90/
Fhg5Qdd9BdK6RVtb2979dyZZ82XN6id9up29NMOp9s/ij+ffH//17fVe+gZYKfylD8xqnLbF
TGRPopVtSpulYn24vezyurQbQSHVKedzEeifats20E1EydCk+6IaejB/fPv6dP9j1dw/X59m
naYYL6lMs2i5EFjzgv/EsD4Ul10pXeExTXK7lJqjL6ZD77eHAWRTlHcylsLmTqyaOMxLHKck
ABMv5XuKN/JHwhjKQJb9/lDJF7ECmvyWpRDLp7y8VJ3IrC6CaG7cjFw35X6bl7yRcTJu8iCh
eQCfLhl1L9Jclq/qbkS6u1zoz54pevzkUJV1cb5UWS5/3R/P5R6KmGB80JZcBsjdXQ6dvHqV
pFCbHngu/6EAdThi9BIRO27JxCn+T/lhX2aX0+mMgk1Awr1vT2L8qE15sy7a9k7M5MbryIsF
b9O7vDwKYa5jisxYYyCLOmuFWA7Zjar9p10Q0b3UpTx8+/Xh0q5FL+eWcjAJZFrzoxA7Huco
zsFEJpaC7FI8H30OU0w+BWfw/AdkZ2kKl6wobw6XkNyeNmgLMigP5upX0b0t4mdzm9hh4gGh
J5rf2g/dA2wh6VBVgFGBzFHciZYtz8KeozRAnhaR7iVpdg5xmN6A/osja9ceq7vLviNRlNDL
7a/nLSjOYlQ0hWi0c9MEUZRhik3FZDavmZ+v2zL/P9aeZblxHMn7fIWiDxs9EdM7EinqcdgD
RVIS2wRJE5Qs14XhstUuRdmW15Z3uubrNxPgIwEmXTMbe+hqKzPxJJBIJPKx4TlZgzFYYyeN
rd5OD49Hi0sGYSpZ0WUn4MK88avQ5xxk1WkNfLFCo+/ALiwwn/I2zjEwVpgfMLzEJqpWC2+8
d6v1zUB9eCjmZepOZ72lW/hhVOVyMTPjnoXKKBC/YbywQjpYNPFyzOZKabBGlEUElts4xSQP
wcyFcU6Ai5srsszkNl752nV6PpvaU2DhWY0fkgG3WedTM1dPjZDpzIMvw2tDgUTbOMPK9dPD
zKVBH23s3PA7NrBhbresUhqG+7nHejCqtcGd6DVQyWXMSu4vQ7PVqEz9fTwkI/tFkG929qfX
abt/drZEaamk1ep6FxdX1kmOKaHqzK31vlm/3T0fR18//vgDRK/QzjsOAnQgQozV29UDMOW5
cktBdFYbYVaJtkx3sVL4bx0nSWGYRNaIIMtvobjfQ4DYsolWSWwWkSBds3Uhgq0LEXxdcP+I
4k1aRWkYm3EDAbnKym2N4Ue1gv+xJaGZMok+LatGkdEomWu0517DGR2FFc1OhQ35wVUSb7bk
KgRQAbypFvml1QGUBnGwZZz2rb6NJfCtSdvYi88E1WTAw3UKy2ejejkJVVQdfmgYH3RzKKee
KagBpvZ654uJCE+qTER2Y0oOHZhFiVpTI0MJu8DVuFd399+fTo/fLqP/GIH41vj89+6/KNoF
iS9l7dfTTTpi+rk7269jljLyVTQUdUgvZjQdjR3CosMYvo4d2A7GZGI8h8MwAXk6pErecpMM
BHrv6OpoW5+OBmgWCzNjiYGiTv5kpL2QPKSYHRvAmLqZO/b5USkk9+JHSPKF57EzaXtmdxgu
SAvprIpW8GmjZt5Z0uQe5nae5PxoVuFsMubOXdJ2ERyCNOXqrqNisM1GIb20/2TXNOWVXZTF
kWqUOkzbX3AuG1lK8HelLlLA0FI+LAChAZmNfe4jJEGyKx1nSgfRU3YRU7Jsl/YfXLZwkvUY
AwDpR4afXRqcsgBxt+S8LYCs8G/okHfbmN9ZWCPDIbS++fV4jwpuLNvj1VjQn+I1q/uiChYU
u4PdZwWs1uvBLvg5z3AVTu6k1cYOztukNzFRAvfxgUqCLV5FzWpAoIZft3Y9Qbbb+LzzHaKF
H/hJwmddV8WVpctQN25zONus4cDH2mQp3tlNeayBWhNHSkaogVybtaETSCbsQUVfriJOsNPf
X6ziorfQNms2nyWioC51pTdbvrqNTMCNn5RZbte7j6MbpU0Y6s5toZWhVrkYE3YOlInLyCb/
3V8VvOMFYsubON2ykpIeX4qZZct+J5JgKNmWwkahOQNJlGb7rFcJXBRw5wzUAnJjHIhsJ3tj
EjChRTbUa+HfrkEc2NqllOvtZsCxVxWMgyKT2ZrLkabwWQosJ+rtFLFLylgthIGCaRmb85EV
ZXRlVwMXC4w1mmTFMI/Ko9JPbtmMowoNOxmOCrOxGmjdHSimPYI+rxalsKEq4JPzPoGUKGD9
jhVF4qdKXRJYTCEvUIVqwqQf6+kzYEpXZAExZQ4cTTZtGfk9zgDAKEFf5IhzkVQUuzRPbB5c
COvTblC758vYeLpugcM8TAq/KH/Pbs0mKBRZnDX7ZbznVKAKBVecyN6HqHzY9IZeboudLHU6
y4HadniSVrl07bI3cWz72RPsIU5FZnbhS1Rk9RjbihrYZ0fjl9sQjs/BTa+DQFfb3cr61hoe
wABBsta/rFM0qXOzNxbfzHHfvuqw0gkqNhoJhTy4GLQNggKb8jsJF75tEJu3105wQ3zn+N0J
MwCGbYfxpDfstCHBLsnjarXj9yYSwJ/pUPBhxIMou622vqy25ua3AhCoGUIYjoyISS08//bj
/XQP85rc/eAfa9MsVy0egijm350Rq2IN7IdGVPrbfWb3rZ38T/phNeKHGzNVZtfCbR7xAW2x
YJHB95M3ccmeBYJabOU3hYyuQXZhgDKEO49xr2kQQ1dyqKVaJVlAWF0Lql3Z/2tBZG90ON4B
bxmoqn791Xa1yk1be2pvz+8XfLtr3tzDXmxpEbSO/m1rCJQhrPCB1naAjGcwd4baAjHB9XAp
URpHqAApsIyDK4Y6jW7UAUXuQhGqmFFpwMGqRn6gmFWBJ2QKYmu1vcGn93Sj7mva2ygKuSWt
CsKteeIMZPHRBKk7drwlJyxrvHRnGPfP6k8gZq6zsPqvoN7ColWKjTEHdDiga1WqnJaMN50W
vGS13y16TL0DFbQOkWXXpdOK86ZIimAwcp1uC6PRclEyW6zXG2nueYdD7fJuDxi1KxOmgNOb
GgDOmKnJFx77PtRg54veN7K0Nd20UL0IhfbyjrbIGevUoNB1WCWzmTb4oQ2kKixdO1WEKQgT
qVOvxNBZjJmZKV2PNWvSS72OIm82UQY+RsuyGiiTwFtqC2aziU9C6BE8texul773p9XIVRk6
MzOBi4LH0p2sE3fC5lGnFI5KImUxCWWv9vXp9PL918lf1bFUbFajWu33gRnPOTFk9Gsnw5EA
CHq2UcwVVufbqM7W/CQH+GhD/caYp/ZMqwjOA1sFmcCcDrF8Oz0+GoeCrgT458ZSmFMEtMKH
YzWIMmDA26y0F0iNDWN5NVi/KLk3EoNkG8GRuIr80p6AGt89B/D4IN8NYPwAZPW4vB1Aszu5
HVWdtMMUftV8n14vaO37PrroSe/WT3q8/HF6uqCZjzK1Gf2K3+Zy9/Z4vNiLp/0ChQ8X/igd
ml4dGmkACdfXOBgYXhqVGGqIR+ZKk2evq3biVEyMFucHQYTJMNC8hUxmDP+m8cpPDRm1g+rU
IsLnVoBNpZugO55QRIe8fh5E65+VVLLFjg+T1GueGjYRpIp/JvCv3N/A5h4Ygh+G9Sdi2ipC
4YN0eDPQ7TjPYs6boCgDfKrsuoUASy5C0DYoM+AmLLB5dvnl7XI//oUSALKEi41ZqgZapdpO
I0kvZpKBTfcwkb2dAJjRqXkLJrwHS8RpucZ219YAFDwvsoAB6/VqNNzAq10cKWPFgQnFQDRU
gMbLIHavpzxuiHVoaDP4cI3yVyvvSyQHYqm2RFH2hQ1n2hIcFjQDSgu3Mrk08FCqx70BeBUA
i9gVt/b8NBTzgehIHcmMD+5bE2xvxcKj7r8Nohekt4ZjElLDuIkgzIwYBsLx2BJWQo4GU0gv
cOdOHxHLZOKMmW5phDNYxJlxM3gADBt7t8arBJRUDjUQY27eFMYdxMyGKlswJcR0Ui7GXMc1
proJ+YtzQ1YH+/5khKtr17niNoMOlfvZrmvyJfS6TaKRWhgJF57l2O8j1sKduOxIC9hNfGTU
jsBbTIaK8qGVa4JIwGWQWbHF3h07zCIrMEAv8wGlJxhgCNt30fAljG0wyJeUtU6KOtS4Ee6Q
HuMo9PkZs8fhkvfZHof15UwGx7kMGKakMW3SNdVs/nR3AVn6+XP+ChzHWcxYduYZ4YgJ3GPm
FDnXwqvWvoiT237XNXqAK84WvH0rIZk7A8FpKM30X6BZsElKjVpYpu9MaSilFq7vgTycYaFt
tih78ZVXk3npLziesigXLDNEDJtKixJ4S6ZKKWYON8rV9dQMGd6srtwLxsxawEU35piRvkh/
vsQbS4pe4S+36bXIe0LM+eU3uEL8bHPhA2DKZu1rWVcJf40nbL9luv+MhfYClTfzM3fHrTsv
XkqljufEbrwQU6b1IvN20IGomEDQt4xDwTZKN4ZlHMLaRB5bP02jRJrYjCSI9JMSI7oKuQEM
Ibup/EOM1Iad6VomVRQKThsHAiCazQOSOmYom50tQiuxESWHIBaNN6pBK39ODSXvPiCX6nLt
xARPJ4zm2E2ML2/ToCoPlTkq4VuuO+38VYUftxpLAK92ayaaI1a6Nnwa5I2CkgcJXdj6tgBp
PYfYMKOaBO7YufmxWqi6G9TeO42Zp9nNduy7Q+1wQK1dptM5DSISC5ykII4r8020nMyujJxj
fqF8opRlJwVro3+F7JJ/1uAiU5PkERW9QmjFMNz1pPQ3fPxpdNtSz66YKpR7D6QEhvqGIJSK
milrDaIuQRnBjn3rwe1UdcFfCdTUTNR+NCJKd739K073b+f38x+X0fbH6/Htt/3o8eP4fiEv
Zl0SoJ+QNh3YFNHtyngRLXt3ZNhmURj3ehPDON8vd4+nl0f7Qcq/vz8+Hd/Oz8dLw2MbfyUT
o6lf7p7Oj8odsPZ7vT+/QHW9sp/R0Zoa9NfTbw+nt6NOhGTV2Sz0sJy7dtwHs72f1VYH4Xu9
uweyl/vjJwNpG50PZXYE1HzKd+fnTdT+A9jH1oVY/ni5fDu+n4yZHKRRROnx8o/z23c1/h//
PL79bRQ/vx4fVMPBwIC8pZ0isG7qX6ysXjYXWEZQ8vj2+GOklggurjgw24rmC2/Kf7HBCrQO
4/h+fkL18E+X2s8o23doZg80Rm133z9esRDUdBy9vx6P99+MyGc8BXlD1Dux6hl61Uv94e18
ejBmRm4tzU3DqKlWGS3q9TmgDgV6GDR1EsMKWa3zjb/KMv7SuUtjqEvmPqdYFpk6J7sXRPhd
BZZDrYlNB16FFVJZYg6jw1jw71sKO5QmtWaAFQ6xyMSnNEPWjQ2+Z+PTp8h4vVuH1wkCPiXq
mYb1KIbSJzT4fbwq8Enp8xlRbkkhev32Vt/m7v378cK5tFqYrtpDnKA8iC4Oa/4rruMoCbHl
oSWyu+GTMjQ7JTqs/RIETH5YWRKuY/ZM397A1TtVr/u19BY8ne+/j+T5441L8BwkVxLTmQiq
OVfWbeg8VeVxOZuu6MZiqyML1I+TVTaQwSETYteYp/S1ssfn8+WI4a/ZC43K0YEKWJZbMoV1
pa/P74/MbT8HCZ9cXPCnkn9sGBFqmpaMGltRAw2Ub+KijUMAE/TycANnE7mlaASM4Ff54/1y
fB5lL6Pg2+n1r8gw709/nO6JkYTmjM9wagNYns1bXsPkGLQuhxz4YbBYH6t9L97Odw/35+eh
cixeH7OH/O/rt+Px/f4O2P/1+S2+HqrkZ6T6reo/xWGogh5OIa8/7p4w+PxQKRbffT24HLW6
q8Pp6fTyp1VRt/Pj9FDtgx1dE1yJ9mz8l743uRpgKIT9uoiumd0dHcqg02hFf17gxK0XGFk6
bV2aXKWm/91nzV1qirX0l9OFoQOoMQPmXjW2n7quQ7iumVmww6gXdZZD1DR95W2PokztEOA2
SVFiYjnenrkmkcLz2KBfNb4xIiOcEdhQQR8TKRJ+VHADXdNH8Q5WBcTekIDRQqjLGErwV3i6
VPryTMD1ayecZm1bHYfF5DvqzzV3rSbFzTqbDsCBrN52NYljVgx3e62T4Zm7pqjL9mW8/jWq
FYIPiTv1BqUahZ87A1lyV8Kf0Is8/DbSEejfZtbflQhg7ajH24SH1vSdysJ3BqKFh77L+6gK
vwhpBHkNWFqKkCIcSORJDFJ1j1z2PRonvWwoUCQxv2uLQxW9hb86yJBoQ9VPc56uDsHvV5Ox
mdpEBK4zEGRbCH8+9XpfkmBn1K0aAIsp1RYDYOl5EzuTtIbaZDR9tIqta+atPwQzx+PV37K8
WvCRLhGz8s14KP+HW353/x0vJwWJ8AQQZzkxfs9oPBf9u4rXmEYYPc6TRMUZ6dBLM0O2TpiL
DJ4ZDSIXC0R2VUTpPkqyHHMNlVFgWGJtD0bG3jj1nYOqmhhxqEdVs8akDJypmZxVgQbeHhRu
ybnE4VliPDwCYDmzIhAHuTt1+LDDafVlUneOlEj9Heb9ZLVfeMgAfzeGKEN1XIosrC3VWgzm
uA+DMQZI+WHAJGwRz6QTcPhZc7dfzyZjc+pqYeLQdPnf1Q2pYFGjyAgzhbu+iGTgJ0Yi7X6J
Wr58fQI5pCdWtlDNqL8dn5UdtNbj0yVeJjCF+bZnLb8S0cxky/jbZqtBIBcs94z96zYVeCsX
yfmYjQKCbceF0gVscmq6KnNpRoDcf1ksD+z9oTdE/XZxemjeLlA7omOLmQ59NY/Wh6iyeeN8
CujBS740Xz/9lJgVSVUh67nTdwiZN+XaPnUCZw9pnQi0Qvu0aHD17P/FiOCHqUzUMuK5nTc2
Q1BgmnE2ZSwgplMj7QxAvKXL3+EBN1vOBg6VMM/QgZqG4ZLTqTM1mMbMcdkHZmAwnukSjJDF
QNhF4D3TOfseDzseuuB5JhfUG94KXULUlp9MaquTfvh4fm7SXdFv3MPVMQOO//1xfLn/0WpB
/4mmoGEo6yiLRB+wQcXi3eX89vfwhFEZv37Y4bg+pdMv6t/u3o+/JUAGt8nkfH4d/QrtYBDJ
ph/vpB+07n+3ZBc34NMRGsv18cfb+f3+/Hocvbdsq/04K7Hhg4OuD750MOgqWVIdzNwzZINv
bosMRDRyeOU7d+xRaUcD6hpMsbmsy6OAxgvX5cZ17PhR1krqj1fzsOPd0+UbYd0N9O0yKu4u
x5E4v5wuJldfR1PjeR9vc2OdNppuFYQ5bJ/Y6gmS9kj35+P59HC6/OC+lS8cdzIQQ31bsufH
NsSYwgf2U213Ig7RIpS88kmHmvDr36YsvC13lETG8zGN3Ym/HUNu7I1Ib2rYTRe01X4+3r1/
vOn8LR8wQ2T6VyKeGLEY1G+zO+tDJhdzetFpIJYILw4zw7goTve4FGf1Uhy+UyRSzEJ56J0Q
Nbxdxw1HGh6YtvZW0QneewJE+Dt8GCNFuh/uDhPLkMJPXEz5xp8PeSiX7kBwNYVcsjt9tZ3M
6QbF31RkCYTrTBakYwhwHeO3S43rAnRi8czfM3px2eSOn8PI/PGY3Onb41gmznJs5tg2cawl
nEJNHI+VO/xEsvC8yIgLx+/SnxiZOIq8GKNTC9MT7fTDGceXhUeNYpI9cIdpIK3jdTrl48DW
KON+nGb+xAr83OKyvIRvzu39HAbjjF0jzYeMJxPqqoS/p4Z2Cq5+rssa6sGa3+1jSWe4BdkC
bRlIdzrhnIsUZm44hzRTWsIX9Ga8QkzhBpIVIG4+59+JADf1XG56dtKbLBzjlX8fpIn9WSwk
a1i1j0QyG7tkD2nI3Dgo9slswoqBX+AbwpeaUInYZBPaUuDu8eV40fdvhoFcLZZzYmGjftMr
99V4uTQvkbWiR/ibdEhV4W9cK7ME2TxYMCozATfoglfLCBG4njOl9iWaeao2eT1N0x0b3ayS
rQi8xdQdRJiiSYMshDuh1s4m3Gbi7FT/pU2Y8vp0NJORqhtKHbukqYIS1kfe/dPppff9uJmN
0wBuxJ/NLCHWusiqyMou9kV7GDFNqjYbh6PRbyOd/uXp/HI0B4SWW0Wxy0teVap8AwiqS6bL
Vm2IpK/nCxyLJ1YJ6jl8Hhg5MWx28YaiU1EYFxM4N7h1CBjgAkRfkScosxlWU3zf2H7DuKig
koh82eY2GahOF9HXBcws9/F2ZDbxKh/PxmJDZZ7cMfUH+NuUbcJkC8zGTLmTS56JG2ef5bKz
zVm1gsiTCdXr6N9mFwDmIlH3eaQ3o8KM/m0L/Qh1OR1YzQusiDcUarZfelO6OLa5M54ZLX3J
fZBZeCOc3vfoBLUXNAKhe5WyZwNZf9nzn6dnFHbR5vtBZVa6Z+9dSloZcHeNQ4zHHJdRtSdS
llhNHHO951a8vEZoWaO90ZgUlcV6bGgk5AHaZs94oCTGxvvEc5PxoT3d2wn7dJj/v3Y5ml0d
n1/x+s3uGrKmy0iQMGEiOSzHs8nUhlDhtRT5eGzoYBSEW5QlsDwzzq2COCG7qrgut6LZDXE0
gB+2oxWC0KZ2XVp0ymebmmECTDkvKxt6fcwU1ypKORNzo7hGWwZq5Futqf8h2hoXPtJ1sEzk
lCQrJleVhnSnjN1i22DuB1fVygxcgvFioOE4z4KSja4Iuzsq8SWuLLIkMd/1NG5VBEKWq1q/
y5v2K0JtfLzhgtxqAozs2jj86h28vR3Jj6/v6p26m7o6zhnazXRzQYB11gEDvQpEdZWlPr6e
OnXJbu9CmdomHYpx0rtBsCW3dIqRMRzRRtgcxOLSicVhIa7tsB6ESMQHmBvab6OO/OBXziIV
1VbG/HukQYVjHKQKYInm/QgjtDN+nm+zNKpEKGYzljUhWRZESYbK2SI0zeQRqT82xgbhubzx
ZUlRtLyC/rFiA3mphh+w/ciZU/iyWTWd4V6zs9KwyJThuAmoVnEaYjK03DidTCz7ZG1V0LgK
/PL1hK7Lf/v2j/qP/3l50H/98r+VPVlzGzmPf8WVp92qzExsy0ce8kB1s6Ue9eU+LNkvXYqj
JKqJj/Kx32R//QJksxskQSX7ZAtA8wBBECQBMFQ8Vj46nQecZAefQWNNCHL8oUJJnZ9eoKhO
2NhLdFQas/ku10evz9s7tWoS7+ZxL8m6OapBbUliEQPpFyw0bzoGWtFsYiN0Srpizqr8Fo7H
StXCytQ5BEhUyE51S8CdocI3Xo7w4cOklvJWetjhKqzCEY7Krsqo2a3Kq+XC8v0sEwt+bxHH
SUYbbWB9kgfbi2iRkJj8pCG8gx8qfBtDeosytm6mEKczYoW8ZQiFlXWKwIVKQEY1GiJBRfNu
nAo5l67/oZmzmGUOeLiZ3hkh+zLOvQ52cbAHWVx8POGCWRBrJ0BFiPIZ5Ld+nodVlfdlRZbg
Ji2tGGb8jStmiINNlua4oP6kAB01E7V1Zgt5Df8XVuJpECmEE8638HUn4tjJFG67UulblT16
NCv1aT9OLdBiBWsVtoOVqBs2IQXg0jIXpOdy054A2PKYQkC/EW1be3SgpxtMoB5lPqqRUVdb
uQ0Ac6oLp65Op1Y5IYeoU1ok7xM1cxs+C7dwFmzhbFRAA+zveUwOH/GXSwFF5fNIREsSCFXL
tMFFw2rTCARS5QLrwtGDFLMdlAzOHwSKot0k9tZEwPFuJPxb0TBs3Tg9wN9XXdlaWnfzywFE
CjZFFyLKArPFgzapO5K/gWBqWYm0dmtci5rPgIlILyzPWIdJo+SblFVGGsYdwrfuCBoIz+8R
q8ZXzfZFkOcjcd0VfSMKoOtDEWea1hE7DRQNDHHrQrFYmWBmD511fzq1TrNgd5MT09tJkyOo
aT1nb/sLVzANmJl7BuXPPYXRjLMHSH+iEsekxd+gOdNA6lNTNuhddRqRskkWkZHUdArpCHQD
p+aTgQyp6OzE+2kmewTrgK5x51bE6KVzE8BDWbBfqG8q+6kwCwyWyaKha7IaU4tvBsSopQEx
71JYckHK0kUh2q6WtOmN+zRD7AJSDTAJlSZ+C41gB0NpCYb9Co7hJ5jnSS+I6FA21aYIopZ6
lnVtmTS2etewng5Q0mFqZUt8IwDx9wY6+I8VanygDR+AotVNMMy+m+LDEX1s6ySORGRroV5p
yLKSDxQhX+E+gA9NIES5BOaUlR8oEm3vvlvvcDR6RbJMQQVS85m/yTcUy7Rpy0UtOOPf0HjS
psHlHKdon0EJtG6FxGngVDyG3KnW657Ef8D+5K/4OlbWDWPcpE35ETakoQCULk48lKmHL1uf
J5fNX4lo/ypap95R3FtL3vIGvrCk5Nolwd8m6RW+A1QJ2FbMTi84fFpiiEcj20/v9i+Pl5dn
H/84fscRdm1C0mcUrZkGk45vD6yAClmvrUN2vuP66OVl9/bl8egrxxBlrdhVK9AqsPNSSDzZ
oZNbAZEvmJU6tXw+FSpapllcS6IfV7IuKJOdbW6bV3abFOAXBoqmUcsY676ZJ3Ef1RIMamq2
459pyTRHGj7HxnLSRoek67BA0uiyxmBrR6GJ2LE+BoAZPgNNQtabVKuIM0QjcAjt5s+rl07V
8FsnNqbGkPRET4FCojf3yKXXcmKSBu2Ubp56hoqB4cNMoohkrK2AA1/32S0xs0forZVFbAI3
rZ01WCEEpvrjYsbczx0DaYQTM4jpStcuZdGmkQiaPBHoaJZHDewfmyUdLQPRxoi3ONhovX7x
DuqGEM9C8qrHxPpsJl+XUO372SopAcZ4RPbblv4H3kT1SXAcDzUqu52xbQGpOPTZ5pYonrEu
RzhGxGyFZzLzbAVcuuUtkZFW5nMJO37uXnkam1oschCJfljIodBPp8Sq2YTnU57iE368wZO7
k73yZupVsZmF1Azgzp0SBpCXQLke6uJWBzA5aGSF/o2rXobnGMaot47VNQkM2YjmD7MN3Yyl
86iW0VSd257L2QlFunWgKPxGJcHi3e6aVZ+pym6oITzEANp2jp5v49iEd192X39sX3fvPMKi
KTN/6Oww1gFYC5J3F9bBa0tuOk/wNKRfg5bkJ1B3YMWRtbtJMBDXfB3h7kGXgXN7RINjDpIM
6pZe7Y3QCJbSVmUMBbsnS/O0/XQ8GmiyXZf1ircTCqc7+JveR6vfVlJqDXENH4q03NE1pOed
zOuybJGCReqmKcUUxOMObUg6GrPZPw0R2ngyQyK7b3HaiDmsT11ccS8JAAmnP2EngyFLsBku
ye0P7sfdn8gNq0I3VXDTFXUVub/7BfWIAABIBML6VT23Hfk0uelGWijRwZcSIszHz3PWfBQQ
8khWS3ffq0HeYNhoTqYNyoh0n4k5jfKKUqemdDggajj/IIXFx87XU1f1+Ft7Q6Raq3fP1/hC
w5I3dZCqq/CxpjA+ZMErpLcaTVD+mnTC42uvFT6TxI+QJvyN9h2aILBBFPzSKDxzV3BKz8Ie
qmn8uocRaQLZKT5WfGMKmqEMfkzLA9m2TjMya8adbz9j3YoskovTC2tCW7gLzs/TIrk8+xD8
/PKME1GHhLhUOZiLEObccsV0cJwvkUNyYrOTYE6DmFkQE+zA+XmYM+d8SkeL6OPp+W8QsYkE
nXJOgvz6OOOS/9ptvZi5n6dNiXLXX/66fccnv24g0By7Vajsa4EPTfXHLn8NglculILz8KP4
Wajo0IQw+HNbTgz4IsTCEPvHPp6GWnLM50q2SEKtXZXpZV+7bVJQfiOIaEw+CNsJwW+MDUUk
YU/Ju8pMJEUru5rb9o0kdQl7cFG4TVS4mzrNspTz1DYkCyGBwJ6YCl5LuXIZiogUmi0KPgfS
SFN0KWe9W7xxHhY2uLarV3yGHqRQB4zUbzXjzoG7Io20r4EN6IuyzkWW3uo3pY1PCz1wtC6t
dczo7u7tGX0XvTSOuObSLuDvvpZXnWyGbTC/45F1k4LxDHtl+KJOiwW/cs+HIvlTQXxOTMZh
guGehiGZWtvHS3wFWb+BaLnODxZWnMtGub61dUrdAvxdhYEkXDHDvoHBWG8KBD7rN0mdM+hK
tEtiIzc5Jjio8DRBpfH/dH52dnpOTFV0d4/UTRG+5KofcuVONEz5IB744ipT84BR+cIw20Bu
nbC4VINFzdvPHrFUeQZ+o129uI60eXugherSEkSyqmF7dC2yTk5JNj3iJo1bMVdmLggflPvx
EOkJCAU97Dk5O+f6lYcymY0kbZmXN+zJlqEQFXA5L2uWzQbpmedBQs/YDpAMF9jsGWbgiyEl
acOWnpUirthnY0eSG0HzzE5cFAm6n6ZxoFzYHpbrAucAy2r2tt9o0OHqhhH7Scu6NKbXbG0e
tRPKPU3YT+8wVPrL438e3v/c3m/f/3jcfnnaP7x/2X7dAeX+y3t8beIbat/3L7sf+4e3f9+/
3G/v/nn/+nj/+PPx/fbpaft8//j8/vPT13daXa92zw+7H+rl951yuJ/Utvbn2gH9z6P9wx6j
Lvf/ux3Ct0dWpS3OqmgFiwVNh6wQ6tIb2E2ei6F8MjToqxd4UWZy+uLbYdDhbozpCtx1ybR0
A9KoHAHofY1KOWznh9GwXOZRdeNCN/SyS4OqKxeCqY7PYXWISvLsjFp18PZC34o+/3x6fTy6
e3zeHT0+H33f/XhSAfkWMToSiCp1yxjAJz5cipgF+qTNKkqrJfWJdBD+J6hGWKBPWlOXiQnG
EpLTUqfhwZaIUONXVeVTr6iboCkBD0p9UrC+xIIpd4BbD4oNqI5307M/HA+PlLOQV/wiOT65
zLvMQxRdxgP9plfqrwdWfxihUNdUEdMf15fZxo650PVF89vnH/u7P/7Z/Ty6U/L8DR9c/+mJ
cd0IrwWxL0syihgYS1jHTJGgVa/lydnZ8UeT1kS8vX7HoLG77evuy5F8UK3EDMX/2b9+PxIv
L493e4WKt69br9lRRI69zVBFuV/vEhZ7cfKhKrMbDC9muCrkIsV3IMKcbeRVes18KaFoUJ9W
zk+dW1Fl07h//EI9SEyL5tzQRgl3u2aQrS/2Udt4DJDRnCk6q7nQkAFZJnNGXOf+YG+Y+sAa
X9dDJl6Hp/hQbdtx+xzT1qYBnppnA7Yv30PsyoXfmCUH3GCz3SZea0oT4Lh7efVrqKPTE784
BfbK22yW1gugA3ieiZU84bivMZw5NtXTHn+I08RXPaxWJ5Ls6LN4xsAYuhTEVkXFcIJY5/HB
uYB4mtdtAoMtzYFP6auNZkItxbFHC0CuCACfHTOL5FKc+sCcgbVg2MxLf9FrF/XxR27ZWFdn
dsI4bRXsn77byXSN+vAXDYDpFKMOuOjmKUNdRzNWcsp1IO+vER2RyyxLhcffSOBm3rlqIbgz
9guf9xiA5FIm/GK2WopbYYU0GP6LrAEFfKAXg4pmWIAPlR9Sy3VlvUk4SsHMg7XS5xJs1JG/
vmBo+MRAPf6P908YQ2tZ3iOf1C2zVxK6xLi1Xs58YdbOEx5s6Wsl5RoxaM16+/Dl8f6oeLv/
vHs2uZtMXidX8pq0j6qa9U0ynajnKrNe54sBYpbOcygWLnjJRIgi/iZpovDq/TvFByAlxkhS
a59Ydz1nghtEz6rqERs0s0cKNJV9gR7RaL2He6ROJIbYA7qt+LH//LyFTdTz49vr/oFZ8bJ0
zioVBdeqwkcMy4wJ1zxEw+L0JDz4uSbhUaN1d7iEyQjk0HGg02bFA1sVz2yOD5Ecqj64ck69
swxFnyiwRC3XjOa87kWbj8llQ1i0q30Rm/BY44cZnwuJEGv/6wPTC2jwPGYTSX/TgsgoglWS
b2eelYs06hcb/kuCd51AYMed5xKPYdXBLd7Is8iqm2cDTdPNbbLN2YePfSShewk67skh+opq
omoVNZd9VafXiMdSghFaSHphDrwCRV2ofRaWwx16pYsCnxaQ2q9PBYQMDoXjPMfcWF/VvuZF
vef8sv/2oEPk777v7v7ZP3yb5vzwoAU5Ga+tmAYf33x6R+6DB7zctLWgbAqdXpZFLOobtz6e
WhcNWgPfNm5antg4gv9Gp02f5mmBbYABK9rEcC0LqkV9YkNPcgykn8M+GdYlekqP0fgWB+cp
GID4eBERKhPUDrZhEVU3fVKXufO+NSXJZBHAFhL9x9PMOjuNyjpm76+gx7nsiy6f41tKJMYa
xUdkfvFVlLoRhQblgGEXAXMY1ksLdHxuU/gbDSio7XrLhoqstGf40750sjEwceX8ht8wEIIZ
86mo1yFJ1RRz9kIOcOeWgRfNbBUacV4RoL79jV5EHP/dnR2+L92S9WTy2hJFXOaEK0xtjlcj
gWrfXBuOvrVoKtg25K1eEx0odc6cGotQrmTqomlBWZdMpGbbR50wp0oVmNBPUY23vQm1tSD9
5vKcYdaAVDkK7JQBAyYV5/xt+IAXNXfQMCHbJUw5MtIagY//RB50Hv3NtCAwzFPn+4XlmUgQ
c0CcsBjLYd6Cz/z5ro7whRXPASt23DdlVlrbPArFC9XLAAoqDKHgK6o53M8obh4trR/KebVV
6cypn2ULC1Qjgd9LDtavaEIbAp/nLDhpCFyFvF2LrMd9PjUvmjJKQbNeSxCB2noPUKg4bZrg
AUHua4nY1Uwof9yl2oWQwrEV+I26UkDaZMxRZpehXs/TsY3TXRPAcf8QckBsFpkebqKqqi4X
zQqfBVT3PBamr62lIL6iK0lWWqdS+PuQ4ioy2193FL+2zNOI+klF2W3fCjKt0voKTWxSeV6l
VvRHnObWb/iRxIStmL4DMzzAmktv6TF9SUmKVRyIZVXSy31YK3L7KBLv/4vF4SQgntVhX8cZ
Y01Bn573D6//6GxQ97uXb75vhbJoVj0GsVhGpQajJyN/H6H9vfGNrQxv0sdbl4sgxVWXyvbT
bGT0YNB6JYwU8U0hYABdCx1s8HmJtresayCwssgH+zseh+x/7P543d8PJt6LIr3T8GefO/qy
2Y7Gn2AY5NlF0rosJtimylLeF58QxWtRJ/xKQajmbcKSLOI5Bs2nFXt5Lgt1SZR3eLJmpxtI
QNdJFT//6fjDycyWwAo0EaaOyXmPl1qKWBUsGm4NW0rMVoWxrCD0dGqVFUgZ7IYBk6WFZfDq
rjY6sBtj5HLRUr3rYlTLMTfAjaPg1qJoh85VpVKzjdvpAe5WDtowkoMLMr6FU1kPKP226ChB
U+da+zszKePd57dv6tnC9OHl9fnt3n77Nhe4F4WtC03vRYDjDbcez08f/j2eBoPS6Qxe7Jqv
emgHVcwbwblIKDjoctg05noBmZ6b+51u2XVqJ35/gmAYpHdcPVzVj+USLYWaAhZTfEiBGg66
MMQ6i4+DMFOBi6TBost1we+91Za7TJvSllcb3hflkL0hSHEra0+FKJJaJj53dAA1++6wnijK
b6JD/WmtHjDJ4wEpi1jP+WAh17nboOtc3T25YYEjsubzhI34agGG/yLcbP02lfLe8Hihpxzm
GyMTdonpqkiXMQg+ycq1pzh4ZBQpg2clUKK9UzYN1qbJsecvMgmh29FmiXn1XNlV9Efl49PL
+yN8NuDtSSuI5fbhmxW4XoGgROi8UoKJxYocwbuuZBqJi3XZkWec0Qmlq5gnc5oyaYPI0auO
kqkafodmaNoxZQ/W0C87kPcWLD+mc+sr0NCgv+PSSu91mHnaOxSU7pc31LSMetCC79oJCmiv
3QpmfPkmDx+mbFvAkOMrKSvnseZBdsGIzyv/vUjsCVGS//XytH/AS3bo5P3b6+7fHfyze737
888//5ukrMXEIqpc9crmFOA0GmYg534eEfUZdsydGmDK5x3sQ+g59SDH0zOc9izlyddrjekb
mGO2S+hQ07qx4tQ0VDXMUc7Kj05WPicHRFCBaIseWiBDXyPP1EUJ93b7SK8aBXMB86CE9slT
f81BEs0C/v8Y2nEzqCLQQHcoJelsDRSSdkkZOMC3vivwRhEkWZ/hHNDAK71sBFTTP3rR/rJ9
3R7han2HB52eqTvk7LDlmwM2zERQqWBSMLkYdqplDbbiohV42Ijpq9PBqc9SAoFm2pVHYHhj
VLzIxkyPddSxhoOaLnVELgjpuJMDg6jDRSjp3TNDRPxCVJAEFy9l747a+eTYKQSHOPC1vKKh
aSb/rtUll9mgSrXJWquV84Bc6GRFYD3hbp9rP57WFdFNW5IdeVFWusVkwdC/McN3b+TVku3I
VidqK+s+NwlbvaJV9Jb+gj94WNI36xTNe7dmUtQQS9is6fnBoIJxO68+VTZ+Y7fPqs+cEXBd
ZPVu4vQYF0aV+cErWvNiaBGIzmKROVvrsa2KGew7mPUVrLeJ17yxVAeu17oROta1XMPYDnCm
mmFAmwKsriU9mnAQo3lmc133dA6KCYYMZlqCOTItvWDhpPL05UM1BgJRFJgtH58OVV9K1kIy
xDDZDJk/gj5maIzLO0zNgJeC6gU0Rqq1xOq0Yw5OiRl3o0PllaJJWIkuWmRo8qqLOZYxWuxQ
s4AGqjwFNCkYUmGI2Je/WGJKqWFxM6Ik8ipzHOsViLKDddWnVPr8yAp7pmh1usnf4GkyZi3z
SIJvmw8Ew6PZWQoNPkSnfwVC2geaZRqH3nkfKKo0TvhorYHgOsHHKFDS8hjv7wLPqxvixlvH
H592D8/7lztrnaOHf+3u5RXNETSdo8f/2T1vv+3o1mPVFXy42LBu44maeuRiyLBHZaBMlAN6
mJ4PVJOtTkj7ux8cyPFnb+pg7xaV10baiHFZd4XWyyDVOCls76BsFbdWFJG6N1dXxY2Tv8cm
CWLnxnpThuKBGTrHw/6gCUHvK1wTxLouCNegs+aE8eY8PHC8bKhIyEGQSLFkKTcYEn+AZ/o0
W0eAcSrDUDUYGXHvfL0CRFtuQp8NV/H3FnA4UXeLAjCIX8ZPT0XRdekB7CasrxTeHD2EKWq8
qG2D4WmanyGPNIVNYy6VohbfVe7w4TrXWy4bqrzAMHOgy7XK4yM6UCxLdWJ2bSUDTQtMV04W
vVCjkrTOYRNDl1M12ib3m8N/tRSFRUSFFCpPEruhq7yMveHGUBswe7h9pCkOd4pp6xQG3w1n
U9PxqsyDFzEHta4XX6TvZf4PJkPSGkvaAQA=

--huq684BweRXVnRxX--
