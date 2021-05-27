Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FF6392B9C
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 12:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbhE0KVl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 06:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbhE0KVh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 06:21:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DB4C061574
        for <linux-input@vger.kernel.org>; Thu, 27 May 2021 03:20:03 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lmD7I-0000bp-6P; Thu, 27 May 2021 12:19:52 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1lmD7H-0007FD-3t; Thu, 27 May 2021 12:19:51 +0200
Date:   Thu, 27 May 2021 12:19:51 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, lkp@intel.com, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [input:next 2732/2735]
 drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error:
 uninitialized symbol 'z2'.
Message-ID: <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
References: <202105270957.mdv83Usm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202105270957.mdv83Usm-lkp@intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:18:27 up 176 days, 24 min, 45 users,  load average: 0.17, 0.14,
 0.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, May 27, 2021 at 12:30:00PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> head:   6cf3b3abbf0b3b778138c0f8936aa7820af62cfc
> commit: fb082cd59afa7fbd3a610e9835050675040b1b99 [2732/2735] Input: resistive-adc-touch - add support for z1 and z2 channels
> config: x86_64-randconfig-m001-20210526 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> New smatch warnings:
> drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uninitialized symbol 'z2'.
> drivers/input/touchscreen/resistive-adc-touch.c:88 grts_cb() error: uninitialized symbol 'x'.
> drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'y'.
> 
> Old smatch warnings:
> drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'x'.
> drivers/input/touchscreen/resistive-adc-touch.c:109 grts_cb() error: uninitialized symbol 'y'.
> 
> vim +/z2 +84 drivers/input/touchscreen/resistive-adc-touch.c
> 
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   56  static int grts_cb(const void *data, void *private)
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   57  {
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   58  	const u16 *touch_info = data;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   59  	struct grts_state *st = private;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   60  	unsigned int x, y, press = 0, z1 = 0, z2;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   61  	unsigned int Rt, i;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   62  
> fb082cd59afa7f Oleksij Rempel 2021-05-25   63  	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
> fb082cd59afa7f Oleksij Rempel 2021-05-25   64  		switch (st->ch[i]) {
> fb082cd59afa7f Oleksij Rempel 2021-05-25   65  		case GRTS_CH_X:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   66  			x = touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   67  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   68  		case GRTS_CH_Y:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   69  			y = touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   70  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   71  		case GRTS_CH_PRESSURE:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   72  			press = touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   73  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   74  		case GRTS_CH_Z1:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   75  			z1 = touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   76  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   77  		case GRTS_CH_Z2:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   78  			z2 = touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   79  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   80  		}
> fb082cd59afa7f Oleksij Rempel 2021-05-25   81  	}
> fb082cd59afa7f Oleksij Rempel 2021-05-25   82  
> fb082cd59afa7f Oleksij Rempel 2021-05-25   83  	if (z1) {
> fb082cd59afa7f Oleksij Rempel 2021-05-25  @84  		Rt = z2;
> 
> It's likely this is a false positive, but we can see why the static
> checker would complain.

The presence of this values was validated on probe. Do we really need
extra set them to 0?

> fb082cd59afa7f Oleksij Rempel 2021-05-25   85  		Rt -= z1;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   86  		Rt *= st->x_plate_ohms;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   87  		Rt = DIV_ROUND_CLOSEST(Rt, 16);
> fb082cd59afa7f Oleksij Rempel 2021-05-25  @88  		Rt *= x;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   89  		Rt /= z1;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   90  		Rt = DIV_ROUND_CLOSEST(Rt, 256);
> fb082cd59afa7f Oleksij Rempel 2021-05-25   91  		/*
> fb082cd59afa7f Oleksij Rempel 2021-05-25   92  		 * On increased pressure the resistance (Rt) is decreasing
> fb082cd59afa7f Oleksij Rempel 2021-05-25   93  		 * so, convert values to make it looks as real pressure.
> fb082cd59afa7f Oleksij Rempel 2021-05-25   94  		 */
> fb082cd59afa7f Oleksij Rempel 2021-05-25   95  		if (Rt < GRTS_DEFAULT_PRESSURE_MAX)
> fb082cd59afa7f Oleksij Rempel 2021-05-25   96  			press = GRTS_DEFAULT_PRESSURE_MAX - Rt;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   97  		else
> fb082cd59afa7f Oleksij Rempel 2021-05-25   98  			press = 0;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   99  	}
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  100  
> aa132ffb6b0a18 Eugen Hristev  2018-05-22 @101  	if ((!x && !y) || (st->pressure && (press < st->pressure_min))) {
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  102  		/* report end of touch */
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  103  		input_report_key(st->input, BTN_TOUCH, 0);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  104  		input_sync(st->input);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  105  		return 0;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  106  	}
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  107  
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  108  	/* report proper touch to subsystem*/
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  109  	touchscreen_report_pos(st->input, &st->prop, x, y, false);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  110  	if (st->pressure)
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  111  		input_report_abs(st->input, ABS_PRESSURE, press);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  112  	input_report_key(st->input, BTN_TOUCH, 1);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  113  	input_sync(st->input);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  114  
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  115  	return 0;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  116  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
