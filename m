Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A246B42B3DF
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 05:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237326AbhJMD6D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 23:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbhJMD6C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 23:58:02 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78127C061570;
        Tue, 12 Oct 2021 20:56:00 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id c4so896525pls.6;
        Tue, 12 Oct 2021 20:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dmUH49RbtBd7SKbwm3iLQIp/4x2cgwKsfDezzoBD4k4=;
        b=ZinCMOIZgYBx591gLcXsB+xMDts/cEk0+i5XpVE/G5rMByN2AakdnZYcmw0aC0CBQ4
         9vDVlsWbAtycEa+oyg4qNnzA6WX5Rm9qULEKewZfT0jOyjxXz0uVMfIy+kShH/aK3uNg
         Vm4MI6eaKeZsRByIYFYdUrrFXWhb0YfxkRsACrXz3IyNvH4kM8GkKG2KNZUFiPagVbaG
         ojsX2pUdQc9R9mnsZXddHmOEHzFl06h3u2lDEubj45GMXJRKXtx4CPDhAaM6blOYBd60
         4FNr79Gs2fJSyThKsNSvSRf26OZmJaDj4FMVNznyNWRxUOO9TgC86U1luvuSbFKqaKbQ
         rJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dmUH49RbtBd7SKbwm3iLQIp/4x2cgwKsfDezzoBD4k4=;
        b=PfdjfCARvN7BQu7wYtTNs/7S76sppVyz09V+TcK289xi2y0nhFiriD6IzLoGhOF2MZ
         jFyMN9lRVeUxK3X5Cnf+vEkf9sMO4n/VbXJlQ2Frg9LWZ5xjt6/1ezH+McgTLiFNXdil
         I99lwG7NUYGmi5Fp+3o+fmmRYVGQhMpbgFQtUZ/w06O9DHYYkqo15dWAH3RgUOdaF+qu
         2R/KzGs0dr+FNyA/+IPYQEd+e19EhsMPlaurRizWUa64J5zXUKXoAo0kR7d6obt3oB3T
         ayDLwwOtgiJIA3nGj4R82J2s9Po5KkBRx7OfMCYqp1kWhYzhs0iH/m0yCDFwXXVPEy4H
         25LA==
X-Gm-Message-State: AOAM531+vMdX66+02iCOfEcZe9A/0bUaPcYdecFHT4KRbY3UTHdxQ+Vo
        7oMP4k63nR1bb4e4BUdJvhrE5rp25gQ=
X-Google-Smtp-Source: ABdhPJzf/a2CTxZ/6iMWBZaEPC0V3+F5JtY1UIpk+xBbwyYUlMCzBkwBPaYF1TFtWuZpTifCMmhH4g==
X-Received: by 2002:a17:90a:30b:: with SMTP id 11mr10669293pje.136.1634097359809;
        Tue, 12 Oct 2021 20:55:59 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:618d:87ca:8f95:87c0])
        by smtp.gmail.com with ESMTPSA id y24sm12293635pfo.69.2021.10.12.20.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 20:55:58 -0700 (PDT)
Date:   Tue, 12 Oct 2021 20:55:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH 2/2] Input: wacom_i2c - Use macros for the bit masks
Message-ID: <YWZYy8OsqJx1J8VA@google.com>
References: <20211009113707.17568-1-alistair@alistair23.me>
 <20211009113707.17568-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009113707.17568-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Sat, Oct 09, 2021 at 09:37:07PM +1000, Alistair Francis wrote:
> To make the code easier to read use macros for the bit masks.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 8d7267ccc661..6865342db659 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -14,6 +14,12 @@
>  #include <linux/interrupt.h>
>  #include <asm/unaligned.h>
>  
> +// Bitmasks (for data[3])
> +#define WACOM_TIP_SWITCH_bm         (1 << 0)
> +#define WACOM_BARREL_SWITCH_bm      (1 << 1)
> +#define WACOM_ERASER_bm             (1 << 2)
> +#define WACOM_BARREL_SWITCH_2_bm    (1 << 4)

