Return-Path: <linux-input+bounces-11021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07793A6A948
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 16:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E63E4188B70B
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 14:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301278BF8;
	Thu, 20 Mar 2025 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S0gLP8jH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5D1DED46
	for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742482470; cv=none; b=PVUEHxXewQXDBLCWTChSmDMPaqBN4nyfsFlYRxFxVdxfOrhqvAjFxbmnW3D9c1XXtdbF4MZiVGpEV61evRI/VrNHpSq2Xg3RXL/vVHR88u7xGcxSnz1r0v31RrFZJSHLQ89JeKGljgIbcl53+6PX3UJF6StTPK8pgjF0+eRUHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742482470; c=relaxed/simple;
	bh=yMwQk2aQOJ0mAW6PH84UnsPCa5vK0tOCkuoyO589icE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTrFCIKDr6OO5dVLchACszQPIv+ECChP0X7saVEDeKJNaQp6glIlV05H+NFMh6VXmjhiDsBe/k2GEPxJxlPvGOcrPki2YlbBVPz8RdgNUqIvLw+ja8vFtZ5Rpd6T6CKzNxH8c9X6Q9X3NlwlsnkhKxM8cGF23+2p70DNtvH6t+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S0gLP8jH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742482467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIQfSDOvtc2eym5zZk5AdY+d4UUrbHON1HsD7M6KtnE=;
	b=S0gLP8jHGLuMAbSUwPK/49kLXxEqv4Ri3Rvl7GGaloAh97P9r78iaOuPIf9DgNMysmTTNl
	67xGQidTmlEPHNC778G9na38TYJcS8HtMMLl2kzhI9QnKmDPLShBPE4CwsEkSmvG1AE7YS
	YPLmNDA+898if3Di+wP0E2GR7z/CyxM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-zEkW8k4gP4aCD1xIDSmLoA-1; Thu, 20 Mar 2025 10:54:25 -0400
X-MC-Unique: zEkW8k4gP4aCD1xIDSmLoA-1
X-Mimecast-MFC-AGG-ID: zEkW8k4gP4aCD1xIDSmLoA_1742482464
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac37ed2b99fso89514266b.3
        for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 07:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742482464; x=1743087264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIQfSDOvtc2eym5zZk5AdY+d4UUrbHON1HsD7M6KtnE=;
        b=S3snJSVVY1y/sDBAbY1wvhBv1B2E5jtV8Cqe/6wsJdIgAH2DkJq5L64mH1trcB8KzG
         +wgm4/tzV/xbnmYjao9hSXydllBrN4fpfiGlmJN6KTL1sc2uoWSdRVgLRH7kDTRiFafk
         qDmmXcP9xZXcwqx61vZrYT8O9+Rw8a2hDRKeHYN78SUog0F7JdErbAZbt/PmNCfLNX2U
         UfHtEwIp8/MfIQ0qU3O6sUhBXv2oSe9XvxpsioRLR5WM+ky0SpC3BONT4yJ+gN0BE94k
         EfXq5jhkRhQO8mbBswcJbl6Lp/8J1wGPgJJNtFnpm9sK8N5zR3XycdaO2K5xkBIt23Nu
         /eeg==
X-Gm-Message-State: AOJu0YyEr60IATyXIVlSqNvnddJiasSrDn5FInr0Zjky5jmYOMykssiS
	hWz/FRnpWT6vZEJWf8vo8fA+i8d1PQpSiEp/qFf6NRBUNzwZUgBdN+BUk45iJ3nDwElmYU42wVg
	MCQnNgSE61RzTicvO7rdhc3pfoA879QgGYfysw/3fpkSih0+zjedU7Dmxpd6WrvmnafWj
