Return-Path: <linux-input+bounces-11023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EEA6AA57
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 16:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D08A2179C52
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 15:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238CA1E25F2;
	Thu, 20 Mar 2025 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RD2EUlvS"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107DE19DF98
	for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 15:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742486036; cv=none; b=i6Sr5jUd5dIPxPGktzt7Tpq3Cx76Mw5VqOt8qvx3lG7yieHWQ9cn4yx0Fle/hCUkgwV8yywGr7xF0f3jEWH1ZYDXN+55aRZrhoc5DkNHrbu544J2HGMoZQ3mBz3Ypwet0SrxSMUa0gpIPCsMij9PNf6XZj8U3Qxn6aYeJFrVbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742486036; c=relaxed/simple;
	bh=ITB+d7tVR01lyBUf90bM0ZiBq/CkRATR6PyPUocHbmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkNTCscWGzlHTsMRDWZGlW0wlsQWZvsaOmWqmBrp1auiUt/nqSZL2yjDF2GkV9ZyolIpY5CYgoe41IDaCglAlm2YkMUuM7ui5jnR4ICiAEfsW9yyGlZMRQqWVk8ktdEwifjnXwInkdqhhdEFUu7coazTqoI974fjNW9IJpegIxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RD2EUlvS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742486032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Upw/aJZgwGJnoo6CVNvSHiN5ioBfrAT0flbOV95D3pg=;
	b=RD2EUlvSJgL6mPXMC6mWnYQCKME/YE2vyoVv8YDYGRclSBybdQD9Rr8GNHY6vuE1JYPXuR
	K+sA+/Z09fozLsm+DbZB201VqcQtRA1pHXTUtY9z7iPqR4ICWly4gEfg2BeRoF696/dNYO
	UUPRczLI1H3VpcIlpOqyLhMWEU+nqBE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-tkDmVVXtP22xDO31hEbWcg-1; Thu, 20 Mar 2025 11:53:50 -0400
X-MC-Unique: tkDmVVXtP22xDO31hEbWcg-1
X-Mimecast-MFC-AGG-ID: tkDmVVXtP22xDO31hEbWcg_1742486030
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3d175fe71so87690966b.0
        for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 08:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486030; x=1743090830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Upw/aJZgwGJnoo6CVNvSHiN5ioBfrAT0flbOV95D3pg=;
        b=NHN5w9+jflnwsgfyifHf08cszEe/v6f0xy4OAHpCPBTYWwkTajTVartFAKhOzaBJYP
         EBeB255DC+QcmseVINAFZ1R3BKygnBECdT4msICNbuPhCXYNKiLgADSK8BaT2g5Woz1F
         E0AIa3fU+b+ApBhNc3v4zbJzX+hKFpJnqaO7oMhBva8k1MkUVzMHtL0SJ8DqqoMQHrgL
         vTN64W4anBGF0iATQ/pDDwcc/eFLSq6vbG3kUc4i2oinK4A2PognwBaQVHcnJ27yZSlj
         B5zZdDYlt/+M42C78gWJKu3aW10XOMop8m7VWfhHn6/1Ka29kfdTpJ7Caj46Zsxm1jMg
         lXiw==
X-Gm-Message-State: AOJu0YxaodJEqfwAmdYKxlslS2X/yZxlEg2hMKD8LdCsMhRZG9W2RKV7
	w5xatnkCMJ1BAi+VhtT3gYpXabaFd5Xnyq/cm2nHXIQBoiTCW3Uh+tcYlYMjgp3cNvoEXCscoRK
	it5shToUtdS61aRs08xuYoLYee3UG7LF/SEtrHvMMmTBZ45VMQg7iXesQmaer
X-Gm-Gg: ASbGnctk1HQdPXFcdH/0mlEFaUS7eN0JA8irCpKcW+B4hjyUX6wRufw31v9Ery6q6lK
	BnHd6UsRMNSGCGSdQPpQxB7QrnK8pizZVSvdKkGndM1r/EDRvEqd145eau3KPJpCxmZrYm5A++y
	2tzkB5AxwZaVztvIVs6JDDRfXQZAyCD+g7idKP8Yk/4+Dg+V8Udw+BEf05wtdaTvhcrqNN1Dqo3
	InGqwTtDGCMFq82fadgcC0limtOOlZeTBtyQcfDtA2IyjvLwnL2roWZag1xRK1lH+iylY9qkLaT
	OgMo5ucv3PQyAPFZ3iqE5QlnGHIjCZidVP7Ex0wju9btSe3E/1WGmOuobtnKbRA75yYCCxAOwj3
	LJrWK0rzq3TV6ZasfSciwQACqVX1l/u0PuZls0bxGNXfF8fJnEl0FKT7YaBTKG909Bw==
