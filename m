Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29ABD42B325
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 05:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237109AbhJMDMr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 23:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237065AbhJMDMq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 23:12:46 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1317EC061570;
        Tue, 12 Oct 2021 20:10:44 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f21so850328plb.3;
        Tue, 12 Oct 2021 20:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aCzXtPqTbH26F/MqJ/WHnTguIl3gJMvAD05t5XNYsCI=;
        b=g+m1LOsFcNgFxA9wPgI248PfKej8vNAiAwTnwivysaCE/A97Ne77gMj1RrgyU6+QMr
         za70opQh5tHp9frcF5Gwgrxj66H/0mKjjQLVpaKXJU3fo8TZ5P0t2Kkf4RdWfVQbVlVp
         n/JrPxEZa0BqATrrSwuekGdUsoByRmkdFYxjbx+i+tJPvak3q8z2BFmqFuKMAGiUvD3h
         UW+uQ9BEiZO2Qvl3TVL3X9dfgwIM4T+SWz19zuc+vmUd7dvAGb0yyTwXBJUIW3jorkaR
         aeIhz+iGprpdTVKrTBbI6pntcrivmiJFlBSpJMn4aByd7P9WP+lEk9S2lqjih4qStL2i
         DXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aCzXtPqTbH26F/MqJ/WHnTguIl3gJMvAD05t5XNYsCI=;
        b=XkFiNRqEN29tK8ZXjtjoB+hCsfUKrk0ni62FinBxB23D+NzSsGyWzW3pNulEmJdCOY
         ovRuDVvTIoqTrDJiOkJ074+BstuBMA0C6cVbzZlIe7dX9XnpMtdNJD4qfEMeQggekdd6
         0F2jWTYv2oMVkapMEqswx2MJYjqAVY2szTJWHhUi+gEhZ/P/4cc7tAIGrLUGTUf1uhJs
         uGaOomaA1cpsAXqgHxBPjAZWrCo5/NgkvLSFJmodA1L0gPfMd1dfC76IZ6+gt8H56Yt1
         qsrMVlPjCTa9OLK5oRnzb6D+3cQJts7SAGUqN/ack9p5Kw4vtK+r1zyeY16FrVZbEmuU
         k9Iw==
X-Gm-Message-State: AOAM530XWaQULUPQmRjRnNwJHH6+lm7mc35AXkiywETeSDdB/B7fgLco
        t4MMdQg2ReP+7C8z1CKbX80=
X-Google-Smtp-Source: ABdhPJzel6BSKUmOk5nEklv8y7V6HANnqXBQmJgMP6USY873he3FukaaeMjhXyJ7eT/1f7Zmm+eLXw==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id nu11mr10414805pjb.210.1634094643368;
        Tue, 12 Oct 2021 20:10:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:618d:87ca:8f95:87c0])
        by smtp.gmail.com with ESMTPSA id m12sm4034458pjv.29.2021.10.12.20.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 20:10:42 -0700 (PDT)
Date:   Tue, 12 Oct 2021 20:10:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH 1/2] Input: wacom_i2c - Clean up the query device fields
Message-ID: <YWZOL2ne/DSqaJuM@google.com>
References: <20211009113707.17568-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009113707.17568-1-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Sat, Oct 09, 2021 at 09:37:06PM +1000, Alistair Francis wrote:
> Improve the query device fields to be more verbose.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 49 ++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 22826c387da5..8d7267ccc661 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -14,13 +14,21 @@
>  #include <linux/interrupt.h>
>  #include <asm/unaligned.h>
>  
> -#define WACOM_CMD_QUERY0	0x04
> -#define WACOM_CMD_QUERY1	0x00
> -#define WACOM_CMD_QUERY2	0x33
> -#define WACOM_CMD_QUERY3	0x02
> -#define WACOM_CMD_THROW0	0x05
> -#define WACOM_CMD_THROW1	0x00
> -#define WACOM_QUERY_SIZE	19
> +// Registers
> +#define WACOM_COMMAND_LSB   0x04
> +#define WACOM_COMMAND_MSB   0x00
> +
> +#define WACOM_DATA_LSB      0x05
> +#define WACOM_DATA_MSB      0x00
> +
> +// Report types
> +#define REPORT_FEATURE      0x30
> +
> +// Requests / operations
> +#define OPCODE_GET_REPORT   0x02
> +
> +#define WACOM_QUERY_REPORT	3
> +#define WACOM_QUERY_SIZE	22
>  
>  struct wacom_features {
>  	int x_max;
> @@ -41,27 +49,30 @@ static int wacom_query_device(struct i2c_client *client,
>  			      struct wacom_features *features)
>  {
>  	int ret;
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
>  		{
>  			.addr = client->addr,
>  			.flags = I2C_M_RD,
> -			.len = sizeof(data),
> +			.len = WACOM_QUERY_SIZE - 1,

Why is this change? If we are indeed supposed to read 1 byte less this
should be a separate patch.

>  			.buf = data,
>  		},
>  	};
> -- 
> 2.31.1
> 

Thanks.

-- 
Dmitry
