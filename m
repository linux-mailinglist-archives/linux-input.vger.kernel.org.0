Return-Path: <linux-input+bounces-1551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87598842D3D
	for <lists+linux-input@lfdr.de>; Tue, 30 Jan 2024 20:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D16AB24953
	for <lists+linux-input@lfdr.de>; Tue, 30 Jan 2024 19:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D652569D1E;
	Tue, 30 Jan 2024 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TdW76e/B"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE067C51
	for <linux-input@vger.kernel.org>; Tue, 30 Jan 2024 19:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643977; cv=none; b=GmLUEf/8RLv3T3xinJIQlppNe/0fE2l6sSKq5Mt3Tt5HS16FlCsZnkznLtHJ9fMiEiyFLUT3zPyq9Au4ND7gAUAvmLm/cWK0ZnfZxi0Oa93uDzk/VSO30SqucPlfwoNs+/jn6iAEfLFngEuvDM7XM87rhj1imPkn6p44e75VcbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643977; c=relaxed/simple;
	bh=fmo/pk03lR/aZ1hEu9aLMhI4WnKAP1eB8JQi9migzNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTfFVmRjnztzG89p0hPUmj1qKohxBzPfUDNQMZHtyMEI6uEOL/uerLUReLJcLR262akXIFKy4Ws1PTMOyMDMcgOWAR/SQHO/WMIe9ZALnJV9HLOrOZPI/flAQ6rv3Q6qTamMyTU96Bin9Cn/hgr4ouT1EzWEizUri29F6iqvOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TdW76e/B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706643975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgaXuTc9A121GAs0+EjFCIWMRfllZdxTyYxhjcWlwnw=;
	b=TdW76e/BGoj//ZAB7Y5aF+B1CTf2wut+94sL78jp+TXUHYpdlHAxqocYITm3PHN5QmwyYB
	KwEXhtK3FAmoJmkuF33gx+AF2XkGewrbxKcCrpAV1UcQfbHSKVjxBnGf+2aTuDw5E4brSm
	XZ1WZsoNEh9uKaULMzURTW6FJOCd0r0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-B2HS4K6wNFSvOoYtf0V4VA-1; Tue, 30 Jan 2024 14:46:13 -0500
X-MC-Unique: B2HS4K6wNFSvOoYtf0V4VA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-55d71ec6ef3so1818346a12.0
        for <linux-input@vger.kernel.org>; Tue, 30 Jan 2024 11:46:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643972; x=1707248772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgaXuTc9A121GAs0+EjFCIWMRfllZdxTyYxhjcWlwnw=;
        b=xM7cE1GkjzKch5ldx5k2P0LHDI1r4ebWmz8LKR2CyKNOacbAGmkQRxa3KoMmXct0Aq
         qT1Zw3aC4RxD33wZO8iAsW0rLwoL5xKAO51zgdoJOyXLwa2lFL+5L0Ptjb4uy5tsZWwc
         IM31JMpCnSV9AMJxQOA0tPDVn2Yvv0TaP0v08rh/ZyMHwkGAZeD01iKlQzJkKDdAtdgC
         JGaShFYvGoVMirEhNQI9T/MXXTeb3mW5hM0AI1sW8vB7zJsRlcM9+hj/OUFcuG7udvIZ
         MnzGVokfhK6NMIb3W/+WsQ4LBnCnATtNuvx/NcnrSuUxFDduDi9I31wF9gbzEOYN/QAE
         fQYw==
X-Gm-Message-State: AOJu0YyVcmUmV3kanr9Ap/lS45Oap45Zb1bGb94jQJro/zeu8AOgn611
	KxDAvfZ+t5f5qvrtXF7JkJEIxwtVrPiCr4oABRWh3jFNykbp571ZBqc4b2M6TCaw6/6pUS0EyJc
	r/ehWEAe2MC0wsFdPlZt/UO921brX6IiGMtPimbd+0oN+ybK5iGC62higGar3slwSJii5
