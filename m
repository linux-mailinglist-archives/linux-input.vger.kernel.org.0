Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CF41E5D18
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 12:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387745AbgE1KYp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 06:24:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:10019 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387884AbgE1KYn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 06:24:43 -0400
IronPort-SDR: rxUqRjwZxDk0hq/eDNTn8oTwZhr1/xsQbag7F76amva/ZvEpgZqsvon0yoO/HyoA2lwPaFNprl
 n1zbMP9SI5/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 03:24:43 -0700
IronPort-SDR: 7YzXa/VGBxUz2xxG1w1dcOrFdJUpU2foPW9a+SEpZaDyYkYPl7NWzB4+lh2YzRLemfTKQLD834
 iDij8LIGp9qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; 
   d="scan'208";a="270806799"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 28 May 2020 03:24:41 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jeFiO-009PMJ-HY; Thu, 28 May 2020 13:24:44 +0300
Date:   Thu, 28 May 2020 13:24:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Fengping Yu <fengping.yu@mediatek.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [RESEND PATCH v11] Add matrix keypad driver support for Mediatek
 SoCs
Message-ID: <20200528102444.GJ1634618@smile.fi.intel.com>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528090144.54033-1-fengping.yu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 28, 2020 at 05:01:42PM +0800, Fengping Yu wrote:
> 
> Change since v10:
> - add wakeup source setting in probe function

You forgot tags by Marco

> 
> fengping.yu (3):
>   dt-bindings: Add keypad devicetree documentation
>   drivers: input: keyboard: Add mtk keypad driver
>   configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=m
> 
>  .../devicetree/bindings/input/mtk-kpd.yaml    |  95 ++++++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/input/keyboard/Kconfig                |  11 +
>  drivers/input/keyboard/Makefile               |   1 +
>  drivers/input/keyboard/mtk-kpd.c              | 206 ++++++++++++++++++
>  5 files changed, 314 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
>  create mode 100644 drivers/input/keyboard/mtk-kpd.c
> 
> -- 
> 2.18.0
> 

-- 
With Best Regards,
Andy Shevchenko


