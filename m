Return-Path: <linux-input+bounces-1528-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 246248406C9
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 14:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9025F1F2652D
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 13:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D3062A05;
	Mon, 29 Jan 2024 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TSaTpuwD"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5690C63105
	for <linux-input@vger.kernel.org>; Mon, 29 Jan 2024 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706534697; cv=none; b=E5R+4wY8x0de+6UL0ILGtiStqNBdidtIqalWhYT6hCZo5ub9KfDvnZG3FmV0UZ0AN7dbs9e2lb0ykBQz6hutXS107zjLLDjInxxt6GDA/h+9qKv58Ipm7MQv+IcL1cioObQOQ2+58xvgLIuFpUcH8Jrya2VnZzfWn3UBf34lU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706534697; c=relaxed/simple;
	bh=4CcNOrNwRwBrEGR+e3HjUAhAuERzDoQh5mY9r6+oCqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjV1DT6On2cSsyFSQI+IFkiOYxR3MeXwq7X4kdhQ6C4aNVgUjjrQ1wE9DLja6Um5MobajISVdZpm0+Q3Bt9grdkJ7wwt/MQDKW+gr2LuvbIwWstm7iqw44d3cG/HxOaA6RGc5q8HJcPsT1qYG3pj02uEkQ/civEbteL/G5sogoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TSaTpuwD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706534694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjW2gx+q/zxqrmgNlGmYGm2s+tPpxiBcBfLRz9vMj/s=;
	b=TSaTpuwD7wdbP6AQff12DZE2yjBLTVlWZqj4nqk55pFDO2COqA674wJQDNepFiqZk4vSJ8
	unDj+LoF6zZi8EW5S1a9RhCnGKT9dbv/MXPQc9NTCnHE/pwOZg1rHasRQ6ntY31YLdMolc
	4Jk1eCpWNAhnHG0e4+1wx0xYfwnMwls=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-XU2KPCZqPLGpcwRE_iFacA-1; Mon, 29 Jan 2024 08:24:53 -0500
X-MC-Unique: XU2KPCZqPLGpcwRE_iFacA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a35118e98caso179428366b.0
        for <linux-input@vger.kernel.org>; Mon, 29 Jan 2024 05:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706534692; x=1707139492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjW2gx+q/zxqrmgNlGmYGm2s+tPpxiBcBfLRz9vMj/s=;
        b=LdQtc7A4FaY9vb6bLw68PIhpaDbY4jAlCP6pQpffIVgkB/uNyDtuQ5BJp0TFIaTucl
         U7IDTzN41xVGCh/RUI5cknvii/RHlmfK++/8gcfn5JyraM46TvToPmJsX1xTwC4pMMei
         cGC8Dyvug3F4fvSFCLLMPd2zvIvgQuYdqNwhWlHmgE2uMP/i7g3+3mGLNTvGUgCqoFYl
         o5xeuOq21yzkbbQlBvLRrUY5nwDJbHZXmt6BcwoIu/KFDgRq5Vy75IbBJWxYTfmt+2uD
         F+Wjf6qoq2291EG8F1i7FSxczsVWe4Zaz3cd5ERz5FOW/7bHfiDAz0xrUwxOzn1+P4R8
         Nfyw==
X-Gm-Message-State: AOJu0Yy5L7FqqFPYeBVd0ddRtmE2oa35Ak+7EMzwRQFdbaqoqXA4rx2P
	ZQB9GKmCwPEz7lcpzL8b8h3rIoaa4XCN6419CwuvBCQSD69RYJImZRZtqozTFejtlvHehIlqijR
	lJzsDXLmbd733vHp4v1AClhdgioVW+zYamV2sp3ylEDXx4/rM5OOMttm0dEVI
X-Received: by 2002:a17:906:3a89:b0:a31:83a5:2a99 with SMTP id y9-20020a1709063a8900b00a3183a52a99mr4740630ejd.47.1706534691611;
        Mon, 29 Jan 2024 05:24:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7TX896oJnCjndvlaGM10IFKtMY4SKsP7IJBmYSn/8z49FXRTLYWGM2Pd7zyiBVJTYI9OGuQ==
