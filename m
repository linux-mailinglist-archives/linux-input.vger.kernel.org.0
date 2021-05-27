Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34DEE392ACD
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 11:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbhE0JcL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 05:32:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31744 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235903AbhE0JcH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 05:32:07 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14R9IUHF028197;
        Thu, 27 May 2021 09:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=BDdq8UWbW4G3ht8T92r0mzF/1i/bwFurIhmGWnA6NYs=;
 b=y5jwIrQBec5vC1X+1Hd4trW17qE0WIiMCGrWOgY0dxtaNIHnC3wHMODpUq8gqXnku1b9
 jTr2IcZqFzgHXyYkWddLTt7k21BfvyVSaj/rtkgheOlPDCE6LqAornTiGfJDdcMmsYNL
 JYsONbqnlf2EqFSTl2BWTUra5Ly1ZIalBluYfRJoobR8v6PjQcyXnijdezPfyjSHyTDF
 8jsvvZ2WIsAC6I6ITxJUQSRPrQaY1w3RjKB56RMGqZ1olZdL+tQf2is4PDdSFG10tQh4
 2XIsna0L66jadNZ4QAtjYjNFoiqBTXViRz7uOS/xKeuFCcu09z0LVZZ64jTyO1QEgZtP NQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 38sppd0byg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 09:30:22 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14R9ULdf115787;
        Thu, 27 May 2021 09:30:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38pq2w7r1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 09:30:21 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14R9O6PG102507;
        Thu, 27 May 2021 09:30:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38pq2w7r19-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 09:30:20 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14R9UIUJ017758;
        Thu, 27 May 2021 09:30:18 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 May 2021 02:30:16 -0700
Date:   Thu, 27 May 2021 12:30:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [input:next 2732/2735]
 drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error:
 uninitialized symbol 'z2'.
Message-ID: <202105270957.mdv83Usm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 5VperKINHOwlk9IFiFgRQjvP_n55luXW
X-Proofpoint-ORIG-GUID: 5VperKINHOwlk9IFiFgRQjvP_n55luXW
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   6cf3b3abbf0b3b778138c0f8936aa7820af62cfc
commit: fb082cd59afa7fbd3a610e9835050675040b1b99 [2732/2735] Input: resistive-adc-touch - add support for z1 and z2 channels
config: x86_64-randconfig-m001-20210526 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uninitialized symbol 'z2'.
drivers/input/touchscreen/resistive-adc-touch.c:88 grts_cb() error: uninitialized symbol 'x'.
drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'y'.

Old smatch warnings:
drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'x'.
drivers/input/touchscreen/resistive-adc-touch.c:109 grts_cb() error: uninitialized symbol 'y'.

vim +/z2 +84 drivers/input/touchscreen/resistive-adc-touch.c

