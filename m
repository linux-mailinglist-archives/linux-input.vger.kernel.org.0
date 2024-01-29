Return-Path: <linux-input+bounces-1537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FFC840C7B
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 17:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAAF1284B79
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 16:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AA915699C;
	Mon, 29 Jan 2024 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1JVwQ4B"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D14157049
	for <linux-input@vger.kernel.org>; Mon, 29 Jan 2024 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706547274; cv=none; b=a9iF4bpQ7teP5jWI5XhZLz3dFTFgZaQqKwhfUbwBkJhV0HSpGBXuWx9enthWNk3k0Xn1vGJHLhPFDx/GY6YZDZ3Srs1JG2T0R27dxgCa/Q44foNgfALxAvqq1MYDhp4cIGWupeyWK679qrS0h73hnuO1p+KrUqlGUDG8H68O3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706547274; c=relaxed/simple;
	bh=iFNzd4mw40s4KUm6eOReaJzKwb+wS/JRCr/xou02cuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvM6vw868TT69nAmiMMXSe7IvpbHERfh8oTPWUlJfzr9k1gAeUN3FvGbXMl9mqL+D64ZywpY7r3VsY53ifC/sraeTrVdwMW1EBjnFe198yVVOGAArbQAhXXuwLjL1lzGEE3dyaR7WNcFVgU+eLiMvwd6bsHn509AjI5w/2QnLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1JVwQ4B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706547271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IB0VM0uJ1/FZbzHRbCVJX5WpCqsKxQUXqystAOpQFds=;
	b=D1JVwQ4ByZ6u1S7eh9TXewTFD8HtZxTs5Umn2dR9BosQCe86cIVa56IHZgE3ziWuMkDf5b
	ZQ1JsDQThifOZmymlcvw8sy7aDcgOZ1hlkNA5ly4EvVqH+L9ci8ISHX529NeYHQC5Sw1+t
	06CpxwWqSh/F33lKvkKQH3qK5vBWDwA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-067opFmINoqtlMrbD7HMKg-1; Mon, 29 Jan 2024 11:54:27 -0500
X-MC-Unique: 067opFmINoqtlMrbD7HMKg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a350f83730eso143527466b.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jan 2024 08:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706547267; x=1707152067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IB0VM0uJ1/FZbzHRbCVJX5WpCqsKxQUXqystAOpQFds=;
        b=WvU6dq6zTuCPED/lt2/kQ/ZblhARXAExGfplSHiDakhFGE9yN0aFcs97LiEvaBCqvw
         xvXYFB1eFavfajpFusYszIl7AaTv8eBCyd5tFOootmPsxclaeGQwtcbaf4UNNzfUJJm5
         WeAHkGyn/l+sYgw/yiiE7aIi2OhywrW0Bewzf4V2AgaMOmpSSv9QEY7E2eqa5N4mzhA5
         HEdmfWGqnqbh3HeBX5/PJ0eTgYXJ+Mama2ihXlQ2KCEturPmjwmAOJed0ssSWu2KUsts
         mCkZj1Bzt9p3dPdLC3CBFjk9ByyhLxr7k3tjvw7sF0mTSXfVne7PsUlXUOa1nG3uukaY
         dMCw==
X-Gm-Message-State: AOJu0Yzj/Uui2lL9EqQ54YzPR0iD71aZvWpxQMVSZ33L50xZyHR8FPlS
	+OcoI7fS3S3pdpRLSkJcKz42ccTQd214YBhxh1gFzTAKue5XriLdWmgCt11oaMRYPQIuP/tn1tG
	panM64l8/PsBPSf1MCxBKy8TWLnIxU52pWMTA/tQd52j3TE0CD0UumS/IDnPj
X-Received: by 2002:a17:906:6d8:b0:a36:11f:58fc with SMTP id v24-20020a17090606d800b00a36011f58fcmr426342ejb.40.1706547266872;
        Mon, 29 Jan 2024 08:54:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6GX9Muw9V608uTSaVb3N1AMA/7de2U9pcEOdDZ4kom1ckkYgQxh9xiaz+xeokcP2fjiMX/Q==
X-Received: by 2002:a17:906:6d8:b0:a36:11f:58fc with SMTP id v24-20020a17090606d800b00a36011f58fcmr426336ejb.40.1706547266580;
        Mon, 29 Jan 2024 08:54:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i6-20020a170906114600b00a35a3d322e4sm1631217eja.209.2024.01.29.08.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 08:54:26 -0800 (PST)
Message-ID: <4bd022b8-e4a9-4269-a261-65fddc791ec5@redhat.com>
Date: Mon, 29 Jan 2024 17:54:25 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: logitech-hidpp: Do not flood kernel log
Content-Language: en-US, nl
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20240129164931.38477-1-oleksandr@natalenko.name>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240129164931.38477-1-oleksandr@natalenko.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/29/24 17:49, Oleksandr Natalenko wrote:
> Since commit 680ee411a98e ("HID: logitech-hidpp: Fix connect event race")
> the following messages appear in the kernel log from time to time:
> 
> logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> logitech-hidpp-device 0003:046D:4051.0006: Disconnected
> logitech-hidpp-device 0003:046D:408A.0005: Disconnected
> 
> As discussed, print the first per-device "device connected" message
> at info level, demoting subsequent messages to debug level. Also,
> demote the "Disconnected message" to debug level unconditionally.
> 
> Link: https://lore.kernel.org/lkml/3277085.44csPzL39Z@natalenko.name/
> Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/hid/hid-logitech-hidpp.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 6ef0c88e3e60a..d2f3f234f29de 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -203,6 +203,8 @@ struct hidpp_device {
>  	struct hidpp_scroll_counter vertical_wheel_counter;
>  
>  	u8 wireless_feature_index;
> +
> +	bool connected_once;
>  };
>  
>  /* HID++ 1.0 error codes */
> @@ -988,8 +990,13 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
>  	hidpp->protocol_minor = response.rap.params[1];
>  
>  print_version:
> -	hid_info(hidpp->hid_dev, "HID++ %u.%u device connected.\n",
> -		 hidpp->protocol_major, hidpp->protocol_minor);
> +	if (!hidpp->connected_once) {
> +		hid_info(hidpp->hid_dev, "HID++ %u.%u device connected.\n",
> +			 hidpp->protocol_major, hidpp->protocol_minor);
> +		hidpp->connected_once = true;
> +	} else
> +		hid_dbg(hidpp->hid_dev, "HID++ %u.%u device connected.\n",
> +			 hidpp->protocol_major, hidpp->protocol_minor);
>  	return 0;
>  }
>  
> @@ -4184,7 +4191,7 @@ static void hidpp_connect_event(struct work_struct *work)
>  	/* Get device version to check if it is connected */
>  	ret = hidpp_root_get_protocol_version(hidpp);
>  	if (ret) {
> -		hid_info(hidpp->hid_dev, "Disconnected\n");
> +		hid_dbg(hidpp->hid_dev, "Disconnected\n");
>  		if (hidpp->battery.ps) {
>  			hidpp->battery.online = false;
>  			hidpp->battery.status = POWER_SUPPLY_STATUS_UNKNOWN;


