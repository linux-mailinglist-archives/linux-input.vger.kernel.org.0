Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB890DC031
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 10:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438291AbfJRIoO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 04:44:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:47120 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727903AbfJRIoO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 04:44:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 01:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,311,1566889200"; 
   d="scan'208";a="397870720"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2019 01:44:05 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iLNrf-0008LD-3B; Fri, 18 Oct 2019 11:44:03 +0300
Date:   Fri, 18 Oct 2019 11:44:03 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>,
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
        Marco Felsch <m.felsch@pengutronix.de>,
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
Message-ID: <20191018084403.GR32742@smile.fi.intel.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 17, 2019 at 01:41:54PM -0700, Dmitry Torokhov wrote:
> Input devices now support polling mode natively (via input_setup_polling
> API), and input_polled_dev implementation is going away. This series
> switches drivers found in drivers/input to the new scheme.
> 

For all I have been Cc'ed
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Dmitry Torokhov (21):
>   Input: raspberrypi-ts - switch to using polled mode of input devices
>   Input: sur40 - switch to using polled mode of input devices
>   Input: ts4800-ts - switch to using polled mode of input devices
>   Input: tsc6507x-ts - switch to using polled mode of input devices
>   Input: adc-keys - switch to using polled mode of input devices
>   Input: clps711x-keypad - switch to using polled mode of input devices
>   Input: jornada680_kbd - switch to using polled mode of input devices
>   Input: gpio_keys_polled - switch to using polled mode of input devices
>   Input: apanel - switch to using polled mode of input devices
>   Input: wistron_btns - switch to using polled mode of input devices
>   Input: cobalt_btns - convert to use managed resources
>   Input: cobalt_btns - switch to using polled mode of input devices
>   Input: sgi_btns - switch to using managed resources
>   Input: sgi_btns - switch to using polled mode of input devices
>   Input: rb532_button - switch to using managed resources
>   Input: rb532_button - switch to using polled mode of input devices
>   Input: gpio_decoder - switch to using polled mode of input devices
>   Input: mma8450 - switch to using polled mode of input devices
>   Input: bma150 - switch to using polled mode of input devices
>   Input: kxtj9 - switch to using managed resources
>   Input: kxtj9 - switch to using polled mode of input devices
> 
> Jonathan Bakker (1):
>   Input: bma150 - use managed resources helpers
> 
>  drivers/input/keyboard/Kconfig             |   4 -
>  drivers/input/keyboard/adc-keys.c          |  36 ++--
>  drivers/input/keyboard/clps711x-keypad.c   |  70 +++----
>  drivers/input/keyboard/gpio_keys_polled.c  |  65 +++---
>  drivers/input/keyboard/jornada680_kbd.c    |  37 ++--
>  drivers/input/misc/Kconfig                 |  15 --
>  drivers/input/misc/apanel.c                | 153 ++++++--------
>  drivers/input/misc/bma150.c                | 190 +++++------------
>  drivers/input/misc/cobalt_btns.c           |  73 +++----
>  drivers/input/misc/gpio_decoder.c          |  42 ++--
>  drivers/input/misc/kxtj9.c                 | 224 ++++++---------------
>  drivers/input/misc/mma8450.c               | 101 +++++-----
>  drivers/input/misc/rb532_button.c          |  48 ++---
>  drivers/input/misc/sgi_btns.c              |  54 ++---
>  drivers/input/misc/wistron_btns.c          |  51 ++---
>  drivers/input/touchscreen/Kconfig          |   4 -
>  drivers/input/touchscreen/raspberrypi-ts.c |  38 ++--
>  drivers/input/touchscreen/sur40.c          |  92 +++++----
>  drivers/input/touchscreen/tps6507x-ts.c    |  36 ++--
>  drivers/input/touchscreen/ts4800-ts.c      |  68 ++++---
>  20 files changed, 557 insertions(+), 844 deletions(-)
> 
> -- 
> 2.23.0.866.gb869b98d4c-goog
> 

-- 
With Best Regards,
Andy Shevchenko


