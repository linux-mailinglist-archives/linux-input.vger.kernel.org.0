Return-Path: <linux-input+bounces-1278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC882F569
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 20:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 512481C239AF
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 19:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8901D526;
	Tue, 16 Jan 2024 19:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SP8u9AeI"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6C1D521
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705433626; cv=none; b=hc+sGRaH77dVStcuXJ7HyoDlCXW/2PUx0JKelk/DWM263Z2sff7EHK8N6wVbZdC7rrLB35hcHAQGGGibIjRUAoLvtJL/dFmT+ip+l7CiY+OmY8Cy5lEUN0bFjJbZMrDxHJLU+Qmqrtosz7kFIvm26KlrzW9JrGOBGLkwCDCgKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705433626; c=relaxed/simple;
	bh=0NiPbbzOw6VLYHsoOnBrhsja+Y5M2wNz7vr30+C6uqw=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=JU7HQz3oJMHl4ywvSCFM0Qjx2RTnjmOSv9WhAwanUK79JoSZGFdWb5xXLcumAlGy+T9i/cAPKVkrddODd08oRikH0HkJdU/ogG8WO8wCExzYL08MEUwtXV3aP7GgiG1id6o844IKSR+R7slGgybWCnB4kpVe3oeWOWakK9N3lnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SP8u9AeI; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705433624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNrhdld/n5czczbAWEYyYAgRE/OfLzkOJw8n2YV7DFE=;
	b=SP8u9AeIKmE0BZk9+CGDofqbjZ8dC4RHfAiGJrlMVgFTCqN6Wdq/rpYI9Enx0OCPDjOwAO
	J8SPj1FmipUsCbliCugZ505KKh+5/WuhH5C42JOgZIBiMo8xCrvlNyTzVEypXSGeZfaGen
	AmsVrTsN7q3HGSi8lVsbgBe/0LshyZI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-1sYsJKYcMUSQ4GRaSeifig-1; Tue, 16 Jan 2024 14:33:43 -0500
X-MC-Unique: 1sYsJKYcMUSQ4GRaSeifig-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2e66e65f6aso55724466b.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 11:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705433621; x=1706038421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNrhdld/n5czczbAWEYyYAgRE/OfLzkOJw8n2YV7DFE=;
        b=h7SXhW2gDMu5MQ/A5/pmBJDsqueQLTqiyQHx5qzH2zNZjVDpPbYBWMuANSQHlSl4nS
         l6GpzC2168TQIkHUvIwGffij5Dmweanf0c60swTeFsbCGmOEreLLmtUwrLPtMjKqdZbF
         Vfoc1GY/OeOklQKIQBiQjzCNj0Z1Upna2DgIw2+Dn0akamVAmpR2yzWWH54z+XGN+Cy3
         hhI9OCnLFvHqk1WMqTZaBAIgRuqC0qP9d1Wk3yZ6H++Q4pxzv+AAxrg73WrPisCxzlSt
         y3te/MMPspaoVck2mFp9j5+0NebMsX6QdIkr3jN/hE2M2SRU+48ItXrHWtrEPL9lzWWR
         5ONw==
X-Gm-Message-State: AOJu0YwG4lSkBUsZe/fmQRnw6XEjUUU1jM9tibS3b4c9j5CqUlg/VVA4
	Z6Abtp4FKcGk/iJCIYZYmrI6LJhF7tcn5SndNHEfekH9m6YFMb/56rNIx/HCUAUHMYczYuZ2GCS
	GhpuUXiT8AkuHwnAg4lQcwItJsVDL/uta/Is1+kI=
X-Received: by 2002:a17:907:a782:b0:a2c:c556:bff5 with SMTP id vx2-20020a170907a78200b00a2cc556bff5mr4432926ejc.108.1705433621533;
        Tue, 16 Jan 2024 11:33:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp8cY7AwPrnnqz9wAPeoIXybTJ+AyIPQ1EuOtGt0F61jUZhg/FFWMkXzAynOr/uYHNjQyZZA==
X-Received: by 2002:a17:907:a782:b0:a2c:c556:bff5 with SMTP id vx2-20020a170907a78200b00a2cc556bff5mr4432920ejc.108.1705433621227;
        Tue, 16 Jan 2024 11:33:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id vw5-20020a170907a70500b00a2e3a1ae471sm1661382ejc.6.2024.01.16.11.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 11:33:40 -0800 (PST)
Message-ID: <5207ea8a-722b-4431-8d50-8cec8356f1ad@redhat.com>
Date: Tue, 16 Jan 2024 20:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>,
 gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
 Anton Zhilyaev <anton@cpp.in>
References: <20231115174625.7462-1-hdegoede@redhat.com>
 <W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com>
 <162f0847-3f72-4606-a1ab-de05bdd97339@redhat.com>
 <DZ5T0aPAth1T_tvaht8979K9VSJFt5_00JStgZUA1nApXOA6JYcEjgdEnCZ-V1o_kKNya5nhqz9NTW76_xpQXMWvnGpu497KLsmPxewtEZ0=@protonmail.com>
 <20a1cc94-7f88-4b7f-879b-1835f804e8d1@redhat.com>
 <ZabTi1PbTl-uF5aM@google.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZabTi1PbTl-uF5aM@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/16/24 20:05, Dmitry Torokhov wrote:
> On Tue, Jan 16, 2024 at 03:43:10PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/16/24 14:32, Barnabás Pőcze wrote:
>>>
>>> After:
>>>
>>> evdev:input:b0011v0001p0001*
>>>  KEYBOARD_KEY_f8=fn
>>>  KEYBOARD_KEY_76=f21
>>>
>>> I: Bus=0011 Vendor=0001 Product=0001 Version=abba
>>> N: Name="AT Translated Set 2 keyboard"
>>> P: Phys=isa0060/serio0/input0
>>> S: Sysfs=/devices/platform/i8042/serio0/input/input4
>>
>> I see, thank you. There are no v0001p0001 matches
>> in the hwdb.d/60-keyboard.hwdb shipped with systems.
>>
>> Typically laptop builtin keyboards use another match-type
>> so that they can do DMI matching e.g.:
>>
>> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pn*:*
>>
>> So luckily for almost all users the e field in the match
>> rule changing should not be an issue. Sorry that this
>> was a problem for you.
> 
> Hans, I wonder, if we skip "GET ID" command because it is a
> portable/laptop, maybe we should assume that it is the standard "0xab83"
> instead of "0xabba" that we assign if GET ID fails but SET LEDS
> succeeds. What do you think?

That sounds like a good idea to me. I was already wondering
if there was a standard response.

Do you plan to write a fix yourself or shall I propose one ?

Regards,

Hans