X-Received: by 2002:a17:906:3a89:b0:a31:83a5:2a99 with SMTP id y9-20020a1709063a8900b00a3183a52a99mr4740598ejd.47.1706534691162;
        Mon, 29 Jan 2024 05:24:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vg10-20020a170907d30a00b00a356c0fdd2csm2164303ejc.26.2024.01.29.05.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 05:24:50 -0800 (PST)
Message-ID: <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
Date: Mon, 29 Jan 2024 14:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US, nl
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Werner,

On 1/19/24 17:04, Werner Sembach wrote:
> Am 19.01.24 um 09:44 schrieb Hans de Goede:

<snip>

>> So my proposal would be an ioctl interface (ioctl only no r/w)
>> using /dev/rgbkbd0 /dev/rgbkdb1, etc. registered as a misc chardev.
>>
>> For per key controllable rgb LEDs we need to discuss a coordinate
>> system. I propose using a fixed size of 16 rows of 64 keys,
>> so 64x16 in standard WxH notation.
>>
>> And then storing RGB in separate bytes, so userspace will then
>> always send a buffer of 192 bytes per line (64x3) x 14 rows
>> = 3072 bytes. With the kernel driver ignoring parts of
>> the buffer where there are no actual keys.
> The be sure the "14 rows" is a typo? And should be 16 rows?

Yes that should be 16.

<snip>

>> This way we can address all the possible keys in the various
>> standard layouts in one standard wat and then the drivers can
>> just skip keys which are not there when preparing the buffer
>> to send to the hw / fw.
> 
> Some remarks here:
> 
> - Some keyboards might have two or more leds for big keys like (iso-)enter, shift, capslock, num+, etc. that in theory are individually controllable by the firmware. In windows drivers this is usually abstracted away, but could be interesting for effects (e.g. if the top of iso-enter is separate from the bottom of iso-enter like with one of our devices).
> 
> - In combination with this: The driver might not be able to tell if the actual physical keyboard is ISO or ANSI, so it might not be able the correctly assign the leds around enter correctly as being an own key or being part of ANSI- or ISO-enter.
> 
> - Should the interface have different addresses for the different enter and num+ styles (or even the different length shifts and spacebars)?
> 
> One idea for this: Actually assign 1 value per line for tall keys per line, 3 (or maybe even 4, to have one spare) values per line for wide keys and 6 (or 8) values for space. e.g.:

That sounds workable OTOH combined with your remarks about also supporting
lightbars. I'm starting to think that we need to just punt this to userspace.

So basically change things from trying to present a standardized address
space where say the 'Q' key is always in the same place just model
a keyboard as a string of LEDs (1 dimensional / so an array) and leave
mapping which address in the array is which key to userspace, then userspace
can have json or whatever files for this per keyboard.

This keeps the kernel interface much more KISS which I think is what
we need to strive for.

So instead of having /dev/rgbkbd we get a /dev/rgbledstring and then
that can be used for rbb-kbds and also your lightbar example as well
as actual RGB LED strings, which depending on the controller may
also have zones / effects, etc. just like the keyboards.



> - Right shift would have 3 values in row 10. The first value might be the left side of shift or the additional ABNT/JIS key. The 2nd Key might be the left side or middle of shift and the third key might be the right side of shift or the only value for the whole key. The additional ABNT/JIS key still also has a dedicated value which is used by drivers which can differentiate between physical layouts.
> 
> - Enter would have 3 values in row 8 and 3 values in row 9. With the same disambiguation as the additional ABNT/JIS but this time for ansii-/ and iso-#
> 
> - Num+ would have 2 values, one row 8 and one in row 9. The one in row 9 might control the whole key or might just control the lower half. The one in row 8 might be another key or the upper half
> 
> For the left half if the main block the leftmost value should be the "might be the only relevant"-value while the right most value should be the "might be another key"-value. For the right side of the main block this should be swapped. Unused values should be adjacent to the "might be another key"-value, e.g.:
> 
>                                   | Left shift value 1    | Left shift value 2           | Left shift value 3            | Left shift value 4     | 102nd key value
> ISO/ANSI aware                    | Left shift color      | Unused                       | Unused                        | Unused                 | 102nd key color
> ISO non aware 1 led under shift   | Left shift color      | Unused                       | Unused                        | 102nd key color        | Unused
> ANSI non aware 1 led under shift  | Left shift color      | Unused                       | Unused                        | Unused                 | Unused
> ISO non aware 2 leds under shift  | Left shift left color | Left shift right color       | Unused                        | 102nd key color        | Unused
> ANSI non aware 2 leds under shift | Left shift left color | Left shift right color       | Unused                        | Unused                 | Unused
> ISO non aware 3 leds under shift  | Left shift left color | Left shift middle color      | Left shift right color        | 102nd key color        | Unused
> ANSI non aware 3 leds under shift | Left shift left color | Left shift middle color      | Unused                        | Left shift right color | Unused
> ANSI non aware 4 leds under shift | Left shift left color | Left shift middle left color | Left shift middle right color | Left shift right color | Unused
> 
> Like this with no information you can still reliable target the ANSI-shift space, if you know it's an ISO keyboard from user space you can target shift and 102nd key, and if you have even more information you can have multi color shift if the firmware supports it.

