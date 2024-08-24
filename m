Return-Path: <linux-input+bounces-5827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6760E95DD74
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 13:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F32282D53
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 11:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617D0155312;
	Sat, 24 Aug 2024 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="N6BoymD3"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4241F2F29;
	Sat, 24 Aug 2024 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724497975; cv=none; b=VC9PfTGv1H46AO7BHDdEVJV5NVJa3x0elDVKpevmbNDsbvGcCPWv68fN//Ly7aRKtI3mNXHIkR4vwdPnRKAqh2liNrSbixHoUFyTiNj7FcCpaQH2srKnIZ3mVRfdLnmRvVahWT1HfgvtKT1hkGJPkTR240mwdmjuh9CibJzn9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724497975; c=relaxed/simple;
	bh=kiUKKfB0vZVngw+ckf7ii8fzrP2b/gXZpBcMhPyAgGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/w4FmuUzjRYDNRpw96idneAv8JBiGovCttPq+5Nd/7lvoO2wufdQrof1a2SDrd17XKj/Z/no5YTx1wIrexCeqb1Ahg1eBZ0o7CtsJmSVtv+79XKFykwk7b76GCpN+w0dX3HBTYKVuBox0GQiy9Wa0sFn94bGC4NMiLcKN+NIe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=N6BoymD3; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z8tDgaTliTu4HgiUXp4kPXcAlVVhPz75DKsdsi2D/mU=; b=N6BoymD3ilhm0Zpkph8jocb0Ty
	7FNQ8VVWPlXJ5PA1usgiTpi7NnKIiAeLmCJbhOcRTuLjGKPUvdKg0k/VgPXOEv/AvONSzB6Hmb6a7
	pjH02yb9ih7jBS+7ldysXL3SRVZI8sC8C7a8aFTIrZf8efbLCHqjScG0FffHbfzCrZ3EDzlXsqGnu
	SbP2r+gCmX/3Ne97DjanXOgMBQ6/i98c8RP2u4xIN4/HxU6lwsdJntfrUFgGgEIl0Ylav/ihdHR8U
	wGCjM4SUlblCIpvHYTnXnnimMhFY1Z4NFsBzVVl7wG9sQcVvWHx+5Z+pxWwoZo2UR5y+QnJTTYFu6
	/vTzLWWg==;
Received: from i53875ae2.versanet.de ([83.135.90.226] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1shohG-0002A6-L7; Sat, 24 Aug 2024 13:12:42 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Subject: Re: [PATCH 01/18] Input: zforce_ts - use devm_add_action_or_reset()
Date: Sat, 24 Aug 2024 13:13:28 +0200
Message-ID: <11576391.MucGe3eQFb@diego>
In-Reply-To: <20240824055047.1706392-2-dmitry.torokhov@gmail.com>
References:
 <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
 <20240824055047.1706392-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 24. August 2024, 07:50:25 CEST schrieb Dmitry Torokhov:
> From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> 
> If devm_add_action() fails we are explicitly calling the cleanup to free
> the resources allocated. Lets use the helper devm_add_action_or_reset()
> and return directly in case of error, as we know that the cleanup
> function has been already called by the helper if there was any error.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

mistmatch between From and first Signed-off-by

Other than that:
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/zforce_ts.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
> index fdf2d1e770c8..ffbd55c6e1d4 100644
> --- a/drivers/input/touchscreen/zforce_ts.c
> +++ b/drivers/input/touchscreen/zforce_ts.c
> @@ -803,15 +803,12 @@ static int zforce_probe(struct i2c_client *client)
>  		udelay(100);
>  	}
>  
> -	ret = devm_add_action(&client->dev, zforce_reset, ts);
> +	ret = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to register reset action, %d\n",
>  			ret);
>  
>  		/* hereafter the regulator will be disabled by the action */
> -		if (!IS_ERR(ts->reg_vdd))
> -			regulator_disable(ts->reg_vdd);
> -
>  		return ret;
>  	}
>  
> 





