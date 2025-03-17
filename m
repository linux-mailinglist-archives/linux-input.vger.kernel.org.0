Return-Path: <linux-input+bounces-10886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D832A64DAF
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 13:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 333E51897499
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 12:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAB02397B0;
	Mon, 17 Mar 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="higStgvO"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D2F23959D
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212744; cv=none; b=NTUAUM37mcz6uEeuuD/kQTa5gPlZE8Sw7AOOI2HJdU4u9M1bkNyH6z5pJF2HIbA3z1BSlS9DixN/aPQsU8ehv6QArinO88QmkYaKKxfIJWyRBsXvbQX7Jrvst+xAzytmwdxfGCUJNIb8npf855m0lOUl4V0uNBvaNlraMJOiiyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212744; c=relaxed/simple;
	bh=kGRTlob9dS4wjrb9wDoE4m44BhOfQUCktnvmrkWM6BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzUBT84S0wLSkv+IZXwwmEZrpzv6dBJVd0uj2J0YnQJgEWbqcutKXVvVhS1o4mZo/YHF14GD/lyoJJtVOJoyqs6Yxhk2omn1+MS3dgm1VeHp6bGEZbSX/D/5sadzdhkyp8rofLuN0rYFOwts+z797vbai0VqNLv25eFpfdSHcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=higStgvO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742212741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibbLnhe1qBMBBLBfKU3vYef+bv4kMt41HKPTL4S5OPc=;
	b=higStgvOLtscvtC0pp/UtA7uFuyMfjr7Z4Js/WFFe06yGZsqU+DYy60GSOA/H6EJgcXQ+A
	CS3maIdmyZx0JvWosYgyggjyEng1Lwly09Rw7G2qViyhPxM9hIPQsruMI5wQLatjbswnjA
	5Dms6LNo+scaoUMQq5IDtGgefgdPxys=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-_URah8Q_MYur-WPgw6CQpQ-1; Mon, 17 Mar 2025 07:59:00 -0400
X-MC-Unique: _URah8Q_MYur-WPgw6CQpQ-1
X-Mimecast-MFC-AGG-ID: _URah8Q_MYur-WPgw6CQpQ_1742212739
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac384a889easo27775066b.0
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 04:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212739; x=1742817539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibbLnhe1qBMBBLBfKU3vYef+bv4kMt41HKPTL4S5OPc=;
        b=X1ycgbeSMaUX6sX1B1hXu5kiDZ+24oMwQISOOjsFd4+oSl1pzU5YFHdYMbcBEFdvUS
         8cXOglQ5Iyv/JZrBRjuJweg4PcWXRUvhcIgYHPWNpcWHVT2/FiGlBiLrllSU3+MPaQYE
         dPHFwEt6KYwNAKsU3M26SYnPT5BObAP0b3JoJ8CAxJqjAqaiM3QYvSKjU7dc9fSG0OhR
         qP3GlCTmQ2ZWWUp/3byDmFNOSjoqsdwADm+vKssLh8vtRj6Xy9jJEs3Ht/Gj/aCh6oDi
         avGlmCMIWr/JHvNyxoM7xXcKmQ6KsA5Oyi4h8dN+8yq6mXGcQwH0wq+ha3tXGUMmLfVf
         8HGQ==
X-Gm-Message-State: AOJu0YxCnN753+FsvhuCyHTFYLqqWEwb2ll+DyNr+Le2zs9OGNrMeL4j
	TYmyUwXwgj37b4iJ5/RSj5rCBZ5PVZ1cZe7hPyMMg/bXBbksZVmRdFDEeaKCEeAdY6PAzJQUqsC
	H8fpV/S4REB7ow1K+c37AkSR+XBE9mxGc6KJDew/T/IrrTlt4hV56Mr6132lK
X-Gm-Gg: ASbGnct+GGjiGmwgYu7PP5ML43GHQNz/TUzOnbqa5fVPtWLQ1e/eapCA2R/9UH6112V
	isgUAqG0FB71vDSHpEeR/Btc5jk1ApsJCbu+1DR8yNy/+lLprLRN9owHraW/QW5PYOrww7EEvnd
	Fdhu8PNQFkVgkrqr1afJDSY16kyqIZWH4cGrubcmh5vdswALrmNRxNFXs3oz5pJDlDXMCsVwWMh
	MFUnY/lbDkPrIg1XEDqPV3LKMEDdaoB7nkoLo/eBT7aIZMg7MTNxXBiHdvPiiV5lr1Fabbjq+KI
	k8+WXazGvFBj63I/Fng=
X-Received: by 2002:a17:907:c292:b0:abf:6e30:c24e with SMTP id a640c23a62f3a-ac3124b2162mr1419638566b.22.1742212739135;
        Mon, 17 Mar 2025 04:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu9L6waIA1+4l5vWezs0/gLYMZtHuW4yfmYTOV7+dgHirrYrXj5zuut4GB6gKN4F/ns2JTjw==
X-Received: by 2002:a17:907:c292:b0:abf:6e30:c24e with SMTP id a640c23a62f3a-ac3124b2162mr1419637066b.22.1742212738768;
        Mon, 17 Mar 2025 04:58:58 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0bd3sm657279066b.67.2025.03.17.04.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 04:58:58 -0700 (PDT)
Message-ID: <76c57b22-04d3-4331-a10c-b210db5f9055@redhat.com>
Date: Mon, 17 Mar 2025 12:58:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: Werner Sembach <wse@tuxedocomputers.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250311180643.1107430-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Werner,

On 11-Mar-25 19:06, Werner Sembach wrote:
> Currently only F23 is correctly mapped for PS/2 keyboards.
> 
> Following to this table:
> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf

That is a very interesting document, good find!

> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
> 
> * Qt on Wayland and therefore KDE on Wayland can see the keypress anyway for
> some reason and it is actually used in a touchpad toggle shortcut, but this is
> currently being fixed in both KDE and xkeyboard-config to make this less weird,
> so it could directly be fixed to correctly handle the F24 keypress instead.
> 
> - The scancodes for F13-F22 are currently unmapped so there will probably be no
> harm in mapping them. This would also fix the issue that some of these keys
> can't be mapped as the target from userspace using the `setkeycodes` command.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

It is unfortunate that this changes the scancode 0x5f mapping from 85 to 194
(from KEY_ZENKAKUHANKAKU to KEY_F24) but as you mention the xkbconfig does
not even define a keycode-label for 85 + 8 = 93 (xkb shifts all codes up 8) in:
/usr/share/X11/xkb/keycodes/evdev, 93 is simply not there. So making this changes
and updating the mapping to match the mappings from the microsoft document from
above sounds good to me.

Regards,

Hans




> ---
>  drivers/input/keyboard/atkbd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 3598a21d9d014..4bd6e6ef0715e 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>  #include "hpps2atkbd.h"	/* include the keyboard scancodes */
>  
>  #else
> -	  0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
> -	  0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
> -	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
> -	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
> -	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
> -	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
> +	  0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
> +	184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
> +	186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
> +	188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22,  8,  9,185,
> +	190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
> +	192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
>  	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>  	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>  