X-Gm-Gg: ASbGnct6tNg3038wtbRaho0u1WDNodJcVcO6K9SQuNGoZXsaLPJVN/e9Y2uPo8+7j8W
	jJOhFUKjMa876NhSXL0ShUQZ2FvBmDgrsfFClAV747TeKmXZUjgOXhwHb2IDW2n9xWAsnZoaCF9
	lycEVbpr+zlvkPSC0G+mez9R73zngPqbwJR5/uoTU6xMAbDRId77AJHFafizC8DBapG7Lo516YY
	pMEM7BZ19rmqQBKfwXl4l+0see8/JFlWemH5+fhcutZs1XDN/A+xSON7wB7215wKF3F4+AYq/b4
	U4QmQd0tIVPXbgjyTOgaePcS+nFF8lL3Y46Pes8l/wJlD3T6+Na+OBPsgcuy7nRjNPTMruL6esi
	Xh/+zeQ5QvI4PsjsI+O4niQKZP8IZkCift+Wx5uyqTdLrxT/mqsRdzNUw0UY08kzAPg==
X-Received: by 2002:a17:907:7f9f:b0:abf:6a53:2cd5 with SMTP id a640c23a62f3a-ac3ce18d827mr435424066b.48.1742482463691;
        Thu, 20 Mar 2025 07:54:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG00voEwgoi5DrpGoQ2g8mrtBg73QlEJf3wHicuOVjhmI5EBretIdwOMzZlNZhp3rrCzpi0Mg==
X-Received: by 2002:a17:907:7f9f:b0:abf:6a53:2cd5 with SMTP id a640c23a62f3a-ac3ce18d827mr435419366b.48.1742482463066;
        Thu, 20 Mar 2025 07:54:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816974b63sm10578644a12.28.2025.03.20.07.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 07:54:22 -0700 (PDT)
Message-ID: <0926fffc-ff0e-4f7c-926f-be9f5c861bae@redhat.com>
Date: Thu, 20 Mar 2025 15:54:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Goodix Drive issue
To: Henry Isaac <henry_isaac@live.com>
Cc: linux-input <linux-input@vger.kernel.org>
References: <AM9PR03MB7712D6F6F359E3147B35B415EDDF2@AM9PR03MB7712.eurprd03.prod.outlook.com>
 <a458616b-3f3d-4f1d-9339-3ebdab6a2fdc@redhat.com>
 <AM9PR03MB7712B2C65E49480D9205B40EEDDE2@AM9PR03MB7712.eurprd03.prod.outlook.com>
 <59f9c9cc-f839-40ae-8853-67dd00571c85@redhat.com>
 <AM9PR03MB7712EBF7F099701871650F54EDD92@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AM9PR03MB7712EBF7F099701871650F54EDD92@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Henry,

On 19-Mar-25 4:49 PM, Henry Isaac wrote:
> Hello,
> 
> Sorry about that, I'll be sure to select reply all next time.
> 
> For some reason I am still getting nothing on the sudo i2cdetect unless I am doing something wrong, I have attached the command line results as a .txt
> 
> I will add, I am unsure if this makes a difference but the touchscreen supports, and the tablet comes with a battery powered stylus, I am unsure if this feature of the touchscreen could cause any issues?

Well that is weird. I'm not quite sure what is going on here...

Do you know which driver the touchscreen uses under
Windows ? Maybe the manufacturer provides a separate
driver packages for the touchscreen for Windows ?

Also I presume that the LCD panel of the tablet was
on during all these tests ?

Sometimes the touchscreen gets turned on/off together
with the LCD panel ...

Regards,

Hans



