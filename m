Return-Path: <linux-input+bounces-1263-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF3E82EB9E
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 10:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E281F2850A9
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 09:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2DD12E43;
	Tue, 16 Jan 2024 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbRXDohb"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551AE12E40
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705397663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAROFYz0VoJ3LBsBUNqK3dYOMCsxFj6+N8fGk1qAPvA=;
	b=QbRXDohbjVchTbP/jRsjHvoLZfoPJGLBS6LtPeOqjKojdhPJk58wj+z/Z0QFsxbqGRiLuV
	NwJZP65BhOl2TNOQG9+9KoGGjB19TikgCEBUjErTiypAtraseWXekL9NAr3+oEPw9wg0KK
	5BDTcoSn1BxHkZ4oEnFYCcCWZ/IJqBI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-Z23dvpixM2Ga9uIAdPJqHw-1; Tue, 16 Jan 2024 04:34:22 -0500
X-MC-Unique: Z23dvpixM2Ga9uIAdPJqHw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2e6fb4c24eso19695066b.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 01:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705397659; x=1706002459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAROFYz0VoJ3LBsBUNqK3dYOMCsxFj6+N8fGk1qAPvA=;
        b=QtnmxS+tvwe2iGF0yJdwl+gVxc92SPvEub37DkwgY5fu17dYILrVwV2DD2/dtEPDCD
         lSP2HesnkcpNKjthZr0MEmm3EOHAUFuNuyV2jNqVBIOcDLaD20IIQElI8BoVnm+5G/Q8
         By2T2zfOfiwqicuKyk7dm5nWudVFC/nrKzRAMds5UMk7fHTSTnEPdKJ9A8jMcqzglAY9
         ys6EsGOa2G/Jv4Oyc6ysO/1rp2NsLkptcsAWTqHBKuqo7kGy9DyQ23SRt06bzKxwygdh
         biTDKddUMkT8lokH3SjX9OT+WW0q0gEshZkTWabBRNbW8GZcb9b0X+yL7pi2qjurGC8B
         CylA==
X-Gm-Message-State: AOJu0YyR3A6dZg7nSWqdP0V3QksV8DZloJEWw2Qe2Tl8GFOO6iRb1ULN
	deAxIVEkUgaJCaripLH7CTQAqxJRo8D/+r+QZ8LzeSCFlxWeVyUm40PM6FKgp/aGJOTg+7wCNst
	WAJs2QFmhPV19a6KfpnZ3RlhlrsOyC5o=
X-Received: by 2002:a17:906:d8d1:b0:a2d:b3f4:c03a with SMTP id re17-20020a170906d8d100b00a2db3f4c03amr1293926ejb.29.1705397659614;
        Tue, 16 Jan 2024 01:34:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLicFvqI1ntTHcsIvx5g/471VozWujSkLXtdp/HhFQOZflqNc2GtxDFuz1iuDrYsvOrv2NFw==
X-Received: by 2002:a17:906:d8d1:b0:a2d:b3f4:c03a with SMTP id re17-20020a170906d8d100b00a2db3f4c03amr1293913ejb.29.1705397659245;
        Tue, 16 Jan 2024 01:34:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k11-20020a1709063e0b00b00a1e4558e450sm6303186eji.156.2024.01.16.01.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 01:34:18 -0800 (PST)
Message-ID: <162f0847-3f72-4606-a1ab-de05bdd97339@redhat.com>
Date: Tue, 16 Jan 2024 10:34:18 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
To: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 Shang Ye <yesh25@mail2.sysu.edu.cn>, gurevitch <mail@gurevit.ch>,
 Egor Ignatov <egori@altlinux.org>, Anton Zhilyaev <anton@cpp.in>
References: <20231115174625.7462-1-hdegoede@redhat.com>
 <W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Barnabás,

On 1/16/24 01:21, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2023. november 15., szerda 18:46 keltezéssel, Hans de Goede írta:
> 
>> There have been multiple reports of keyboard issues on recent laptop models
>> which can be worked around by setting i8042.dumbkbd, with the downside
>> being this breaks the capslock LED.
>>
>> It seems that these issues are caused by recent laptops getting confused by
>> ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks for
>> this, just skip ATKBD_CMD_GETID alltogether on laptops in translated mode.
>>
>> The main goal of sending ATKBD_CMD_GETID is to skip binding to ps/2
>> mice/touchpads and those are never used in translated mode.
>>
>> Examples of laptop models which benefit from skipping ATKBD_CMD_GETID:
>>
>> * "HP Laptop 15s-fq2xxx", "HP laptop 15s-fq4xxx" and "HP Laptop 15-dy2xxx"
>>   models the kbd stops working for the first 2 - 5 minutes after boot
>>   (waiting for EC watchdog reset?)
>>
>> * On "HP Spectre x360 13-aw2xxx" atkbd fails to probe the keyboard
>>
>> * At least 9 different Lenovo models have issues with ATKBD_CMD_GETID, see:
>>   https://github.com/yescallop/atkbd-nogetid
>>
>> This has been tested on:
>>
>> 1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
>>    in translated mode when no keyboard is plugged in and with a ps/2 kbd
>>    a "AT Translated Set 2 keyboard" /dev/input/event# node shows up
>>
>> 2. A Lenovo ThinkPad X1 Yoga gen 8 (always has a translated set 2 keyboard)
> 
> Just wanted to briefly mention that this broke my hwdb configuration because the
> version field of the device (as shown in `/proc/bus/input/devices`) has changed
> and it was included in the hwdb match rule.

