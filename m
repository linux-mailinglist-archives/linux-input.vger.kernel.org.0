Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7199043D0C5
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233760AbhJ0Sd1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:33:27 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:34868 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243640AbhJ0Sd1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:33:27 -0400
Received: from g550jk.localnet (ip-213-127-63-241.ip.prioritytelecom.net [213.127.63.241])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 5321AC6C79;
        Wed, 27 Oct 2021 18:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1635359459; bh=eqfvrW3djl2rMckCdQ8iCPc9puV62AsaOk6nIabDaM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=mDUy4pwOPLA4UjWHEhXHWYIIzEu5yyl263gERf8bRX1nOZXJLZpmh3ZU/DAGZxnLx
         oUm7MxSRqTe/rtX7VWQrzAZ9RIhwszZXSmqpAE9LK+5Y7rpAfWB6d5cayHAAbI+lXj
         +rimFcNGwwSj7J2+Pdzww8NBzh/CnXO7eZVeBa8s=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     dmitry.torokhov@gmail.com, ~postmarketos/upstreaming@lists.sr.ht
Cc:     robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>,
        Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH 3/6] Input: zinitix - Handle proper supply names
Date:   Wed, 27 Oct 2021 20:30:58 +0200
Message-ID: <5507591.DvuYhMxLoT@g550jk>
In-Reply-To: <20211027181350.91630-4-nikita@trvn.ru>
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-4-nikita@trvn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nikita,

On Mittwoch, 27. Oktober 2021 20:13:47 CEST Nikita Travkin wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> The supply names of the Zinitix touchscreen were a bit confused, the new
> bindings rectifies this.
> 
> To deal with old and new devicetrees, first check if we have "vddo" and in
> case that exists assume the old supply names. Else go and look for the new
> ones.
> 
> We cannot just get the regulators since we would get an OK and a dummy
> regulator: we need to check explicitly for the old supply name.
> 
> Use struct device *dev as a local variable instead of the I2C client since
> the device is what we are actually obtaining the resources from.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Michael Srba <Michael.Srba@seznam.cz>
> Cc: phone-devel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> [Slightly changed the legacy regulator detection]
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> This patch was previously submitted here:
> https://lore.kernel.org/linux-input/20210625113435.2539282-2-linus.walleij@l
> inaro.org/
> 
> Changes since the original patch:
>  - Adress the review comments by Dmitry:
>    Drop explict OF check and use of_find_property()
> ---
>  drivers/input/touchscreen/zinitix.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c
> b/drivers/input/touchscreen/zinitix.c index 1e70b8d2a8d7..d4e06a88a883
> 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -252,16 +252,27 @@ static int zinitix_init_touch(struct bt541_ts_data
> *bt541)
> 
>  static int zinitix_init_regulators(struct bt541_ts_data *bt541)
>  {
> -	struct i2c_client *client = bt541->client;
> +	struct device *dev = &bt541->client->dev;
>  	int error;
> 
> -	bt541->supplies[0].supply = "vdd";
> -	bt541->supplies[1].supply = "vddo";
> -	error = devm_regulator_bulk_get(&client->dev,
> +	/*
> +	 * Some older device trees have erroneous names for the regulators,
> +	 * so check if "vddo" is present and in that case use these names
> +	 * and warn. Else use the proper supply names on the component.
> +	 */

Nitpick, but:
"and in that case use these names and warn."
I don't see any dev_warn or anything that would 'warn'. If you send a v2 it 
might be nice to fix that.

Regards
Luca

> +	if (of_find_property(dev->of_node, "vddo-supply", NULL)) {
> +		bt541->supplies[0].supply = "vdd";
> +		bt541->supplies[1].supply = "vddo";
> +	} else {
> +		/* Else use the proper supply names */
> +		bt541->supplies[0].supply = "vcca";
> +		bt541->supplies[1].supply = "vdd";
> +	}
> +	error = devm_regulator_bulk_get(dev,
>  					ARRAY_SIZE(bt541-
>supplies),
>  					bt541->supplies);
>  	if (error < 0) {
> -		dev_err(&client->dev, "Failed to get regulators: %d\n", 
error);
> +		dev_err(dev, "Failed to get regulators: %d\n", error);
>  		return error;
>  	}




