Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADFF3FCF91
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 00:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235750AbhHaW3t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 18:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhHaW3t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 18:29:49 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9ADC061575;
        Tue, 31 Aug 2021 15:28:53 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c8so2196942lfi.3;
        Tue, 31 Aug 2021 15:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dS9a4YMFIkiyop0PAaPSvf253c+DJ+aqy8e3zyibudI=;
        b=d1GVhDAbWLf39u8T58lsdyyzB3xuNKg4Snil8lED8FR6T5Da6Bbo1S0OeUfmF4RPoI
         KLzZbsIFQEsImkpVg8eOrEMshDXO5VvJHeb7sWQOYXOnaOwT8U3NvBdpCC5SKaFGpLJF
         xTevo3atCRYZxfYU+lMvIRBJTRLIsdmaGq3k6NdcK8kFQklBNRME+NfKWY/Unk1RQADn
         7AIMyj5lQidQDjnU6U05R1iJfGtyMuPA1euC9rlM66zQzuhoI3M8Kt0vfItN6DNEjoCJ
         4Vbv7HwrCsYDTnNONB6IvgidjP6WvZzsPIdm5bYf6a+qzLAFU60fsO4zgs4ZO+TrEWCk
         c8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dS9a4YMFIkiyop0PAaPSvf253c+DJ+aqy8e3zyibudI=;
        b=pKPTQBqpZDIsfXH7RGgOPFaB+UrfiR0uNN7z8qJo2L2XqY8kNgEviy9Nll+yWhmkeh
         RaJBC5XzPI+bJ8vCGpo1qRkP5daSChwVhVhzfferoaZ+VvK77SD71z0fd094p2RXeCx6
         o+CxBKXGJ87gBzXoMJ4aAO68U/KxMa9UDN8Np+iN1XwU6ix81TN1rZStciwiBADwtaGf
         W8NNlV4+8o1bkWu8J6exE5NmwQJ+sGGj6Q/9JCPcsImRBPHH9ccyjvsYeS/0EgFQ2HML
         oPt9C1sPryh4S2/XHxW8hhumsWO9XFPLHUhijEuo51rAyCz42Y7ptmRDqfm60qlzYcZH
         ZHOA==
X-Gm-Message-State: AOAM532KehVG4mDjQtuGPyYxp+JuP7C5sMLXbKZ3K9NgEbU5cpx20qmQ
        MoDfnDVA6mEkpmAkyNKY31A=
X-Google-Smtp-Source: ABdhPJwPqlhz8T1tF33XrwgI72jslJEnQiOVzkoc3MWXhkcOJH2Y6flAB6Q8dAi7LuveQWwTIoXn+w==
X-Received: by 2002:ac2:42d2:: with SMTP id n18mr23879636lfl.505.1630448930893;
        Tue, 31 Aug 2021 15:28:50 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id g24sm2341740ljm.6.2021.08.31.15.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 15:28:50 -0700 (PDT)
Date:   Wed, 1 Sep 2021 01:28:48 +0300
From:   Kari Argillander <kari.argillander@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com, linux-kernel@vger.kernel.org,
        alistair23@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 07/12] Input: wacom_i2c - Clean up the query device
 fields
Message-ID: <20210831222848.5dtyedllyn43tgoz@kari-VirtualBox>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-9-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829091925.190-9-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Just minor style issues checked.

On Sun, Aug 29, 2021 at 07:19:20PM +1000, Alistair Francis wrote:
> Improve the query device fields to be more verbose.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 63 ++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index d6036406a9f3..a35d8fda7e7b 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -13,16 +13,33 @@
>  #include <linux/irq.h>
>  #include <linux/input/touchscreen.h>
>  #include <linux/interrupt.h>
> +#include <linux/reset.h>
>  #include <linux/of.h>
>  #include <asm/unaligned.h>
>  
> +// Registers

Use /* */ comments.

>  #define WACOM_DESC_REG	0x01
> -#define WACOM_CMD_QUERY0	0x04
> -#define WACOM_CMD_QUERY1	0x00
> -#define WACOM_CMD_QUERY2	0x33
> -#define WACOM_CMD_QUERY3	0x02
> -#define WACOM_CMD_THROW0	0x05
> -#define WACOM_CMD_THROW1	0x00
> +#define WACOM_COMMAND_LSB   0x04
> +#define WACOM_COMMAND_MSB   0x00
> +
> +#define WACOM_DATA_LSB      0x05
> +#define WACOM_DATA_MSB      0x00

You use spaces here. Should be tabs.

> +
> +// Report types
> +#define REPORT_FEATURE      0x30
> +
> +// Requests / operations
> +#define OPCODE_GET_REPORT   0x02
> +
> +// Power settings
> +#define POWER_ON            0x00
> +#define POWER_SLEEP         0x01
> +
> +// Input report ids
> +#define WACOM_PEN_DATA_REPORT           2
> +#define WACOM_SHINONOME_REPORT          26
> +
> +#define WACOM_QUERY_REPORT	3
>  #define WACOM_QUERY_SIZE	22
>  
>  #define WACOM_MAX_DATA_SIZE_BG9     10
> @@ -85,27 +102,30 @@ static int wacom_query_device(struct i2c_client *client,
>  {
>  	int ret;
>  	u8 cmd_wac_desc[] = {WACOM_DESC_REG, 0x00};
> -	u8 cmd1[] = { WACOM_CMD_QUERY0, WACOM_CMD_QUERY1,
> -			WACOM_CMD_QUERY2, WACOM_CMD_QUERY3 };
> -	u8 cmd2[] = { WACOM_CMD_THROW0, WACOM_CMD_THROW1 };
>  	u8 data[WACOM_QUERY_SIZE];
> +
> +	u8 get_query_data_cmd[] = {
> +		WACOM_COMMAND_LSB,
> +		WACOM_COMMAND_MSB,
> +		REPORT_FEATURE | WACOM_QUERY_REPORT,
> +		OPCODE_GET_REPORT,
> +		WACOM_DATA_LSB,
> +		WACOM_DATA_MSB,
> +	};
> +
>  	struct i2c_msg msgs[] = {
> +		// Request reading of feature ReportID: 3 (Pen Query Data)

//

>  		{
>  			.addr = client->addr,
>  			.flags = 0,
> -			.len = sizeof(cmd1),
> -			.buf = cmd1,
> -		},
> -		{
> -			.addr = client->addr,
> -			.flags = 0,
> -			.len = sizeof(cmd2),
> -			.buf = cmd2,
> +			.len = sizeof(get_query_data_cmd),
> +			.buf = get_query_data_cmd,
>  		},
> +		// Read 21 bytes

//

>  		{
>  			.addr = client->addr,
>  			.flags = I2C_M_RD,
> -			.len = sizeof(data),
> +			.len = WACOM_QUERY_SIZE - 1,
>  			.buf = data,
>  		},
>  	};
> @@ -158,9 +178,12 @@ static int wacom_query_device(struct i2c_client *client,
>  	}
>  
>  	dev_dbg(&client->dev,
> -		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
> +		"x_max:%d, y_max:%d, pressure:%d, fw:%d, "
> +		"distance: %d, tilt_x_max: %d, tilt_y_max: %d\n",
>  		features->x_max, features->y_max,
> -		features->pressure_max, features->fw_version);
> +		features->pressure_max, features->fw_version,
> +		features->distance_max,
> +		features->tilt_x_max, features->tilt_y_max);
>  
>  	return 0;
>  }
> -- 
> 2.31.1
> 