X-Received: by 2002:a05:6402:1494:b0:55f:27ce:bdbe with SMTP id e20-20020a056402149400b0055f27cebdbemr170144edv.30.1706643972234;
        Tue, 30 Jan 2024 11:46:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG3TnmkyVSLJ0RspKn4cgq88d4joiQUfQVNCaPE98eCrjjOlpr522oXhAQNoj/aCiDPjBuBw==
X-Received: by 2002:a05:6402:1494:b0:55f:27ce:bdbe with SMTP id e20-20020a056402149400b0055f27cebdbemr170135edv.30.1706643971866;
        Tue, 30 Jan 2024 11:46:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n17-20020a05640205d100b0055f05342a41sm2295577edx.44.2024.01.30.11.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 11:46:11 -0800 (PST)
Message-ID: <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
Date: Tue, 30 Jan 2024 20:46:10 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Werner Sembach <wse@tuxedocomputers.com>, Pavel Machek <pavel@ucw.cz>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/30/24 20:08, Werner Sembach wrote:
> Hi,
> 
> Am 30.01.24 um 19:35 schrieb Hans de Goede:
>> Hi,
>>
>> On 1/30/24 19:09, Werner Sembach wrote:
>>> Hi Hans,
>>>
>>> resend because Thunderbird htmlified the mail :/
>> I use thunderbird too. If you right click on the server name
>> and then go to "Settings" -> "Composition & Addressing"
>> and then uncheck "Compose messages in HTML format"
>> I think that should do the trick.
> Can't set this globally or other people will complain that my replies delete company logos in signatures xD. But usually the auto detection of Thunderbird works.
>>
>>> Am 30.01.24 um 18:10 schrieb Hans de Goede:
>>>> Hi Werner,
>>>>
>>>> On 1/30/24 12:12, Werner Sembach wrote:
>>>>> Hi Hans,
>>>>>
>>>>> Am 29.01.24 um 14:24 schrieb Hans de Goede:
>>> <snip>
>>>>> I think that are mostly external keyboards, so in theory a possible cut could also between built-in and external devices.
>>>> IMHO it would be better to limit /dev/rgbledstring use to only
>>>> cases where direct userspace control is not possible and thus
>>>> have the cut be based on whether direct userspace control
>>>> (e.g. /dev/hidraw access) is possible or not.
>>> Ack
>>>
>>> <snip>
>>>
>>>>> So also no basic driver? Or still the concept from before with a basic 1 zone only driver via leds subsystem to have something working, but it is unregistered by userspace, if open rgb wants to take over for fine granular support?
>>>> Ah good point, no I think that a basic driver just for kbd backlight
>>>> brightness support which works with the standard desktop environment
>>>> controls for this makes sense.
>>>>
>>>> Combined with some mechanism for e.g. openrgb to fully take over
>>>> control as discussed. It is probably a good idea to file a separate
>>>> issue with the openrgb project to discuss the takeover API.
>>> I think the OpenRGB maintainers are pretty flexible at that point, after all it's similar to enable commands a lot of rgb devices need anyway. I would include it in a full api proposal.
>> Ack.
>>
>>> On this note: Any particular reason you suggested an ioctl interface instead of a sysfs one? (Open question as, for example, I have no idea what performance implications both have)
>> sysfs APIs typically have a one file per setting approach,
>> so for effects with speed and multiple-color settings you
>> would need a whole bunch of different files and then you
>> would either need to immediately apply every setting,
>> needing multiple writes to the hw for a single effect
>> update, or have some sort of "commit" sysfs attribute.
>>
>> With ioctls you can simply provide all the settings
>> in one call, which is why I suggested using ioctls.
> 
> Ack
> 
> If the static mode update is fast enough to have userspace controlled animations, OpenRGB is calling that direct mode. Is it feasible to send 30 or more ioctls per second for such an direct mode? Or should this spawn a special purpose sysfs file that is kept open by userspace to continuously update the keyboard?

ioctls are quite fast and another advantage of ioctls is
you open the /dev/rgbledstring# device only once and
then re-use the fd for as many ioctls as you want.

Regards,

Hans


