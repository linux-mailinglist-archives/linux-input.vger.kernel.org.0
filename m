Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2D01A4540
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 12:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgDJKdM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 06:33:12 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:30951 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgDJKdL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 06:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586514789;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lelT622mCvNFcoTa3BDt/EoTxL7DPkLbvVCtt51N44E=;
        b=He9JDFAoKhXpq8bw7P7ZU83lAH/dS5PqKHGFPOTcJWg+QUPpLYPDGYcInwTScf6fRm
        8Jjv5eSHA2pMmD8lrWpbZ3xP0HX7Ysbw5QSSYUcpjsUGQfCimqKzv/lrLDbQatPcbZvr
        3o79ax89dU8C1WhAOHPlbJVnS8AncVDfccYqc99AeBoDBX0mxVqJndDU1WHVllQ7pfhm
        o8hJDgpN1CURoApucrik7/q3QxPX5hspFITqYsEdyA67SZhw5Y+882295MCqcWlf7crS
        FedQG+C6JRtVQzkko2D49uoXORVsa0rhv3tGpTDX7Qm9gQcnzcNJBkE3GOwzZoc8m8BR
        ixJA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IcjDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w3AARFPAu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 10 Apr 2020 12:27:15 +0200 (CEST)
Date:   Fri, 10 Apr 2020 12:27:02 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: mms114 - add support for mms345l
Message-ID: <20200410102631.GA85423@gerhold.net>
References: <20200405170904.61512-1-stephan@gerhold.net>
 <20200409221503.GS75430@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409221503.GS75430@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Apr 09, 2020 at 03:15:03PM -0700, Dmitry Torokhov wrote:
> Hi Stephan,
> 
> On Sun, Apr 05, 2020 at 07:09:03PM +0200, Stephan Gerhold wrote:
> > MMS345L is another first generation touch screen from Melfas,
> > which uses the same registers as MMS152.
> > 
> > However, using I2C_M_NOSTART for it causes errors when reading:
> > 
> > 	i2c i2c-0: sendbytes: NAK bailout.
> > 	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)
> > 
> > The driver works fine as soon as I2C_M_NOSTART is removed.
> > 
> > Add a separate melfas,mms345l binding, and make use of I2C_M_NOSTART
> > only for MMS114 and MMS152.
> > 
> > Reviewed-by: Andi Shyti <andi@etezian.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Sorry for sitting on this for so long. I looked around, and I think that
> instead of adding separate handling for 345L we shoudl simply drop the
> "no start" bit for everyone. I am not sure what the original version
> tried to do here, as far as I can see in various public Android trees the
> driver for these devices does not use I2C_M_NOSTART.
> 
> Actually, I wonder if the difference is not in the touch controller that
> is being used, but rather in the I2C controller the device in connected
> to.
> 
> I would like to apply the version of the patch below.

Thanks a lot for your reply!

Your suggested patch below works fine on my MMS345L device
(with the melfas,mms152 compatible). Applying it would allow
the touchscreen to work on my device in mainline :)

I wonder if we should still add a separate melfas,mms345l compatible:

The only remaining difference to MMS152 at the moment is the
MMS152_COMPAT_GROUP register. It seems to be used for something
different on MMS345L, so when it is printed in mms114_get_version()
it just displays some garbage:

TSP FW Rev: bootloader 0x6 / core 0x26 / config 0x26, Compat group: \x06

(It used to actually print it as some ASCII control character but
 apparently that was fixed...)

It's not really critical, but in case we find more differences I think
it's better to directly add a separate compatible string to the device
tree.

If you agree with this I can send a separate patch with the new
compatible string once you have applied the patch below.

Thanks again!
Stephan

> 
> Input: mms114 - fix handling of mms345l
> 
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> MMS345L is another first generation touch screen from Melfas,
> which uses the same registers as MMS152.
> 
> However, using I2C_M_NOSTART for it causes errors when reading:
> 
> 	i2c i2c-0: sendbytes: NAK bailout.
> 	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)
> 
> The driver works fine as soon as I2C_M_NOSTART is removed.
> 
> Reviewed-by: Andi Shyti <andi@etezian.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Link: https://lore.kernel.org/r/20200405170904.61512-1-stephan@gerhold.net
> Patchwork-Id: 11474771
> [dtor: removed separate mms345l handling, made everyone use standard
> transfer mode, propagated the 10bit addressing flag to the read part of the
> transfer as well.]
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/mms114.c |   12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
> index 69c6d559eeb0..2ef1adaed9af 100644
> --- a/drivers/input/touchscreen/mms114.c
> +++ b/drivers/input/touchscreen/mms114.c
> @@ -91,15 +91,15 @@ static int __mms114_read_reg(struct mms114_data *data, unsigned int reg,
>  	if (reg <= MMS114_MODE_CONTROL && reg + len > MMS114_MODE_CONTROL)
>  		BUG();
>  
> -	/* Write register: use repeated start */
> +	/* Write register */
>  	xfer[0].addr = client->addr;
> -	xfer[0].flags = I2C_M_TEN | I2C_M_NOSTART;
> +	xfer[0].flags = client->flags & I2C_M_TEN;
>  	xfer[0].len = 1;
>  	xfer[0].buf = &buf;
>  
>  	/* Read data */
>  	xfer[1].addr = client->addr;
> -	xfer[1].flags = I2C_M_RD;
> +	xfer[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
>  	xfer[1].len = len;
>  	xfer[1].buf = val;
>  
> @@ -428,10 +428,8 @@ static int mms114_probe(struct i2c_client *client,
>  	const void *match_data;
>  	int error;
>  
> -	if (!i2c_check_functionality(client->adapter,
> -				I2C_FUNC_PROTOCOL_MANGLING)) {
> -		dev_err(&client->dev,
> -			"Need i2c bus that supports protocol mangling\n");
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(&client->dev, "Not supported I2C adapter\n");
>  		return -ENODEV;
>  	}
>  
