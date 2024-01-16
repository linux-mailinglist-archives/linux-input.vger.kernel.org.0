Return-Path: <linux-input+bounces-1267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5206782F0BD
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 15:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA4D285E16
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 14:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7204E1BF22;
	Tue, 16 Jan 2024 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gOAiT+V8"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF1C1BF32
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705416195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zslZ4nrtSF+deObftyFSW69jYOuD+r3RaTGNVY2qNi0=;
	b=gOAiT+V83tEZ8r+fk+vm2JNw9MVMT9TdO4x3AeWHpi/vxP5qZOt786SI3ZcUggDNu7QqxL
	c++so2T6fnEBMlxcuAbEeBwaIjARoTQJDxRVHM7f+aiSyKkrBh1ZKTKLP7RLraeb1F8Mzq
	GPE2o3tKO+LKTr1fhUf6dffxnlpfn3Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-9hsJgw0bOK60AX6_hkeGDQ-1; Tue, 16 Jan 2024 09:43:13 -0500
X-MC-Unique: 9hsJgw0bOK60AX6_hkeGDQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-558fc42759fso1467605a12.1
        for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 06:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705416192; x=1706020992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zslZ4nrtSF+deObftyFSW69jYOuD+r3RaTGNVY2qNi0=;
        b=wh8AymPSkgwfwAAK79oHBRVrwlJORluOh0DwcbbV3Zgsp8zhcA6IfhzDfCa+9Iggrg
         RjkciifaYhkbDYPwwL5ieS3TnpD6+geGnz1r2jyclWWsPn60qxd5OMUzZRaW9sud2I63
         puaAZx137ArrD5tHWQKYThxuCz2kyVzXrrjlqI+1IkSn58L2jdkmF9JL9RqJN7yLGry9
         R/tlAy4m/5oVDwRSo8ScSMPvSNfxPRZvbVZJtyPej2kQ4PBGKgMecktvjU6oKNL7Oy7B
         5p1cn9jHwpr776N/wvdtPdnVqmHsVIrA7jm9tlvln79ILzV8AkxbuA9FvQ8lNHmypGtL
         PxkA==
X-Gm-Message-State: AOJu0YxgGp8pufT4CJthqowA/UFOURy9tQtyBdTrEpxBu3kALJNPXfoP
	2l/X/irHeWeO/m9z6TteygiigFUP5m97yjG/78jyfffosnto7vf/EY1SYk3xa+RLGauKd5K3WQU
	niCMNkK1Ug1JofJZoxq6KVI56fiYUvq0=
X-Received: by 2002:aa7:c143:0:b0:558:b89d:a2ce with SMTP id r3-20020aa7c143000000b00558b89da2cemr4298885edp.19.1705416192556;
        Tue, 16 Jan 2024 06:43:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd/Z4ZAplKe17YHYU8oebPidVCIvKAtmbrfG93PbmakqjNbBadZz+QtsRs35rLbods9qI0MQ==
X-Received: by 2002:aa7:c143:0:b0:558:b89d:a2ce with SMTP id r3-20020aa7c143000000b00558b89da2cemr4298882edp.19.1705416192236;
        Tue, 16 Jan 2024 06:43:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id ef5-20020a05640228c500b00557d839727esm6826117edb.7.2024.01.16.06.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 06:43:11 -0800 (PST)
Message-ID: <20a1cc94-7f88-4b7f-879b-1835f804e8d1@redhat.com>
Date: Tue, 16 Jan 2024 15:43:10 +0100
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
 <162f0847-3f72-4606-a1ab-de05bdd97339@redhat.com>
 <DZ5T0aPAth1T_tvaht8979K9VSJFt5_00JStgZUA1nApXOA6JYcEjgdEnCZ-V1o_kKNya5nhqz9NTW76_xpQXMWvnGpu497KLsmPxewtEZ0=@protonmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DZ5T0aPAth1T_tvaht8979K9VSJFt5_00JStgZUA1nApXOA6JYcEjgdEnCZ-V1o_kKNya5nhqz9NTW76_xpQXMWvnGpu497KLsmPxewtEZ0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/16/24 14:32, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2024. január 16., kedd 10:34 keltezéssel, Hans de Goede írta:
> 
>> [...]
>>> 2023. november 15., szerda 18:46 keltezéssel, Hans de Goede írta:
>>>
>>>> There have been multiple reports of keyboard issues on recent laptop models
>>>> which can be worked around by setting i8042.dumbkbd, with the downside
>>>> being this breaks the capslock LED.
>>>>
>>>> It seems that these issues are caused by recent laptops getting confused by
>>>> ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks for
>>>> this, just skip ATKBD_CMD_GETID alltogether on laptops in translated mode.
>>>>
>>>> The main goal of sending ATKBD_CMD_GETID is to skip binding to ps/2
>>>> mice/touchpads and those are never used in translated mode.
>>>>
>>>> Examples of laptop models which benefit from skipping ATKBD_CMD_GETID:
>>>>
>>>> * "HP Laptop 15s-fq2xxx", "HP laptop 15s-fq4xxx" and "HP Laptop 15-dy2xxx"
>>>>   models the kbd stops working for the first 2 - 5 minutes after boot
>>>>   (waiting for EC watchdog reset?)
>>>>
>>>> * On "HP Spectre x360 13-aw2xxx" atkbd fails to probe the keyboard
>>>>
>>>> * At least 9 different Lenovo models have issues with ATKBD_CMD_GETID, see:
>>>>   https://github.com/yescallop/atkbd-nogetid
>>>>
>>>> This has been tested on:
>>>>
>>>> 1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
>>>>    in translated mode when no keyboard is plugged in and with a ps/2 kbd
>>>>    a "AT Translated Set 2 keyboard" /dev/input/event# node shows up
>>>>
>>>> 2. A Lenovo ThinkPad X1 Yoga gen 8 (always has a translated set 2 keyboard)
>>>
>>> Just wanted to briefly mention that this broke my hwdb configuration because the
>>> version field of the device (as shown in `/proc/bus/input/devices`) has changed
>>> and it was included in the hwdb match rule.
>>
>> That is unfortunate. Was this a custom rule or one from
>> the hwdb shipped with systemd ?
>>
>> Either way can you share the match pattern of the rule before and
>> after? I want to check if there are any similar cases in
>> the hwdb shipped with systemd.
>> [...]
> 
> It was a custom rule.
> 
> Before:
> 
> evdev:input:b0011v0001p0001eAB83*
>  KEYBOARD_KEY_f8=fn
>  KEYBOARD_KEY_76=f21
> 
> I: Bus=0011 Vendor=0001 Product=0001 Version=ab83
> N: Name="AT Translated Set 2 keyboard"
> P: Phys=isa0060/serio0/input0
> S: Sysfs=/devices/platform/i8042/serio0/input/input4
> 
> 
> After:
> 
> evdev:input:b0011v0001p0001*
>  KEYBOARD_KEY_f8=fn
>  KEYBOARD_KEY_76=f21
> 
> I: Bus=0011 Vendor=0001 Product=0001 Version=abba
> N: Name="AT Translated Set 2 keyboard"
> P: Phys=isa0060/serio0/input0
> S: Sysfs=/devices/platform/i8042/serio0/input/input4

I see, thank you. There are no v0001p0001 matches
in the hwdb.d/60-keyboard.hwdb shipped with systems.

Typically laptop builtin keyboards use another match-type
so that they can do DMI matching e.g.:

evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pn*:*

So luckily for almost all users the e field in the match
rule changing should not be an issue. Sorry that this
was a problem for you.

Regards,

Hans


