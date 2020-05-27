Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AEB1E3E05
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 11:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729484AbgE0Jut (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 May 2020 05:50:49 -0400
Received: from mga17.intel.com ([192.55.52.151]:22368 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729445AbgE0Jut (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 05:50:49 -0400
IronPort-SDR: cyt05oBntXhqS3iCBFiEhTd+0SDHn6pwSVPqOJ/MHrEP1Zs35e76j4DKuq7Rh7QLyvFuz7pF9V
 cnQK+l1Pwkvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 02:50:49 -0700
IronPort-SDR: Mpk22qHSCUEF+iHYmSQxTF0lRMvAwMP0sBMWTJsi4ktcES1nUbOrrFCdkCTNyzUKPAqvhboKdU
 a8eQS2oJ67pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
   d="scan'208";a="375978934"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 27 May 2020 02:50:47 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdsi2-009By8-Ob; Wed, 27 May 2020 12:50:50 +0300
Date:   Wed, 27 May 2020 12:50:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Fengping Yu <fengping.yu@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 2/3] drivers: input: keyboard: Add mtk keypad driver
Message-ID: <20200527095050.GJ1634618@smile.fi.intel.com>
References: <20200527083137.56566-1-fengping.yu@mediatek.com>
 <20200527083137.56566-3-fengping.yu@mediatek.com>
 <20200527090048.wawdb5qkkhroyjtf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527090048.wawdb5qkkhroyjtf@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 27, 2020 at 11:00:48AM +0200, Marco Felsch wrote:
> On 20-05-27 16:31, Fengping Yu wrote:

> > +	irqnr = platform_get_irq(pdev, 0);
> > +	if (irqnr < 0)
> > +		return -irqnr;
> 		       ^
> 		       irqnr is already negative
> 
> > +	ret = devm_request_threaded_irq(&pdev->dev, irqnr,
> > +					NULL, kpd_irq_handler, 0,
> > +					MTK_KPD_NAME, keypad);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
> > +						irqnr, ret);
> 
> Still not alligned.
> 
> > +		return ret;
> > +	}

And on top, can't we use irq instead of irqnr?

-- 
With Best Regards,
Andy Shevchenko


