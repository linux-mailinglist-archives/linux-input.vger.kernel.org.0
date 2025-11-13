Return-Path: <linux-input+bounces-16068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD2C55B18
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 05:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7883B4E22F1
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 04:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE940303A07;
	Thu, 13 Nov 2025 04:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvmnsB1E"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC03A3009D3;
	Thu, 13 Nov 2025 04:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009426; cv=none; b=fXVHBgemQX2pHB/USd6O61CQDyd0EQ+obmqcgbgiUfx/KDqWQwEtYLI4sdshaMAvmAEDMdqZWhM1azchz37AcqkGZ86zw2B0cqwudCwP0mmG5ozrmEjy63tjRBNEy7PpuXYTCjnGJ2Aq+jv/rB99sB28tir5zCMYsCOJdL+P1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009426; c=relaxed/simple;
	bh=jbIgAg7jhangvaiUcjriRdzLzDP6LyQs0vP+VOx8Oyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=athYhFHe9NSCImEBja0Z+p+y9yxaXDIJi1jaIPepTIcKA7Q7RWjhpRfZX7ZbHlgz3251LGk5k9I7vihNVQANIdTNZIoetjK7i7lcmzJQeKlNVzF4xtjeDjcBeioQQ0MWFOfhPF2uIVU+mJ2mV8M/LM8GrbC8LztQ7g8aw3uVMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvmnsB1E; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009425; x=1794545425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jbIgAg7jhangvaiUcjriRdzLzDP6LyQs0vP+VOx8Oyk=;
  b=mvmnsB1EzzcNDTpxZtPYYiw3F89vLWIBKasjFTVE7ZdVUg7EHlf2Zyr/
   rqijHPlwmQSdP34iKvCKzMJ7iMMMuABFgJ6iac38gAE19WEwt6OIV1WOs
   jO/Ygzgj/UkIIUxsyUFHhYG590mzug9Wo/BjCleQLSIOGiTeX13/dnH0t
   eK/NyujBBfGlAgagA1AhDTRXilemA7lkdRlXajMUjxfsUKU4TOuJA/j5I
   m+jf/eKOz7rRjBZOcSc3qfWLSPytAhYdVzeKlfMPIw96156VY39hi1ebo
   EY0utXpaYxN//D/RA4pphJdkg8/5B2i42nJcp710oD7bj/cffO7J8k8Ig
   Q==;
X-CSE-ConnectionGUID: oMjPbNw8TxWPRUQyU4T92g==
X-CSE-MsgGUID: 4qgmq9B7Q0WGLXL8Z8v9Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68947832"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68947832"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:23 -0800
X-CSE-ConnectionGUID: FMZMrAMfStmNmuw7a3HEOQ==
X-CSE-MsgGUID: zd6mVIkdSxKleM2Mf2ahdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="212789111"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 20:50:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004sq-2W;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Denose <jdenose@google.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Denose <jdenose@google.com>
Subject: Re: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan
 touchpad on lid event
