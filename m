Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A57C2537F7
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 21:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgHZTNl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 15:13:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:44215 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgHZTNk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 15:13:40 -0400
IronPort-SDR: /5FNslLMNJKKlgAPm0EgKx3t8bQAck4aWk3SzAK60ISeacbPpodN9N4RrmA5bTgTbtfBE3ic+I
 kfM1cQk/E2Pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="157405298"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="157405298"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 12:13:39 -0700
IronPort-SDR: ZcGGLoixQZ6nULO+1Ko/Zg/Hsbn0nNA+uiLExJUfC7NTu1+bxpJB4Uy0qceUaHaGGq6pFoKzjz
 plj6MbxvFJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="329328664"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 12:13:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kB0rW-00BdUq-HG; Wed, 26 Aug 2020 22:13:34 +0300
Date:   Wed, 26 Aug 2020 22:13:34 +0300
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
Subject: Re: [PATCH 02/24] Input: gpio_keys - Simplify with dev_err_probe()
Message-ID: <20200826191334.GX1891694@smile.fi.intel.com>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826181706.11098-2-krzk@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 08:16:44PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -505,10 +505,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  				 */
>  				bdata->gpiod = NULL;

gpiod_get_optional()?
Do not see much context though (but please double check your series for these
kind of things).

>  			} else {
> -				if (error != -EPROBE_DEFER)
> -					dev_err(dev, "failed to get gpio: %d\n",
> -						error);
> -				return error;
> +				return dev_err_probe(dev, error, "failed to get gpio\n");
>  			}
>  		}
>  	} else if (gpio_is_valid(button->gpio)) {

-- 
With Best Regards,
Andy Shevchenko


