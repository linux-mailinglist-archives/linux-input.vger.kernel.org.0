Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D21E2537E9
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 21:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgHZTMX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 15:12:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:52611 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726723AbgHZTMX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 15:12:23 -0400
IronPort-SDR: W0jvpSkNuJYoPmQXNLmemNpDwS2+QhPOo3m2u8D16S4dMm28TFmdyhv+G4rShD4Ws+jZaUl7Ht
 eP2lziZw34+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="217922063"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="217922063"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 12:12:22 -0700
IronPort-SDR: msCSdz+/zf0pVqfRitTQX+FMRwmN2/PH1nw9Z/bKyLxmU+6ZtpIS87VyiPBUl8MkHsD8BBkjES
 N8xSlaMcPOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="329328323"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 12:12:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kB0qH-00BdTy-7i; Wed, 26 Aug 2020 22:12:17 +0300
Date:   Wed, 26 Aug 2020 22:12:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 01/24] Input: bcm-keypad - Simplify with dev_err_probe()
Message-ID: <20200826191217.GW1891694@smile.fi.intel.com>
References: <20200826181706.11098-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 08:16:43PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

> +++ b/drivers/input/keyboard/bcm-keypad.c
> @@ -379,11 +379,9 @@ static int bcm_kp_probe(struct platform_device *pdev)
>  	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
>  	if (IS_ERR(kp->clk)) {
>  		error = PTR_ERR(kp->clk);
> -		if (error != -ENOENT) {
> -			if (error != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Failed to get clock\n");
> -			return error;
> -		}
> +		if (error != -ENOENT)
> +			return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
> +
>  		dev_dbg(&pdev->dev,
>  			"No clock specified. Assuming it's enabled\n");

Shouldn't be this rather switch to devm_clk_get_optional() + dev_err_probe?

>  		kp->clk = NULL;

-- 
With Best Regards,
Andy Shevchenko


