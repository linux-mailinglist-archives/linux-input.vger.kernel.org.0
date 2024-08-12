Return-Path: <linux-input+bounces-5516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219E94ED5C
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 14:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9001C218D3
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 12:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596D617B51B;
	Mon, 12 Aug 2024 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/O0qZZt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7554B17B511;
	Mon, 12 Aug 2024 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466969; cv=none; b=BOZ2FQ33EymQ0L7J7UiwOLEuXkYkblIkqd9ZTqF0ZOXYMRsyt1P7xFB7CjFW4mbOCfVyFW6UHdW8NqJilNyY6AYgR2y9EzYfEFOjIGltbOSV921wQKF9syweQp4rtpKz7svoelSJ6+P5pRUlw9nI9/HUnBAgAcsGdIp8DosDRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466969; c=relaxed/simple;
	bh=xmOz9i590euFwz5p9gjSvVKVVi3gHn+XMi00DX+IekU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bSnsT/B8KB3bpVJZyB4dbvvun/DeF+R6ErOs4cQBsO6+TfO8BrdXYUKHbo0lQVRkG7vwWa6sYV2hU4ej/AABTMO2Bz9D0oZqtYawaV7sMqH5hDwjdhy0pOd7FQaOJGvVdMBVNpJSZA0ZTifHkQrxYZSGEOulgGKUl+w/dtWOqWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/O0qZZt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5bb8e62570fso5136940a12.1;
        Mon, 12 Aug 2024 05:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723466966; x=1724071766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnXSsVi5+5db07Ed7AXNAmnMRne5oezIWy1P1aMFHkg=;
        b=g/O0qZZtsu2f1MktPKAt+i10BEMYCTtzAhKQCS3jxLaLPxLGhnneBnscrjOZAbmxpn
         t6npDiyCjqgcCMHVRokXsmcgQD99PkmMipWvb0ptqzsP/FAEKyvFROnUFiqW6pQmd1cL
         4nzXIRjOwQntLmEUV1OebwmAIeWU82/216SewLvfShYOCPUOdBpAhViQudB4wR+fqzAG
         D2OGA1qAvRF33MSE3lI+hzk5bPkf+v75tvW6w5D5+njdtLfffa0Ib0ZAtwjzWMuuoEzU
         ij7bsWv3ZkFn+4c2x6cvGi+aN0CFYsoGnDm7BZ/MhK86aq3XcWZCzF5SfrjdNGTT0Frf
         xHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723466966; x=1724071766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnXSsVi5+5db07Ed7AXNAmnMRne5oezIWy1P1aMFHkg=;
        b=VrgikKwyUTWxlMWRA7HuDSBX0bdxlNrdJ18QkzEmSn2F0ptnJSWOi2FyTJ6zdbYG3P
         v3mPWjgCUxvpDCzDSUTEcX+BK/FC0FomB2kL2NZvOXEYJjN92bxpw3epxs2qaFBvUGBr
         Uyxvk/X91tOXtzAJNMlXegmlff8DvRZV25wrHXTvHrs+GpFuizLK+OmSWZ9uf+VCU7es
         udf7OZy4QqsVmsS9uFGBOgpznZ0xdSpXaMBF1pc+LkPMXZR8l8Mj9/H7JG10rW0WumW6
         JCnQ/bNDI4uXuvErVLmSocSHchEXIbmcpON0s1C5O9bCEYG2JBATNH32JiqMGux8LrKC
         v+qg==
X-Forwarded-Encrypted: i=1; AJvYcCWa15B/sPiKP2Mow3wJu77SxzBnvyWG4GPjdU7+03TK3wkiqFzQmouYayhczngvO33WgXE26W7aaNhgQ+NZ8hrq//c0fS8tpeTaq3iwlRYxh9KQ1lepp4hMg+kfDhDxc0mv0DzW1vIbkGM=
X-Gm-Message-State: AOJu0YyyqVEkxktzUgaxm9AsmwihNwtL9zW7bROHXKa4++0X7eTDvQEt
	xjNyYaa9YZvNxvANMMkjviZVu3V8scWW1QdcKYtSI/xb3wt+Zhli
X-Google-Smtp-Source: AGHT+IGKKAcxPaNYnI9zez4PhxKh8E33NaWrrK64ImIeGcbyLlD9Xv6I2+jRbgq4yhhEqepiNQflow==
X-Received: by 2002:a05:6402:26c7:b0:5a3:3062:36c7 with SMTP id 4fb4d7f45d1cf-5bd44c0e442mr134017a12.7.1723466965207;
        Mon, 12 Aug 2024 05:49:25 -0700 (PDT)
