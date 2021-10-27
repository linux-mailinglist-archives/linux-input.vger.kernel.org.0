Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5808B43C0F3
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 05:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239248AbhJ0DsR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Oct 2021 23:48:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:52529 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239188AbhJ0DsP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Oct 2021 23:48:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210150030"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; 
   d="gz'50?scan'50,208,50";a="210150030"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 20:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; 
   d="gz'50?scan'50,208,50";a="447369409"
Received: from lkp-server01.sh.intel.com (HELO 33c68f307df1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2021 20:45:45 -0700
Received: from kbuild by 33c68f307df1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mfZsm-0000Bd-OZ; Wed, 27 Oct 2021 03:45:44 +0000
Date:   Wed, 27 Oct 2021 11:45:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alistair Francis <alistair@alistair23.me>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     kbuild-all@lists.01.org, andreas@kemnade.info,
        alistair23@gmail.com, dmitry.torokhov@gmail.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, rydberg@bitmath.org
Subject: Re: [PATCH 1/4] Input: Add driver for Cypress Generation 5
 touchscreen
Message-ID: <202110271135.i0WiktuX-lkp@intel.com>
References: <20211025114214.44617-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20211025114214.44617-2-alistair@alistair23.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on arm/for-next]
[also build test WARNING on xilinx-xlnx/master soc/for-next rockchip/for-next arm64/for-next/core shawnguo/for-next clk/clk-next linus/master keystone/next v5.15-rc7 next-20211026]
[cannot apply to dtor-input/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alistair-Francis/Add-support-for-the-Cypress-cyttsp5/20211025-194449
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
config: sparc-randconfig-m031-20211027 (attached as .config)
compiler: sparc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0709ecf257374af4472f599dddb75dc13e7e46c9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alistair-Francis/Add-support-for-the-Cypress-cyttsp5/20211025-194449
        git checkout 0709ecf257374af4472f599dddb75dc13e7e46c9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=sparc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/cyttsp5.c: In function 'cyttsp5_write':
>> drivers/input/touchscreen/cyttsp5.c:243:9: warning: ISO C90 forbids variable length array 'cmd' [-Wvla]
     243 |         u8 cmd[size + 1];
         |         ^~
   drivers/input/touchscreen/cyttsp5.c: In function 'cyttsp5_get_touch_axis':
>> drivers/input/touchscreen/cyttsp5.c:305:13: warning: variable 'next' set but not used [-Wunused-but-set-variable]
     305 |         int next;
         |             ^~~~
   drivers/input/touchscreen/cyttsp5.c: In function 'cyttsp5_get_mt_touches':
>> drivers/input/touchscreen/cyttsp5.c:333:9: warning: ISO C90 forbids variable length array 'ids' [-Wvla]
     333 |         DECLARE_BITMAP(ids, si->tch_abs[CY_TCH_T].max);
         |         ^~~~~~~~~~~~~~


vim +/cmd +243 drivers/input/touchscreen/cyttsp5.c

   239	
   240	static int cyttsp5_write(struct cyttsp5 *ts, unsigned int reg, u8 *data,
   241				 size_t size)
   242	{
 > 243		u8 cmd[size + 1];
   244	
   245		/* High bytes of register address needed as first byte of cmd */
   246		cmd[0] = HI_BYTE(reg);
   247	
   248		/* Copy the rest of the data */
   249		if (data)
   250			memcpy(&cmd[1], data, size);
   251	
   252		/* The hardware wants to receive a frame with the address register
   253		 * contains in the first two bytes. As the regmap_write function
   254		 * add the register adresse in the frame, we use the LOW_BYTE as
   255		 * first frame byte for the address register and the first
   256		 * data byte is the high register + left of the cmd to send
   257		 */
   258		return regmap_bulk_write(ts->regmap, LOW_BYTE(reg), cmd, size + 1);
   259	}
   260	
   261	static void cyttsp5_final_sync(struct input_dev *input, int max_slots,
   262				       unsigned long *ids)
   263	{
   264		int t;
   265	
   266		for (t = 0; t < max_slots; t++) {
   267			if (test_bit(t, ids))
   268				continue;
   269			input_mt_slot(input, t);
   270			input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
   271		}
   272	
   273		input_sync(input);
   274	}
   275	
   276	static void cyttsp5_report_slot_liftoff(struct cyttsp5 *ts, int max_slots)
   277	{
   278		int t;
   279	
   280		if (ts->num_prv_rec == 0)
   281			return;
   282	
   283		for (t = 0; t < max_slots; t++) {
   284			input_mt_slot(ts->input, t);
   285			input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
   286		}
   287	}
   288	
   289	static void cyttsp5_mt_lift_all(struct cyttsp5 *ts)
   290	{
   291		struct cyttsp5_sysinfo *si = &ts->sysinfo;
   292		int max = si->tch_abs[CY_TCH_T].max;
   293	
   294		if (ts->num_prv_rec != 0) {
   295			cyttsp5_report_slot_liftoff(ts, max);
   296			input_sync(ts->input);
   297			ts->num_prv_rec = 0;
   298		}
   299	}
   300	
   301	static void cyttsp5_get_touch_axis(int *axis, int size, int max, u8 *xy_data,
   302					   int bofs)
   303	{
   304		int nbyte;
 > 305		int next;
   306	
   307		for (nbyte = 0, *axis = 0, next = 0; nbyte < size; nbyte++)
   308			*axis = *axis + ((xy_data[nbyte] >> bofs) << (nbyte * 8));
   309	
   310		*axis &= max - 1;
   311	}
   312	
   313	static void cyttsp5_get_touch_record(struct cyttsp5 *ts,
   314					     struct cyttsp5_touch *touch, u8 *xy_data)
   315	{
   316		struct cyttsp5_sysinfo *si = &ts->sysinfo;
   317		enum cyttsp5_tch_abs abs;
   318	
   319		for (abs = CY_TCH_X; abs < CY_TCH_NUM_ABS; abs++) {
   320			cyttsp5_get_touch_axis(&touch->abs[abs],
   321					       si->tch_abs[abs].size,
   322					       si->tch_abs[abs].max,
   323					       xy_data + si->tch_abs[abs].ofs,
   324					       si->tch_abs[abs].bofs);
   325		}
   326	}
   327	
   328	static void cyttsp5_get_mt_touches(struct cyttsp5 *ts,
   329					   struct cyttsp5_touch *tch, int num_cur_tch)
   330	{
   331		struct cyttsp5_sysinfo *si = &ts->sysinfo;
   332		int i, t = 0;
 > 333		DECLARE_BITMAP(ids, si->tch_abs[CY_TCH_T].max);
   334		u8 *tch_addr;
   335		int tmp;
   336	
   337		bitmap_zero(ids, si->tch_abs[CY_TCH_T].max);
   338		memset(tch->abs, 0, sizeof(tch->abs));
   339	
   340		for (i = 0; i < num_cur_tch; i++) {
   341			tch_addr = si->xy_data + (i * TOUCH_REPORT_SIZE);
   342			cyttsp5_get_touch_record(ts, tch, tch_addr);
   343	
   344			/* Convert MAJOR/MINOR from mm to resolution */
   345			tmp = tch->abs[CY_TCH_MAJ] * 100 * si->sensing_conf_data.res_x;
   346			tch->abs[CY_TCH_MAJ] = tmp / si->sensing_conf_data.len_x;
   347			tmp = tch->abs[CY_TCH_MIN] * 100 * si->sensing_conf_data.res_x;
   348			tch->abs[CY_TCH_MIN] = tmp / si->sensing_conf_data.len_x;
   349	
   350			t = tch->abs[CY_TCH_T];
   351			input_mt_slot(ts->input, t);
   352			input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
   353			__set_bit(t, ids);
   354	
   355			/* position and pressure fields */
   356			input_report_abs(ts->input, ABS_MT_POSITION_X,
   357					 tch->abs[CY_TCH_X]);
   358			input_report_abs(ts->input, ABS_MT_POSITION_Y,
   359					 tch->abs[CY_TCH_Y]);
   360			input_report_abs(ts->input, ABS_MT_PRESSURE,
   361					 tch->abs[CY_TCH_P]);
   362	
   363			/* Get the extended touch fields */
   364			input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR,
   365					 tch->abs[CY_TCH_MAJ]);
   366			input_report_abs(ts->input, ABS_MT_TOUCH_MINOR,
   367					 tch->abs[CY_TCH_MIN]);
   368	
   369			touchscreen_report_pos(ts->input, &ts->prop,
   370					       tch->abs[CY_TCH_X], tch->abs[CY_TCH_Y],
   371					       true);
   372		}
   373	
   374		cyttsp5_final_sync(ts->input, si->tch_abs[CY_TCH_T].max, ids);
   375	
   376		ts->num_prv_rec = num_cur_tch;
   377	}
   378	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--liOOAslEiF7prFVr
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--liOOAslEiF7prFVr--
