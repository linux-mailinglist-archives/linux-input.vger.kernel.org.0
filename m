Return-Path: <linux-input+bounces-7046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C998F00D
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 15:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7DF91F20FA2
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 13:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3319C199386;
	Thu,  3 Oct 2024 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPVLKO5V"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E614F9E7;
	Thu,  3 Oct 2024 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961065; cv=none; b=I85n3XAbALRQ+OPprqaF4Vi4wTLG82VFmoxyBvDkEswThi9ZNJeZQ1Q1nyDB6gqiUdkSe+fvPWjPX/s35EJgS3THNVT7UfQWNyriGW5WMxtUrTT4yTgIDIBQnTvxrSExJ9ogGdJ2wuvVWfVO50tE0QHj6zUdLGGdnF3BV8zg9aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961065; c=relaxed/simple;
	bh=fKaaK1t8ZCxAiqATnpJy3e0owJdew3z1bPDFtVOeGLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+1+zgbp2DLOCn8j93ahIIpMJdvb3MHaqdkFw5jjgDwhqDnb0P3m3BbN3BQQ3dg61Optix9hBNDes7r8KY8tnd15PtGDoNPH8rchUgnvFJqGz8G/vQc7j+NzP84l28bjIRih7yWk3yTBf8EMhaXbAo0zw6CLdxU63T9ANVv9Kss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPVLKO5V; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e077a4b8c0so688609a91.1;
        Thu, 03 Oct 2024 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727961062; x=1728565862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5NdxgfEzX8ias7S8o2MIyW24FbQbPXLM7CRi1/yip6Y=;
        b=NPVLKO5VOfQvb/spBJnA6MV2gqFWK6UqBcYj8AU5OVDqhxRIJUTx4lICgz3MWYEzyp
         1QSZNwLkVcjFHS5i8g7yWntDtwQNtbTu3UlHZyAC7gor/Kefh9o3+JuRonHkNi8oeiB6
         4WuMxaLoVP+BD1uTfr1mgDnr8C43wSJ1BXNCGfuFrLay+IjncmDCBCliwqJtJbcoX4hg
         b6MiEBibYgNq1b8ZBiio73WV7A0qEm+3TfgpJ92Ad+DpsP/yQjHLB/Sn0925bObG8HCr
         YgGRtWKw5PzaIBPnODtQZW/9sfGwPLnvafY6q5R4fmlPYyFhQ0VAe5ZGVSCGGuZ+NZzM
         ibmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727961062; x=1728565862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NdxgfEzX8ias7S8o2MIyW24FbQbPXLM7CRi1/yip6Y=;
        b=MUf32q1suSdCTTpNz2ovAlgNpDcFBqTnUvqDauXdjTp7qvMyuaKFz2qNRqehKXEixK
         EFiuor22skYEcPvPMec8diIVo+DQTz7D2AtFyGXqJi5A55IbG0oMD72TLX7glBpWUKsS
         YpuccZ19UwDp61WXQDuAxIE5z/QObTySjVTb2qyKOSWnKnHvRulE0OTmijN+5GxzVkcg
         BIVJJk3Ps4/9iK9xGElm3PULz7d6ZEKlnjWApdFNqkrGJtoEG3eigMXLTxPC43rsLiUi
         HD3sXQ6be2NH9D++2kv/TYG+OP9PD4qvC1hihfxLa7zn0DbAcg7jXp+e3x1Z5xPSYfh5
         d9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVocCWSj0ZZGQkIyMpTjCdluClfWM3LVlhcwia0oKWNiSiItgqw+t/a6XMGj8YNwEWSBybbdZ3eFuW5ZyJ5@vger.kernel.org, AJvYcCXz5m+3GCyW+Di+bHQCLlis/EHqXAIVGIGYN4N3DPC30wTw2ypXR+c7WOReSLutJPsxE1ICNxvVa5FmxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/csbDgMzMWN7yVGMd3NafgxR66mqrJ2R3pT2GGU0nekjl0z8a
	25HUYDPGpLbOyGkqrPOSnUbb/n8kV4032kVVLBW0saaaBIVgWFQr
X-Google-Smtp-Source: AGHT+IGS2rzEgUeiGSDp5f6Zk5nSGJqlENlGxGXVMDON1IQQG+Nap3NFwrJxIJpNXLNxYDajBKEGfw==
X-Received: by 2002:a17:90a:3482:b0:2d8:85fc:464c with SMTP id 98e67ed59e1d1-2e1b38c6e58mr4768575a91.11.1727961062319;
        Thu, 03 Oct 2024 06:11:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18fa61d7esm3659956a91.57.2024.10.03.06.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 06:11:02 -0700 (PDT)
