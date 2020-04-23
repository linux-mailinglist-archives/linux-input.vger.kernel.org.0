Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771981B596C
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 12:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgDWKlH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Apr 2020 06:41:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:8397 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgDWKlH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Apr 2020 06:41:07 -0400
IronPort-SDR: 91FP6AM55qA9ubi+Nw316rDmXsY1gcBi29KTMCJ+3mKIMuoJJOEC1wLJ9ACk1nSLXtjBC3te7J
 /i53Wj89f4Zg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 03:41:06 -0700
IronPort-SDR: Kx7K6p4/N5TZr/15qVHfz7t/YfWa8qfU8ew8siy/+r4y7JvNcT3POh2yqW11AOx+oW2pMXXyru
 ohidmBdCH2uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="291141993"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 23 Apr 2020 03:41:04 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jRZI3-002cOT-JJ; Thu, 23 Apr 2020 13:41:07 +0300
Date:   Thu, 23 Apr 2020 13:41:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Fengping yu <fengping.yu@mediatek.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        wsd_upstream@mediatek.com, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/3] drivers: input: keyboard: add mtk keypad driver
Message-ID: <20200423104107.GO185537@smile.fi.intel.com>
References: <20200423011958.30521-1-fengping.yu@mediatek.com>
 <20200423011958.30521-4-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423011958.30521-4-fengping.yu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 23, 2020 at 09:20:02AM +0800, Fengping yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 

This misses the commit message. It's a show stopper for such patches.
Read this [1].

[1]: https://chris.beams.io/posts/git-commit/

...

> +#define KPD_DEBOUNCE_MASK	GENMASK(13, 0)
> +#define KPD_DEBOUNCE_MAX	256000

Is there any unit in which debounce time is being measured? Add it as a suffix
to the definition, if it's possible.

...

> +#define BITS_TO_U32(nr)	DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(u32))

This already defined in bits.h.

...

> +	keypad->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(keypad->base)) {

> +		dev_err(&pdev->dev, "Failed to get resource and iomap keypad\n");

This is duplicate noisy message, please remove.

> +		return PTR_ERR(keypad->base);
> +	}

...

> +	writew(keypad->key_debounce * 32 / 1000 & KPD_DEBOUNCE_MASK,

Perhaps one pair of parentheses is needed to make logic clear.

(Yes, I remember I commented on this in earlier versions where it was many
 parentheses around above calculations, but you have to use common sense as well)

> +		keypad->base + KP_DEBOUNCE);

-- 
With Best Regards,
Andy Shevchenko


