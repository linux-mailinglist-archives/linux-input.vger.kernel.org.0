Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6474B97FB1
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 18:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfHUQJl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 12:09:41 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34432 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfHUQJl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 12:09:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id d3so1586088plr.1
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wOS0XsuioRQ5jfgbyZ60BOQMTCfok/qmKANuYxPzuAs=;
        b=YVDnULprI2vnIoDIEZ4mtNkbbR8ROckm8uPhhhn3rKTidR22tOR2KqmKdPMzUJPP+N
         j3bQM59rmU5v0tXVs+h8VqAWrSX9p51JgZUAg/4tUwBuMISeqh7n0CcgURtV4ROLw6v2
         YJVFWCU1gYcdCmoCW87r7oU0GX+wv3+OjJMfZofmcJEx5VYJlhEcd38wjUv4TNb/bqWQ
         SzqB3VtfnxIVhhHilZo2TTYHOLWXAIi8De+MIc7PLlc8H0WCMSf/BoGapg3iPR9AAc7j
         oz/So1D54LtHfd9AKMuWq1HM9cjh1ESnl5hvDjZafO9+ouEe7oMmUM3ApLs4SBSD2SMt
         KabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wOS0XsuioRQ5jfgbyZ60BOQMTCfok/qmKANuYxPzuAs=;
        b=DwSKsE9/+253SY7To1ggCp/j/qf2mHryxIwzbHjeYJTIdLAGVr7Xx1wFBKC5dc0m25
         qGApdjKCwY3JkLmpi8Wy10jtSL1fm/AYhl+sTBBGqfxfngFkkv1EFaradWQA8XgtUjXB
         CYiz6hhtejFDxGIMvU/7H0jNABhzHjhCVb8SHa4tTIfNCJIDSqn1+598JSnuw2L8RTej
         vMtpVJw6162o5P1cHiNNgVavUhI7Hoyya9qCVI05PFwt2Ls/ZCDof+dnctlN/PRzYflX
         TEWoDBaJp4lsanP8skYcHnjPIYcj6tj8LMtQCm7b2vlDx7/92J80faQwqhDZCMbCj1G5
         kiPw==
X-Gm-Message-State: APjAAAUAru3cdquu4j0DbFDZQSaRxEH/LIRIDSxRyT6touTVKXUPUdAB
        Jg8jcYqxzEelEbUSRtQH1hI=
X-Google-Smtp-Source: APXvYqxhpLgWGcJlQl0n/pYZCkFD2+F0bwDmwSb57R+vJroS6bgYb/2crQt4p6okPDjzHDvcH1actA==
X-Received: by 2002:a17:902:654f:: with SMTP id d15mr32243995pln.253.1566403780172;
        Wed, 21 Aug 2019 09:09:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q8sm284903pjq.20.2019.08.21.09.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 09:09:38 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:09:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] Input: tsc2007 - use GPIO descriptor
Message-ID: <20190821160936.GB76194@dtor-ws>
References: <20190821085503.8062-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821085503.8062-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Wed, Aug 21, 2019 at 10:55:03AM +0200, Linus Walleij wrote:
> This switches the TSC2007 to use a GPIO descriptor to read
> the pendown GPIO line.
> 
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/input/touchscreen/tsc2007.h      |  4 +++-
>  drivers/input/touchscreen/tsc2007_core.c | 14 +++++++-------
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
> index 91c60bf6dcaf..0306c38b56c7 100644
> --- a/drivers/input/touchscreen/tsc2007.h
> +++ b/drivers/input/touchscreen/tsc2007.h
> @@ -49,6 +49,8 @@
>  #define READ_X		(ADC_ON_12BIT | TSC2007_MEASURE_X)
>  #define PWRDOWN		(TSC2007_12BIT | TSC2007_POWER_OFF_IRQ_EN)
>  
> +struct gpio_desc;
> +
>  struct ts_event {
>  	u16	x;
>  	u16	y;
> @@ -69,7 +71,7 @@ struct tsc2007 {
>  	int			fuzzy;
>  	int			fuzzz;
>  
> -	unsigned int		gpio;
> +	struct gpio_desc	*gpiod;
>  	int			irq;
>  
>  	wait_queue_head_t	wait;
> diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
> index 3b80abfc1eca..5d9c6128622e 100644
> --- a/drivers/input/touchscreen/tsc2007_core.c
> +++ b/drivers/input/touchscreen/tsc2007_core.c
> @@ -23,7 +23,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/i2c.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/platform_data/tsc2007.h>
>  #include "tsc2007.h"
>  
> @@ -226,7 +226,7 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct tsc2007 *ts = i2c_get_clientdata(client);
>  
> -	return !gpio_get_value(ts->gpio);
> +	return !gpiod_get_value(ts->gpiod);

We need to drop the negation here and make sure DTS specifies proper
polarity for GPIOs.

Thanks.

-- 
Dmitry
