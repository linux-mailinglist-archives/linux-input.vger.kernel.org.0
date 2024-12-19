Return-Path: <linux-input+bounces-8670-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136289F7E11
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 16:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC4401644CB
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 15:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBD3226183;
	Thu, 19 Dec 2024 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hBSm+897"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1C224887
	for <linux-input@vger.kernel.org>; Thu, 19 Dec 2024 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622140; cv=none; b=r9xxg3mTHq1hsXtwbTU6fYO/v6P7sU0m44AviO8cBzqe+8VZejaqr6j42GTKDLwGVlZ5KTiMbghnGwkbV6kwz0cPQ9BIzMxGVfVT2sZqGGFCpI7jucGN9ey36ATeklKQTklYu2KJv33+mYwyVp2pK8iUqEzDoL1AaWq3riB0Cok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622140; c=relaxed/simple;
	bh=hcNTFyqKUMwCVdpKIunAnnA4wJG20Ea02Nyh//Qeuhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNY9IefuHnyam/cDZmUOFA7HQmhXXOVHr3Vj1jzBlMlswqKZvPUFjK/M/HaPGEyUJSiycQcaemb2vpuQNH4111B2GegLoAUhX7DXAXo/dA0bck2zJ6+eUSXy9xqFDn80oDDyovVuhbY0OkeCfQ5PPUmfauuqOk/SAVcXQxnwf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hBSm+897; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734622137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbGerx+1B2MPYn30VAqdVqqBm24gLGl8v6xJ0+hVNZc=;
	b=hBSm+897Myw80WaM64PSw/a1wmThoLdj2Eswi0tbXPIegb+qgsA9QIM2gSZPxYo0JET6HO
	A7bD92sVn3yQD8RstkkVe+TGphNJhEusri8KAe/vQ1kSz/cKFlNw6dok+jVqaI8bVjDDU3
	BeNC0/SjbPaksUH/HdzPL/N/FEy4UgE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-agofYwdTPpmTKC856gXxYg-1; Thu, 19 Dec 2024 10:28:53 -0500
X-MC-Unique: agofYwdTPpmTKC856gXxYg-1
X-Mimecast-MFC-AGG-ID: agofYwdTPpmTKC856gXxYg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6a87f324cso87911966b.1
        for <linux-input@vger.kernel.org>; Thu, 19 Dec 2024 07:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734622133; x=1735226933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbGerx+1B2MPYn30VAqdVqqBm24gLGl8v6xJ0+hVNZc=;
        b=dSAPfpzOWeIUOkiCTWOsyeFIFEoYoDmF3SVKWeFkAsOlDZdYr3bSua3RMjcKr6YFMd
         vEw5Qff83zPdZNaarN4eLGJfU7IFi31aQ+HSzDVVH0+PQfgfA3pLiYzgVILA/T8H674M
         FksRM5oxiK/CD3N6ZjnjqX772B9CavFTNDUQyL8JHhO56WO3cGNVx6+r4TBtXPN33XEQ
         9MWFvpUxD4RT1mwjHAj8N41o7PSnKaQ0ykcOi52clY9nalG7z1kk8zrxm8CnkjOkGRMc
         dmBog+EEI1hI4BmfjqTd0YbM7ZkDFvib2MjNqwSsAc/E4hHgJTmo+v3GNRlMqOZrL76J
         a2aA==
X-Forwarded-Encrypted: i=1; AJvYcCXe0P3HnaeKRNvx0R02ZVEvMx3KDnapM+cTbfJLA1D3VTXqsMcV8BR+ZsiQ0sifZO9NfIAaHweLMASNcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4u0yHBMZLr9QdRSelaGOW54pZin5HNcpxhE7x+Rclpfd+yKfT
	NqsMBJfYt1gsqdKFQ3kqiibVFeOK/K0+miZRHcyUzPPA6pooxJavFDjPrdUMmvnjrwhAxFvjDy1
	7RXidcvA0sZRYOlAOx8ucimL7/4cSgw348y27BORfzyRlrI8Sw21soJHLttAf
X-Gm-Gg: ASbGncs313Ko1d0ice6IBHtpxTrVk3pBmiCJsi/yw+T+6cIAPEH2/Klpfly1efQ7p05
	5yBeqYJI87jkj4gl6RcNWYtRgEopLlgP73x8If0mso9ADkfGbW9H/c7RGYdk7/SlEnHN7LVFhGP
	pubEYgTVqj5St+gv/nd+/ucuXvr+0v/IYv8TBVsSHu0pvKydy9Xtf+AhWNVvUYi02zZMe1eKW2F
	91y20weHgc5yG2Zt1m7aEiQ9kYWs9i4ow9+gOEobnhuoRpJxBoa4YVzpVlmZ4u4sgttYcUV/Wt9
	IV/aZCJm+qc9Dv+xcxIcGPP9Xnw089D7+dzC4HsULrbyBFZ+dSm2FJ2gpPZCP5WEyJTu+jbettn
	zK7kYqhub+NgQ+B4YqqDUmYLx6o68TJA=
X-Received: by 2002:a17:907:3e1a:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-aac07b0376amr291358366b.56.1734622132656;
        Thu, 19 Dec 2024 07:28:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8VMwMtkbtAbXw7OMyDkv07qrlWHVjiVumV9c+kDfvHsYUlcZcWuud0FzWXP9xkb6+O/Q77g==
X-Received: by 2002:a17:907:3e1a:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-aac07b0376amr291356166b.56.1734622132254;
        Thu, 19 Dec 2024 07:28:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f070a7bsm76122666b.201.2024.12.19.07.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:28:51 -0800 (PST)
Message-ID: <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
Date: Thu, 19 Dec 2024 16:28:51 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+Cc Peter Hutterer

Hi Mark,

Thank you for your patch.

On 19-Dec-24 4:18 PM, Mark Pearson wrote:
> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
> generates is not mapped.
> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
> the expected value for copilot.
> 
> Tested on T14s G6 AMD.
> I've had reports from other users that their ThinkBooks are using the same
> scancode.

Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
there are 2 issues with this approach:

1. /usr/share/X11/xkb/symbols/inet currently maps this to
   XF86TouchpadOff as F20 - F23 where repurposed to
   TouchPad on/off/toggle / micmute to work around X11
   not allowing key-codes > 247.

   We are actually working on removing this X11 workaround
   to make F20-F23 available as normal key-codes again
   for keyboards which actually have such keys.

2. There are some keyboards which have an actual F23 key
   and mapping the co-pilot key to that and then having
   desktop environments grow default keybindings on top
   of that will basically mean clobbering the F23 key or
   at least making it harder to use.

I think was is necessary instead is to add a new
KEY_COPILOT to include/uapi/linux/input-event-codes.h
and use that instead.

Peter, I thought I read somewhere that you were looking
into mapping the copilot key to a new  KEY_COPILOT evdev
key for some other keyboards?

Regards,

Hans



> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/input/keyboard/atkbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 5855d4fc6e6a..f7b08b359c9c 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -89,7 +89,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>  	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>  	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
>  	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
> -	  0, 89, 40,  0, 26, 13,  0,  0, 58, 54, 28, 27,  0, 43,  0, 85,
> +	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>  	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>  	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>  


