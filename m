Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E85FADE5E5
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 10:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfJUIFb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 04:05:31 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55599 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbfJUIFa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 04:05:30 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iMSfM-000875-Se; Mon, 21 Oct 2019 10:03:48 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iMSfC-00081S-2X; Mon, 21 Oct 2019 10:03:38 +0200
Date:   Mon, 21 Oct 2019 10:03:38 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Anders Roxell <anders.roxell@linaro.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Enrico Weigelt <info@metux.net>, Eric Anholt <eric@anholt.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacky Bai <ping.bai@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
        Jilayne Lovejoy <opensource@jilayne.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Luca Weiss <luca@z3ntu.xyz>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Martin Kepplinger <martink@posteo.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Miloslav Trmac <mitr@volny.cz>,
        Mukesh Ojha <mojha@codeaurora.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Pavel Machek <pavel@ucw.cz>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
        Stefan Agner <stefan@agner.ch>,
        Steve Winslow <swinslow@gmail.com>,
        Sven Van Asbroeck <TheSven73@gmail.com>,
        YueHaibing <yuehaibing@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/22] Stop using input_polled_dev in polling drivers
Message-ID: <20191021080338.prrraz5h7sykxz6e@pengutronix.de>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
 <20191018084403.GR32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018084403.GR32742@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:02:38 up 156 days, 14:20, 97 users,  load average: 0.14, 0.13,
 0.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19-10-18 11:44, Andy Shevchenko wrote:
> On Thu, Oct 17, 2019 at 01:41:54PM -0700, Dmitry Torokhov wrote:
> > Input devices now support polling mode natively (via input_setup_polling
> > API), and input_polled_dev implementation is going away. This series
> > switches drivers found in drivers/input to the new scheme.
> > 
> 
> For all I have been Cc'ed
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Same for me
Acked-by: Marco Felsch <m.felsch@pengutronix.de> 

> > 
> > Dmitry Torokhov (21):
> >   Input: raspberrypi-ts - switch to using polled mode of input devices
> >   Input: sur40 - switch to using polled mode of input devices
> >   Input: ts4800-ts - switch to using polled mode of input devices
> >   Input: tsc6507x-ts - switch to using polled mode of input devices
> >   Input: adc-keys - switch to using polled mode of input devices
> >   Input: clps711x-keypad - switch to using polled mode of input devices
> >   Input: jornada680_kbd - switch to using polled mode of input devices
> >   Input: gpio_keys_polled - switch to using polled mode of input devices
> >   Input: apanel - switch to using polled mode of input devices
> >   Input: wistron_btns - switch to using polled mode of input devices
> >   Input: cobalt_btns - convert to use managed resources
> >   Input: cobalt_btns - switch to using polled mode of input devices
> >   Input: sgi_btns - switch to using managed resources
> >   Input: sgi_btns - switch to using polled mode of input devices
> >   Input: rb532_button - switch to using managed resources
> >   Input: rb532_button - switch to using polled mode of input devices
> >   Input: gpio_decoder - switch to using polled mode of input devices
> >   Input: mma8450 - switch to using polled mode of input devices
> >   Input: bma150 - switch to using polled mode of input devices
> >   Input: kxtj9 - switch to using managed resources
> >   Input: kxtj9 - switch to using polled mode of input devices
> > 
> > Jonathan Bakker (1):
> >   Input: bma150 - use managed resources helpers
> > 
> >  drivers/input/keyboard/Kconfig             |   4 -
> >  drivers/input/keyboard/adc-keys.c          |  36 ++--
> >  drivers/input/keyboard/clps711x-keypad.c   |  70 +++----
> >  drivers/input/keyboard/gpio_keys_polled.c  |  65 +++---
> >  drivers/input/keyboard/jornada680_kbd.c    |  37 ++--
> >  drivers/input/misc/Kconfig                 |  15 --
> >  drivers/input/misc/apanel.c                | 153 ++++++--------
> >  drivers/input/misc/bma150.c                | 190 +++++------------
> >  drivers/input/misc/cobalt_btns.c           |  73 +++----
> >  drivers/input/misc/gpio_decoder.c          |  42 ++--
> >  drivers/input/misc/kxtj9.c                 | 224 ++++++---------------
> >  drivers/input/misc/mma8450.c               | 101 +++++-----
> >  drivers/input/misc/rb532_button.c          |  48 ++---
> >  drivers/input/misc/sgi_btns.c              |  54 ++---
> >  drivers/input/misc/wistron_btns.c          |  51 ++---
> >  drivers/input/touchscreen/Kconfig          |   4 -
> >  drivers/input/touchscreen/raspberrypi-ts.c |  38 ++--
> >  drivers/input/touchscreen/sur40.c          |  92 +++++----
> >  drivers/input/touchscreen/tps6507x-ts.c    |  36 ++--
> >  drivers/input/touchscreen/ts4800-ts.c      |  68 ++++---
> >  20 files changed, 557 insertions(+), 844 deletions(-)
> > 
> > -- 
> > 2.23.0.866.gb869b98d4c-goog
> > 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
