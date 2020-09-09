Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFBD262427
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 02:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgIIAoc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 20:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgIIAo3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Sep 2020 20:44:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18618C061573;
        Tue,  8 Sep 2020 17:44:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 67so751060pgd.12;
        Tue, 08 Sep 2020 17:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K8QsISLidxurmPHK5+YsjnPP/PckoOJ6G9b+uwLzbMw=;
        b=mb+37PjoeLRqv2WjK4oAy8ZM56SLsUERgXMJV+xnvceYAg8LDU9j3g+mPnNZafXStS
         fprzt259PdmatRcwBUd80MYT4qOUqdqOx7swopNaXHu5XAIScv0v+FZRPqRh9F8Db1lC
         JV02KtL1zQ1dv9FEOAvHVJGXwVEBvqVKeEEHNgjVfz7HiNJPag/6HC2V/e/pFbuT4n7y
         OLTm0Ul1Hc1XRprsmrF7VxTvuXALGq0dBrhPCazKdNqOFs7RW/NG/Oe4hFhbirV+RNXb
         1lFe5OHGFhoa1NDHw+/VoV/4/Lj96dcvhcBjlciPyPhWdP91rgeoxsmfsX0UJKno29iV
         ZPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K8QsISLidxurmPHK5+YsjnPP/PckoOJ6G9b+uwLzbMw=;
        b=aN6ksq5MqTChZ3LvBxNoCCFdUaJBRMp1YEMiFophfLCbaCujqNGDUbGudFPlYs110D
         jY9tr5BNLXOekiwuUgoTGyD08GTsp8W8pr0988KYlxCIazy0aDy5cXdCXzNzcdZ7IX5Y
         oSr1xanvDoGDVRKWDgPIZf59yTi6ymD+5j9h/NqWmp/FTWTMlz43Eydvavlita9R3uF+
         zJ4GYAdghtmGq9QByDjlgYZGlZcRdfjFmCEQ+nrHHh8QKAlRdCuAIJ9KKD4srFBAE+ud
         26A38+DzIh3g2dM7mEz6iEsS7AEE/YSKT+CtAFfFFZMWaAqS5m8AfTsK1zr4VaCGsepW
         BZ5Q==
X-Gm-Message-State: AOAM5301PWpYJwryIKK3yo3GKDYqRdGrmkyTAM5/CPyNbWnlRFmusExE
        lVq4SVrd5Wlq8WZO31CjFHI=
X-Google-Smtp-Source: ABdhPJzXqypVIDq1EkovtOZSBjPHx3Aef9gcdPgJx8+NPlHLPtiYhOsFRQXaiEqyLmrxEuEuIaFmHQ==
X-Received: by 2002:a63:ff01:: with SMTP id k1mr1045030pgi.141.1599612268290;
        Tue, 08 Sep 2020 17:44:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id ga3sm342882pjb.18.2020.09.08.17.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 17:44:26 -0700 (PDT)
Date:   Tue, 8 Sep 2020 17:44:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Furquan Shaikh <furquan@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        adurbin@google.com
Subject: Re: [PATCH v2] drivers: input: Use single i2c_transfer transaction
 when using RM_CMD_BANK_SWITCH
Message-ID: <20200909004424.GD1665100@dtor-ws>
References: <20200820224551.GX1665100@dtor-ws>
 <20200821024006.3399663-1-furquan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821024006.3399663-1-furquan@google.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Furquan,