We have BIT() for that.

By the way, do you know what is the good name for bit 3? I see it is
being used in:

        if (!wac_i2c->prox)
                wac_i2c->tool = (data[3] & 0x0c) ?
                        BTN_TOOL_RUBBER : BTN_TOOL_PEN;

        wac_i2c->prox = data[3] & WACOM_IN_PROXIMITY;

0x0c is (WACOM_ERASER | <something else>).

Also, I am a bit confused by this code, now that I look at it closer.
Are we saying that the tool type (eraser or something else) is set only
in first packet for contact/touch?

> +
>  // Registers
>  #define WACOM_COMMAND_LSB   0x04
>  #define WACOM_COMMAND_MSB   0x00
> @@ -110,10 +116,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>  	if (error < 0)
>  		goto out;
>  
> -	tsw = data[3] & 0x01;
> -	ers = data[3] & 0x04;
> -	f1 = data[3] & 0x02;
> -	f2 = data[3] & 0x10;
> +	tsw = data[3] & WACOM_TIP_SWITCH_bm;
> +	ers = data[3] & WACOM_ERASER_bm;
> +	f1 = data[3] & WACOM_BARREL_SWITCH_bm;
> +	f2 = data[3] & WACOM_BARREL_SWITCH_2_bm;
>  	x = le16_to_cpup((__le16 *)&data[4]);
>  	y = le16_to_cpup((__le16 *)&data[6]);
>  	pressure = le16_to_cpup((__le16 *)&data[8]);
> -- 
> 2.31.1
> 

How about the version of the patch below?

-- 
Dmitry

Input: wacom_i2c - use macros for the bit masks

From: Alistair Francis <alistair@alistair23.me>

To make the code easier to read use macros for the bit masks.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Link: https://lore.kernel.org/r/20211009113707.17568-2-alistair@alistair23.me
Patchwork-Id: 12547519
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_i2c.c |   19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 22826c387da5..d3ea9aa8a98c 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -6,6 +6,7 @@
  * <tobita.tatsunosuke@wacom.co.jp>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
@@ -14,6 +15,14 @@
 #include <linux/interrupt.h>
 #include <asm/unaligned.h>
 
+// Bitmasks (for data[3])
+#define WACOM_TIP_SWITCH	BIT(0)
+#define WACOM_BARREL_SWITCH	BIT(1)
+#define WACOM_ERASER		BIT(2)
+#define WACOM_BARREL_SWITCH_2	BIT(4)
+#define WACOM_IN_PROXIMITY	BIT(5)
+
+// Registers
 #define WACOM_CMD_QUERY0	0x04
 #define WACOM_CMD_QUERY1	0x00
 #define WACOM_CMD_QUERY2	0x33
@@ -99,10 +108,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	if (error < 0)
 		goto out;
 
-	tsw = data[3] & 0x01;
-	ers = data[3] & 0x04;
-	f1 = data[3] & 0x02;
-	f2 = data[3] & 0x10;
+	tsw = data[3] & WACOM_TIP_SWITCH;
+	ers = data[3] & WACOM_ERASER;
+	f1 = data[3] & WACOM_BARREL_SWITCH;
+	f2 = data[3] & WACOM_BARREL_SWITCH_2;
 	x = le16_to_cpup((__le16 *)&data[4]);
 	y = le16_to_cpup((__le16 *)&data[6]);
 	pressure = le16_to_cpup((__le16 *)&data[8]);
@@ -111,7 +120,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 		wac_i2c->tool = (data[3] & 0x0c) ?
 			BTN_TOOL_RUBBER : BTN_TOOL_PEN;
 
-	wac_i2c->prox = data[3] & 0x20;
+	wac_i2c->prox = data[3] & WACOM_IN_PROXIMITY;
 
 	input_report_key(input, BTN_TOUCH, tsw || ers);
 	input_report_key(input, wac_i2c->tool, wac_i2c->prox);