> On 19/03/2025 13:25, Hans de Goede wrote:
>> Hi Henry,
>>
>> Note I've added linux-input@vger.kernel.org back to the Cc,
>> please use reply-to-all to keep it in the Cc.
>>
>> On 18-Mar-25 11:26 PM, Henry Isaac wrote:
>>> Hello Hans
>>>
>>> Sorry for the delay, had an issue with Endevour so I reinstalled but this time just used the normal Arch ISO (Sorry if his complicates things) I followed all the steps again and the new ones to be safe.
>>>
>>> At the i2c_hid part of the file it just says address unavailable, I hope this helps!
>> Since the new dmesg was not send to the list, here are the 2 relevant
>> new messages after enabling i2c_hid.dyndbg:
>>
>> [    5.553115] drivers/hid/i2c-hid/i2c-hid-core.c: HID probe called for i2c 0x5d
>> [    5.553819] i2c_hid_acpi i2c-GXTP7386:00: nothing at this address: -121
>>
>> Henry, this means that either the touchscreen is not at that address,
>> or it is but it is not powered on.
>>
>> The ACPI tables describe 5 possible touchscreens, there is
>> a possibility that somehow the wrong one is selected by the BIOS.
>>
>> First lets try to see if there is a touchscreen at a different
>> i2c-address.
>>
>> All ACPI touchscreen descriptions use the same i2c controller,
>> so first of all lets find out which i2c-bus Linux has assigned
>> to that controller, please run:
>>
>> ls -l /sys/bus/i2c/devices/i2c-GXTP7386:00
>>
>> Here is the output of that run on the touchscreen of a laptop:
>>
>> lrwxrwxrwx. 1 root root 0 Mar 19 11:24 /sys/bus/i2c/devices/i2c-ELAN901C:00 -> ../../../devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN901C:00
>>
>> notice the "/i2c-1/" in the output, this indicates that the touchscreen
>> on that laptop is on bus 1. Now install i2c-tools (not sure what
>> the Arch pkg name is) and run e.g.:
>>
>> sudo modprobe i2c_dev
>> sudo i2cdetect -y -r 1
>>
>> replacing "1" with the bus-number you found.
>>
>> Here is example output from the same laptop:
>>
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00:                         -- -- -- -- -- -- -- --
>> 10: 10 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- -- -- -- -- -- -- --
>>
>> This shows a single device on this bus at address 0x10.
>>
>> Maybe you will see a device here at address 0x10, 0x14,
>> 0x38, 0x40 or 0x5d .
>>
>> If you see a device at one of these addresses please
>> copy and paste the output in your next email and
>> then we will see from there.
>>
>> OTOH if you don't see a device at any of these addresses
>> lets try to see if we can power the touchscreen up by setting
>> its GPIO. According to the ACPI info GPIO-controller
>> GPO0 pin 0x3a (pin 58) is used for the touchscreen enable.
>>
>> First lets make sure that gpiochip0 matches GPO0,
>> install libgpiod-utils (Fedora pkg name) and run:
>>
>> sudo gpiodetect
>>
>> On your geminilake tablet I expect that to output
>> something like this:
>>
>> gpiochip0 [INT3453:00] (80 lines)
>> gpiochip1 [INT3453:01] (80 lines)
>> gpiochip2 [INT3453:02] (20 lines)
>> gpiochip3 [INT3453:03] (35 lines)
>>
>> The important thing here is that gpiochip0 is INT3453:00,
>> that may be different if there is some other GPIO chip
>> which got registered earlier.
>>
>> Assuming that gpiochip0 is INT3453:00 lets try to turn
>> the touchpad on:
>>
>> sudo gpioset -c gpiochip0 58=1
>>
>> (and then press Ctrl+C because gpioset keeps running
>> to hold ownership over the GPIO)
>>
>> and then re-run the i2cdetect:
>>
>> sudo i2cdetect -y -r 1
>>
>> again replacing "1" with the bus-number you found.
>>
>> Hopefully a device will show up now, if it does
>> please copy and paste the output in your next email.
>>
>> If there still is no device, then maybe the enable signal
>> is inverted, try running:
>>
>> sudo gpioset -c gpiochip0 58=0
>> (and then press Ctrl+C again)
>>
>> and re-run the i2cdetect:
>>
>> sudo i2cdetect -y -r 1
>>
>> Note if you do get a device found after running gpioset,
>> please also let me know if you got the device to show
>> up with 58=1 or with 58=0
>>
>> Regards,
>>
>> Hans
>>
>>


