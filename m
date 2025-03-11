Return-Path: <linux-input+bounces-10714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB18A5CD51
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 19:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5E717B537
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 18:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72011263883;
	Tue, 11 Mar 2025 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="omaPfx8o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BF32627E7;
	Tue, 11 Mar 2025 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716648; cv=none; b=ePa4pfA+T8ZbWvKBbf8H6VO/rxDdBfMb9O7+CP43TsJ1yRU8veAbK1F3iQoRMFDK3uQ36e+rBkzl0VzNOOc0EefQoLT2eHy2JLBj/3GQDrsUfTC38r8G1pZwb38LYB7jTwmLhEpecWRYFivaInSin6njqPe7tvVC1U8ad2JBk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716648; c=relaxed/simple;
	bh=NQ5vweM3uskXJ3Rjrqwkk81d21CJPgD4AsVgQIQQ2QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MH8oMrWIaKzLArmIXl510+YnLRlk7n3/ZA9mH4g8nEhebjk8TxnQTHSfd8Rbm5ozUi5u+jB7sasMP6Qk/CB40lh0qj94TE38OCXINidciBkT1ZwGUEA/6zAOhgbTckwZL4HOxUkph1w72Vq2rJ+6XBCrPNC9LmOHgOKSYYFXThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=omaPfx8o; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 93C012FC0187;
	Tue, 11 Mar 2025 19:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741716642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8V7VPjzi/nRW6RI17VuvOyviOCuBTnO+03/leDNAQJk=;
	b=omaPfx8oiXxpuKPdW5ojk7SyQw+bHCfTHlMIixP71390YRFuJwkG16OOe5Ltn3Api7yx9F
	/R+M1gEJiiCKrSR+kL8iiDRXy8zsdRz0bTa+yMKHhwi5bv1x5V+Uy6f30gmvFIrMb/7I5y
	Lc4pyInzWamzCRl7uVdLr5dOiHhT/nQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <83ea44f6-c0ad-4cb0-a16e-dd4fa17b63c7@tuxedocomputers.com>
Date: Tue, 11 Mar 2025 19:10:42 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: hdegoede@redhat.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250311180643.1107430-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans, Hi Dimitry,

resending this too on the v2 to not cause confusion:

Regarding remapping KEY_ZENKAKUHANKAKU to KEY_TOUCHPAD_TOGGLE:

Am 11.03.25 um 19:06 schrieb Werner Sembach:
> Currently only F23 is correctly mapped for PS/2 keyboards.
>
> Following to this table:
> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
>
> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.

I think what the firmware vendor actually wanted to do was to send 
ctrl+super+f24 upon touchpad toggle. This would somewhat fall in line with, for 
example, the copilot key being implemented as shift+super+f23.

Following this, my suggestion is to do this remapping and handle the rest in 
xkeyboard-config

>
> * Qt on Wayland and therefore KDE on Wayland can see the keypress anyway for
> some reason and it is actually used in a touchpad toggle shortcut, but this is
> currently being fixed in both KDE and xkeyboard-config to make this less weird,
> so it could directly be fixed to correctly handle the F24 keypress instead.
>
> - The scancodes for F13-F22 are currently unmapped so there will probably be no
> harm in mapping them. This would also fix the issue that some of these keys
> can't be mapped as the target from userspace using the `setkeycodes` command.

This is optional. I can split it off if wanted.

Best regards,

Werner

>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/input/keyboard/atkbd.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 3598a21d9d014..4bd6e6ef0715e 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>   #include "hpps2atkbd.h"	/* include the keyboard scancodes */
>   
>   #else
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
>   	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>   	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>   

