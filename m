Return-Path: <linux-input+bounces-1375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E1D83562A
	for <lists+linux-input@lfdr.de>; Sun, 21 Jan 2024 15:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2634A2821C4
	for <lists+linux-input@lfdr.de>; Sun, 21 Jan 2024 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C55374EC;
	Sun, 21 Jan 2024 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PGh8wUsG"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CAF3717D
	for <linux-input@vger.kernel.org>; Sun, 21 Jan 2024 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705847974; cv=none; b=i/3ULquImmWEVTOhEj6uu2r9IEdcZi5D1W6qWAE/bAqcTBfixyoVoB+dkrTmokjgCyQC6yCNW06Erg/1qkVtX/SHXV7XdAPcrksmzfnseAWYV2XSehnO3mJskuEOjboq3Nq/yFh8githKZ160MXmbhLAe61dt6p/y6rO7fyugQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705847974; c=relaxed/simple;
	bh=WPNSMifYsEXOyV0y7N1voCjLcd8T8PE8xewtQnv81gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+H+455+nfOSMMJWbfkoT49KvEaEVhQ09WU4YhSgw1fzFLl4kbnvFbEWWaOYj7vGiCSzEe1vL5fOusjVqRGMY8NfM2EIxWp9wciKefZ4Prh4nbUbsasVoNrv/qzjXr0SIbXM8UVHvrbJElK22UAYFYTBy9lYi3B6D+uB0iiIMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PGh8wUsG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705847971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGuA+kzxGPPLBUwgOuRhdYnF6wAZDujDr4dgpXU2wo0=;
	b=PGh8wUsGVE/5KfbnqwteK8ECny59iMJp3jmb5s7tH1S7hyH8Qz5ZTqG1TMUAVyIWpdW6Nf
	zUdLwkNc3MXE186539Fd/GLW+5+qeJza8bI82ohoke5e1DQLq5TPPoetn5l+qKyogf5zws
	nJueIAdke67uLj+ABtaRIIGlDb/GvTQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-N6tsSDkWNo-9lsPSG6vGWg-1; Sun, 21 Jan 2024 09:39:29 -0500
X-MC-Unique: N6tsSDkWNo-9lsPSG6vGWg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2ecf1de44fso72073366b.2
        for <linux-input@vger.kernel.org>; Sun, 21 Jan 2024 06:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705847968; x=1706452768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGuA+kzxGPPLBUwgOuRhdYnF6wAZDujDr4dgpXU2wo0=;
        b=QF8vsCeqrfO92hRDIip5xUre2GHAFkmxNw4D7raesxnazIZAJecrd5jAneEBpz2GgR
         fKYqabj2Try/N2Lw2RQLVoh/u+MqhihKPuFfhZyBxjeVJ4/cKyN9Z0ulIiQvsJLFnnLo
         QQ3Rpy6OfI6yQV4+SSeUGdT8WNFvT8c9TKKW9AlFMEBEGj06nHW8OYZpwrvoRb8YkF49
         WRbTeXU6aDLuOO0F4orp/mF6zhOkfd086Kt3M0NZyiab0VUVbEfdZwR/YZiImAd1Fsoq
         BZ0TEwYQ/VAdP4lAHZK9MonJEz4NZ2zEiHxgd796AHk5G6U0Q9T9F9dHT+kUF3UgAvoV
         wsNw==
X-Gm-Message-State: AOJu0YwrFF5hXpLUFOqNC3iDXslNCKmZzgij6ag1WucdOlu/ZzzNCXs2
	wr6WJlD8EAokOxekQ2SW6F/JaTB1hFr38YFaRnMJeQ6RHlSg3fAggWWBcxy/01K/5jFEzl/b+Dl
	LA02MWE2osnLS3iy6T8wuelST96n1dFOSNQMjZmo0Ggg83g2PoAohr/9gT69h
X-Received: by 2002:a17:906:7b82:b0:a2f:e18:fae3 with SMTP id s2-20020a1709067b8200b00a2f0e18fae3mr1421566ejo.41.1705847968070;
        Sun, 21 Jan 2024 06:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiDioSRGlpSzhS69cHuRvvDoJ/IoumA6Cmd6yusgVq3OSrViqDkb1/9mJIOh0K19HfIJJSqA==
X-Received: by 2002:a17:906:7b82:b0:a2f:e18:fae3 with SMTP id s2-20020a1709067b8200b00a2f0e18fae3mr1421561ejo.41.1705847967678;
        Sun, 21 Jan 2024 06:39:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a2ecec00a88sm5414771ejc.99.2024.01.21.06.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 06:39:27 -0800 (PST)