Date: Thu, 3 Oct 2024 06:10:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jakob Hauser <jahau@rocketmail.com>
Subject: Re: [PATCH] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
Message-ID: <Zv6X46ks3xD0p4pn@google.com>
References: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
 <Zv6Dai0WOSn8GOsr@google.com>
 <0559f42a6a1ff5813884a4a78de23f54@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0559f42a6a1ff5813884a4a78de23f54@trvn.ru>

On Thu, Oct 03, 2024 at 06:08:57PM +0500, Nikita Travkin wrote:
> Dmitry Torokhov писал(а) 03.10.2024 16:43:
> > Hi Nikita,
> > 
> > On Wed, Oct 02, 2024 at 06:01:48PM +0500, Nikita Travkin wrote:
> >> When initially adding the touchkey support, a mistake was made in the
> >> property parsing code. The possible negative errno from
> >> device_property_count_u32() was never checked, which was an oversight
> >> left from converting to it from the of_property as part of the review
> >> fixes.
> >> 
> >> Re-add the correct handling of the absent property, in which case zero
> >> touchkeys should be assumed, which would disable the feature.
> >> 
> >> Reported-by: Jakob Hauser <jahau@rocketmail.com>
> >> Tested-by: Jakob Hauser <jahau@rocketmail.com>
> >> Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
> >> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> >> ---
> >>  drivers/input/touchscreen/zinitix.c | 33 ++++++++++++++++++++++-----------
> >>  1 file changed, 22 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> >> index 52b3950460e2..1f726653940c 100644
> >> --- a/drivers/input/touchscreen/zinitix.c
> >> +++ b/drivers/input/touchscreen/zinitix.c
> >> @@ -645,19 +645,30 @@ static int zinitix_ts_probe(struct i2c_client *client)
> >>  		return error;
> >>  	}
> >>  
> >> -	bt541->num_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
> >> -	if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
> >> -		dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
> >> -		return -EINVAL;
> >> +	error = device_property_count_u32(&client->dev, "linux,keycodes");
> >> +	if (error == -EINVAL || error == -ENODATA) {
> >> +		bt541->num_keycodes = 0;
> >> +	} else if (error < 0) {
> >> +		dev_err(&client->dev, "Failed to count \"linux,keycodes\" property: %d\n", error);
> >> +		return error;
> >> +	} else {
> >> +		bt541->num_keycodes = error;
> >>  	}
> >>  
> >> -	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
> >> -					       bt541->keycodes,
> >> -					       bt541->num_keycodes);
> >> -	if (error) {
> >> -		dev_err(&client->dev,
> >> -			"Unable to parse \"linux,keycodes\" property: %d\n", error);
> >> -		return error;
> >> +	if (bt541->num_keycodes > 0) {
> > 
> > I think this check is not needed and "if" can be folded into "else"
> > above. But anyways, do you mind if I rewrite it as follows:
> > 
> > 	...
> > 
> > 	n_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
> > 	if (n_keycodes < 0) {
> > 		error = n_keycodes;
> > 		if (error != -EINVAL && error != -ENODATA) {
> > 			dev_err(&client->dev,
> > 				"Failed to count \"linux,keycodes\" property: %d\n",
> > 				error);
> > 			return error;
> > 		}
> > 	} else if (n_keycodes > 0) {
> > 		if (n_keycodes > ARRAY_SIZE(bt541->keycodes)) {
> > 			dev_err(&client->dev,
> > 				"too many keys defined (%d)\n", n_keycodes);
> > 			return -EINVAL;
> > 		}
> > 
> > 		error = device_property_read_u32_array(&client->dev,
> > 						       "linux,keycodes",
> > 						       bt541->keycodes,
> > 						       n_keycodes);
> > 		if (error) {
> > 			dev_err(&client->dev,
> > 				"Unable to parse \"linux,keycodes\" property: %d\n",
> > 				error);
> > 			return error;
> > 		}
> > 
> > 		bt541->num_keycodes = n_keycodes;
> > 	}
> > 
> > 
> > Or maybe to avoid checking for specific error codes we should do:
> > 
> > 	if (device_property_present(&client->dev, "linux,keycodes")) {
> > 		bt541->num_keycodes = device_property_count_u32(&client->dev,
> > 								"linux,keycodes");
> > 		if (bt541->num_keycodes < 0) {
> > 			error = bt541->num_keycodes;
> > 			dev_err(&client->dev, ...);
> > 			return error;
> > 		}
> > 
> > 		...
> > 	}
> > 
> 
> Oh, yeah, I didn't think of that but explicitly checking the presence
> makes the code easier to read. I think both options are fine but I'd
> prefer the (imo) easier to read second one. Should I submit a v2 or
> you're planning to fast-track it?

Please submit v2 since you have the hardware to do a quick test.

Thanks.

-- 
Dmitry