Received: from [192.168.1.127] ([151.95.35.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd196a4badsm2064486a12.44.2024.08.12.05.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 05:49:24 -0700 (PDT)
Message-ID: <9c1663cb-e40b-4afd-b82c-0ecc939c4485@gmail.com>
Date: Mon, 12 Aug 2024 14:49:20 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
To: Antheas Kapenekakis <lkml@antheas.dev>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: luke@ljones.dev, bentiss@kernel.org, jikos@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAGwozwEg2TiQyB27qjHHz1kCHWXJhYsBhqLqq530Z2ZJQjFcRw@mail.gmail.com>
 <20240811231443.43986-1-derekjohn.clark@gmail.com>
 <CAGwozwFN6neJf2RGOR_e916KvpPWpsyKJd5pMcE+WoOS+M5o=Q@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwFN6neJf2RGOR_e916KvpPWpsyKJd5pMcE+WoOS+M5o=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/24 10:31, Antheas Kapenekakis wrote:
> Hi Derek and Denis,
> 
> Let us be civil. If I could have bug reported you I would have bug reported
> you. However, for some weird coincidence, I do not have access to the
> ShadowBlip bug tracker or the relevant communities. Nevertheless, this is
> not relevant public discussion. Let us refrain from this discussion further,
> including e.g., name-calling.
Hello,

First and foremost we have been civil, we vigorously stated the truth and
enriched this discussions with information and context you initially left out
(for reasons that at this point are very clear to everyone that has been reading)
and I can assure that we will remain civil as we are not going to make fools
out of ourselves.

We are discussing kernel drivers here, those userspace software are none of your
concerns as those are none of kernel maintainers concerns either. 

> 
> The MCU of the Ally is the embedded microcontroller that runs the RGB and the
> controller of the Ally. Therefore, the discussion of the MCU powersave and
> wake is relevant here. What is not proper is that I should also have replied
> to the original patch. I admitted that much in my original email. However,
> since you are now aware of it, I trust that you can block the patch for
> merging until you review it.
> 

The MCU powersave is a feature driven by the APCI interface and here we are discussing
an USB driver: there is absolutely no reasons to block this patch for a problem you
claim you have found (but never reported) in a totally different driver that even lives
in a totally different subsystem, so if you want those issue solved file the proper bug
report where it is relevant (not here).

> If the patch does not function under normal operation, this is relevant here.
> It means this extended patchset is built on reliance of the broken patch,
> which raises questions. Nevertheless, calling the patchset "experimental"
> is hearsay. Therefore, I will refer to it as ambitious from now on :).
> 

The patch does work under normal operation and it has been tested by many as stated already.

The device firmware performs the wake-up of the device and I don't
see any problem assuming the hardware works to submit a driver:
in fact this assumption is made by every kernel driver.

Again, you claim, without providing evidence, that the hardware is not properly waking up
when a certain ACPI attribute is set to one. Just set it to zero. Over these nine months
you had absolutely no problems is driving the hardware via acpi_call driver and tools
making SMU calls.

If you know a way that I can trigger this problem within my hardware
please, use the relevant mailing list reporting a bug so we can solve
it as we have solved other problems before.

Do not obstruct a fully working kernel driver for reasons unrelated to it.

>> This is 100% an issue with your software. I just completed an exhaustive
>> battery of testing at 8w STAPM/FPPT/SPPT on Quiet power profile with only
>> 2 cores active. The tests included using Steam by itself and the kernel
>> implementation, as well as running InputPlumber (which also has an
>> 80ms delay).
> > Please refrain from name-calling. I was very specific to say that the issue
> here is that under load when in a game, Steam will either let A leak through
> to the game or not respond, sporadically. While in Steam UI the combination
> always works, regardless of TDP. Since you did not test while in a game,
> this renders your test invalid.
> 

I have opened the overlay in game with no problems.

Why should we refrain from name-calling? You started this discussion with the
name of your own software, and in the kernel no anonymous contributions are
allowed either.

Plus, if steam (another userspace software) has a problem with combo keys
recognition and timing we are not entitled to solve that in a kernel driver anyway.

> To save you some additional invalid testing for the other issues: using
> ryzenadj on the Ally causes misbehavior, especially after suspend, where the
> TDP will reset. In addition, modifying SMP and core parking can freeze the
> Ally during suspend. Therefore, for further testing, I expect you to disable
> your "PowerStation" application and instead use the low-power platform
> profile, which is provided by asus-wmi, and is the vendor specific way for
> setting TDP on the Ally. Or use asusctl, which does the same.
> 

All of these information are given to you directly by us nine months ago,
while you were incorrectly driving the hardware via ryzenadj doing exactly
what we told you not to do, so you can expect we know this already.

Here you also make assumptions on how more than four people made their tests,
and while I don't speak for others I can ensure mine were done using the
firmware interface ASUS put in place and is exposed via asus-wmi platform driver:
the driver also in charge of handling the MCU powersave feature you are using as
an unreasonable point of arguments here.

In fact I have been telling you to use that interface for (ance again) more than nine months now,
and you only recently did so in your software because problems we told you were
going to manifest finally manifested, and you have been left with no other choice
but to use the proper way of driving the hardware in question. 

> As for using direct HID commands to program RGB, asusctl does the same,
> including many other userspace apps, and prior to this patchset there was
> no way to do different, so I do not see the problem here.
> 

There is no problem here: your software is driving the reported state inconsistent
with the hardware state and that's a you problem.

Our userspace tooling have been using what the kernel has been exposing, especially
Asusctl that is software written by the same person that contributes to said drivers
and is very well informed about other lkml discussion he partecipates.

> Best,
> Antheas

Best regards,
Denis

