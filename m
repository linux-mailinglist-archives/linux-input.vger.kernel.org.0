Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C50343509
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 22:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhCUVnj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 17:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhCUVnP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 17:43:15 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07066C061574;
        Sun, 21 Mar 2021 14:43:14 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e33so7358127pgm.13;
        Sun, 21 Mar 2021 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6lljKH+lDULzki+SahZ8fivj9j6DdHhqc8M0ppuQ1QI=;
        b=AyKgGoek6Hmg/KrUL+ccMAcVdumd89yfTKyuIWEaW7q2f7Ref3BaaJ8MHta4APJE5V
         DlOfkaNtU42qASQQxmDAUiOh5mN9LCUGpD/VtKTE+EqSmMyzstmNIaaaMPWdLQZEsGOR
         QuNcILj1lHbLRqgVRHeIdCXl8+BZsMjEPNzgXV0mkefUjh5lfNsIG81rAu3cbOMbn8PG
         IyhDZ2uuoAddzDOAFwssWqjm5RSkoeZ77j4gnkJrLqdgTuDOUIF+9p7eJooXINftk9/T
         ojlajNnGD8K937lMQMBedYIb1VaQnoYqwo59/6YK8FnrzBPyCMX3BIDZKTfJyp+7S9D/
         bo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6lljKH+lDULzki+SahZ8fivj9j6DdHhqc8M0ppuQ1QI=;
        b=nJZkTiVhSvM4PeM3GZAbheZe/LHhcTN9g3XDnC7Ix1E0d0MfjqNVj8YoHH9AotV94a
         byScdw7KxWqz7au+C2VaWXyoXday7ff9tQTHY7nsFI0CVFiW8a63N7Gbb9u1jQYfxUoW
         bu27tKGyji89700H2Dw/LX0QJce1s+WYc9B9gUIT/fKDEq0n/EBsEsxIeZyv0REv4lpS
         +2nnJPfp3lTT1MM8O/cfGPyCQFrz8eIS3MolKm9Me4lVz83FSWNL03fgqJEhUbnewPDw
         jdPNB+mtOQV/pa134dDODaalQ1uqpHyFkU8HFEvMiRo/9kuspcz7nkgCP9rnBPWyQffQ
         fYqw==
X-Gm-Message-State: AOAM532JuBK1Cw8CoR6T+QPihmjlJYaozXZLtMsga1pzZWNrvNb8+A7l
        zrIcxQsS8QiMAJEzITZ+p6xOrA0DXmk=
X-Google-Smtp-Source: ABdhPJxmAXdgeEH0OYGHce8wWYJPHB2t+bQ33TrK/xzKbKY+gQkGD++ufpgbmKYSUEFPFybwuPrc8w==
X-Received: by 2002:a63:d704:: with SMTP id d4mr19742608pgg.221.1616362994422;
        Sun, 21 Mar 2021 14:43:14 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id 6sm12243826pfv.179.2021.03.21.14.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 14:43:13 -0700 (PDT)
Date:   Sun, 21 Mar 2021 14:43:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v3 7/9] Input: wacom_i2c - Add support for vdd regulator
Message-ID: <YFe97R+swzXmzn7b@google.com>
References: <20210321141049.148-1-alistair@alistair23.me>
 <20210321141049.148-8-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321141049.148-8-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 21, 2021 at 10:10:47AM -0400, Alistair Francis wrote:
> Add support for a VDD regulator. This allows the kernel to prove the
> Wacom-I2C device on the rM2.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 7aa0d1c3dbc9..00db516fa3de 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -13,6 +13,7 @@
>  #include <linux/irq.h>
>  #include <linux/input/touchscreen.h>
>  #include <linux/interrupt.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/of.h>
>  #include <asm/unaligned.h>
> @@ -56,6 +57,7 @@ struct wacom_i2c {
>  	struct i2c_client *client;
>  	struct input_dev *input;
>  	struct touchscreen_properties props;
> +	struct regulator *vdd;
>  	u8 data[WACOM_QUERY_SIZE];
>  	bool prox;
>  	int tool;
> @@ -203,11 +205,29 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  	struct wacom_features features = { 0 };
>  	int error;
>  
> +	wac_i2c = kzalloc(sizeof(*wac_i2c), GFP_KERNEL);
> +	if (!wac_i2c)
> +		return -ENOMEM;
> +
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>  		dev_err(&client->dev, "i2c_check_functionality error\n");
>  		return -EIO;

You are leaking memory here. Additionally, I do not see you removing the
original allocation below, so I think you end up with 2 instances of
structure wacom_i2c.

Thanks.

-- 
Dmitry
