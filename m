Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D9313648D
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730430AbgAJBHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:07:01 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35182 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbgAJBHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:07:01 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so174547plt.2;
        Thu, 09 Jan 2020 17:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iY9HPUKoX/Hm6L0XvQAQCFuB+ralB/tTyvX6oz4sSyE=;
        b=rAVFuHurzpKWGekzPHJ2b7/pb9cTC3IoY/mszFsjstNKhWKC30cq41v36JJEJ6gY5Q
         1Wr0jJ95KfUIsJ0KJgvZtd+/zl0mskMobGnjkDZPZwcZmb0xyO9aHOzKjQ0jQcfebQLM
         KIKoNiPDDNTyB05i24iugQegc8boKsHf4e433yk+01Xihe76ZTfS+uMRmnIbgj5CLnOR
         3nlxw1Yq7tVcsVd7kDlT2IZ1uwR/8m5NdtW8JoUmbz6C3b+V9GUT6I6YHBmfbsk2WVRe
         rTYnLenz+WsAQ1+2PffOuPQN5ec5xCJ3J1wgm6vMo8CXdoNCAdNO6rIeJAum30TWUGha
         OnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iY9HPUKoX/Hm6L0XvQAQCFuB+ralB/tTyvX6oz4sSyE=;
        b=aE78v+P9TZR/3m6fxQ1+RzLqt+q+al6zP0Ea+uzOsDPU3osuiKhK3FE0EVILUnAMPx
         oIgLfuCH/alOrPXXjwKXU4H31je87+BqElo+IuDprrgRvddN1HJgoiKjHzx7k5Dg+ICR
         nk4wafKhth5agfim8NN6lyyooaTDVVsYzebo/m4wxpjpPk2VpVsKD4WfaDh3mnApmJn9
         78tjG1Zq+wIpodEQ7KZK0rsKMtZhmlWcSJ3j1KKlvMnSoNyTHVQgQuV60GJUunW2+7Lz
         HNwPkjXzqsf+BMgZoJ3CYnMKxG6o5qiujBNLdO+j2V9DK5Cr4KA9AQ3LI+dA3Er66rr9
         dJVw==
X-Gm-Message-State: APjAAAVGHtCsNYJ1KM1FXZnN72OZtGo156uv0RglkUCrDTwLKAYvtDBi
        f0TN7JLM9NQ5fc3jWeHCGB0=
X-Google-Smtp-Source: APXvYqznUnpq5Q41CcGKH2wlnPMdn2cWAkPT/kGYShirZo6kLYSYeikmF89E0pRNK2MVP6VlX7mORg==
X-Received: by 2002:a17:902:9b86:: with SMTP id y6mr872613plp.253.1578618420509;
        Thu, 09 Jan 2020 17:07:00 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q21sm257545pff.105.2020.01.09.17.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:07:00 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:06:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/6] Input: edt-ft5x06 - alphabetical include reorder
Message-ID: <20200110010658.GL8314@dtor-ws>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108111050.19001-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 12:10:46PM +0100, Marco Felsch wrote:
> It seems that the include order is historical increased and no one takes
> care of it. Fix this to align it with the common rule to be in a
> alphabetical order.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index b87b1e074f62..e1b31fd525e2 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -13,22 +13,23 @@
>   *    http://www.glyn.com/Products/Displays
>   */
>  
> -#include <linux/module.h>
> -#include <linux/ratelimit.h>
> -#include <linux/irq.h>
> -#include <linux/interrupt.h>
> -#include <linux/input.h>
> -#include <linux/i2c.h>
> -#include <linux/kernel.h>
> -#include <linux/uaccess.h>
> -#include <linux/delay.h>
>  #include <linux/debugfs.h>
> -#include <linux/slab.h>
> +#include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/input.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> -#include <asm/unaligned.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/ratelimit.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include <asm/unaligned.h>
>  
>  #define WORK_REGISTER_THRESHOLD		0x00
>  #define WORK_REGISTER_REPORT_RATE	0x08
> -- 
> 2.20.1
> 

-- 
Dmitry
