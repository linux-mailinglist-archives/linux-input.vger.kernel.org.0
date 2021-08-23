Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DA53F5038
	for <lists+linux-input@lfdr.de>; Mon, 23 Aug 2021 20:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhHWSP5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Aug 2021 14:15:57 -0400
Received: from mail-oo1-f45.google.com ([209.85.161.45]:42548 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhHWSP4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Aug 2021 14:15:56 -0400
Received: by mail-oo1-f45.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so5680971ooq.9;
        Mon, 23 Aug 2021 11:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5oD4U2sM5eushDUG8RX15S68sy802nG0Vq5oU+SDopo=;
        b=YpwqKJ2BL9yU8ucGyIjNsSXEc+fQHXj6SSjaUyMKghHIxZupZlqLRhOYHR/1LvGOBv
         Wp9CQz5qZPfpJhSiXQiRKqAK2a+7K53nAHFvCvf8WEexkmlpaMj6VR/uAvwJUxvrZOZA
         1QopBJyPnuerYIiUDoj1NbmOnPrn1I41fSWijzywUs6pwP9g5kdRPQahj2VSGeBRom7g
         Ai5KLSeMGbLkKSQ1HlnlHUeLUrbfj+kugnwIvA+fKWKwnOWG75eDDP70zDzBA9jR/q9+
         N00F9j2ORlqm6iVc+QMvglENGmJcVmT0JLglccfqzY76B76uhsrTS0LBGAgTDceRTBv/
         yVFA==
X-Gm-Message-State: AOAM533YshCna1E1oEQJUTx60rYiClBL0U5ereRJz+Lu50m9W8E7NbN1
        bcWEJ8r9VZprWW9AGJnILw==
X-Google-Smtp-Source: ABdhPJxada6ILqWk/igshNxxe0Z3oTkb37FNP3Nw2H73kKBkd95Py2y1LqQtCp5R+s8Ata15Mnd2RQ==
X-Received: by 2002:a4a:98e1:: with SMTP id b30mr26744530ooj.34.1629742513317;
        Mon, 23 Aug 2021 11:15:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e2sm3984766otk.14.2021.08.23.11.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 11:15:12 -0700 (PDT)
Received: (nullmailer pid 2454645 invoked by uid 1000);
        Mon, 23 Aug 2021 18:15:11 -0000
Date:   Mon, 23 Aug 2021 13:15:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com, linux-kernel@vger.kernel.org,
        alistair23@gmail.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 09/11] Input: wacom_i2c - Allow flipping the values
 from the DT
Message-ID: <YSPlr0X+3B9nxHW1@robh.at.kernel.org>
References: <20210818154935.1154-1-alistair@alistair23.me>
 <20210818154935.1154-10-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818154935.1154-10-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 19, 2021 at 01:49:33AM +1000, Alistair Francis wrote:
> Allow the device tree properties to flip the tilx, position or distance
> values.
> 
> This is required for the stylus to work correctly on the reMarkable 2.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../input/touchscreen/wacom,generic.yaml      | 18 ++++++++++
>  drivers/input/touchscreen/wacom_i2c.c         | 33 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> index a8a7f362b0ce..0da63fd92ea1 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> @@ -25,6 +25,24 @@ properties:
>    vdd-supply:
>      description: Power Supply
>  
> +  flip-tilt-x:
> +    type: boolean

These all need descriptions.

> +
> +  flip-tilt-y:
> +    type: boolean
> +
> +  flip-pos-x:
> +    type: boolean
> +
> +  flip-pos-y:
> +    type: boolean
> +
> +  flip-distance:
> +    type: boolean
> +
> +  flip-pressure:
> +    type: boolean

I don't understand how you flip pressure?

> +
>  required:
>    - compatible
>    - reg
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index c6579a1a8d04..82b62a768451 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -72,6 +72,13 @@ struct wacom_i2c {
>  	u8 data[WACOM_QUERY_SIZE];
>  	bool prox;
>  	int tool;
> +
> +	bool flip_tilt_x;
> +	bool flip_tilt_y;
> +	bool flip_pos_x;
> +	bool flip_pos_y;
> +	bool flip_distance;
> +	bool flip_pressure;
>  };
>  
>  static int wacom_query_device(struct i2c_client *client,
> @@ -140,6 +147,20 @@ static int wacom_query_device(struct i2c_client *client,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_OF


Use 'if (!IS_ENABLED(CONFIG_OF))' in the function and drop all the 
ifdefs.

> +static void wacom_of_read(struct wacom_i2c *wac_i2c)
> +{
> +	struct i2c_client *client = wac_i2c->client;
> +
> +	wac_i2c->flip_tilt_x = of_property_read_bool(client->dev.of_node, "flip-tilt-x");
> +	wac_i2c->flip_tilt_y = of_property_read_bool(client->dev.of_node, "flip-tilt-y");
> +	wac_i2c->flip_pos_x = of_property_read_bool(client->dev.of_node, "flip-pos-x");
> +	wac_i2c->flip_pos_y = of_property_read_bool(client->dev.of_node, "flip-pos-y");
> +	wac_i2c->flip_distance = of_property_read_bool(client->dev.of_node, "flip-distance");
> +	wac_i2c->flip_pressure = of_property_read_bool(client->dev.of_node, "flip-pressure");
> +}
> +#endif
> +
>  static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>  {
>  	struct wacom_i2c *wac_i2c = dev_id;
> @@ -176,6 +197,14 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>  
>  	wac_i2c->prox = data[3] & 0x20;
>  
> +	// Flip the values based on properties from the device tree
> +	pressure = wac_i2c->flip_pressure ? (features->pressure_max - pressure) : pressure;
> +	distance = wac_i2c->flip_distance ? -distance : distance;
> +	x = wac_i2c->flip_pos_x ? (features->x_max - x) : x;
> +	y = wac_i2c->flip_pos_y ? (features->y_max - y) : y;
> +	tilt_x = wac_i2c->flip_tilt_x ? -tilt_x : tilt_x;
> +	tilt_y = wac_i2c->flip_tilt_y ? -tilt_y : tilt_y;
> +
>  	touchscreen_report_pos(input, &wac_i2c->props, features->x_max,
>  			       features->y_max, true);
>  	input_report_key(input, BTN_TOUCH, tsw || ers);
> @@ -303,6 +332,10 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> +#ifdef CONFIG_OF
> +	wacom_of_read(wac_i2c);
> +#endif
> +
>  	return 0;
>  }
>  
> -- 
> 2.31.1
> 
> 