That is unfortunate. Was this a custom rule or one from
the hwdb shipped with systemd ?

Either way can you share the match pattern of the rule before and
after? I want to check if there are any similar cases in
the hwdb shipped with systemd.

Regards,

Hans



>> Reported-by: Shang Ye <yesh25@mail2.sysu.edu.cn>
>> Closes: https://lore.kernel.org/linux-input/886D6167733841AE+20231017135318.11142-1-yesh25@mail2.sysu.edu.cn/
>> Closes: https://github.com/yescallop/atkbd-nogetid
>> Reported-by: gurevitch <mail@gurevit.ch>
>> Closes: https://lore.kernel.org/linux-input/2iAJTwqZV6lQs26cTb38RNYqxvsink6SRmrZ5h0cBUSuf9NT0tZTsf9fEAbbto2maavHJEOP8GA1evlKa6xjKOsaskDhtJWxjcnrgPigzVo=@gurevit.ch/
>> Reported-by: Egor Ignatov <egori@altlinux.org>
>> Closes: https://lore.kernel.org/all/20210609073333.8425-1-egori@altlinux.org/
>> Reported-by: Anton Zhilyaev <anton@cpp.in>
>> Closes: https://lore.kernel.org/linux-input/20210201160336.16008-1-anton@cpp.in/
>> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2086156
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note this supersedes my previous atkbd series:
>> https://lore.kernel.org/linux-input/20231005201544.26983-1-hdegoede@redhat.com/
>> ---
>> Changes in v2:
>> - Add DMI check for laptop chassis types and only skip ATKBD_CMD_GETID
>>   on laptops with the i8042 in translated mode
>> ---
>>  drivers/input/keyboard/atkbd.c | 61 +++++++++++++++++++++++++++++++---
>>  1 file changed, 57 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>> index c92e544c792d..5667f1e80839 100644
>> --- a/drivers/input/keyboard/atkbd.c
>> +++ b/drivers/input/keyboard/atkbd.c
>> @@ -765,6 +765,59 @@ static void atkbd_deactivate(struct atkbd *atkbd)
>>  			ps2dev->serio->phys);
>>  }
>>
>> +#ifdef CONFIG_X86
>> +static const struct dmi_system_id atkbd_dmi_laptop_table[] = {
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
>> +		},
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
>> +		},
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
>> +		},
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
>> +		},
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible */
>> +		},
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32"), /* Detachable */
>> +		},
>> +	},
>> +	{ }
>> +};
>> +
>> +/*
>> + * On many modern laptops ATKBD_CMD_GETID may cause problems, on these laptops
>> + * the controller is always in translated mode. In this mode mice/touchpads will
>> + * not work. So in this case simply assume a keyboard is connected to avoid
>> + * confusing some laptop keyboards.
>> + *
>> + * Skipping ATKBD_CMD_GETID ends up using a fake keyboard id. Using a fake id is
>> + * ok in translated mode, only atkbd_select_set() checks atkbd->id and in
>> + * translated mode that is a no-op.
>> + */
>> +static bool atkbd_skip_getid(struct atkbd *atkbd)
>> +{
>> +	return atkbd->translated && dmi_check_system(atkbd_dmi_laptop_table);
>> +}
>> +#else
>> +static inline bool atkbd_skip_getid(struct atkbd *atkbd) { return false; }
>> +#endif
>> +
>>  /*
>>   * atkbd_probe() probes for an AT keyboard on a serio port.
>>   */
>> @@ -794,12 +847,12 @@ static int atkbd_probe(struct atkbd *atkbd)
>>   */
>>
>>  	param[0] = param[1] = 0xa5;	/* initialize with invalid values */
>> -	if (ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
>> +	if (atkbd_skip_getid(atkbd) || ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
>>
>>  /*
>> - * If the get ID command failed, we check if we can at least set the LEDs on
>> - * the keyboard. This should work on every keyboard out there. It also turns
>> - * the LEDs off, which we want anyway.
>> + * If the get ID command was skipped or failed, we check if we can at least set
>> + * the LEDs on the keyboard. This should work on every keyboard out there.
>> + * It also turns the LEDs off, which we want anyway.
>>   */
>>  		param[0] = 0;
>>  		if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
>> --
>> 2.41.0
>>
> 


