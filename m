Return-Path: <linux-input+bounces-2881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF489E8EB
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 06:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B88A287A69
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 04:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7571079D;
	Wed, 10 Apr 2024 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STNeliRk"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F49BA2B
	for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 04:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712723592; cv=none; b=XI6KayD0YotjKab+eag23hmQvvloSpyht0kG5mn9FKY1ZfQRt1oN/yK0h784OYwFfQxiRw5+gIIIX/4mWJ1lTBR+O/6urtUBV+rpSfLHqrxzXlKKejSc899nflQAkVEAzTNfXaaAkdS53UXKZXTRpYetM3TH8Z0vDKF7dwcdjNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712723592; c=relaxed/simple;
	bh=h9tgpqXFJcK+DYD0n9TmnkJ3NShANOlEk6vqoLQFEyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJBN3/PmoO9mT6Up8B4a+E2m7nZGfNGxSC85tqFBoOnEutrNA7LsKva2XqTXPix54mlwzD7I8zfWc+XdR2ejH9PvaRQhDoz+nwox8TjqO13UDoT7UfOunJhMDZaFGhfvCDEMEyGJENEscavzEEziQ4YJcb5yrfsOjZJG6Ye1v+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STNeliRk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712723588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D96eMegMNvGOobQPUAcgBWo3TgJJp8g0UMvgonFv028=;
	b=STNeliRkm0u1uMCBGGHXPFMae4gfwqVepqJIUQHHYS0YZGQSpdQk/kROLPiQ5+6p9GpBOe
	yY6WOhbCPCHAHX7Xwaci3hnPFqXt9s8aUoRcFCP0f+vMRu914olbCYKrZbn0MQ8LF+cCsg
	PiLWiOZjRamIPKmRgRwRk/8uVmrRN74=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-Yxa5pkZNNmq4iqzkNkQ1Zg-1; Wed, 10 Apr 2024 00:33:04 -0400
X-MC-Unique: Yxa5pkZNNmq4iqzkNkQ1Zg-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6ed2a12e50aso2051854b3a.1
        for <linux-input@vger.kernel.org>; Tue, 09 Apr 2024 21:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712723584; x=1713328384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D96eMegMNvGOobQPUAcgBWo3TgJJp8g0UMvgonFv028=;
        b=PxmzPDZwkqqnAk6A1tXRQJpUGpu+kKIcwHvGsy0UHwTJT1Qv9UO902RdPLhMtLCw3V
         h+fBK0je1el9JHW92PYCT1uyj1AcNHJ8OoT6Ut3ZIQakMBLpanzqq6203TO4anKlmJIv
         xkpp/wjrKQKrlAQNBA0auJxrKW5kNmM4/3Z4s/isvD4UP3KVHqh2UiTOVwdoRFf0BMYY
         fxV6y3GZmDEm4evBTdZgMacDrM3oVxApdf5YWhaUP90ruzajn84gE26kKgc+xZOq+t7O
         bY0GFIxVdfnPjIJzyqbYf5W/KXiNJe4y51ChBB9Qlik9q3kTBzy3NP7bijQYlK55RaKg
         bncg==
X-Forwarded-Encrypted: i=1; AJvYcCWKXGYLBDTQGv0YHFxHzB8g0rKCiHETpVfz5nOXGNAYB1ETrP8Y+L5bf+kKLnHm3znMiRVLsVrMRuBrWshi/L/oTlxX1oDOTpz6IYc=
X-Gm-Message-State: AOJu0YzhCy1Ah3A7E/jsb0bd8eIyTo8/bIDard6e8W1r/+ROvvcDJN7U
	Bj3Ztpm/UP6XRWH3McjZu/qXgw48IDlhyg32K69U+nzWzzuCi0DZbyvTL/8U5y/9k2Kfj0dbCKG
	sxv5BdNbnsDlD2TjqF+Abob9p9TZyhNRU7g0YwgiPlADcMGyggOEarqtTOPTE
