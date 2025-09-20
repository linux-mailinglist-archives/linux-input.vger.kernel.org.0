Return-Path: <linux-input+bounces-14942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A16EB8CEEB
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 20:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B40A97E4F8B
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 18:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EDF3128D5;
	Sat, 20 Sep 2025 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYXuCmjz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F60D1AF0AF;
	Sat, 20 Sep 2025 18:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758393461; cv=none; b=AKz3feoPxFaZRXMgpWlh41rsMCLOtgFxdzhqJZ4Jh/X7RmaKGGboEbi8Umxs9hacSQIZqvxwiSoy8VNMcJPQ+GUVsifJIsn9F8AdNShoDtWOrx/HFv812fF1C5nSC9XP06lYjaO96eFCIT1QcPYK05JcVPx0wK5mlsPUuGZnviE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758393461; c=relaxed/simple;
	bh=iCSylAv93zCUppqLF9OkTeWwtoRe8xc76Vs6biiXuuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkU5n9nQOIO1dAZRym6AR9KfkkiwByfMwIxeD+PIWCenS4kxqtCFb7QCy+FcUZuHHaFEVPeWmVZrJNbBh6SHMAbPUXfWFljrE6X5acd4q47/fzBRx8SjyNwFrE3dIGUqKWjdYZpvCZXog6gL1lRAY+T9skvDKkcTwZWPLjIfwN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYXuCmjz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758393460; x=1789929460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iCSylAv93zCUppqLF9OkTeWwtoRe8xc76Vs6biiXuuA=;
  b=IYXuCmjzQYTZtUhDmWGUu5nvfJUQy71yeMOVLdXIbPBO3bK/aKd4zPuT
   XweefddPAmh1EvfnYdQofTd8JiwLoHW/1FXWYpKSUGhVjKnyK6m0tf2bO
   ETL9EkfV+ZwiXIs6i6JuVlNF6Vk32dDfOL6saEqBmXkIx7uwVOeUhiKx0
   tD+ekC8d50r9+YLW0yYNWoo52S4DO2TDJo/PX70UN5Tt9253bkGxyeYWv
   2czQXc6J9b+6FOxxX93wJsx9F9fyDig4SXcwVzO0AFfStEj1cJcEgBSEc
   ysdubVEtBBs6T4URTuaMIS+ITtjnHT6DMkwi8zkY2LzzFOemLlTGWtjeo
   A==;
X-CSE-ConnectionGUID: qVQwxTpZSsO6q+peAFAhTw==
X-CSE-MsgGUID: +e4CqfA6RbKawyaXf8mEXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="71338532"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="71338532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 11:37:39 -0700
X-CSE-ConnectionGUID: 7uzSBtwqRPi0r9v6cgcLbQ==
X-CSE-MsgGUID: 6rHf7XkzRWCj7l/x+VrB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="180140357"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2025 11:37:36 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v02Sj-0005fX-0l;
	Sat, 20 Sep 2025 18:37:33 +0000
Date: Sun, 21 Sep 2025 02:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eric =?iso-8859-1?Q?Gon=E7alves?= <ghatto404@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Input: add support for the STM FTS2BA61Y
 touchscreen
Message-ID: <202509210247.oVPW8pop-lkp@intel.com>
References: <20250920014450.37787-3-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920014450.37787-3-ghatto404@gmail.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Gon-alves/dt-bindings-input-Add-ST-Microelectronics-FTS2BA61Y-touchscreen/20250920-094849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250920014450.37787-3-ghatto404%40gmail.com
patch subject: [PATCH v1 2/2] Input: add support for the STM FTS2BA61Y touchscreen
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250921/202509210247.oVPW8pop-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509210247.oVPW8pop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509210247.oVPW8pop-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/touchscreen/fts2ba61y.c: In function 'fts2ba61y_wait_for_ready':
>> drivers/input/touchscreen/fts2ba61y.c:250:25: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     250 |                 stype = FIELD_GET(FTS2BA61Y_MASK_STYPE, buffer[0]);
         |                         ^~~~~~~~~
   drivers/input/touchscreen/fts2ba61y.c: In function 'fts2ba61y_irq_handler':
>> drivers/input/touchscreen/fts2ba61y.c:442:9: error: implicit declaration of function 'usleep'; did you mean 'fsleep'? [-Wimplicit-function-declaration]
     442 |         usleep(1);
         |         ^~~~~~
         |         fsleep


