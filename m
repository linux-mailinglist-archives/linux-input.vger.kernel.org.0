Return-Path: <linux-input+bounces-8123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C4E9D0018
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 18:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9959BB22F13
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 17:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D0F22338;
	Sat, 16 Nov 2024 17:32:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207628172A
	for <linux-input@vger.kernel.org>; Sat, 16 Nov 2024 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731778326; cv=none; b=aEs+E2HHbhjmPMnknmUkzq/Xi1Lqa7L+p+4gdjNvmArSHaEDBDdS27NrthtSFj9pjQu8mC7kxkfg4wV2y+L9Ua14fLeKZsRqycriVkWC7CXIwm19kQVGgThugkOSPdmhKh4T/AJZXQWDJnvpKDC/u/0AfHbpoDbfmbj3IES3KNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731778326; c=relaxed/simple;
	bh=FIkUMQtzAsCH98rE/mt+PVg0U1VN4gEaC9x9wC62e1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVynjFuwZ6xHraCLL/HXIXF8Aan25DOT+kJPOkW8x0V8PPKRnB1hpKDn/Bc9/BTzQp4YyYIeuvIreS1y9fx91W/2rqddJ/bXN34usfEFSXEGMdegrtfXnLLqsfW4DVzjByPXQqzeGaJY9uUpGkee3ZPtPr/XXwWavbmeSg5O0v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dnsense.pub; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dnsense.pub
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b157c9ad12so191132185a.1
        for <linux-input@vger.kernel.org>; Sat, 16 Nov 2024 09:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731778324; x=1732383124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqdhPgfQpRpHIHpDqnH74WSGLYJEvfrRTSjVpjjnw9o=;
        b=JbacxaQvfVinr8UXpDAqPE28Uy3MyM5jy3dgdNuqMeSilxeTCVmktM6hiwb4P6SfOv
         XoA5r2w2SuescTXb25IhLP6boolTC2juSrcV61b1ADWhxqVA7pN0A5c3ElvBmOOzB6CL
         I7MXeA47TBAtc0H8LqYyz917opiS4R2MrjMNXN8a/pKlvtwepR+ncR3L2eD/fuHA63GH
         PpD7Rg2WGDL8EznrP0MOF1bIyUNqRtCznxmJTfUYz0vQngY1DnCTtFb4ZUTxN1k2Hj3V
         Of54QICM1b75xtmJCwiVyYfgqnyjP9FcLlDUuJfnZDMVKz8JEEt2fi9+KWwSBoBwKwEw
         jCRA==
X-Forwarded-Encrypted: i=1; AJvYcCUVn4H0Wi7zJEM3t1tlP/f1G6o5bFbCBnhXK6OWBFKFgCpWJlxVZKSoPCzTi7h5f4oDR0Kv0yip6qyIyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69ddoppIa8oSGANmprr3KtGr1p41a+hglM6LJLBKjfgjZg9jA
	Q4aeYtJncm/TRXy9usU8T8I2XV1JnwsYFtXh1x6X7Pktvon6Fipz
X-Google-Smtp-Source: AGHT+IE7KaHoG6OG6UBXrTTf5+tDhsAm1m9jqrjcMkvRdfiJbYh2Ay5EqxSYE8xZzkjIvWpVDVVx5g==
X-Received: by 2002:a05:620a:2495:b0:7ac:9c07:e90 with SMTP id af79cd13be357-7b3622c24d2mr743393485a.12.1731778323888;
        Sat, 16 Nov 2024 09:32:03 -0800 (PST)
Received: from [10.122.232.239] ([142.157.232.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b35ca63fb4sm278541685a.117.2024.11.16.09.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 09:32:03 -0800 (PST)
Message-ID: <9564a26c-37ec-4b5b-82ec-2b5153e1fe61@dnsense.pub>
Date: Sat, 16 Nov 2024 12:32:02 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: intel_ish_ipc: loader failure on Lunar Lake
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-input@vger.kernel.org
Cc: jikos@kernel.org, Zhang Lixu <lixu.zhang@intel.com>
References: <b74f8422-a7fb-4475-a1c8-383734449f91@dnsense.pub>
 <2d08e47f-ea9b-4d28-b345-36818eadf366@dnsense.pub>
 <88a8d5f06fdf181c320240d8439a5d5c2762a8a4.camel@linux.intel.com>
Content-Language: en-US
From: melvyn <melvyn2@dnsense.pub>
In-Reply-To: <88a8d5f06fdf181c320240d8439a5d5c2762a8a4.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This was correct, I missed the "ISH extension" driver on windows which 
provided a different ISH firmware. Loading it on linux renders these 
sensors fully working.

Unfortunately, I couldn't find any license information apart from the 
"INTEL PROPRIETARY" header in the INF file, which Samsung probably just 
left from the Intel-provided extension template; the firmware probably 
can't be upstreamed without vendor cooperation (unlikely here).

Thank you for the assistance!

-melvyn2

On 11/16/24 09:45, srinivas pandruvada wrote:
> Hi,
>
> + Lixu
>
> It is likely that Samsung needs their own firmware.
>
> Thanks,
> Srinivas
>
> On Fri, 2024-11-15 at 15:18 -0500, melvyn wrote:
>> Totally missed to CC the maintainers, sorry!
>>
>> -melvyn2
>>
>> On 11/7/24 21:42, melvyn wrote:
>>> Hello,
>>>
>>> The intel_ish_ipc driver seems to fail on my machine. It's a
>>> lunar-lake based convertible (samsung galaxy book5 ...) which
>>> should
>>> provide accelerometer/gyroscope/lid tild HID inputs. These work on
>>> Windows fully, but do not appear to work on 6.12rc5. All I have to
>>> go
>>> on are the following kernel log lines:
>>>
>>> ...
>>> [    4.416718] intel_ish_ipc 0000:00:12.0: ISH loader: load
>>> firmware:
>>> intel/ish/ish_lnlm.bin
>>> [    4.430675] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed
>>> 10
>>> [    4.448263] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed
>>> 10
>>> [    4.467844] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed
>>> 10
>>> ...
>>>
>>> The kernel is very close to mainline (NixOS's linux-testing) and
>>> doesn't seem to have any patches which would affect this driver
>>> specifically.
>>>
>>> If there's any further information I can collect please let me
>>> know.
>>> It's my first time trying to use a kernel mailing list, so
>>> apologies
>>> if this is the wrong place or I'm missing something else.
>>>
>>> Thank you,
>>>
>>> melvyn2