Message-ID: <202511122329.Sg4foDAx-lkp@intel.com>
References: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/Input-Add-lid-switch-notifier/20251112-053559
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251111-lid-switch-notifier-v2-2-789723d78d89%40google.com
patch subject: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan touchpad on lid event
config: xtensa-randconfig-002-20251112 (https://download.01.org/0day-ci/archive/20251112/202511122329.Sg4foDAx-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122329.Sg4foDAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122329.Sg4foDAx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1423:(.exception.text+0x21b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: drivers/hid/hid-multitouch.o: in function `mt_touch_report.isra.24':
>> drivers/hid/hid-multitouch.c:1319: undefined reference to `register_lid_notifier'
   xtensa-linux-ld: drivers/hid/hid-multitouch.o: in function `mt_touch_report.isra.24':
>> include/linux/input.h:512: undefined reference to `register_lid_notifier'


vim +1319 drivers/hid/hid-multitouch.c

2d93666e70662c Benjamin Tissoires 2011-01-11  1256  
8dfe14b3b47ff8 Benjamin Tissoires 2018-07-13  1257  static void mt_touch_report(struct hid_device *hid,
8dfe14b3b47ff8 Benjamin Tissoires 2018-07-13  1258  			    struct mt_report_data *rdata)
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1259  {
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1260  	struct mt_device *td = hid_get_drvdata(hid);
8dfe14b3b47ff8 Benjamin Tissoires 2018-07-13  1261  	struct hid_report *report = rdata->report;
8dfe14b3b47ff8 Benjamin Tissoires 2018-07-13  1262  	struct mt_application *app = rdata->application;
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1263  	struct hid_field *field;
01eaac7e57134c Benjamin Tissoires 2018-07-13  1264  	struct input_dev *input;
01eaac7e57134c Benjamin Tissoires 2018-07-13  1265  	struct mt_usages *slot;
55746d28d66860 Hans de Goede      2017-11-22  1266  	bool first_packet;
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1267  	unsigned count;
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1268  	int r, n;
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1269  	int scantime = 0;
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1270  	int contact_count = -1;
5519cab477b613 Benjamin Tissoires 2011-01-07  1271  
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1272  	/* sticky fingers release in progress, abort */
be6e2b5734a425 Andri Yngvason     2022-09-07  1273  	if (test_and_set_bit_lock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1274  		return;
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1275  
01eaac7e57134c Benjamin Tissoires 2018-07-13  1276  	scantime = *app->scantime;
01eaac7e57134c Benjamin Tissoires 2018-07-13  1277  	app->timestamp = mt_compute_timestamp(app, scantime);
01eaac7e57134c Benjamin Tissoires 2018-07-13  1278  	if (app->raw_cc != DEFAULT_ZERO)
01eaac7e57134c Benjamin Tissoires 2018-07-13  1279  		contact_count = *app->raw_cc;
01eaac7e57134c Benjamin Tissoires 2018-07-13  1280  
c2517f62dac608 Benjamin Tissoires 2013-01-31  1281  	/*
c2517f62dac608 Benjamin Tissoires 2013-01-31  1282  	 * Includes multi-packet support where subsequent
c2517f62dac608 Benjamin Tissoires 2013-01-31  1283  	 * packets are sent with zero contactcount.
c2517f62dac608 Benjamin Tissoires 2013-01-31  1284  	 */
01eaac7e57134c Benjamin Tissoires 2018-07-13  1285  	if (contact_count >= 0) {
af8dc4d0949092 Hans de Goede      2017-11-22  1286  		/*
af8dc4d0949092 Hans de Goede      2017-11-22  1287  		 * For Win8 PTPs the first packet (td->num_received == 0) may
af8dc4d0949092 Hans de Goede      2017-11-22  1288  		 * have a contactcount of 0 if there only is a button event.
af8dc4d0949092 Hans de Goede      2017-11-22  1289  		 * We double check that this is not a continuation packet
af8dc4d0949092 Hans de Goede      2017-11-22  1290  		 * of a possible multi-packet frame be checking that the
af8dc4d0949092 Hans de Goede      2017-11-22  1291  		 * timestamp has changed.
af8dc4d0949092 Hans de Goede      2017-11-22  1292  		 */
3ceb3826448d1e Benjamin Tissoires 2018-07-13  1293  		if ((app->quirks & MT_QUIRK_WIN8_PTP_BUTTONS) &&
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1294  		    app->num_received == 0 &&
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1295  		    app->prev_scantime != scantime)
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1296  			app->num_expected = contact_count;
af8dc4d0949092 Hans de Goede      2017-11-22  1297  		/* A non 0 contact count always indicates a first packet */
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1298  		else if (contact_count)
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1299  			app->num_expected = contact_count;
7e3cc447ff8906 Benjamin Tissoires 2013-02-06  1300  	}
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1301  	app->prev_scantime = scantime;
c2517f62dac608 Benjamin Tissoires 2013-01-31  1302  
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1303  	first_packet = app->num_received == 0;
01eaac7e57134c Benjamin Tissoires 2018-07-13  1304  
01eaac7e57134c Benjamin Tissoires 2018-07-13  1305  	input = report->field[0]->hidinput->input;
01eaac7e57134c Benjamin Tissoires 2018-07-13  1306  
01eaac7e57134c Benjamin Tissoires 2018-07-13  1307  	list_for_each_entry(slot, &app->mt_usages, list) {
01eaac7e57134c Benjamin Tissoires 2018-07-13  1308  		if (!mt_process_slot(td, input, app, slot))
01eaac7e57134c Benjamin Tissoires 2018-07-13  1309  			app->num_received++;
01eaac7e57134c Benjamin Tissoires 2018-07-13  1310  	}
01eaac7e57134c Benjamin Tissoires 2018-07-13  1311  
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1312  	for (r = 0; r < report->maxfield; r++) {
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1313  		field = report->field[r];
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1314  		count = field->report_count;
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1315  
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1316  		if (!(HID_MAIN_ITEM_VARIABLE & field->flags))
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1317  			continue;
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1318  
55978fa9dc4c57 Benjamin Tissoires 2013-01-31 @1319  		for (n = 0; n < count; n++)
01eaac7e57134c Benjamin Tissoires 2018-07-13  1320  			mt_process_mt_event(hid, app, field,
01eaac7e57134c Benjamin Tissoires 2018-07-13  1321  					    &field->usage[n], field->value[n],
01eaac7e57134c Benjamin Tissoires 2018-07-13  1322  					    first_packet);
55978fa9dc4c57 Benjamin Tissoires 2013-01-31  1323  	}
5b62efd8250d6a Benjamin Tissoires 2013-02-27  1324  
f146d1c4d7eafd Benjamin Tissoires 2018-07-13  1325  	if (app->num_received >= app->num_expected)
01eaac7e57134c Benjamin Tissoires 2018-07-13  1326  		mt_sync_frame(td, app, input);
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1327  
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1328  	/*
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1329  	 * Windows 8 specs says 2 things:
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1330  	 * - once a contact has been reported, it has to be reported in each
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1331  	 *   subsequent report
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1332  	 * - the report rate when fingers are present has to be at least
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1333  	 *   the refresh rate of the screen, 60 or 120 Hz
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1334  	 *
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1335  	 * I interprete this that the specification forces a report rate of
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1336  	 * at least 60 Hz for a touchscreen to be certified.
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1337  	 * Which means that if we do not get a report whithin 16 ms, either
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1338  	 * something wrong happens, either the touchscreen forgets to send
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1339  	 * a release. Taking a reasonable margin allows to remove issues
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1340  	 * with USB communication or the load of the machine.
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1341  	 *
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1342  	 * Given that Win 8 devices are forced to send a release, this will
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1343  	 * only affect laggish machines and the ones that have a firmware
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1344  	 * defect.
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1345  	 */
3ceb3826448d1e Benjamin Tissoires 2018-07-13  1346  	if (app->quirks & MT_QUIRK_STICKY_FINGERS) {
9609827458c37d Benjamin Tissoires 2017-06-15  1347  		if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
9609827458c37d Benjamin Tissoires 2017-06-15  1348  			mod_timer(&td->release_timer,
9609827458c37d Benjamin Tissoires 2017-06-15  1349  				  jiffies + msecs_to_jiffies(100));
9609827458c37d Benjamin Tissoires 2017-06-15  1350  		else
8fa7292fee5c52 Thomas Gleixner    2025-04-05  1351  			timer_delete(&td->release_timer);
9609827458c37d Benjamin Tissoires 2017-06-15  1352  	}
4f4001bc76fd1a Benjamin Tissoires 2017-06-15  1353  
be6e2b5734a425 Andri Yngvason     2022-09-07  1354  	clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
5519cab477b613 Benjamin Tissoires 2011-01-07  1355  }
5519cab477b613 Benjamin Tissoires 2011-01-07  1356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

