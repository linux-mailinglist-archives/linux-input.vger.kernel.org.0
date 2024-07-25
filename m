Return-Path: <linux-input+bounces-5161-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA593C9E7
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 22:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47DDB1C22018
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 20:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D51369B6;
	Thu, 25 Jul 2024 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYr8YAFW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B51061FCE;
	Thu, 25 Jul 2024 20:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721940771; cv=none; b=douq6TSZNM/DiO32ETWKOq1yPyYGsXRRynM7LIYsKEYyEFnI7g4tC4Vkxc4XB4K1dF/MPctpPetSTJpAw15MCys0ooTE40OX2epku3tgwP4onnV1Eg1lzP/thW6eU8P0xvUo22DCnIOctEQzi3aKpSomGY5wkGnaq+gi1EM3R8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721940771; c=relaxed/simple;
	bh=bvtP0Gz5gIjyHQXzjavqqFRTb5tU3ugzT8R8kdlQAxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjULB0UgEzi2eiSTsMG1PXAeRgE93TICjKdz8fROgl0RB3PhysuO+dmgCwJGEdK+/qXYG4naoaAtjB0QhvQ3GWGtVF5yel0XuV9Dq6wftKvPUeIPDZdtdaWLQGDVaIAr2vRO5WKZa54FmkoGc8HqqnMYLFRy8lHyRVXE2on7zJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYr8YAFW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d150e8153so184513b3a.0;
        Thu, 25 Jul 2024 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721940769; x=1722545569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xlkejLGkKHEiw0rNYla9wLAXy9Y4l1wus7IHgzjF+q0=;
        b=GYr8YAFWcBcT3hlS4RvFVDPq7XkNvXzQ6lbV4YtJ96zlXFLxxlWOsoxQ/n6ttCQKZO
         uDeyXtPlyeDVqJs98fZQrjECt1OeJA5U2b2JjqRDuJ7I/JbjgB9L/k+EDn+puGGbQVS0
         uicdyPohgT5L+MGTfrt6FBsbbrFeFcrxEW3IvsFtCJUyeJO5/PlqTQfiDGXhdTUaIdc3
         KZ/TBKg4lOaU2358nzG4WY7UMgO3MLcBDs86fEouCnLNZsByD527tCWGwywb1Wo5nt07
         v0h2usk7IJhpxqON1hqnVA79wwDjDv6eHlxpSJ8Ac8d3ePCWziTbfjY9DgIrJ79no8xm
         IsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721940769; x=1722545569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlkejLGkKHEiw0rNYla9wLAXy9Y4l1wus7IHgzjF+q0=;
        b=f+HWmnZLu+BNmYQBbRdhBLJqrIpyQcCQfuT8w7OB2zL6FLd/ySPiXGRHsVofJv6Xjz
         l8EQGwMZv+MyYaowYzcyFNfD+xFf8UUUVeXtxSU+JA4z904MK+h459458tKnA7ce6pws
         HY1s/u/iXS9O2gKa+/eC3ynGeb3etJESg0mJ5jJTVP+osJX6jZJB1rqWo1o1gbZRx3ae
         feieKoqxSOm7xFUldehEZNABfJ4RX//tC57jBpSIEz+yeBTPxcDJw4nJaQBjGWaDYzdk
         OMPpEk3AF/zGu6N+y9RRm1u39GLnKTsBgmuHEsf1Tek+YqbNEUewUDBv60oZZvyuT9Pn
         vuag==
X-Forwarded-Encrypted: i=1; AJvYcCVtsvADp8+j+c98WLg3ji2q4xz94OoFvXWKmFfgND/B7TH9vUD1F1Cth2nyNqX/s8ulPsM52bPxp5yziQJQjw+rQkYomoUdrz8ZotKvQ4uyOYyYrxL9zK5Wrz22fXMINzAsXQBpV3s3AhuZhC3kmD1MECUMzi5P8RsA6UA5DkEEs0njYTNofBxkIR8=
X-Gm-Message-State: AOJu0Yw+kEA5iG2MLzBf+8x/UHDRUISINIT/xsW2nv/Y5eBVBkvhtE1f
	Vo1m6x1mcie5qxWMRElL8/ePKNx7Z43YJWZHxSkp/ViC6yP7y1Py
X-Google-Smtp-Source: AGHT+IGkyZWUGDzBobgCFroo7N5PMpb6zoLSb1BieNY5/5MUoS2pw2oKyuoQwDZV1VykqKMeoN7lRg==
X-Received: by 2002:a05:6a00:9296:b0:70d:2ab5:8677 with SMTP id d2e1a72fcca58-70e9ee90bcemr11714128b3a.10.1721940768582;
        Thu, 25 Jul 2024 13:52:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2c0d:838d:8114:e714])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81234dsm1531237b3a.115.2024.07.25.13.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 13:52:48 -0700 (PDT)
Date: Thu, 25 Jul 2024 13:52:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vipulkumar.samar@st.com, viresh.kumar@linaro.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: spear-keyboard - Fix a double put in
 spear_kbd_remove()
Message-ID: <ZqK7HQMtV8oavTsM@google.com>
References: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
 <a39197be6248ebe5385e4f352241b4ba5e857c42.1721939824.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a39197be6248ebe5385e4f352241b4ba5e857c42.1721939824.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Thu, Jul 25, 2024 at 10:46:49PM +0200, Christophe JAILLET wrote:
> The 'input_dev' is a managed resource allocated with
> devm_input_allocate_device(), so there is no need to call
> input_unregister_device() in the remove function.
> 
> In fact, this call was correctly removed in commit 6102752eb354 ("Input:
> spear-keyboard - switch to using managed resources"), but silently
> re-introduced later in the commit in Fixes.

This change is incorrect as it leads to an active and enabled clock
being unprepared to early. We need to unregister input device which in
turn will call spear_kbd_close() if needed which will disable the clock
in question. Only after that we can unprepare it.

There is also no double put as input core will recognize that input
device was unregistered explicitly and will not attempt to unregister it
2nd time through devm:

void input_unregister_device(struct input_dev *dev)
{
	if (dev->devres_managed) {
		WARN_ON(devres_destroy(dev->dev.parent,
					devm_input_device_unregister,
					devm_input_device_match,
					dev));
		__input_unregister_device(dev);
		/*
		 * We do not do input_put_device() here because it will be done
		 * when 2nd devres fires up.
		 */
	} else {
		__input_unregister_device(dev);
		input_put_device(dev);
	}
}

> 
> Fixes: 9336648978c2 ("Input: spear-keyboard - add clk_{un}prepare() support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>  drivers/input/keyboard/spear-keyboard.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
> index 557d00a667ce..5d9fc8dc9433 100644
> --- a/drivers/input/keyboard/spear-keyboard.c
> +++ b/drivers/input/keyboard/spear-keyboard.c
> @@ -276,7 +276,6 @@ static void spear_kbd_remove(struct platform_device *pdev)
>  {
>  	struct spear_kbd *kbd = platform_get_drvdata(pdev);
>  
> -	input_unregister_device(kbd->input);
>  	clk_unprepare(kbd->clk);
>  }
>  
> -- 
> 2.45.2
> 

Thanks.

-- 
Dmitry

