Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CBB1E5D24
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 12:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387839AbgE1K1m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 06:27:42 -0400
Received: from mga07.intel.com ([134.134.136.100]:51751 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387773AbgE1K1h (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 06:27:37 -0400
IronPort-SDR: nCJj2EsDDcKP8rrv4FU6w+rEKdFrHE9Jp0/W26jvUhY1VO3+96/Syah/EoRA3H8rsNo+JL8w/n
 h8pwfQwJ8aXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 03:27:29 -0700
IronPort-SDR: QUbWppTdipRmkK6s3TNjKXxDmOVRiFx+Anq76PGnZ8ysN5MS/bpNf3b8K3wf/qJwZvs4uvoVXl
 6VHpJrTTuyog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; 
   d="scan'208";a="291950293"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 28 May 2020 03:27:27 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jeFl4-009PNm-Uf; Thu, 28 May 2020 13:27:30 +0300
Date:   Thu, 28 May 2020 13:27:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Fengping Yu <fengping.yu@mediatek.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [RESEND PATCH v11 2/3] drivers: input: keyboard: Add mtk keypad
 driver
Message-ID: <20200528102730.GK1634618@smile.fi.intel.com>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
 <20200528090144.54033-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528090144.54033-3-fengping.yu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 28, 2020 at 05:01:47PM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This adds matrix keypad support for Mediatek SoCs.

...

> +config KEYBOARD_MTK_KPD
> +	tristate "MediaTek Keypad Support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST

> +	select CONFIG_REGMAP_MMIO

This is wrong.

> +	select INPUT_MATRIXKMAP

...

> +	ret = devm_add_action_or_reset(&pdev->dev, kpd_clk_disable,
> +				       keypad->clk);

I would leave on one line (only 81 characters).

> +	if (ret)
> +		return ret;

-- 
With Best Regards,
Andy Shevchenko


