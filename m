Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD16377981
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 02:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhEJAXU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 May 2021 20:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhEJAXU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 May 2021 20:23:20 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB2AC061573
        for <linux-input@vger.kernel.org>; Sun,  9 May 2021 17:22:15 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id z16so12100302pga.1
        for <linux-input@vger.kernel.org>; Sun, 09 May 2021 17:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mh71sIa9IV9CspUI1y6O260LhUj1PmeIYgoJfTR1kYw=;
        b=S9cYI3Mq9H1tWbn/fjiTiLWC1efadqO6vL13TPjPJph2ZMoKHvJmZA0HTP1iCHXCxL
         wfJADyGuKNMbP6GB/UqWsegv4Pldf5Cp3Ttms+w+qneGgOVpgmk7358NwE5OHHt6q4Cu
         gwyQyntcdDljhdDkPIQTYGYa1xhkZhgMcj6/ighIWGjlpYwcLhO4UHf3fHcuFzkEsBjb
         iMGEVsJyog6/cMvfQasDsPYXukl+ShAVf5jMh7Q9S+VixdcmQ6z9v5OjWpORifgOezoS
         t5NUclsTfK6+OoaPbwWY0lZDXBf/7s+sNYtPGzJnKrIctzEkJk1mswGbKJNRiewkKMAE
         Jg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mh71sIa9IV9CspUI1y6O260LhUj1PmeIYgoJfTR1kYw=;
        b=tsfWgV6MBYV/IgiUYfyQGexKPFB+5p/ChZ96V8sEATCbLI/4wyB78ckNQqkBke0YVu
         du0kwyG/Jqs7opEu6Ne805l1h6jiYlyUetOgV9OSfyia+abfszIu1nlZhwWvfVbyagUe
         kzNGe6XU9nLFe/DhbwQjsMpd3ZCcSFREi6CbeYnRCOUZhezHVGLSYCc7DqFh9KnN8R7Q
         0+9nSkOJ9vwa+TcWSgGYRJIOr7rujzKaK68d1jVsml2BxXKoyfu6Gi3K0yQS4NmQn3xH
         VKhNtHdbTSW+5bFvPMau/sZIPhDjNySO+q8r+V0Sjtspsi5/dvEN3K7kvghTnKWvXC1U
         P5/w==
X-Gm-Message-State: AOAM530ZCTFkIBoWsWBx2qwtdOBUF9gwkQLjp6eqaLRosUVzX305iv8R
        lYZvOu2J0mMVa8NFftJwRr0=
X-Google-Smtp-Source: ABdhPJxVpjiRI0wbYJ31rnhVB2xFz+m8sABp5iCgh6XRK6MYY3oRmpYpq7xaB5vYDvWwRFPdxjROUA==
X-Received: by 2002:a62:7704:0:b029:28e:358e:fa8b with SMTP id s4-20020a6277040000b029028e358efa8bmr22651152pfc.38.1620606135172;
        Sun, 09 May 2021 17:22:15 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:681e:f810:27a7:e4f9])
        by smtp.gmail.com with ESMTPSA id c6sm17062118pjs.11.2021.05.09.17.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 17:22:14 -0700 (PDT)
Date:   Sun, 9 May 2021 17:22:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
Message-ID: <YJh8s5rU2VE+DyQz@google.com>
References: <20210509233830.359134-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509233830.359134-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Mon, May 10, 2021 at 01:38:30AM +0200, Linus Walleij wrote:
> This edge setting should come from the device tree not
> the driver. Also, most device trees sets this to the
> falling edge, which is contradictory to what is hardcoded.

I see there are 2 possibilities:

1. The driver has never worked
2. DT interrupt annotation is wrong.

It would be nice to know if we are dealing with 1 or 2, as in case of #2
we need to adjust DTSes before this patch can be applied.

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/input/touchscreen/tsc200x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
> index ce2fe30d6b8a..5f0ce663a2dc 100644
> --- a/drivers/input/touchscreen/tsc200x-core.c
> +++ b/drivers/input/touchscreen/tsc200x-core.c
> @@ -540,7 +540,7 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
>  
>  	error = devm_request_threaded_irq(dev, irq, NULL,
>  					  tsc200x_irq_thread,
> -					  IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					  IRQF_ONESHOT,
>  					  "tsc200x", ts);
>  	if (error) {
>  		dev_err(dev, "Failed to request irq, err: %d\n", error);
> -- 
> 2.30.2
> 

Thanks.

-- 
Dmitry
