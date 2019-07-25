Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2DD74E36
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 14:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387876AbfGYMhA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 08:37:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51146 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387879AbfGYMg5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 08:36:57 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so44872308wml.0
        for <linux-input@vger.kernel.org>; Thu, 25 Jul 2019 05:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Z0gdMKdD94PaZEiSEbq5FRYwspNf12+Jpdjrcz+igjs=;
        b=UOm97SebxmPdgl0pmldZmg8Oz9EPHMw3MAJyv62yrULXqoG6qZx3HNBEb44nK+PtYT
         UKisK4WiP+GY8up2suNgz7nly/rRahlg3SCAYRKIdQ/7fNota8uVgQ+n2VY6h0yamY/i
         DA3+HiWbYtKHbLG+DEgWR9IIJFYe1xBF6iwYMcVdKGf6qTyrKFSBCYuES8Am+m9oKotX
         AcZRUEkIM3Y/7mErgVtbn+lTm92UAzjQMqAyq9wEfc27OHOhws6lbv7NgaF0n6iw2SbT
         hKmKHEs+KOQv/3NHjqn251CVQpIbUCNReGuh/xzsXk4eYp59INqz8sjz/dJ/5wjiywDM
         foJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Z0gdMKdD94PaZEiSEbq5FRYwspNf12+Jpdjrcz+igjs=;
        b=Hlml6s6d0MdQ5GuBuHPoWtktsdsDBGLzuPeHJYt/1lguGf1W+to/1CqtOcGVS6ENGv
         cRnzJVB4bwfkH1h82AH1+h3J72C1tRH949p7fDZKNyMSnSDyzt1yRB1GwhFSNxNU+7KN
         AEHvJuDvb1lY6nfvwQTlfERlbaq6zXtY3qst6AciBKGvJwgsHl9v9pyvBBgs77PQgRve
         B8HhY7TsPVEcvZvNthYO9fpNilbf2gwSS9Cv/bSTc9t5woL7XjaiLcb8MEcThcpcExaD
         mC99PdxHIRNwQHJbcpSbTe/mDhtYZ3By6B67/OTjObXAT7ytPSrZGGTK1NnlwNFQYVgq
         21Ig==
X-Gm-Message-State: APjAAAXGa1Hm4Wjct16dzOx8KMC0VQRoHmDm4WwzRaJ4RD7k8xlIWqcb
        mRVdcKJ7f9S5+IQEsHsxpQ1irw==
X-Google-Smtp-Source: APXvYqwCnApL6niVq29NHdbsI3OfsLXQ/OAqwUx7Tk9MTc7XOgQrdsvgvFZgo+WQ4jJrcugukz37gA==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr81170437wma.78.1564058215312;
        Thu, 25 Jul 2019 05:36:55 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id o7sm22393999wru.58.2019.07.25.05.36.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 05:36:54 -0700 (PDT)
Date:   Thu, 25 Jul 2019 13:36:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mfd: mc13xxx: Add mc34708 adc support
Message-ID: <20190725123641.GJ23883@dell>
References: <20190717222602.2912-1-lukma@denx.de>
 <20190717222602.2912-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190717222602.2912-2-lukma@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 18 Jul 2019, Lukasz Majewski wrote:

> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The mc34708 has an improved adc. The older variants will always convert
> a fixed order of channels. The mc34708 can do up to eight conversions
> in arbitrary channel order. Currently this extended feature is not
> supported. We only support touchscreen conversions now, which will
> be sampled in a data format compatible to the older chips in order
> to keep the API between the mfd and the touchscreen driver.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v4:
> - None
> 
> Changes for v3:
> - None
> 
> Changes for v2:
> - Change the return code patch when the mc13xxx ADC is performing conversion
> - Introduce new include/linux/mfd/mc34708.h header file for mc34708 specific
>   defines
> 
> Changes from the original patches:
> - ADC conversion functions prototypes added to fix build error
> - Adjustments to make checkpatch clean (-ENOSYS, line over 80 char)
> 
> This patch applies on top of v5.2 - SHA1: 0ecfebd2b52404ae0c54a878c872bb93363ada36
> ---
>  drivers/mfd/mc13xxx-core.c  | 102 +++++++++++++++++++++++++++++++++++++++++++-
>  drivers/mfd/mc13xxx.h       |   3 ++
>  include/linux/mfd/mc34708.h |  37 ++++++++++++++++
>  3 files changed, 141 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/mfd/mc34708.h
> 
> diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
> index 1abe7432aad8..01473d6fda21 100644
> --- a/drivers/mfd/mc13xxx-core.c
> +++ b/drivers/mfd/mc13xxx-core.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/core.h>
> +#include <linux/mfd/mc34708.h>
>  
>  #include "mc13xxx.h"
>  
> @@ -45,6 +46,8 @@
>  
>  #define MC13XXX_ADC2		45
>  
> +#define MC13XXX_ADC_WORKING		(1 << 0)

BIT(0) ?

>  void mc13xxx_lock(struct mc13xxx *mc13xxx)
>  {
>  	if (!mutex_trylock(&mc13xxx->lock)) {
> @@ -198,22 +201,30 @@ static void mc34708_print_revision(struct mc13xxx *mc13xxx, u32 revision)
>  			maskval(revision, MC34708_REVISION_FAB));
>  }
>  
> +static int mc13xxx_adc_conversion(struct mc13xxx *, unsigned int,
> +				  unsigned int, u8, bool, unsigned int *);
> +static int mc34708_adc_conversion(struct mc13xxx *, unsigned int,
> +				  unsigned int, u8, bool, unsigned int *);
> +
>  /* These are only exported for mc13xxx-i2c and mc13xxx-spi */
>  struct mc13xxx_variant mc13xxx_variant_mc13783 = {
>  	.name = "mc13783",
>  	.print_revision = mc13xxx_print_revision,
> +	.adc_do_conversion = mc13xxx_adc_conversion,
>  };
>  EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13783);

I'd prefer to keep the call-back functions as close to zero as
possible.

It would be better to turn mc13xxx_adc_conversion() in to the catch
function choose an execution route based on some platform matching.

If you could do the same for print_revision too, that would be even
better.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
