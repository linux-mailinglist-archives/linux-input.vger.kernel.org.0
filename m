Return-Path: <linux-input+bounces-2301-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4CE876E4A
	for <lists+linux-input@lfdr.de>; Sat,  9 Mar 2024 01:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A5A9282BFA
	for <lists+linux-input@lfdr.de>; Sat,  9 Mar 2024 00:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E69B7FA;
	Sat,  9 Mar 2024 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaCbL1jU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5D810;
	Sat,  9 Mar 2024 00:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709945632; cv=none; b=fcfQzBwj0XxyZ8CIkAxt6gDKgmQXvruUyzUVCfSKCb1boWCakELB4qk+gzilgl+lqa9QZrTOLPn4aTRbuTdy4i5iM6IsdMX0bwbcvHuiKoEosTEa3z+DnCgTLPumfPg9GsatW0TA2lYjWEjXnPq41Tjhk/wopmCN94Hb3ctFulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709945632; c=relaxed/simple;
	bh=sBS/E+9RYfG8VDbxBvKEINIwthVjn+/3VWTvf/SBitQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1/7oEcQfclR9x7ilV2oN8akd+FJzaXspFIR9ebfB8eCOsGxtcAmpHDW/2qJSLVv9616F41qxY+iQbBrt86fIEVaxx9VQ7CqzXSWRmbkHV/79Q0eptsw2uyKSwhcb2KFCIKB2l/LA97/NoLsbjnExEYDA1W0qJIs/cISS59P8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaCbL1jU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412e68b8594so19364695e9.1;
        Fri, 08 Mar 2024 16:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709945629; x=1710550429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Hdx09+d1D0tFZrI6Mxlyu45Tbnev2I6krb0Jix0agU=;
        b=aaCbL1jUJ68cLK+39lc9+X+oQ6j7kdQo5yc2+33E1vOqmtCazr6vA2F5IrIW8dQuzi
         kYEje9kh5CT/NXgYtQiW9NvMBhMygeb2IGY07DZRjFi/haK/rdCw3UuX0JNEoV1vPUcQ
         DAxCPQVGK52UhI0E+qihltpDikfktLMLbu4ldIIfuNNDEg42zENjpS58Q+R1zdSkvag6
         k17YWG7HTQ65TkjfCqQzpDz7sPWV1kxwD6KH8IL8AL/MVfZhMCxTKwIjNIblgTRGJgb1
         7fTw1Pu70uOOEa12m/YRrC6y4tmkj31Rvd2z2n+0mXKO5E4du0++Tkj/LL6pMSPzjvD2
         HBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709945629; x=1710550429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Hdx09+d1D0tFZrI6Mxlyu45Tbnev2I6krb0Jix0agU=;
        b=Fx/CPhpQHAbR0yQ6HI92cBFE0MnSBhczaG7OASl3lJoMYoRhY1J2SP9zWL6Yuy4p1p
         SV5LRqO/VbNcfr4QZOQ/gZjtjCy6s36mJjNfldskgmQxJcXtxbWktYkRwD1yqGCy29eq
         fpbT6XfekKEXrRtdWj54cISkxJHDy9LfVbuTfchkAuCoecqfMD2MECr3OgAqshR/kv4c
         NeyZHKBelazzoaRET1c+MpwxSyYKc7SpDXpFeCTKt6UC+g+ZF7mEK7iO0T+JtQL2uGeI
         f6CM2YNpKINgLOl5N9wPd2+DkNUQtXAwOU3beP1UX2KlM3JwnTfqSzfvVRGe86AKe+J+
         rupA==
X-Forwarded-Encrypted: i=1; AJvYcCWQlqC6M7z5XqifoqY9feViVP6p0x9EWQKcCSE4YiO486JZvqxc7ocY5lxw6+VbfX+jro+zUBnG6YXzUU8xKtwVu7ZsW7aOzKW2OnjskYi6d3ARCQ==
X-Gm-Message-State: AOJu0Yxiuvt6pXv1lJTxwbzrqrXNJhODjHz1qJMsSuAFSB+vpseLIUZ4
	0ir/wk9B2pgoW2r2aNMOmvjRg4UOacl4DkKP1Zy6xgQEf7xlCZkdjzaLrRvB
X-Google-Smtp-Source: AGHT+IE8+MVX2/x69L02bm5YD1xJuMSZGuGbQRo+U2p3KPTlLuzMCt3tyw0ywyeYOIjcQpc6wC67zw==
X-Received: by 2002:a05:600c:314f:b0:413:127f:f73a with SMTP id h15-20020a05600c314f00b00413127ff73amr517743wmo.20.1709945628351;
        Fri, 08 Mar 2024 16:53:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id o1-20020a05600c4fc100b00412f12f00adsm906323wmq.10.2024.03.08.16.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 16:53:47 -0800 (PST)
Message-ID: <94ba9368-6ce6-4d05-a576-fc58a474df7a@gmail.com>
Date: Sat, 9 Mar 2024 01:53:49 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] HID: surface-hid: kbd: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 kernel@pengutronix.de
References: <cover.1709747164.git.u.kleine-koenig@pengutronix.de>
 <05d0d6ef781ebd6124a36f70cda1f90331799dc7.1709747164.git.u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <05d0d6ef781ebd6124a36f70cda1f90331799dc7.1709747164.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/6/24 18:50, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Looks good to me.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

> ---
>   drivers/hid/surface-hid/surface_kbd.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/surface-hid/surface_kbd.c b/drivers/hid/surface-hid/surface_kbd.c
> index 4fbce201db6a..8c0cbb2deb11 100644
> --- a/drivers/hid/surface-hid/surface_kbd.c
> +++ b/drivers/hid/surface-hid/surface_kbd.c
> @@ -271,10 +271,9 @@ static int surface_kbd_probe(struct platform_device *pdev)
>   	return surface_hid_device_add(shid);
>   }
>   
> -static int surface_kbd_remove(struct platform_device *pdev)
> +static void surface_kbd_remove(struct platform_device *pdev)
>   {
>   	surface_hid_device_destroy(platform_get_drvdata(pdev));
> -	return 0;
>   }
>   
>   static const struct acpi_device_id surface_kbd_match[] = {
> @@ -285,7 +284,7 @@ MODULE_DEVICE_TABLE(acpi, surface_kbd_match);
>   
>   static struct platform_driver surface_kbd_driver = {
>   	.probe = surface_kbd_probe,
> -	.remove = surface_kbd_remove,
> +	.remove_new = surface_kbd_remove,
>   	.driver = {
>   		.name = "surface_keyboard",
>   		.acpi_match_table = surface_kbd_match,

