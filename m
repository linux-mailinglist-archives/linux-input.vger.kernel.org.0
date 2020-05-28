Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2651E60A1
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 14:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388938AbgE1MWu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 08:22:50 -0400
Received: from mga01.intel.com ([192.55.52.88]:46572 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388767AbgE1MWt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 08:22:49 -0400
IronPort-SDR: BYPjuql71Gh4K7UxVUjfwXXxMl87rNhIAM/F1Ft5VT6fCnjYe7XIijUYv6Jda/AIUJNZVvRKEo
 hxurGGGxt5Ww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 05:22:47 -0700
IronPort-SDR: A3d785f1MX0R7l/E+smvmFj55G3TOUMleCHgan5saOuclYvpp83MCkk6Ke8WhCNtrEbqnDgWXP
 cxkwBA55WAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; 
   d="scan'208";a="270834696"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 28 May 2020 05:22:45 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jeHYe-009QMX-Rx; Thu, 28 May 2020 15:22:48 +0300
Date:   Thu, 28 May 2020 15:22:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [RESEND PATCH v11 2/3] drivers: input: keyboard: Add mtk keypad
 driver
Message-ID: <20200528122248.GL1634618@smile.fi.intel.com>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
 <20200528090144.54033-3-fengping.yu@mediatek.com>
 <20200528102730.GK1634618@smile.fi.intel.com>
 <20200528114558.5decxsun2o65k2fr@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528114558.5decxsun2o65k2fr@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 28, 2020 at 01:45:58PM +0200, Marco Felsch wrote:
> On 20-05-28 13:27, Andy Shevchenko wrote:
> > On Thu, May 28, 2020 at 05:01:47PM +0800, Fengping Yu wrote:

...

> > > +	select CONFIG_REGMAP_MMIO
> > 
> > This is wrong.
> 
> Why is this wrong? The driver uses the rmap-mmio functions.

In Kconfig CONFIG_ prefix is implied.

There is no CONFIG_CONFIG_REGMAP_MMIO.

> Thanks for the explanation =)

Sorry, I think it's obvious...

> > > +	select INPUT_MATRIXKMAP

-- 
With Best Regards,
Andy Shevchenko


