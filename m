Return-Path: <linux-input+bounces-10899-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E77A65977
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 18:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00B867AB574
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 17:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC5D191F92;
	Mon, 17 Mar 2025 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Q/2ywAoS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BF15573F;
	Mon, 17 Mar 2025 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230837; cv=none; b=dApF3rRwF14eVJAkhxvGDXP+FKczKoqCxq8hPZ9JSp1bQ9ltagKMkhQjDNSnDMAyUaiFLw+feDfNv6AUzreLIUpD3OefozMFiD4UadGrT/HIacZoKmc77R4V4RsJWQj6RuKvNGIDorKyU9mhhxMFQL8aC9mrGJyi8dMvdKA0DVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230837; c=relaxed/simple;
	bh=VqupcyliOYH4F1zqYAPQItQzbiMUsOLEaPNMOHxsrLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYM/68/Fm/RaLZNEtJ8U5IIReAgmGJ1FIGnZJxjx7OdVH7SqnN2/qith1QzxsKBjqO52iuqdxoFbWGhlUl9WLZdO1LbSEWz7rjSbV3p0SfPO7mL69OYrJiRPJc6rt+Iae5lIEGRVejfXQH8Eh5AvnYMU6oMmlzNjlUgaLdNYrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Q/2ywAoS; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5b164989.dip0.t-ipconnect.de [91.22.73.137])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 11E4A2FC0048;
	Mon, 17 Mar 2025 18:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742230831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kB9XBh1FT3qb/yYIn3fQ1n7C+7c4bGR+JzwwiFxSx9Y=;
	b=Q/2ywAoSyARno2tNci7RgHkPU29vzA0kfa88fKhJ/QOJYZ9SzClNL120DyDT6DbCDLt1iW
	txDjvJrr1EPnLefZeF3V9GtviiBAjgIRLfeYEIg5yXAGyPPVjXNF20n1C/S73DgqDXMyjd
	3xo8SfFKg96BCAHzh8CeQ3VYqWpN9zI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <9da24c58-25ab-4b21-b0ed-f777970affe7@tuxedocomputers.com>
Date: Mon, 17 Mar 2025 18:00:30 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
 <76c57b22-04d3-4331-a10c-b210db5f9055@redhat.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <76c57b22-04d3-4331-a10c-b210db5f9055@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 17.03.25 um 12:58 schrieb Hans de Goede:
> Hi Werner,
>
> On 11-Mar-25 19:06, Werner Sembach wrote:
>> Currently only F23 is correctly mapped for PS/2 keyboards.
>>
>> Following to this table:
>> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
> That is a very interesting document, good find!
>
>> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
>> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
>> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
>> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
>>
>> * Qt on Wayland and therefore KDE on Wayland can see the keypress anyway for
>> some reason and it is actually used in a touchpad toggle shortcut, but this is
>> currently being fixed in both KDE and xkeyboard-config to make this less weird,
>> so it could directly be fixed to correctly handle the F24 keypress instead.
>>
>> - The scancodes for F13-F22 are currently unmapped so there will probably be no
>> harm in mapping them. This would also fix the issue that some of these keys
>> can't be mapped as the target from userspace using the `setkeycodes` command.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thanks for reviewing.

Should I resend the patch standalone because the first of this Patchset will 
likely be rejected?

Best regards,

Werner

>
> It is unfortunate that this changes the scancode 0x5f mapping from 85 to 194
> (from KEY_ZENKAKUHANKAKU to KEY_F24) but as you mention the xkbconfig does
> not even define a keycode-label for 85 + 8 = 93 (xkb shifts all codes up 8) in:
> /usr/share/X11/xkb/keycodes/evdev, 93 is simply not there. So making this changes
> and updating the mapping to match the mappings from the microsoft document from
> above sounds good to me.
>
> Regards,
>
> Hans
>
>
>
>
>> ---
>>   drivers/input/keyboard/atkbd.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>> index 3598a21d9d014..4bd6e6ef0715e 100644
>> --- a/drivers/input/keyboard/atkbd.c
>> +++ b/drivers/input/keyboard/atkbd.c
>> @@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>   #include "hpps2atkbd.h"	/* include the keyboard scancodes */
>>   
>>   #else
>> -	  0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
>> -	  0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>> -	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>> -	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
>> -	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>> -	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>> +	  0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
>> +	184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
>> +	186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
>> +	188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22,  8,  9,185,
>> +	190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>> +	192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
>>   	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>   	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>>   