X-Received: by 2002:a05:6a00:4fd2:b0:6ed:4b2d:a764 with SMTP id le18-20020a056a004fd200b006ed4b2da764mr7587762pfb.11.1712723583670;
        Tue, 09 Apr 2024 21:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx0Sz3ojTpctz7giTqqx2R5V+bbs742ef5vHqDuJyANeevjTVtDt6gkz7oZGO6GFvy6D5EOg==
X-Received: by 2002:a05:6a00:4fd2:b0:6ed:4b2d:a764 with SMTP id le18-20020a056a004fd200b006ed4b2da764mr7587733pfb.11.1712723583260;
        Tue, 09 Apr 2024 21:33:03 -0700 (PDT)
Received: from [192.168.1.240] (117-20-68-143.751444.bne.nbn.aussiebb.net. [117.20.68.143])
        by smtp.gmail.com with ESMTPSA id it24-20020a056a00459800b006e6be006637sm9251859pfb.135.2024.04.09.21.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 21:33:02 -0700 (PDT)
Message-ID: <5fe3b171-afc0-47de-802c-28470ce40674@redhat.com>
Date: Wed, 10 Apr 2024 14:32:56 +1000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
 <ZhR-WPx7dgKxziMb@google.com>
 <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
Content-Language: en-US, en-AU
From: Peter Hutterer <peter.hutterer@redhat.com>
In-Reply-To: <ZhXpZe1Gm5e4xP6r@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 11:20, Dmitry Torokhov wrote:
> On Tue, Apr 09, 2024 at 02:47:05PM -0700, Dmitry Torokhov wrote:
>> On Tue, Apr 09, 2024 at 03:23:52PM +1000, Peter Hutterer wrote:
>>> On 09/04/2024 09:31, Dmitry Torokhov wrote:
>>>> Hi Mark,
>>>>
>>>> On Sun, Mar 24, 2024 at 05:07:58PM -0400, Mark Pearson wrote:
>>>>> Add support for new input events on Lenovo laptops that need exporting to
>>>>> user space.
>>>>>
>>>>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>>>>> Add a new keycode to allow this to be used by userspace.
>>>>
>>>> What is the intended meaning of this keycode? How does it differ from
>>>> the driver sending BTN_LEFT press/release twice?
>>>>>
>>>>> Lenovo support is using FN+N with Windows to collect needed details for
>>>>> support cases. Add a keycode so that we'll be able to provide similar
>>>>> support on Linux.
>>>>
>>>> Is there a userspace consumer for this?
>>>
>>> Funnily enough XKB has had a keysym for this for decades but it's not
>>> hooked up anywhere due to the way it's pointer keys accessibility
>>> feature was implemented. Theory is that most of userspace just needs
>>> to patch the various pieces together for the new evdev code + keysym,
>>> it's not really any different to handling a volume key (except this
>>> one needs to be assignable).
>>
>> What is the keysym? If we can make them relatable to each other that
>> would be good. Or maybe we could find a matching usage from HID usage
>> tables...

There's a set of  XK_Pointer_ keysyms defined in X11/keysym.h, including XK_Pointer_DblClick1 and XK_Pointer_DblClickDefault.
Unfortunately they're not hooked up to anything atm, see this draft MR:
   https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/659
Because they're not hooked up anywhere they'll also need to be hooked into the client space, same as the various XF86FooBar symbols we've added over the years.

If we were to add KEY_DOUBLECLICK we can patch xkeyboard-config to bind that to the existing XK_Pointer_DblClickDefault symbol (it would get XF86DoubleClick assigned by the current automated scripts), so in theory that key would work like any other key with that symbol assigned.

> I was looking through the existing codes and I see:
> 
> #define KEY_INFO		0x166	/* AL OEM Features/Tips/Tutorial */
> 
> We also have KEY_VENDOR used in a few drivers/plafrom/x86, including
> thinkkpad_acpi.c and I wonder if it would be suitable for this vendor
> specific debug info collection application (which I honestly doubt will
> materialize).

fwiw, I suggested KEY_DOUBLECLICK because that is the action the user takes. Whether that starts a particular application is mostly a question of configuration, defaulting to something that emulates a double-click seems prudent though. And if someone wants to remap that to the compose key that'd be trivial too then.

Cheers,
   Peter