Right, so see above I think we need to push all these complications
into userspace. And simple come up for a kernel interface
for RGB LED strings with zones / effects / possibly individual
addressable LEDs.

Also we should really only use whatever kernel interface we come up
with for devices which cannot be supported directly from userspace
through e.g. hidraw access. Looking at keyboards then the openrgb project:

https://openrgb.org/devices_0.9.html

Currently already supports 398 keyboard modes, we really do not want
to be adding support for all those to the kernel.

Further down in the thread you mention Mice with RGB LEDs,
Mice are almost always HID devices and already have extensive support,
including for their LEDs in userspace through libratbag and the piper UI,
see the screenshots here (click on the camera icon):
https://linux.softpedia.com/get/Utilities/Piper-libratbag-104168.shtml

Again we really don't want to be re-doing all this work in the kernel
only to end up conflicting with the existing userspace support.

<snip>

>> 5. A set_effect ioctl which takes a struct with the following members:
>>
>> {
>> long size; /* Size of passed in struct including the size member itself */
>> int effect_nr; /* enum value of the effect to enable, 0 for disable effect */
>> int zone;  /* zone to apply the effect to */
> Don't know if this is necessary, the keyboards I have seen so far apply firmware effects globally.
>> int speed; /* cycle speed of the effect in milli-hz */
> 
> I would split this into speed and speed_max and don't specify an actual unit. The firmwares effects I have seen so far: If they have a speed value, it's some low number interpreted as a proportional x/n * the max speed of this effect, with n being some low number like 8 or 10.
> 
> But i don't know if such clearly named properties are even sensefull, see below.
> 
>> char color1[3]; /* effect dependend may be unused. */
>> char color2[3]; /* effect dependend may be unused. */
>> }
> 
> We can not predetermine how many colors we might need in the future.
> 
> Firmware effects can vary vastly in complexity, e.g. breathing can be a single bit switch that just varies the brightness of whatever color setting is currently applied. It could have an optional speed argument. It could have nth additional color arguments to cycle through, it could have an optional randomize bit that either randomizes the order of the defined colors or means that it is picking completely random color ignoring the color settings if set.
> 
> Like this we could have a very fast explosion of the effects enum e.g.: breathing, breathing_2_colors, breathing_3_colors, ... breathing_n_colors, breathing_speed_controlled, breathing_speed_controlled_2_colors, ... breathing_speed_controlled_n_colors_random_bit, etc.
> 
> Or we give up on generic names and just make something like: tongfang_breathing_1, tongfang_scan_1, tongfang_breathing_2, clevo_breathing_1
> 
> Each with an own struct defined in a big .h file.
> 
> Otherwise I think the config struct needs to be dynamically created out of information the driver gives to userspace.

Given that as mentioned above I believe that we should only use a kernel
driver where direct userspace access is impossible I believe that having
things like tongfang_breathing_1, tongfang_scan_1, tongfang_breathing_2,
clevo_breathing_1, etc. for the hopefully small set of devices which
needs an actual kernel driver to be reasonable.

Talking about existing RGB LED support I believe that we should also
reach out to and get feedback on (or even an ack for) the new rgbledstring
API from the OpenRGB folks: https://openrgb.org

Maybe they already have a nice abstraction to deal with different
kind of effects which we can copy for the kernel API ?

Regards,

Hans




