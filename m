Return-Path: <linux-input+bounces-5659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF8B956B4C
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29E2B1F22E4D
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 12:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFC516B752;
	Mon, 19 Aug 2024 12:54:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3BE16A95B;
	Mon, 19 Aug 2024 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072086; cv=none; b=A8rE5Yb/rTLZN6hx5BrQ2q6D36Yd8zpWP8L3Yrdyx68ajtooIbXesgDJvD+LQImkh1s+TQ3JZxmt1Jcj5jire/nPCroGJltsacYTeS8ftX2S1nCO35TZme0cp+n7Esb126F4D+rnhaYPMPjTuchW9TNMTM5w+v1EZxxowZSTDF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072086; c=relaxed/simple;
	bh=x7cKfk074uAaag+7WIUWZ1a+Qj+BXtwY8p59LBstgmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWREmytt/GWWsCXYaC4KZebdW4OuwRSgsbbdIA37v+fomywli8e6jINFpYytU5EH3Xom+LjRbV0KKfspFGjFlxn5WiGxKW0kOaQHOUjnQBkR9EaE3thDQrPk43pv4K+t4seImoiuoFiFpHfl57uiL1ErXb9bz6IbZqKwDz2U5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so34341805e9.0;
        Mon, 19 Aug 2024 05:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724072083; x=1724676883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RbEInPK5+tBponMBMdk2lgWirV2b4TtuNIxrJRlIjA=;
        b=wEbw6Lg08KoXjxAfj9t1J+0FZtYGEyB1XyGV6dvCpn0Lrcu0hFC0rdITYQnm1UutWj
         bj7H2+fFCoYHVuxn7ZMU4QBgG2kcjiHbYEW+k9HMP7coFPQ8Gh7j8fahaMs55HtA62Ll
         ypyqfEbX4QaPmhDdp+gPjDnw6MzEJZ+MBQa8SRD8dh/zMpbuLRYYBMMsGX05hVsyrCko
         FLw5wJiEPkOqnURwxcyXWBQRtFLbKtzNNjQtLFJxlJeErItfypIuJXLoNT/X3yvQzS+N
         4Kt/qG0ryAlJbWwr2bCXB5KP/4in2DHr6qsCmJe+VcP9mn4H4RG389JJdlJdEyDrks5M
         hhwg==
X-Forwarded-Encrypted: i=1; AJvYcCV+k83ksgN7llL3qv37BXNH+kfAHEyhdEXdtnyk7WZiOs5whLTZfvTTHpAA2+NWVEitYZ8+YuyhVUZZlxWMTBxLw416MsgfDzGltgbg+PU/DM3pPze5JU79geZkmnN0Bt8lZpaWFNrArIgywwGhkeClX21ebRUANhZN3VIoopQ05JqCTiaqMYMjDYDmrF6Ej5Xvgh1n28Wzojdbn91nT0TnsHV4bc53eVs=
X-Gm-Message-State: AOJu0Yy+ulcmjZ514LFM+InbB/UWrrSbMkII2UjQCrDRTBswICLbxsLg
	Sj5Gb0qvNfGTrQd4WwcwgHrSWH/d5oBnelv/l/diaPUjH7YatMXneFtT9A==
X-Google-Smtp-Source: AGHT+IG++ok9lWADVGTBunua6rCJ+KvPzkAe6bPu8m1tw+nMFYZ23Bj9drFDx3X6EdN0ajAKC43c1g==
X-Received: by 2002:a05:600c:a05:b0:426:554a:e0bf with SMTP id 5b1f17b1804b1-429ed79f5camr70799655e9.16.1724072082834;
        Mon, 19 Aug 2024 05:54:42 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded36a95sm160746995e9.28.2024.08.19.05.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:54:42 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:54:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 05/14] Input: samsung-keypad - use devm to disable
 runtime PM
Message-ID: <bkkh2as5v44nldhpnmswt7pssiude6ddci7v5nvzqhba6xxbnj@veoftlgrhu6p>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-6-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-6-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:02PM -0700, Dmitry Torokhov wrote:
> To make sure that runtime PM is disabled at the right time relative
> to all other devm-managed resources use devm_add_action_or_reset()
> to register a handler that will disable it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/samsung-keypad.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
> index 7adcd2657bca..924327de4d8f 100644
> --- a/drivers/input/keyboard/samsung-keypad.c
> +++ b/drivers/input/keyboard/samsung-keypad.c
> @@ -310,6 +310,13 @@ samsung_keypad_parse_dt(struct device *dev)
>  }
>  #endif
>  
> +static void samsung_disable_runtime_pm(void *data)
> +{
> +	struct samsung_keypad *keypad = data;
> +
> +	pm_runtime_disable(&keypad->pdev->dev);
> +}
> +
>  static int samsung_keypad_probe(struct platform_device *pdev)
>  {
>  	const struct samsung_keypad_platdata *pdata;
> @@ -420,11 +427,16 @@ static int samsung_keypad_probe(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, pdata->wakeup);
>  	platform_set_drvdata(pdev, keypad);
> +
>  	pm_runtime_enable(&pdev->dev);
> +	error = devm_add_action_or_reset(&pdev->dev, samsung_disable_runtime_pm,
> +					 keypad);
> +	if (error)
> +		return error;

I think you are open-coding devm_pm_runtime_enable().

