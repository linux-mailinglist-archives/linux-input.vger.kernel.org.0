Return-Path: <linux-input+bounces-7041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F498EE5A
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 13:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CEEDB216E6
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 11:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C78154C17;
	Thu,  3 Oct 2024 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCVbVKZY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36BD154434;
	Thu,  3 Oct 2024 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727955824; cv=none; b=ph67YQztsDtSWLLRgQv9H7ZP8HRd7/D93tyQ+CFMgv4PopRI1b2QdmHbfkIrI2ZwgrZjPSEkb2kBUzXnu7CB11rkQ/ViSqWiZJdeZCbaJ+SnqKrMRR5tiPAti0lKKlvVa1QvkhZXPCzfIwSmL3PGbr8BSlT9U3Vfih/LPsBSi4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727955824; c=relaxed/simple;
	bh=i3R691/UcXH6aWGktAFCgy6g4D2dkGWdusEwm1tyfos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFKuHP8gU3JzByme3XYIQJjWEUSyWxb6Raz5juwgZeRTdMx3xDfzhpINuMTfyPENORETYNvYY3p4OiFUkO+MU7J9ZfsTacbpwDUHC5J4YZMVbhZ2I8nYWh++BwWd1Ui1q8C6pPmXa2DVvZJkJHpAvOIvQkmGbTZgHJmrwGGJZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCVbVKZY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e053f42932so647525a91.0;
        Thu, 03 Oct 2024 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727955822; x=1728560622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZE0uq/LDzY4qmE0b+j+QSNQqLEy3ZgCjVlePJZ3Bd0=;
        b=fCVbVKZYdOs7sHnlP/Rr8k96FwEVKBoGXInktouO5ORK1oEeR2e8Yx88XHVExXuhYr
         qM9FcnoQYrPYldlke1jhXCEXh9v7VW0A8DfIEk8iMRtpyrOd7HzEwVd0/GkGHLgOxcTT
         15WU8S8xRTVzxrvARyoFu5YSBR6aa+csq5qEAF164HxeOjpvYNJFyRDWLQM3FfY7Pq75
         q8KVEyu/AyhAzyTljAYohKZwD/f7tb/472zZyhy6a7BwWSsXn/lqih4jSvjIX2a6n9xk
         /FMTBdyn/+5WEdzuiHvO5xMa7zbXZLkze99xlPQoHoAfjS9ttUXUir+wCEHMOWlIWXTb
         Ov4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727955822; x=1728560622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZE0uq/LDzY4qmE0b+j+QSNQqLEy3ZgCjVlePJZ3Bd0=;
        b=i5mszqUg0dshUVVJvly2bQEwIpkjj5YLUY0j1YP285u5IbTrTu+3whH4Cqa1rZW86L
         2GxmW3kUYksss/VjYCL0cYqhlO32+G8fcvhJa61bbbOpX0WcT0TFt4GnaXZTmxoTUTgp
         1T5cW5/facefcW/gF3o7DB16w/fVTPCbYUxVf8FkHridWRp0pNlOLBNVtt8O41WSb4C7
         WaYo5+spH/7tDn9g9exQMVk7CchJfmBX6aqF+enIaahCI3+X9VGdXrkb9fIT30j3D6MR
         0pPTXqTlQx4ar2awkOwWV6nN/VJlJoF+ezVlntEimgbcNrRm6KzLTftAO0QbIhZoIMBt
         NlKw==
X-Forwarded-Encrypted: i=1; AJvYcCWhnSC02YCs/lyVWyAIFVU6+rFa63tRdl54WJIdtEEfSJl9ylaFINStU78GnP3NyDTny36HJynWZhO9Og==@vger.kernel.org, AJvYcCXEhkend6qs4F7RwbKhuSfwtTzrBDfUIaQl1lwXjZoJJ9ki9j8zGYq6aaGMDsYZ4ydQ5fOgep6yAhxWuS1V@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxq2hHSJJIgyLInv5O1iYMy03Fbsw+YjmtyJofBqUwU2R0PGx2
	rF7/S+J3QZWR+0b3W0HJgvpOO8NqSt2qIDczD3mlpypByb3Y00ZU