aa132ffb6b0a18 Eugen Hristev  2018-05-22   56  static int grts_cb(const void *data, void *private)
aa132ffb6b0a18 Eugen Hristev  2018-05-22   57  {
aa132ffb6b0a18 Eugen Hristev  2018-05-22   58  	const u16 *touch_info = data;
aa132ffb6b0a18 Eugen Hristev  2018-05-22   59  	struct grts_state *st = private;
fb082cd59afa7f Oleksij Rempel 2021-05-25   60  	unsigned int x, y, press = 0, z1 = 0, z2;
fb082cd59afa7f Oleksij Rempel 2021-05-25   61  	unsigned int Rt, i;
aa132ffb6b0a18 Eugen Hristev  2018-05-22   62  
fb082cd59afa7f Oleksij Rempel 2021-05-25   63  	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
fb082cd59afa7f Oleksij Rempel 2021-05-25   64  		switch (st->ch[i]) {
fb082cd59afa7f Oleksij Rempel 2021-05-25   65  		case GRTS_CH_X:
fb082cd59afa7f Oleksij Rempel 2021-05-25   66  			x = touch_info[i];
fb082cd59afa7f Oleksij Rempel 2021-05-25   67  			break;
fb082cd59afa7f Oleksij Rempel 2021-05-25   68  		case GRTS_CH_Y:
fb082cd59afa7f Oleksij Rempel 2021-05-25   69  			y = touch_info[i];
fb082cd59afa7f Oleksij Rempel 2021-05-25   70  			break;
fb082cd59afa7f Oleksij Rempel 2021-05-25   71  		case GRTS_CH_PRESSURE:
fb082cd59afa7f Oleksij Rempel 2021-05-25   72  			press = touch_info[i];
fb082cd59afa7f Oleksij Rempel 2021-05-25   73  			break;
fb082cd59afa7f Oleksij Rempel 2021-05-25   74  		case GRTS_CH_Z1:
fb082cd59afa7f Oleksij Rempel 2021-05-25   75  			z1 = touch_info[i];
fb082cd59afa7f Oleksij Rempel 2021-05-25   76  			break;
fb082cd59afa7f Oleksij Rempel 2021-05-25   77  		case GRTS_CH_Z2:
fb082cd59afa7f Oleksij Rempel 2021-05-25   78  			z2 = touch_info[i];
fb082cd59afa7f Oleksij Rempel 2021-05-25   79  			break;
fb082cd59afa7f Oleksij Rempel 2021-05-25   80  		}
fb082cd59afa7f Oleksij Rempel 2021-05-25   81  	}
fb082cd59afa7f Oleksij Rempel 2021-05-25   82  
fb082cd59afa7f Oleksij Rempel 2021-05-25   83  	if (z1) {
fb082cd59afa7f Oleksij Rempel 2021-05-25  @84  		Rt = z2;

It's likely this is a false positive, but we can see why the static
checker would complain.

fb082cd59afa7f Oleksij Rempel 2021-05-25   85  		Rt -= z1;
fb082cd59afa7f Oleksij Rempel 2021-05-25   86  		Rt *= st->x_plate_ohms;
fb082cd59afa7f Oleksij Rempel 2021-05-25   87  		Rt = DIV_ROUND_CLOSEST(Rt, 16);
fb082cd59afa7f Oleksij Rempel 2021-05-25  @88  		Rt *= x;
fb082cd59afa7f Oleksij Rempel 2021-05-25   89  		Rt /= z1;
fb082cd59afa7f Oleksij Rempel 2021-05-25   90  		Rt = DIV_ROUND_CLOSEST(Rt, 256);
fb082cd59afa7f Oleksij Rempel 2021-05-25   91  		/*
fb082cd59afa7f Oleksij Rempel 2021-05-25   92  		 * On increased pressure the resistance (Rt) is decreasing
fb082cd59afa7f Oleksij Rempel 2021-05-25   93  		 * so, convert values to make it looks as real pressure.
fb082cd59afa7f Oleksij Rempel 2021-05-25   94  		 */
fb082cd59afa7f Oleksij Rempel 2021-05-25   95  		if (Rt < GRTS_DEFAULT_PRESSURE_MAX)
fb082cd59afa7f Oleksij Rempel 2021-05-25   96  			press = GRTS_DEFAULT_PRESSURE_MAX - Rt;
fb082cd59afa7f Oleksij Rempel 2021-05-25   97  		else
fb082cd59afa7f Oleksij Rempel 2021-05-25   98  			press = 0;
fb082cd59afa7f Oleksij Rempel 2021-05-25   99  	}
aa132ffb6b0a18 Eugen Hristev  2018-05-22  100  
aa132ffb6b0a18 Eugen Hristev  2018-05-22 @101  	if ((!x && !y) || (st->pressure && (press < st->pressure_min))) {
aa132ffb6b0a18 Eugen Hristev  2018-05-22  102  		/* report end of touch */
aa132ffb6b0a18 Eugen Hristev  2018-05-22  103  		input_report_key(st->input, BTN_TOUCH, 0);
aa132ffb6b0a18 Eugen Hristev  2018-05-22  104  		input_sync(st->input);
aa132ffb6b0a18 Eugen Hristev  2018-05-22  105  		return 0;
aa132ffb6b0a18 Eugen Hristev  2018-05-22  106  	}
aa132ffb6b0a18 Eugen Hristev  2018-05-22  107  
aa132ffb6b0a18 Eugen Hristev  2018-05-22  108  	/* report proper touch to subsystem*/
aa132ffb6b0a18 Eugen Hristev  2018-05-22  109  	touchscreen_report_pos(st->input, &st->prop, x, y, false);
aa132ffb6b0a18 Eugen Hristev  2018-05-22  110  	if (st->pressure)
aa132ffb6b0a18 Eugen Hristev  2018-05-22  111  		input_report_abs(st->input, ABS_PRESSURE, press);
aa132ffb6b0a18 Eugen Hristev  2018-05-22  112  	input_report_key(st->input, BTN_TOUCH, 1);
aa132ffb6b0a18 Eugen Hristev  2018-05-22  113  	input_sync(st->input);
aa132ffb6b0a18 Eugen Hristev  2018-05-22  114  
aa132ffb6b0a18 Eugen Hristev  2018-05-22  115  	return 0;
aa132ffb6b0a18 Eugen Hristev  2018-05-22  116  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

