Return-Path: <linux-input+bounces-240-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5B7F8B26
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 14:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDFCA1C20AEF
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 13:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94818B65F;
	Sat, 25 Nov 2023 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CIDlW/QO"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABE0FB
	for <linux-input@vger.kernel.org>; Sat, 25 Nov 2023 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700919830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsHCNmWJGKrepgfpA9s1RKdVnW04UyDdG55Wyh97aww=;
	b=CIDlW/QO84C5bYpBEmmFnYJsbzlpRdvz3zpHDXGi0mh0pXpT0HGDeIyzq+oq5+4go8kY09
	BvfuF8hQKiy78hDdSx/FAk0kRdXnh/YPsYlmzKswp9YMYrnyRp/8Db2PQIT4jznX9NJYXc
	JhNKz11AcFODe5EhMvM47hvKZBSRwCY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-FzVM48AsP0WfWp8PfpxWXQ-1; Sat, 25 Nov 2023 08:43:44 -0500
X-MC-Unique: FzVM48AsP0WfWp8PfpxWXQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a0bd5327164so26003766b.3
        for <linux-input@vger.kernel.org>; Sat, 25 Nov 2023 05:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700919823; x=1701524623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsHCNmWJGKrepgfpA9s1RKdVnW04UyDdG55Wyh97aww=;
        b=JtxcrxDHRxUNlUN4s61/DK+zcfYaOfZ1mvMsNl2LqtuPkJynMjW3r3PW44TglzsOnn
         q7bFHySIeUjpzuu41VxgtNgOVtvKMURWmQXRjAUkaWR2f4nrKo9FHqhH0h6YwTJbqdDl
         iZkyOudOtlUeAlbmutFAGN6p0FcQts6QlEEECAE0ETzD5KBha6Rp78+ItbmhuviORDNw
         1x/gnzG6wMc2asL7G73zmxHaRuZlU6RH04Y5aPpbH+lK6n5ZnKEbRAYQMYzSIVRUk6oX
         hHbiwwlqIXOPK1gqDMYSgtAPjyxWOW7mJrrEHGzpZ/qCug71MbUVEMwQ1yWGGQaa5krQ
         P8Ug==
X-Gm-Message-State: AOJu0YzTvAwjJ7JbYR+/cwbgOFgyJgSm8y8K+g8reJjrC10NJnTx0Crk
	dfhq1nEv9fZFXvF6XKEu8tlhXhK6ngNBgvfhlzgx061rESAaSPwut4kfa+bno6n15FigNgUQ5ht
	/5OUZ/WbaAI4RaRffJx5bdg4=
X-Received: by 2002:a17:906:2886:b0:9fd:1cd7:f68d with SMTP id o6-20020a170906288600b009fd1cd7f68dmr4614890ejd.67.1700919822812;
        Sat, 25 Nov 2023 05:43:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2YmNq2+tuUxmbOdLJ4LH5bD07VQTjVObjhzALo4VMBXJWMLwWyy0xgsfXv3f/XfXIsQqunA==
X-Received: by 2002:a17:906:2886:b0:9fd:1cd7:f68d with SMTP id o6-20020a170906288600b009fd1cd7f68dmr4614877ejd.67.1700919822408;
        Sat, 25 Nov 2023 05:43:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ml21-20020a170906cc1500b009e61366a4c3sm3479886ejb.2.2023.11.25.05.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 05:43:41 -0800 (PST)
Message-ID: <da597d75-147f-4e5a-9d9d-67ba2d9744c6@redhat.com>
Date: Sat, 25 Nov 2023 14:43:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Content-Language: en-US, nl
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>,
 gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
 Anton Zhilyaev <anton@cpp.in>
References: <20231115174625.7462-1-hdegoede@redhat.com>
 <ZWF4XDFDBTEvIOrV@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZWF4XDFDBTEvIOrV@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 11/25/23 05:30, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Wed, Nov 15, 2023 at 06:46:25PM +0100, Hans de Goede wrote:
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
>>
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
> 
> Thank you for making the changes, however I wonder if we should
> open-code check for the chassis type, as DMI can be quite bloated and
> here we are dealing with exactly one field. Something like this:
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 5667f1e80839..786f00f6b7fd 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -766,39 +766,24 @@ static void atkbd_deactivate(struct atkbd *atkbd)
>  }
>  
>  #ifdef CONFIG_X86
> -static const struct dmi_system_id atkbd_dmi_laptop_table[] = {
> -	{
> -		.matches = {
> -			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible */
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32"), /* Detachable */
> -		},
> -	},
> -	{ }
> -};
> +static bool atkbd_is_portable_device(void)
> +{
> +	static const char * const chassis_types[] = {
> +		"8",	/* Portable */
> +		"9",	/* Laptop */
> +		"10",	/* Notebook */
> +		"14",	/* Sub-Notebook */
> +		"31",	/* Convertible */
> +		"32",	/* Detachable */
> +	};
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(chassis_types); i++)
> +		if (dmi_match(DMI_CHASSIS_TYPE, chassis_types[i]))
> +			return true;
> +
> +	return false;
> +}
>  
>  /*
>   * On many modern laptops ATKBD_CMD_GETID may cause problems, on these laptops
> @@ -812,7 +797,7 @@ static const struct dmi_system_id atkbd_dmi_laptop_table[] = {
>   */
>  static bool atkbd_skip_getid(struct atkbd *atkbd)
>  {
> -	return atkbd->translated && dmi_check_system(atkbd_dmi_laptop_table);
> +	return atkbd->translated && atkbd_is_portable_device();
>  }
>  #else
>  static inline bool atkbd_skip_getid(struct atkbd *atkbd) { return false; }
> 
> 
> It gives me slightly smaller output:
> 
> dtor@dtor-ws:~/kernel/work (master *)$ size drivers/input/keyboard/atkbd.o.old
>    text    data     bss     dec     hex filename
>   28407    1512      37   29956    7504 drivers/input/keyboard/atkbd.o.old
> dtor@dtor-ws:~/kernel/work (master *)$ size drivers/input/keyboard/atkbd.o
>    text    data     bss     dec     hex filename
>   26107    1512      37   27656    6c08 drivers/input/keyboard/atkbd.o
> 
> Please let me know if this works for you and I can combine on my end.

This works for me / squashing this change in is fine with me.

Thank you.

Regards,

Hans



