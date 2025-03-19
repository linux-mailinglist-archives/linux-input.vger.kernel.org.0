Return-Path: <linux-input+bounces-10973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE24A68DDC
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 14:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8568819C1484
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 13:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3122561D7;
	Wed, 19 Mar 2025 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bOHAN8xF"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480462566E1
	for <linux-input@vger.kernel.org>; Wed, 19 Mar 2025 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742390712; cv=none; b=SSwAJn5qL35VhjXw3RgiE0RC67EIxRJzG2P7MBAzyQ7AmMRCYzpf1fdsvEiuO1cf7qKtMBSt/ZLI3Kjl0F04BVY2Fv9kkvPQwR6u2HUjjsbNVxuobbqv+9OC9WxEStnzTFNM8hgf/Mf/hO+13HxzQ6GecLnkYRh3SAGqqaQ+Ods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742390712; c=relaxed/simple;
	bh=1I6CO/bkAqPndcdPVPaDVfi0sdwx74yJ61kxXi0/WSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=RkxXvg4vMnkRgwhdEzDAZov6h4vupse4DrazmVuk46eojeP2ZUN8dKBP/b8pZWTX6EvLLBcKxMcoadxRntLZzphgjiIdO8Zi1EVO1Hkb88L3nol0821r1twSgU8bHUYq2NXw9Upc9Mw0DZydAC9eM+vvgKegnwSl+RmpAmULvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bOHAN8xF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742390709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=opl0TvL1BoVX2JZxA1WD5mM47lv5lWQ6PDRRNc6pgu4=;
	b=bOHAN8xFko5Qq9DJA/A3eLuQDK4KSOQz0nHN/eTiE9lcJmNW0BIIUTgBzvsTqucJqeKs6U
	VYIgl5KnLK+tqzz+zfwo03F7bk5siAZlnDJIqN30n0ySlJMYpWaQqyoEMLhkshXlMjsH/U
	j4z201V5MkJL5rysUehuG1HcH70RmtE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-0YSjyX7CNfqasLw6_RwYDQ-1; Wed, 19 Mar 2025 09:25:07 -0400
X-MC-Unique: 0YSjyX7CNfqasLw6_RwYDQ-1
X-Mimecast-MFC-AGG-ID: 0YSjyX7CNfqasLw6_RwYDQ_1742390706
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e5c03580aaso5744009a12.2
        for <linux-input@vger.kernel.org>; Wed, 19 Mar 2025 06:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742390706; x=1742995506;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opl0TvL1BoVX2JZxA1WD5mM47lv5lWQ6PDRRNc6pgu4=;
        b=ClsK4Z/pXM7q3M1S82IZyTwDZg+rhfuE4Xz+M0WSXy2oZIxr8zMLpOrV2Y5aK5azlD
         Ul72bn8pfLZHEdauX3m0th9sy2ecPzFlBhrhOt+Li2UGjhy6MTlWUro6FedlcDImufW5
         SnJ0e/vBIdLH5SaXitz7SdRQMNwjdzjcskgBYcQw399xPQ5z5v5icsoOp7XnXTdDZbda
         ++nrAh4WLz3za0f5uGAGgnANnw5VH4bK3q+kFaPoufQkdKDPlSJcIscFWlhXoSL2wK0M
         SYnP4Q2UhzHsXu3EvHLWUJ+jagHWLWcwi7PI4ALISj9a5Rnb1o2/UZ1myI/7wloIhwR2
         G38Q==
X-Gm-Message-State: AOJu0Yx/Wmb82zrsK3juin+gsSH2vjys/mollUilj7GDG/L9pHpTQdoJ
	mcqShSn9EtAcaHw4GbeXTZyxS5JWk6zMcCgJzhHmuII7+E0vFpm3g9JGLOrHexbrm8Wvy+0owXY
	7q4jt0cJs7qFzfFivvKEtrHaJ0IFH53RADiv365GWOymk0lwrmZt5UEi7hcW+FMEV/e3i
X-Gm-Gg: ASbGncv5SuaL+DqEbm/jdPnWktI1bvsx5qyzCK++6GMMlkC1nUyNTz3ql4D0J4COAqX
	/mZuO55yrAyIUtIaOj8UNIXDV/G5Po0b3d9F1FfbUGuvh+JZdDs2RxrFCWZMyYqH3YIf+bd3iiO
	PzXzuoXjCy+eDRmgekpC3i1NjAvYmsTb53l8aGQS3xOYbOfqfTO3km+HaXnZeEq7tI1y2mYxGhM
	HpKHYyx7pMonNho7hD2JvaSzSrQ8fiEYGcyRj67Q5/K1JvPeC0VpzR1nwGfrEw+d66V/C4vUGUK
	hRoLVRRjfTuZHM5Rg87n07q0lpaP1Rg30Hhqh+6oNmDCE7fcwZMIfkXcNEAfA2FptbCFIkMs91X
	Ffj9QMAJkG5Y3Xvv7aAm0/9e8lUVH13BeYcaP2vMKUY90fO1Sg9hCX4p88ZWyPSeEsA==
