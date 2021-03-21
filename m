Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F2E343485
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 21:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhCUUIa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 16:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhCUUIZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 16:08:25 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4F3C061574;
        Sun, 21 Mar 2021 13:08:23 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so7039269pjb.4;
        Sun, 21 Mar 2021 13:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nf7QAxQV2jN/UCZ4NjE9e/nPP99CCDIssOlWL0oskbw=;
        b=RzMQWnzk2rEZWMNOTXT97ZqN2Ylk4foVrosj12JLxo28s5HrIu0qCcZDC4IPceD6Zx
         WYz29E7COfhGKTN3IRZom3cmEtu1aTGaL4C113qNSyeJnSNoCvI3RI8FxwFgFzNV8IcM
         U8EQznTxM7TcoEO+rK7Yup1YC0s/TNiKPZvYKx+DojK8WUFgb3rboO7XZ4YZXgh+qgQk
         oowoieYYdD8Pz/SKYb+Vol6vkx59yBquXooJjyv8dah+ZdWMniOBlQd+HQSadBExoDoW
         ccC9vDXsLoXgoXEjC4jrqjrQU4CqgV7KU8vENkbFSAu3/pRnLngKzV2XZ2xPZ3fyG1Yu
         7/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nf7QAxQV2jN/UCZ4NjE9e/nPP99CCDIssOlWL0oskbw=;
        b=BUuzS5A7Gd6hvobDtdO2U3CNT9mDinUqwqTRbUSyqMG4ppWh5IKYNUQM/hDAc/aKpa
         wPlSH32Ak/TNYe/KEseXpku6eKf9+n7ffqh8ZGq+6xNE64/wXmotZZs3OH7zD4yxKSBV
         VcDWDWy0dJ7SyABGSYhtzx0aypft8imiA0uXMTRNHfRco7I63lzRfNZSjh83YODPr4bN
         tRgaoJAwQJwtX7qoXxju15V2tdv+li9ySm3ZO4EjI5xsgKkxoW30h1VcdwQKxStZXMKt
         DgANSY6anvPrqEpixYNRKxBr/75ptZQor/LxglqkfSnFt7m7ijjhTOe5dXEPuYt+Fb8m
         J+4g==
X-Gm-Message-State: AOAM532dnMCiMlT++v/I/jlxEpdTMlspHmxdTynGX3HAvXNRv4ZK8vWJ
        D06BMRi0CrzilbMwcJQvryg=
X-Google-Smtp-Source: ABdhPJz0TeFvfjyMQ7p9iOsnoL8Kx36KRMksE9sAsmy1eFfJIOoOfCSLQtltyIp1xWYdY4T+A4+MBA==
X-Received: by 2002:a17:903:31c6:b029:e5:d0a4:97cc with SMTP id v6-20020a17090331c6b02900e5d0a497ccmr23590368ple.52.1616357303517;
        Sun, 21 Mar 2021 13:08:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id f2sm11768711pfq.129.2021.03.21.13.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 13:08:22 -0700 (PDT)
Date:   Sun, 21 Mar 2021 13:08:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v3 4/9] Input: wacom_i2c - Add touchscren properties
Message-ID: <YFentDIVXUmUT9Ya@google.com>
References: <20210321141049.148-1-alistair@alistair23.me>
 <20210321141049.148-5-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321141049.148-5-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 21, 2021 at 10:10:44AM -0400, Alistair Francis wrote:
> Connect touchscreen properties to the wacom_i2c.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index fc0bf583d33b..9b2ed0463d09 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -11,6 +11,7 @@
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/irq.h>
> +#include <linux/input/touchscreen.h>
>  #include <linux/interrupt.h>
>  #include <linux/of.h>
>  #include <asm/unaligned.h>
> @@ -33,6 +34,7 @@ struct wacom_features {
>  struct wacom_i2c {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> +	struct touchscreen_properties props;
>  	u8 data[WACOM_QUERY_SIZE];
>  	bool prox;
>  	int tool;
> @@ -188,6 +190,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  	__set_bit(BTN_STYLUS2, input->keybit);
>  	__set_bit(BTN_TOUCH, input->keybit);
>  
> +	touchscreen_parse_properties(input, true, &wac_i2c->props);
>  	input_set_abs_params(input, ABS_X, 0, features.x_max, 0, 0);
>  	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
>  	input_set_abs_params(input, ABS_PRESSURE,

Please also use touchscreen_report_pos() so flipping and swapping of
axes also works.

Thanks.

-- 
Dmitry