X-Received: by 2002:a17:907:97d5:b0:abf:6f87:c720 with SMTP id a640c23a62f3a-ac3ce04d7c7mr470639366b.29.1742486029472;
        Thu, 20 Mar 2025 08:53:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/CTGN5lJ6smOHSduW0pHR+HNQB8ue55nLopBsDpwrAA3iqcLSvZ+8xOjqHbqLVaxN2QIyNg==
X-Received: by 2002:a17:907:97d5:b0:abf:6f87:c720 with SMTP id a640c23a62f3a-ac3ce04d7c7mr470635566b.29.1742486028875;
        Thu, 20 Mar 2025 08:53:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef93e0casm3375166b.77.2025.03.20.08.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 08:53:48 -0700 (PDT)
Message-ID: <4d07fb2b-eef8-434a-8308-9b1cb95ea482@redhat.com>
Date: Thu, 20 Mar 2025 16:53:47 +0100
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
References: <AM9PR03MB771256AE6BFD89860F547D69EDD82@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AM9PR03MB771256AE6BFD89860F547D69EDD82@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Henry.

On 20-Mar-25 4:10 PM, Henry Isaac wrote:
> Hello Hans 
> 
> Yes the LCD was on during the entire process. Everything litterally works on the tablet except for the touchscreen function. The display is fine, no refresh rate issues or resolution issues.
> 
> I am unsure the exact driver for windows, I can boot into a copy of windows 11 and find out. Also Geos website has a zip folder of all the drivers if this helps!
> 
> https://geocomputers.freshdesk.com/en/support/solutions/articles/103000268395-where-can-i-download-the-drivers-for-my-geo-device-

Ok I downloaded this and there are no special touchscreen
drivers there, so I guess things just work with the default
i2c-hid support in Windows.

Question, do the cameras on this tablet work ? I wonder
if this is using an IPU4 based camera with a sensor which
happens to be on the same bus and is blocking the bus.

When you run the i2cdetect command does it go fast or
slow ? It should be pretty fast.

Also do any new messages show up in dmesg when you run
i2cdetect ?

Regards,

Hans




