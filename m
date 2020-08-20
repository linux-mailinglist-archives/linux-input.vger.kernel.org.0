Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0ED24C7E3
	for <lists+linux-input@lfdr.de>; Fri, 21 Aug 2020 00:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgHTWp5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Aug 2020 18:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgHTWp4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Aug 2020 18:45:56 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA49C061385;
        Thu, 20 Aug 2020 15:45:55 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mt12so84225pjb.4;
        Thu, 20 Aug 2020 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vv2JBZBzbyS5oyQ6tWaHzLVDVGLLdMyl4CPDOQIBTk0=;
        b=f57WA+Di9w9m8gTLKX8nnMEXtaJgKWJhoyZ34CF6T9axYgkjDWzUSjTqE6QODQv/kW
         oTCRKD+WZenW1kyzY67ehADNCkdwxOXipQnYrYg9X1pjMp6YcFA3A7QXtxCNdHpXJWjq
         207lDuYDk3DjYSD13iDYXP3v4KAVslQKDYLdpLsFHhJy9y5M5wg4+HekN0JwTh6nY0rg
         PGJRL51NdJAZHJvqlDPguu5o5Ob+fkdkEZcO6T6mBainj9+8Ikn1eeFGcK6aJKnMlsWR
         stmh7R96QnZXk252iCyd6++FSAkiDA6lj+J0zoNWRGP/+tKeLttm2G4I1rQdzNNr2gAj
         Idgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vv2JBZBzbyS5oyQ6tWaHzLVDVGLLdMyl4CPDOQIBTk0=;
        b=g+UeW6F/dCNaKAKX333U3//f4bXaDyuYA4mBrZNgRDPSqI0fBtdLb0uTso0NPWXZGz
         S1OM58hJQhnS5fnT3fBkRfdgbSsniYCYmbC5qD8GMB/k75t/rRt5rxFIdLeDOr71X3O3
         ZiKMtOGX6SmiISPinOpkAJx077XWXXpu4OaVyIStH2LNctQZW9JvLAyCfD5iJhGMWikY
         faUbmcWhBv+uN9+3G6B75dqqmyE9agzgjF/1yhlA9fba4LUhlPETE9KKiecukvxngasn
         dJg2oCjNQMk0c9skdhy+0Z8JR4NZ/KIaLzQ/6US5iZqeZYIQRppnUyzFc29CN7BCL22f
         01qw==
X-Gm-Message-State: AOAM5329iFPR+Mp/Ol/dzqDkoMaW6ZqyjnY48OGmElvhx7ksq8XbQi/k
        bTau8mSlDH+kK+DU25pozwE=
X-Google-Smtp-Source: ABdhPJxqMHsYAJSwsyvLQM5pRnXiVHCtX9mKqHRg3De3OQdBFA2DPtvByVzDIYZdfjB+KpOCK4yo/w==
X-Received: by 2002:a17:90b:2083:: with SMTP id hb3mr4673pjb.234.1597963554729;
        Thu, 20 Aug 2020 15:45:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x28sm108995pfj.73.2020.08.20.15.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 15:45:53 -0700 (PDT)
Date:   Thu, 20 Aug 2020 15:45:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Furquan Shaikh <furquan@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        adurbin@google.com
Subject: Re: [PATCH] drivers: input: Use single i2c_transfer transaction when
 using RM_CMD_BANK_SWITCH
Message-ID: <20200820224551.GX1665100@dtor-ws>
References: <20200818234215.2255611-1-furquan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818234215.2255611-1-furquan@google.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Furquan,

On Tue, Aug 18, 2020 at 04:42:15PM -0700, Furquan Shaikh wrote:
> On an AMD chromebook, where the same I2C bus is shared by both Raydium
> touchscreen and a trackpad device, it is observed that interleaving of
> I2C messages when raydium_i2c_read_message() is called leads to the
> Raydium touch IC reporting incorrect information. This is the sequence
> that was observed to result in the above issue:
> 
> * I2C write to Raydium device for RM_CMD_BANK_SWITCH
> * I2C write to trackpad device
> * I2C read from trackpad device
> * I2C write to Raydium device for setting address
> * I2C read from Raydium device >>>> This provides incorrect
>   information
> 
> This change updates raydium_i2c_read_message and
> raydium_i2c_send_message to perform all the I2C transfers in the
> function as part of a single i2c_transfer transaction. This ensures
> that no transactions are initiated to any other device on the same bus
> in between and hence the information obtained from the touchscreen
> device is correct. Verified with the patch across multiple
> reboots (>100) that the information reported by the Raydium
> touchscreen device during probe is correct.
> 
> Signed-off-by: Furquan Shaikh <furquan@google.com>
> ---
>  drivers/input/touchscreen/raydium_i2c_ts.c | 102 ++++++++++++++++-----
>  1 file changed, 80 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index fe245439adee..11c00d341eb1 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -111,6 +111,15 @@ struct raydium_info {
>  	u8 y_res;		/* units/mm */
>  };
>  
> +/*
> + * Header to be sent for RM_CMD_BANK_SWITCH command. This is used by
> + * raydium_i2c_{read|send}_message below.
> + */
> +struct __packed raydium_bank_switch_header {
> +	u8 cmd;
> +	__be32 be_addr;
> +};

I believe the preferred placement of __packed attribute is after the
definition:

dtor@dtor-ws:~/kernel/work $ git grep "struct __packed" | wc -l
210
dtor@dtor-ws:~/kernel/work $ git grep "} __packed" | wc -l
8718

> +
>  /* struct raydium_data - represents state of Raydium touchscreen device */
>  struct raydium_data {
>  	struct i2c_client *client;
> @@ -198,22 +207,44 @@ static int raydium_i2c_read(struct i2c_client *client,
>  static int raydium_i2c_read_message(struct i2c_client *client,
>  				    u32 addr, void *data, size_t len)
>  {
> -	__be32 be_addr;
> -	size_t xfer_len;
> -	int error;
> +	int ret;
>  
>  	while (len) {
> -		xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
> -
> -		be_addr = cpu_to_be32(addr);
> +		u8 read_addr = addr & 0xff;
> +		struct raydium_bank_switch_header header = {
> +			.cmd = RM_CMD_BANK_SWITCH,
> +			.be_addr = cpu_to_be32(addr),
> +		};
> +		size_t xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
> +		/*
> +		 * Perform as a single i2c_transfer transaction to ensure that
> +		 * no other I2C transactions are initiated on the bus to any
> +		 * other device in between. Initiating transacations to other
> +		 * devices after RM_CMD_BANK_SWITCH is sent is known to cause
> +		 * read issues.
> +		 */
> +		struct i2c_msg xfer[] = {
> +			{
> +				.addr = client->addr,
> +				.len = sizeof(header),
> +				.buf = (u8 *)&header,
> +			},
> +			{
> +				.addr = client->addr,
> +				.len = 1,
> +				.buf = &read_addr,
> +			},
> +			{
> +				.addr = client->addr,
> +				.flags = I2C_M_RD,
> +				.len = xfer_len,
> +				.buf = data,
> +			}
> +		};

I think this can be moved out of while loop.

I also wonder if this can be actually combined with raydium_i2c_read().
As far as I understand read/writes to register above 255 require
page select write, so we can always prepare the header and then submit
either 3 or 2 messages in the transfer depending on the register we are
dealing with. Or maybe convert to regmap?

Thanks.

-- 
Dmitry