X-Received: by 2002:a05:6402:2816:b0:5e5:71e:8c63 with SMTP id 4fb4d7f45d1cf-5eb80d05e22mr2449618a12.15.1742390705551;
        Wed, 19 Mar 2025 06:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWrIq7UZ4Hl7sgdG6uX1zIb0ihrlwGPzv4cDocOHVWeOXlzBAqtzAKNYcYjelgN+qPLUbizQ==
X-Received: by 2002:a05:6402:2816:b0:5e5:71e:8c63 with SMTP id 4fb4d7f45d1cf-5eb80d05e22mr2449426a12.15.1742390702887;
        Wed, 19 Mar 2025 06:25:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm9255110a12.41.2025.03.19.06.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 06:25:02 -0700 (PDT)
Message-ID: <59f9c9cc-f839-40ae-8853-67dd00571c85@redhat.com>
Date: Wed, 19 Mar 2025 14:25:01 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Goodix Drive issue
To: Henry Isaac <henry_isaac@live.com>
References: <AM9PR03MB7712D6F6F359E3147B35B415EDDF2@AM9PR03MB7712.eurprd03.prod.outlook.com>
 <a458616b-3f3d-4f1d-9339-3ebdab6a2fdc@redhat.com>
 <AM9PR03MB7712B2C65E49480D9205B40EEDDE2@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
Cc: linux-input <linux-input@vger.kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AM9PR03MB7712B2C65E49480D9205B40EEDDE2@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Henry,

Note I've added linux-input@vger.kernel.org back to the Cc,
please use reply-to-all to keep it in the Cc.

On 18-Mar-25 11:26 PM, Henry Isaac wrote:
> Hello Hans
> 
> Sorry for the delay, had an issue with Endevour so I reinstalled but this time just used the normal Arch ISO (Sorry if his complicates things) I followed all the steps again and the new ones to be safe.
> 
> At the i2c_hid part of the file it just says address unavailable, I hope this helps!

Since the new dmesg was not send to the list, here are the 2 relevant
new messages after enabling i2c_hid.dyndbg:

[    5.553115] drivers/hid/i2c-hid/i2c-hid-core.c: HID probe called for i2c 0x5d
[    5.553819] i2c_hid_acpi i2c-GXTP7386:00: nothing at this address: -121

Henry, this means that either the touchscreen is not at that address,
or it is but it is not powered on.

The ACPI tables describe 5 possible touchscreens, there is
a possibility that somehow the wrong one is selected by the BIOS.

First lets try to see if there is a touchscreen at a different
i2c-address.

All ACPI touchscreen descriptions use the same i2c controller,
so first of all lets find out which i2c-bus Linux has assigned
to that controller, please run:

ls -l /sys/bus/i2c/devices/i2c-GXTP7386:00

Here is the output of that run on the touchscreen of a laptop:

lrwxrwxrwx. 1 root root 0 Mar 19 11:24 /sys/bus/i2c/devices/i2c-ELAN901C:00 -> ../../../devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN901C:00

notice the "/i2c-1/" in the output, this indicates that the touchscreen
on that laptop is on bus 1. Now install i2c-tools (not sure what
the Arch pkg name is) and run e.g.:

sudo modprobe i2c_dev
sudo i2cdetect -y -r 1

replacing "1" with the bus-number you found.

Here is example output from the same laptop:

     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: 10 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         

This shows a single device on this bus at address 0x10.

Maybe you will see a device here at address 0x10, 0x14,
0x38, 0x40 or 0x5d .

If you see a device at one of these addresses please
copy and paste the output in your next email and
then we will see from there.

OTOH if you don't see a device at any of these addresses
lets try to see if we can power the touchscreen up by setting
its GPIO. According to the ACPI info GPIO-controller
GPO0 pin 0x3a (pin 58) is used for the touchscreen enable.

First lets make sure that gpiochip0 matches GPO0,
install libgpiod-utils (Fedora pkg name) and run:

sudo gpiodetect

On your geminilake tablet I expect that to output
something like this:

gpiochip0 [INT3453:00] (80 lines)
gpiochip1 [INT3453:01] (80 lines)
gpiochip2 [INT3453:02] (20 lines)
gpiochip3 [INT3453:03] (35 lines)

The important thing here is that gpiochip0 is INT3453:00,
that may be different if there is some other GPIO chip
which got registered earlier.

Assuming that gpiochip0 is INT3453:00 lets try to turn
the touchpad on:

sudo gpioset -c gpiochip0 58=1

(and then press Ctrl+C because gpioset keeps running
to hold ownership over the GPIO)

and then re-run the i2cdetect:

sudo i2cdetect -y -r 1

again replacing "1" with the bus-number you found.

Hopefully a device will show up now, if it does
please copy and paste the output in your next email.

If there still is no device, then maybe the enable signal
is inverted, try running:

sudo gpioset -c gpiochip0 58=0
(and then press Ctrl+C again)

and re-run the i2cdetect:

sudo i2cdetect -y -r 1

Note if you do get a device found after running gpioset,
please also let me know if you got the device to show
up with 58=1 or with 58=0

Regards,

Hans



