Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEBB34D912
	for <lists+linux-input@lfdr.de>; Mon, 29 Mar 2021 22:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2UeI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Mar 2021 16:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhC2Udn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Mar 2021 16:33:43 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B692AC061574;
        Mon, 29 Mar 2021 13:33:42 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so8319343pjb.0;
        Mon, 29 Mar 2021 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5JWGpm2Luw9oA1XrYw8G4eVqUmBGNX4VUAL1U9HUofM=;
        b=VY6h3tpEWizPKlvA7CBSflg8EXIOPRjaySIAo+boILZIUfNGhMpoPTGpsWT0sWEbv3
         lytJCj+65unjb3jJHIMPRddLnlH/NBTRhea/BwtmtNCSTc4aftw0S76vSOenAEE3Vs88
         HG7RU/iHInlxdB3TPsvhTn9VNDq3/2PWoyTV1rilQpzN2N+P5zlzhbMulO4JF5GZZa7E
         H4c2oR1eSJixpINYZAy4SWPKu2VLkJSdtve4i76tdp8y8pqgSXbnw9L8QQHcQ8rY6yyg
         NNaDQTUH4DlDxtHLCWepTog59y3X88RGnJouE354JukTcW7Ngn2VqyvhJvmURVA2FSSp
         Rbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5JWGpm2Luw9oA1XrYw8G4eVqUmBGNX4VUAL1U9HUofM=;
        b=EF4JZTthN+eJBReaWRZyylMhon8/YfbRjAm/KlqF82T+qDQNmCrsDGfSrYrBZTzlIl
         742UGg8UIfi9NZhqH15qdD0LhhgiGA+hNk7BspxCJIUusLLt/3B1iLTb30figPYNcD7W
         +I1Rm23QvCA/tUW82KhQCrfb21Zd0C2Un82r7avadpE5wx/Ki6cFpJpqkktQEbaop1iX
         Ly6aPAuOcxvR4BQFyzdPyJqT2tXA5hh/VT+lFXF6VO23UNxYGcVF6omchR2B4FOBNiYJ
         snsUg0I37Q+H5oFaBTffdT1pA+w3RSXdbITo1Q6kICjaKxglN/+h+uAO39Lxf2rdCDKQ
         S+mA==
X-Gm-Message-State: AOAM532ZLCV+56zzpaCz9zqIfqot7+umFuJx5SWYTNHiGQtkc35CIMyN
        sNvKVY7ca4vAXYVmDPhlFp0=
X-Google-Smtp-Source: ABdhPJxxBdmZ4Of72OqcTVC5WmVMBPDxwy0e8dm3jNMkc7FK7ywP1A1NxxZkPxbK5AkOMCJnBtENaw==
X-Received: by 2002:a17:902:d64a:b029:e6:30a6:64e3 with SMTP id y10-20020a170902d64ab02900e630a664e3mr30759214plh.28.1617050022009;
        Mon, 29 Mar 2021 13:33:42 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a82a:a913:988c:7480])
        by smtp.gmail.com with ESMTPSA id t1sm18202660pfc.173.2021.03.29.13.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 13:33:41 -0700 (PDT)
Date:   Mon, 29 Mar 2021 13:33:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair22.me>
Subject: Re: [PATCH v4 07/10] Input: wacom_i2c - Add support for reset control
Message-ID: <YGI5or9QsfbONo2e@google.com>
References: <20210326015229.141-1-alistair@alistair23.me>
 <20210326015229.141-7-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326015229.141-7-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Thu, Mar 25, 2021 at 09:52:27PM -0400, Alistair Francis wrote:
> From: Alistair Francis <alistair@alistair22.me>
> 
> Signed-off-by: Alistair Francis <alistair@alistair22.me>
> ---
> v4:
>  - Initial commit
> 
>  drivers/input/touchscreen/wacom_i2c.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 84c7ccb737bd..28004b1180c9 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -55,6 +55,7 @@ struct wacom_features {
>  struct wacom_i2c {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> +	struct reset_control *rstc;
>  	struct touchscreen_properties props;
>  	u8 data[WACOM_QUERY_SIZE];
>  	bool prox;
> @@ -175,6 +176,8 @@ static int wacom_i2c_open(struct input_dev *dev)
>  	struct wacom_i2c *wac_i2c = input_get_drvdata(dev);
>  	struct i2c_client *client = wac_i2c->client;
>  
> +	reset_control_reset(wac_i2c->rstc);

Why does this device need to be reset on every open compared to doing it
in probe?

> +
>  	enable_irq(client->irq);
>  
>  	return 0;
> @@ -193,6 +196,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  {
>  	struct wacom_i2c *wac_i2c;
>  	struct input_dev *input;
> +	struct reset_control *rstc;
>  	struct wacom_features features = { 0 };
>  	int error;
>  
> @@ -201,6 +205,12 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  		return -EIO;
>  	}
>  
> +	rstc = devm_reset_control_get_optional_exclusive(&client->dev, NULL);
> +	if (IS_ERR(rstc)) {
> +		dev_err(&client->dev, "Failed to get reset control before init\n");
> +		return PTR_ERR(rstc);
> +	}

I think majority users will have this controller reset line connected to
a GPIO. I briefly looked into reset controller code and I do not see it
supporting this case. How is this device connected on your board?

> +
>  	error = wacom_query_device(client, &features);
>  	if (error)
>  		return error;
> @@ -214,6 +224,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  
>  	wac_i2c->client = client;
>  	wac_i2c->input = input;
> +	wac_i2c->rstc = rstc;
>  
>  	input->name = "Wacom I2C Digitizer";
>  	input->id.bustype = BUS_I2C;
> -- 
> 2.31.0
> 

Thanks.

-- 
Dmitry
