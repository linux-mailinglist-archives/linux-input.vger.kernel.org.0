Return-Path: <linux-input+bounces-10885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634ECA64BB9
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 12:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA03A1885E94
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 11:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7FA221560;
	Mon, 17 Mar 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBefQiZA"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CD38B
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209511; cv=none; b=E3BEQk7Lm1vZrwLLr+YidAdy/q4Xia3myzCWpB+yeNNUyW4EmpZtL+Gd1XO0Stepj7lf1rjgv2HW2ISRhnbqsDmkQ7jItVYlSJ/Z1W3AwgmBTc3LKTwBldvpcQJ6mTOS0DKXcmS0bbTbDSqzbghq1tMjotr4WwRlQe7dK+c0Hq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209511; c=relaxed/simple;
	bh=q1p2RryvxXZOam8aZ9xn/h3XCaJjpYdoRqVclsSyld4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZsyiYNMf/mvXpHhV9iB4qMF/+McMTq6sP/0u1VaZ0QurZti1sX4o8nIwGpamZ7ugD259JfPRSg7M2OzF8mW5TOc6fHXNXx2fu+ApYPrrGQwand2E4PrakIpCmoMkewzAHXIhpcp7Y2qc/F23mQkYg8LAtdUVq0TFU9QyCiIsKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBefQiZA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742209504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBvUwzP789HFV3ICxplLlIM9nxvDPZjAQBuQvtsW2zo=;
	b=NBefQiZAWj4BoSGFX4eqmxpQn7yGvyGWVsEYwwqT9htTqLaJQbf3fUjfWjHP+jllYN7xBK
	ahGtyPtCIJg3wHi/uYAh8c+U3UuitSyCjIywL8PV5y3Xmm2mR3i5CWcvY6vFuqu0LcxzzU
	fsZo6rNte2rN7bTWSHwcJYVCQRW5n/A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-SjLtu2UuO8qxIJYI6mPxPw-1; Mon, 17 Mar 2025 07:05:03 -0400
X-MC-Unique: SjLtu2UuO8qxIJYI6mPxPw-1
X-Mimecast-MFC-AGG-ID: SjLtu2UuO8qxIJYI6mPxPw_1742209502
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-abb9b2831b7so565188266b.1
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 04:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209502; x=1742814302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBvUwzP789HFV3ICxplLlIM9nxvDPZjAQBuQvtsW2zo=;
        b=DPNJKKaTDRuQ9/EQF4nwIXVodFhaOLeaLs9CItq/jpFzhoXHKnDcv1bsUN6GF+wsiW
         gH6YGEZH3A1zekzhi4cBabRfqB6GOcNM/S+M6pa7yn/EVF/d5JZErMJfRF+67ehX5nK0
         8foUD0+sVj8H2/0Av7lHzIhVKhEXaPygrqHkapzTGpMzMbjyXVv1pg+5mWN2gToc0Khm
         cTdeTpte7G4qS6vBbHMPS/aXb94ITBzYBfZlvHqTjHTfNKQwFv68Pv4aeEFLwuK+EhKA
         qg2cbPueMgyKs3suL0OsH/9yxSwMsvM8TniAUEZfeXjej0TFB0N06frs2z8gd4hk++r5
         zuvA==
X-Gm-Message-State: AOJu0YzXYvsRXvCSc6M28OoOmeeQg3hxVLF0QE81xrtC30euGHdNmjiJ
	cpjBehburmkhRkTP7C7G6n/Qo6oBx8m6Qu61yq76k4wVHzxf4etLsxsCIov0QDXW/UxTPK0XJ8t
	ol2WULmz9ofAJ1nnUvuaTfGZ6mM1O+E+UdzsD88gpB1/iWTulA0HPMYI8oGuUqZ5UWYM+850=
X-Gm-Gg: ASbGncsKY3lvA2Xw83mV11sJOmal2OiCamSh5hceI35BCW9fqgbAHh63dOU6bg+MG6H
	PDxsH+EiJZGvT81fVJ65Ul3zUvDH7dCdFPsV2Snb1KpSZe9GsicxFlHxbGnBjVphTr6ym3pAKJt
	9UA/y+nOOcQkGmctQnGw/oDX9ZsYZ20Iq5lssM8UicV5tFf+kzcIAHieS2s1eG/qxxGgcDWf8NM
	w1fH3lEBToipAGFcQiFBUmBxb4nk386KUyPlEkwUarRDxcPk4hzdsgNs+LVGGDwqGFaL3DC6nJS
	9RtkhD6udOPVCXr33W8=
X-Received: by 2002:a17:907:c247:b0:abf:6ead:2e57 with SMTP id a640c23a62f3a-ac31250719fmr1579388966b.24.1742209501666;
        Mon, 17 Mar 2025 04:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg67v2/9e+4jJswcJERm7K//dGMJHq/JlGnG8h8sQJj6Ko8ZyvaXXpwZPR+bSl3ASos+fM1g==
X-Received: by 2002:a17:907:c247:b0:abf:6ead:2e57 with SMTP id a640c23a62f3a-ac31250719fmr1579386766b.24.1742209501267;
        Mon, 17 Mar 2025 04:05:01 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9fe0sm654695166b.55.2025.03.17.04.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 04:05:00 -0700 (PDT)
Message-ID: <4e37c7b2-85bc-459e-b2ea-2e362c16e9aa@redhat.com>
Date: Mon, 17 Mar 2025 12:04:59 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: atkbd - Map FN-key for TongFang barebones
To: Werner Sembach <wse@tuxedocomputers.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250311180643.1107430-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Werner,

Thank you for your patches / your work on this.

On 11-Mar-25 19:06, Werner Sembach wrote:
> TongFangs firmware sends scancode 0xe0 0x78 upon pressing the FN key.
> 
> This patch maps this scancode to avoid a dmesg warning printed every FN-keypress
> and to enable userspace to use they key in other shortcuts than the firmware
> builtin ones.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

This laptop specific mapping really belongs in hwdb, 0xe0 0x78
translates to KEYBOARD_KEY_f8 in hwdb and if you look for that in:

/lib/udev/hwdb.d/60-keyboard.hwdb

You already find several entries, e.g. :

evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pn*:*
...
 KEYBOARD_KEY_f8=fn

And e.g. also for some Clevo models:

 KEYBOARD_KEY_f8=f21                                    # Touchpad Toggle

and:

# HP Elite x2 1013 G3
evdev:atkbd:dmi:bvn*:bvr*:svnHP*:pnHPElitex21013G3:*
 KEYBOARD_KEY_f8=unknown                               # rfkill is also reported by HP Wireless hotkeys

these first couple of hits show that 0xf8 is not
universally mapped to Fn, so putting this mapping in the kernel's
default key table is wrong IMHO.

Regards,

Hans



> ---
>  drivers/input/keyboard/atkbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index adf0f311996c9..3598a21d9d014 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -98,7 +98,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>  	173,114,  0,113,  0,  0,  0,126,128,  0,  0,140,  0,  0,  0,127,
>  	159,  0,115,  0,164,  0,  0,116,158,  0,172,166,  0,  0,  0,142,
>  	157,  0,  0,  0,  0,  0,  0,  0,155,  0, 98,  0,  0,163,  0,  0,
> -	226,  0,  0,  0,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
> +	226,  0,  0,464,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
>  	  0,  0,  0,  0,  0,  0,  0,  0,  0,107,  0,105,102,  0,  0,112,
>  	110,111,108,112,106,103,  0,119,  0,118,109,  0, 99,104,119,  0,
>  