X-Google-Smtp-Source: AGHT+IEJrNBlM7UNbuKt8o6MUnOwSHA8XYDZOqfQyarsyH7hHInG+p3hDcQGcCuTWSlvYIh1FVSn1A==
X-Received: by 2002:a17:90a:ae0c:b0:2db:89f0:99a3 with SMTP id 98e67ed59e1d1-2e1848f9e49mr7705888a91.26.1727955821926;
        Thu, 03 Oct 2024 04:43:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1bfd2a019sm1348197a91.45.2024.10.03.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 04:43:41 -0700 (PDT)
Date: Thu, 3 Oct 2024 04:43:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jakob Hauser <jahau@rocketmail.com>
Subject: Re: [PATCH] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
Message-ID: <Zv6Dai0WOSn8GOsr@google.com>
References: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>

Hi Nikita,

On Wed, Oct 02, 2024 at 06:01:48PM +0500, Nikita Travkin wrote:
> When initially adding the touchkey support, a mistake was made in the
> property parsing code. The possible negative errno from
> device_property_count_u32() was never checked, which was an oversight
> left from converting to it from the of_property as part of the review
> fixes.
> 
> Re-add the correct handling of the absent property, in which case zero
> touchkeys should be assumed, which would disable the feature.
> 
> Reported-by: Jakob Hauser <jahau@rocketmail.com>
> Tested-by: Jakob Hauser <jahau@rocketmail.com>
> Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  drivers/input/touchscreen/zinitix.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index 52b3950460e2..1f726653940c 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -645,19 +645,30 @@ static int zinitix_ts_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> -	bt541->num_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
> -	if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
> -		dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
> -		return -EINVAL;
> +	error = device_property_count_u32(&client->dev, "linux,keycodes");
> +	if (error == -EINVAL || error == -ENODATA) {
> +		bt541->num_keycodes = 0;
> +	} else if (error < 0) {
> +		dev_err(&client->dev, "Failed to count \"linux,keycodes\" property: %d\n", error);
> +		return error;
> +	} else {
> +		bt541->num_keycodes = error;
>  	}
>  
> -	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
> -					       bt541->keycodes,
> -					       bt541->num_keycodes);
> -	if (error) {
> -		dev_err(&client->dev,
> -			"Unable to parse \"linux,keycodes\" property: %d\n", error);
> -		return error;
> +	if (bt541->num_keycodes > 0) {

I think this check is not needed and "if" can be folded into "else"
above. But anyways, do you mind if I rewrite it as follows:

	...

	n_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
	if (n_keycodes < 0) {
		error = n_keycodes;
		if (error != -EINVAL && error != -ENODATA) {
			dev_err(&client->dev,
				"Failed to count \"linux,keycodes\" property: %d\n",
				error);
			return error;
		}
	} else if (n_keycodes > 0) {
		if (n_keycodes > ARRAY_SIZE(bt541->keycodes)) {
			dev_err(&client->dev,
				"too many keys defined (%d)\n", n_keycodes);
			return -EINVAL;
		}

		error = device_property_read_u32_array(&client->dev,
						       "linux,keycodes",
						       bt541->keycodes,
						       n_keycodes);
		if (error) {
			dev_err(&client->dev,
				"Unable to parse \"linux,keycodes\" property: %d\n",
				error);
			return error;
		}

		bt541->num_keycodes = n_keycodes;
	}


Or maybe to avoid checking for specific error codes we should do:

	if (device_property_present(&client->dev, "linux,keycodes")) {
		bt541->num_keycodes = device_property_count_u32(&client->dev,
								"linux,keycodes");
		if (bt541->num_keycodes < 0) {
			error = bt541->num_keycodes;
			dev_err(&client->dev, ...);
			return error;
		}

		...
	}


Thanks.

-- 
Dmitry