> On 20 Mar 2025 2:54 pm, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>     Hi Henry,
> 
>     On 19-Mar-25 4:49 PM, Henry Isaac wrote:
>     > Hello,
>     >
>     > Sorry about that, I'll be sure to select reply all next time.
>     >
>     > For some reason I am still getting nothing on the sudo i2cdetect unless I am doing something wrong, I have attached the command line results as a .txt
>     >
>     > I will add, I am unsure if this makes a difference but the touchscreen supports, and the tablet comes with a battery powered stylus, I am unsure if this feature of the touchscreen could cause any issues?
> 
>     Well that is weird. I'm not quite sure what is going on here...
> 
>     Do you know which driver the touchscreen uses under
>     Windows ? Maybe the manufacturer provides a separate
>     driver packages for the touchscreen for Windows ?
> 
>     Also I presume that the LCD panel of the tablet was
>     on during all these tests ?
> 
>     Sometimes the touchscreen gets turned on/off together
>     with the LCD panel ...
> 
>     Regards,
> 
>     Hans
> 
> 
> 
>     > On 19/03/2025 13:25, Hans de Goede wrote:
>     >> Hi Henry,
>     >>
>     >> Note I've added linux-input@vger.kernel.org back to the Cc,
>     >> please use reply-to-all to keep it in the Cc.
>     >>
>     >> On 18-Mar-25 11:26 PM, Henry Isaac wrote:
>     >>> Hello Hans
>     >>>
>     >>> Sorry for the delay, had an issue with Endevour so I reinstalled but this time just used the normal Arch ISO (Sorry if his complicates things) I followed all the steps again and the new ones to be safe.
>     >>>
>     >>> At the i2c_hid part of the file it just says address unavailable, I hope this helps!
>     >> Since the new dmesg was not send to the list, here are the 2 relevant
>     >> new messages after enabling i2c_hid.dyndbg:
>     >>
>     >> [    5.553115] drivers/hid/i2c-hid/i2c-hid-core.c: HID probe called for i2c 0x5d
>     >> [    5.553819] i2c_hid_acpi i2c-GXTP7386:00: nothing at this address: -121
>     >>
>     >> Henry, this means that either the touchscreen is not at that address,
>     >> or it is but it is not powered on.
>     >>
>     >> The ACPI tables describe 5 possible touchscreens, there is
>     >> a possibility that somehow the wrong one is selected by the BIOS.
>     >>
>     >> First lets try to see if there is a touchscreen at a different
>     >> i2c-address.
>     >>
>     >> All ACPI touchscreen descriptions use the same i2c controller,
>     >> so first of all lets find out which i2c-bus Linux has assigned
>     >> to that controller, please run:
>     >>
>     >> ls -l /sys/bus/i2c/devices/i2c-GXTP7386:00
>     >>
>     >> Here is the output of that run on the touchscreen of a laptop:
>     >>
>     >> lrwxrwxrwx. 1 root root 0 Mar 19 11:24 /sys/bus/i2c/devices/i2c-ELAN901C:00 -> ../../../devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN901C:00
>     >>
>     >> notice the "/i2c-1/" in the output, this indicates that the touchscreen
>     >> on that laptop is on bus 1. Now install i2c-tools (not sure what
>     >> the Arch pkg name is) and run e.g.:
>     >>
>     >> sudo modprobe i2c_dev
>     >> sudo i2cdetect -y -r 1
>     >>
>     >> replacing "1" with the bus-number you found.
>     >>
>     >> Here is example output from the same laptop:
>     >>
>     >>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     >> 00:                         -- -- -- -- -- -- -- --
>     >> 10: 10 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     >> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     >> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     >> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     >> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     >> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     >> 70: -- -- -- -- -- -- -- --
>     >>
>     >> This shows a single device on this bus at address 0x10.
>     >>
>     >> Maybe you will see a device here at address 0x10, 0x14,
>     >> 0x38, 0x40 or 0x5d .
>     >>
>     >> If you see a device at one of these addresses please
>     >> copy and paste the output in your next email and
>     >> then we will see from there.
>     >>
>     >> OTOH if you don't see a device at any of these addresses
>     >> lets try to see if we can power the touchscreen up by setting
>     >> its GPIO. According to the ACPI info GPIO-controller
>     >> GPO0 pin 0x3a (pin 58) is used for the touchscreen enable.
>     >>
>     >> First lets make sure that gpiochip0 matches GPO0,
>     >> install libgpiod-utils (Fedora pkg name) and run:
>     >>
>     >> sudo gpiodetect
>     >>
>     >> On your geminilake tablet I expect that to output
>     >> something like this:
>     >>
>     >> gpiochip0 [INT3453:00] (80 lines)
>     >> gpiochip1 [INT3453:01] (80 lines)
>     >> gpiochip2 [INT3453:02] (20 lines)
>     >> gpiochip3 [INT3453:03] (35 lines)
>     >>
>     >> The important thing here is that gpiochip0 is INT3453:00,
>     >> that may be different if there is some other GPIO chip
>     >> which got registered earlier.
>     >>
>     >> Assuming that gpiochip0 is INT3453:00 lets try to turn
>     >> the touchpad on:
>     >>
>     >> sudo gpioset -c gpiochip0 58=1
>     >>
>     >> (and then press Ctrl+C because gpioset keeps running
>     >> to hold ownership over the GPIO)
>     >>
>     >> and then re-run the i2cdetect:
>     >>
>     >> sudo i2cdetect -y -r 1
>     >>
>     >> again replacing "1" with the bus-number you found.
>     >>
>     >> Hopefully a device will show up now, if it does
>     >> please copy and paste the output in your next email.
>     >>
>     >> If there still is no device, then maybe the enable signal
>     >> is inverted, try running:
>     >>
>     >> sudo gpioset -c gpiochip0 58=0
>     >> (and then press Ctrl+C again)
>     >>
>     >> and re-run the i2cdetect:
>     >>
>     >> sudo i2cdetect -y -r 1
>     >>
>     >> Note if you do get a device found after running gpioset,
>     >> please also let me know if you got the device to show
>     >> up with 58=1 or with 58=0
>     >>
>     >> Regards,
>     >>
>     >> Hans
>     >>
>     >>
> 
> 