On Thu, Aug 20, 2020 at 07:40:06PM -0700, Furquan Shaikh wrote:
> On an AMD chromebook, where the same I2C bus is shared by both Raydium
> touchscreen and a trackpad device, it is observed that interleaving of
> I2C messages when `raydium_i2c_read_message()` is called leads to the
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
> This change adds a new helper function `raydium_i2c_xfer()` that
> performs I2C transactions to the Raydium device. It uses the register
> address to decide if RM_CMD_BANK_SWITCH header needs to be sent to the
> device (i.e. if register address is greater than 255, then bank switch
> header is sent before the rest of the transaction). Additionally, it
> ensures that all the I2C operations performed as part of
> `raydium_i2c_xfer()` are done as a single i2c_transfer. This
> guarantees that no other transactions are initiated to any other
> device on the same bus in between. Additionally,
> `raydium_i2c_{send|read}*` functions are refactored to use this new
> helper function.
> 
> Verified with the patch across multiple reboots (>100) that the
> information reported by the Raydium  touchscreen device during probe
> is correct.
> 
> Signed-off-by: Furquan Shaikh <furquan@google.com>
> 
> ---
> v2: Added a new helper function raydium_i2c_xfer so that all read and
> send transfers are handled using the same path. This helper function
> uses register address > 255 to decide whether to send
> RM_CMD_BANK_SWITCH command. Additionally, __packed keyword is moved
> to be placed after the structure defintion.
> 
>  drivers/input/touchscreen/raydium_i2c_ts.c | 132 +++++++++------------
>  1 file changed, 58 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index fe245439adee..261e4a290836 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -51,6 +51,7 @@
>  
>  /* Touch relative info */
>  #define RM_MAX_RETRIES		3
> +#define RM_RETRY_DELAY_MS	20
>  #define RM_MAX_TOUCH_NUM	10
>  #define RM_BOOT_DELAY_MS	100
>  
> @@ -136,114 +137,98 @@ struct raydium_data {
>  	bool wake_irq_enabled;
>  };
>  
> -static int raydium_i2c_send(struct i2c_client *client,
> -			    u8 addr, const void *data, size_t len)
> +static int raydium_i2c_xfer(struct i2c_client *client, u32 addr, void *data,
> +				size_t len, bool is_read)
>  {
> -	u8 *buf;
> -	int tries = 0;
> -	int ret;
> -
> -	buf = kmalloc(len + 1, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	buf[0] = addr;
> -	memcpy(buf + 1, data, len);
> -
> -	do {
> -		ret = i2c_master_send(client, buf, len + 1);
> -		if (likely(ret == len + 1))
> -			break;
> -
> -		msleep(20);
> -	} while (++tries < RM_MAX_RETRIES);
> -
> -	kfree(buf);
> -
> -	if (unlikely(ret != len + 1)) {
> -		if (ret >= 0)
> -			ret = -EIO;
> -		dev_err(&client->dev, "%s failed: %d\n", __func__, ret);
> -		return ret;
> -	}
> +	struct raydium_bank_switch_header {
> +		u8 cmd;
> +		__be32 be_addr;
> +	} __packed header = {
> +		.cmd = RM_CMD_BANK_SWITCH,
> +		.be_addr = cpu_to_be32(addr),
> +	};
>  
> -	return 0;
> -}
> +	u8 reg_addr = addr & 0xff;
>  
> -static int raydium_i2c_read(struct i2c_client *client,
> -			    u8 addr, void *data, size_t len)
> -{
>  	struct i2c_msg xfer[] = {
> +		{
> +			.addr = client->addr,
> +			.len = sizeof(header),
> +			.buf = (u8 *)&header,
> +		},
>  		{
>  			.addr = client->addr,
>  			.len = 1,
> -			.buf = &addr,
> +			.buf = &reg_addr,
>  		},
>  		{
>  			.addr = client->addr,
> -			.flags = I2C_M_RD,
>  			.len = len,
>  			.buf = data,
> +			.flags = is_read ? I2C_M_RD : 0,
>  		}
>  	};
> +
> +	/*
> +	 * If address is greater than 255, then RM_CMD_BANK_SWITCH needs to be
> +	 * sent first. Else, skip the header i.e. xfer[0].
> +	 */
> +	int xfer_start_idx = (addr > 0xff) ? 0 : 1;
> +	size_t xfer_count = ARRAY_SIZE(xfer) - xfer_start_idx;
>  	int ret;
>  
> -	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> -	if (unlikely(ret != ARRAY_SIZE(xfer)))
> -		return ret < 0 ? ret : -EIO;
> +	ret = i2c_transfer(client->adapter, &xfer[xfer_start_idx], xfer_count);
> +	if (likely(ret == xfer_count))
> +		return 0;
>  
> -	return 0;
> +	return -EIO;

We are losing real error here, I'll change this to

	return ret < 0 ? ret : -EIO;

>  }
>  
> -static int raydium_i2c_read_message(struct i2c_client *client,
> -				    u32 addr, void *data, size_t len)
> +static int raydium_i2c_send(struct i2c_client *client, u32 addr,
> +				const void *data, size_t len)
>  {
> -	__be32 be_addr;
> +	int tries = 0;
> +	int ret;
> +
> +	do {
> +		ret = raydium_i2c_xfer(client, addr, (void *)data, len, false);
> +		if (likely(ret == 0))
> +			return 0;
> +
> +		msleep(RM_RETRY_DELAY_MS);
> +	} while (++tries < RM_MAX_RETRIES);
> +
> +	dev_err(&client->dev, "%s failed\n", __func__);
> +	return -EIO;

Again losing real error here, I'll rename ret to error and do

	return error;

here.

> +}
> +
> +static int raydium_i2c_read(struct i2c_client *client, u32 addr, void *data,
> +				size_t len)
> +{
> +	int ret;
>  	size_t xfer_len;
> -	int error;
>  
>  	while (len) {
>  		xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
> +		ret = raydium_i2c_xfer(client, addr, data, len, true);

I think this needs to be xfer_len, not len.

I can fix it up locally if you agree.

Thanks.

-- 
Dmitry
