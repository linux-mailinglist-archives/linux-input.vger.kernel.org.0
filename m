Return-Path: <linux-input+bounces-67-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD97EC9DE
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 18:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 754011F266B5
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 17:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D483175D;
	Wed, 15 Nov 2023 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aIA7mo/b"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3494C196
	for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 09:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700070337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNSW9xt0BuxgJERzL4j9Lp2C2xtqLvps6QDDmuILMkY=;
	b=aIA7mo/bWgl5T5yQBIr0dmiQ5c+RATxhpWc27/l2TdulOqTBgo1qzMkbjMFWrd2THGtaZe
	Ft7CgHRSsgW2cv8iLM8SsX+ERqdbPNkPBbYPYIwooE+oi+6OZ8+/xWqG7fs8wsEDeSOnRN
	HQnNMasKngEqi4mwe80bjWFS1U0wydY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-rhxta5gNMmCBFXKdNnktOg-1; Wed, 15 Nov 2023 12:45:35 -0500
X-MC-Unique: rhxta5gNMmCBFXKdNnktOg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9bea60bd1adso137761666b.0
        for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 09:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700070333; x=1700675133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HNSW9xt0BuxgJERzL4j9Lp2C2xtqLvps6QDDmuILMkY=;
        b=nVAa3FbQnIJdCgwHK9XtbzcQYDzIe26m3jU4VmxluyGtYrLaobcAGt7TgVB9/yLWhS
         WzdN4J5YAQELOMmTI3fOOFStHzJAXUIZN/Duwf+wbMJ37ACkLrjQMuUxGOsk6PS8aP31
         ok4Gmj2oWQt5pkL4dbRR3HZBPAz2X2PeEMgHcFEWquqwve5xlbToxIiXSvsBw/xudHFn
         6IA14qV+RddfwzXSqnoD5b7W+cj5MUneVy4wQWkd4fY4rC+i1HEcu8E8DFUjFqmuh5pG
         /JVQXwJhg4hrZSgyuwyXMYBXoCPKaFsooWWfvrvsYlSVWsRRkRJD1p77WZMJzdR7QE5D
         4Uiw==
X-Gm-Message-State: AOJu0YxTq2GYWfvOsOAIZ4ivO1tW+5yPxW2H91G/DM4AGvLr0t8eO5yg
	DCUVd35ZuYvk5oiXn19N2BW0ml6WKLRIMgLDDqpHdXFbG0/Cp4/CRieFJQ08Ph4eBrUs371ZfkG
	MnzgXKvpdfJY2zH2hgHm9vZhiAgMjNHY=
X-Received: by 2002:a17:906:3013:b0:9ae:50ec:bd81 with SMTP id 19-20020a170906301300b009ae50ecbd81mr5625655ejz.21.1700070333490;
        Wed, 15 Nov 2023 09:45:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+1I9WlKqIYh1MchEACIL0Rm/6rmxfTt99Fb1WAfhK2Ht1CkWjGC0oGEiL1EQyX9yXERsU6g==
X-Received: by 2002:a17:906:3013:b0:9ae:50ec:bd81 with SMTP id 19-20020a170906301300b009ae50ecbd81mr5625637ejz.21.1700070333163;
        Wed, 15 Nov 2023 09:45:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o18-20020a1709061d5200b009a1c05bd672sm7354029ejh.127.2023.11.15.09.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 09:45:32 -0800 (PST)
Message-ID: <4fdc57c7-3362-45e8-a37c-dec9296d0f6c@redhat.com>
Date: Wed, 15 Nov 2023 18:45:31 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>,
 gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
 Anton Zhilyaev <anton@cpp.in>
References: <20231106155429.5377-1-hdegoede@redhat.com>
 <ZVOZUa1i9dQfm76M@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZVOZUa1i9dQfm76M@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Thank you for the review.

On 11/14/23 16:59, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Mon, Nov 06, 2023 at 04:54:29PM +0100, Hans de Goede wrote:
>> There have been multiple reports of keyboard issues on recent laptop models
>> which can be worked around by setting i8042.dumbkbd, with the downside
>> being this breaks the capslock LED.
>>
>> It seems that these issues are caused by recent laptops getting confused by
>> ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks for
>> this, lets just skip ATKBD_CMD_GETID alltogether when in translated mode.
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
>>   https://github.com/yaescallop/atkbd-nogetid
>>
>> Note this also removes the "NCD terminal keyboards are only supported on
>> non-translating controllers." warning since that code is now unreachable.
>>
>> This has been tested on:
>>
>> 1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
>>    in translated mode when no keyboard is plugged in and with a ps/2 kbd
>>    a "AT Translated Set 2 keyboard" /dev/input/event# node shows up
>>
>> 2. A Dell Latitude 9420 (always has a "AT Translated Set 2 keyboard")
>>
>> 3. A Lenovo ThinkPad X1 Yoga gen 8 (idem)
> 
> I agree that the mice/touchpads are not going to work if the controller
> is in translated mode, however I wonder if on a device with external
> PS/2 ports we could not end up with a port in translated mode with
> "wrong" device plugged in.
> 
> Can we consider not skipping the check completely, but rather use DMI to
> check the chassis type (we already have a similar check in 8042)
> and skip ATKBD_CMD_GETID on mobile devices, but still try
> ATKBD_CMD_SETLEDS on them?

I think that should work. At least the patches from:

https://github.com/yescallop/atkbd-nogetid

for the affected Lenovo models to exactly that and from my (remote)
debugging of the issue on one of the HP laptops I expect it to work
fine there too.

I've prepared a v2 implementing this and I'll send v2 out
right after this email.

Regards,

Hans