vim +/FIELD_GET +250 drivers/input/touchscreen/fts2ba61y.c

   239	
   240	static int fts2ba61y_wait_for_ready(struct fts2ba61y_data *ts)
   241	{
   242		u8 buffer[FTS2BA61Y_EVENT_BUFF_SIZE];
   243		u8 cmd = FTS2BA61Y_CMD_READ_EVENT;
   244		u8 status_id, stype;
   245		int ret;
   246	
   247		for (int retries = 5; retries > 0; retries--) {
   248			ret = fts2ba61y_read(ts, &cmd, 1, buffer, FTS2BA61Y_EVENT_BUFF_SIZE);
   249	
 > 250			stype = FIELD_GET(FTS2BA61Y_MASK_STYPE, buffer[0]);
   251			status_id = buffer[1];
   252	
   253			if (stype == FTS2BA61Y_EVENT_STATUSTYPE_INFO &&
   254			    status_id == FTS2BA61Y_INFO_READY_STATUS) {
   255				ret = 0;
   256				break;
   257			} else
   258				ret = -ENODEV;
   259	
   260			msleep(20);
   261		}
   262	
   263		return ret;
   264	}
   265	
   266	static int fts2ba61y_reset(struct fts2ba61y_data *ts)
   267	{
   268		u8 cmd = FTS2BA61Y_CMD_REG_W;
   269		/* the following sequence is undocumented */
   270		u8 reset[FTS2BA61Y_RESET_CMD_SIZE] = { 0x20, 0x00,
   271						       0x00, 0x24, 0x81 };
   272		int ret;
   273	
   274		disable_irq(ts->spi->irq);
   275	
   276		ret = fts2ba61y_write(ts, &cmd, 1, &reset[0], FTS2BA61Y_RESET_CMD_SIZE);
   277		if (ret)
   278			return ret;
   279		msleep(30);
   280	
   281		ret = fts2ba61y_wait_for_ready(ts);
   282		if (ret)
   283			return ret;
   284	
   285		enable_irq(ts->spi->irq);
   286	
   287		return 0;
   288	}
   289	
   290	static int fts2ba61y_set_channels(struct fts2ba61y_data *ts)
   291	{
   292		int ret;
   293		u8 cmd = FTS2BA61Y_CMD_READ_PANEL_INFO;
   294		u8 data[FTS2BA61Y_PANEL_INFO_SIZE];
   295	
   296		ret = fts2ba61y_read(ts, &cmd, 1, data, FTS2BA61Y_PANEL_INFO_SIZE);
   297		if (ret)
   298			return ret;
   299	
   300		ts->max_x = get_unaligned_be16(data);
   301		ts->max_y = get_unaligned_be16(data + 2);
   302	
   303		/* if no tx channels defined, at least keep one */
   304		ts->tx_count = max_t(u8, data[8], 1);
   305	
   306		return 0;
   307	}
   308	
   309	static int fts2ba61y_set_touch_func(struct fts2ba61y_data *ts)
   310	{
   311		u8 cmd = FTS2BA61Y_CMD_TOUCHTYPE;
   312		u16 touchtype = cpu_to_le16(FTS2BA61Y_TOUCHTYPE_DEFAULT);
   313	
   314		return fts2ba61y_write(ts, &cmd, 1, (u8 *)&touchtype, 2);
   315	}
   316	
   317	static int fts2ba61y_hw_init(struct fts2ba61y_data *ts)
   318	{
   319		int ret;
   320	
   321		ret = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
   322									ts->regulators);
   323		if (ret)
   324			return ret;
   325	
   326		msleep(140);
   327	
   328		ret = fts2ba61y_reset(ts);
   329		if (ret)
   330			return ret;
   331	
   332		ret = fts2ba61y_set_channels(ts);
   333		if (ret)
   334			return ret;
   335	
   336		return fts2ba61y_set_touch_func(ts);
   337	}
   338	
   339	static int fts2ba61y_get_event(struct fts2ba61y_data *ts, u8 *data, int *n_events)
   340	{
   341		int ret;
   342		u8 cmd = FTS2BA61Y_CMD_READ_EVENT;
   343	
   344		ret = fts2ba61y_read(ts, &cmd, 1, data, FTS2BA61Y_EVENT_BUFF_SIZE);
   345		if (ret < 0)
   346			return ret;
   347	
   348		if (!data[0]) {
   349			*n_events = 0;
   350			return 0;
   351		}
   352	
   353		*n_events = FIELD_GET(FTS2BA61Y_MASK_LEFT_EVENTS, data[7]);
   354		if (unlikely(*n_events >= FTS2BA61Y_EVENT_COUNT)) {
   355			cmd = FTS2BA61Y_CMD_CLEAR_EVENTS;
   356			fts2ba61y_write(ts, &cmd, 1, NULL, 0);
   357			*n_events = 0;
   358			return -EINVAL;
   359		}
   360	
   361		if (*n_events > 0) {
   362			ret = fts2ba61y_read(ts, &cmd, 1,
   363					     &data[1 * FTS2BA61Y_EVENT_BUFF_SIZE],
   364					     FTS2BA61Y_EVENT_BUFF_SIZE * (*n_events));
   365			if (ret)
   366				return ret;
   367		}
   368	
   369		return 0;
   370	}
   371	
   372	static void fts2ba61y_report_coordinates(struct fts2ba61y_data *ts,
   373						 u8 *event, u8 tid)
   374	{
   375		u8 major = event[4];
   376		u8 minor = event[5];
   377		u8 z = FIELD_GET(FTS2BA61Y_MASK_Z, event[6]);
   378	
   379		u16 x = (event[1] << 4) |
   380			FIELD_GET(FTS2BA61Y_MASK_X_3_0, event[3]);
   381		u16 y = (event[2] << 4) |
   382			FIELD_GET(FTS2BA61Y_MASK_Y_3_0, event[3]);
   383		u16 ttype = (FIELD_GET(FTS2BA61Y_MASK_TTYPE_3_2, event[6]) << 2) |
   384			    (FIELD_GET(FTS2BA61Y_MASK_TTYPE_1_0, event[7]) << 0);
   385	
   386		if (ttype != FTS2BA61Y_TOUCHTYPE_NORMAL &&
   387		    ttype != FTS2BA61Y_TOUCHTYPE_PALM &&
   388		    ttype != FTS2BA61Y_TOUCHTYPE_WET &&
   389		    ttype != FTS2BA61Y_TOUCHTYPE_GLOVE)
   390			return;
   391	
   392		input_mt_slot(ts->input_dev, tid);
   393		input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, true);
   394		input_report_abs(ts->input_dev, ABS_MT_POSITION_X, x);
   395		input_report_abs(ts->input_dev, ABS_MT_POSITION_Y, y);
   396		input_report_abs(ts->input_dev, ABS_MT_TOUCH_MAJOR, major);
   397		input_report_abs(ts->input_dev, ABS_MT_TOUCH_MINOR, minor);
   398		input_report_abs(ts->input_dev, ABS_MT_PRESSURE, z);
   399	
   400		input_mt_sync_frame(ts->input_dev);
   401		input_sync(ts->input_dev);
   402	}
   403	
   404	static void fts2ba61y_report_release(struct fts2ba61y_data *ts, u8 tid)
   405	{
   406		input_mt_slot(ts->input_dev, tid);
   407		input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, false);
   408	
   409		input_mt_sync_frame(ts->input_dev);
   410		input_sync(ts->input_dev);
   411	}
   412	
   413	static void fts2ba61y_handle_coordinates(struct fts2ba61y_data *ts, u8 *event)
   414	{
   415		u8 t_id = FIELD_GET(FTS2BA61Y_MASK_TID, event[0]);
   416		u8 action = FIELD_GET(FTS2BA61Y_MASK_TCHSTA, event[0]);
   417	
   418		if (t_id > ts->tx_count)
   419			return;
   420	
   421		switch (action) {
   422		case FTS2BA61Y_COORDINATE_ACTION_PRESS:
   423		case FTS2BA61Y_COORDINATE_ACTION_MOVE:
   424			fts2ba61y_report_coordinates(ts, event, t_id);
   425			break;
   426	
   427		case FTS2BA61Y_COORDINATE_ACTION_RELEASE:
   428			fts2ba61y_report_release(ts, t_id);
   429			break;
   430		}
   431	}
   432	
   433	static irqreturn_t fts2ba61y_irq_handler(int irq, void *handle)
   434	{
   435		struct fts2ba61y_data *ts = handle;
   436		u8 buffer[FTS2BA61Y_EVENT_COUNT * FTS2BA61Y_EVENT_BUFF_SIZE];
   437		u8 *event;
   438		u8 event_id;
   439		int n_events = 0;
   440		int ret;
   441	
 > 442		usleep(1);
   443	
   444		ret = fts2ba61y_get_event(ts, buffer, &n_events);
   445		if (ret < 0) {
   446			dev_dbg(&ts->spi->dev, "failed to get event: %d", ret);
   447			return IRQ_HANDLED;
   448		}
   449	
   450		for (int i = 0; i <= n_events; i++) {
   451			event = &buffer[i * FTS2BA61Y_EVENT_BUFF_SIZE];
   452			event_id = FIELD_GET(FTS2BA61Y_MASK_EVENT_ID, event[0]);
   453	
   454			if (event_id == FTS2BA61Y_COORDINATE_EVENT)
   455				fts2ba61y_handle_coordinates(ts, event);
   456		}
   457	
   458		return IRQ_HANDLED;
   459	}
   460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