Message-ID: <55f73df1-c735-4cd5-8516-48cd18b23619@redhat.com>
Date: Sun, 21 Jan 2024 15:39:26 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PS/2 keyboard of laptop Dell XPS 13 9360 goes missing after S3
Content-Language: en-US, nl
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
 Dell.Client.Kernel@dell.com, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de>
 <f27b491c-2f1c-4e68-804c-24eeaa8d10de@redhat.com>
 <0b30c88a-6f0c-447f-a08e-29a2a0256c1b@molgen.mpg.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0b30c88a-6f0c-447f-a08e-29a2a0256c1b@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On 1/21/24 15:26, Paul Menzel wrote:
> Dear Hans,
> 
> 
> As always thank you very much for taking the time to reply.
> 
> 
> Am 20.01.24 um 21:26 schrieb Hans de Goede:
> 
>> On 1/18/24 13:57, Paul Menzel wrote:
>>> #regzbot introduced v6.6.11..v6.7
> 
>>> There seems to be a regression in Linux 6.7 on the Dell XPS 13 9360 (Intel i7-7500U).
>>>
>>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>>
>>> The PS/2 keyboard goes missing after S3 resume¹. The problem does not happen with Linux 6.6.11.
>>
>> Thank you for reporting this.
>>
>> Can you try adding "i8042.dumbkbd=1" to your kernel commandline?
>>
>> This should at least lead to the device not disappearing from
>>
>> "sudo libinput list-devices"
>>
>> The next question is if the keyboard will still actually
>> work after suspend/resume with "i8042.dumbkbd=1". If it
>> stays in the list, but no longer works then there is
>> a problem with the i8042 controller; or interrupt
>> delivery to the i8042 controller.
>>
>> If "i8042.dumbkbd=1" somehow fully fixes things, then I guess
>> my atkbd driver fix for other laptop keyboards is somehow
>> causing issues for yours.
> 
> Just a quick feedback, that booting with `i8042.dumbkbd=1` seems to fix the issue.
> 
>> If "i8042.dumbkbd=1" fully fixes things, can you try building
>> your own 6.7.0 kernel with commit 936e4d49ecbc:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=936e4d49ecbc8c404790504386e1422b599dec39
>>
>> reverted?
> 
> I am going to try that as soon as possible.

Ok, thank you.

I'm a bit surprised that my fix which skips sending
the getid command to the kbd during init would actually
cause this issue.

Can you retest with an unmodified 6.7.0 to make sure
that this was not some onetime glitch ?

Regards,

Hans





>>>      [    1.435071] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
>>>      [    1.435409] i8042: Warning: Keylock active
>>>      [    1.437624] serio: i8042 KBD port at 0x60,0x64 irq 1
>>>      [    1.437631] serio: i8042 AUX port at 0x60,0x64 irq 12
>>>      […]
>>>      [    1.439743] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
>>>
>>>      $ sudo libinput list-devices
>>>      […]
>>>      Device:           AT Translated Set 2 keyboard
>>>      Kernel:           /dev/input/event0
>>>      Group:            15
>>>      Seat:             seat0, default
>>>      Capabilities:     keyboard
>>>      Tap-to-click:     n/a
>>>      Tap-and-drag:     n/a
>>>      Tap drag lock:    n/a
>>>      Left-handed:      n/a
>>>      Nat.scrolling:    n/a
>>>      Middle emulation: n/a
>>>      Calibration:      n/a
>>>      Scroll methods:   none
>>>      Click methods:    none
>>>      Disable-w-typing: n/a
>>>      Disable-w-trackpointing: n/a
>>>      Accel profiles:   n/a
>>>      Rotation:         0.0
>>>
>>> `libinput list-devices` does not list the device after resuming
>>> from S3. Some of the function keys, like brightness and airplane
>>> mode keys, still work, as the events are probably transmitted over
>>> the embedded controller or some other mechanism. An external USB
>>> keyboard also still works.
>>>
>>> I haven’t had time to further analyze this, but wanted to report
>>> it. No idea
>>>
>>>
>>> Kind regards,
>>>
>>> Paul
>>>
>>>
>>> ¹ s2idle is not working correctly on the device, in the sense, that
>>> energy usage is very high in that state, and the full battery is at
>>> 20 % after leaving it for eight hours.
> 


