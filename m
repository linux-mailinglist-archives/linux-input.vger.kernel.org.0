Return-Path: <linux-input+bounces-6420-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223F1974577
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 00:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F8C28BE5C
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 22:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFB21AB507;
	Tue, 10 Sep 2024 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="7F1haajD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10CB1AB539
	for <linux-input@vger.kernel.org>; Tue, 10 Sep 2024 22:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726006457; cv=none; b=XcSD+LvtcMhJWVmcNLGJxVCOXyjlb3CTZa2dYsEC7bi4hM0FmxiFxWWz33nk2tXPTDO1hpgdMgrHs2o75WSunnjtMMSunNm8kP/qSrVO9JrYqewtedvnJApIxg7UcuWLs4Foey4OyaAR8FJM7A356Akpep+74zWoS71NPFNlcaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726006457; c=relaxed/simple;
	bh=1a2231xdtyNjo+6HUa+LmpPcnHe1CRip2KlCx8aAwYU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=US9ZNp2lFZU6Uuuc9Bpe2g835UmbEje+MdXU0++r3xbwlMU1dU1Hw6KeNfZuioxBKedCNcbL5SCzaA/TH4r1ISgfb4CuntcI8Tl5SIbTLnC6TMi0LN8k6A8ahOBi+SZRJ28yhcFwpHwUMPL6EbgRWPiHc18Drh9Y+ZOwG+unm40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=7F1haajD; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BEEB15615F6;
	Wed, 11 Sep 2024 01:07:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1726006040;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=GQnZ5MbXQPglVsDZClpURVJsTOFWYFkXFshBS6r6TMQ=;
	b=7F1haajDle8wzbTgsFjGpCSU0ijiAcrkGpxSKfUHxkRDdWtyQ2N6K2+rT7Q+RGMS0lg2TV
	WS+WCCvj6xOts05TzpK+vpX79yRK+Q13hlrsiCPtHpVpXqIPKnOB+tpV8/nxh49MKzOIT9
	Ha0CqJYbiVp2pcP3dG74+xTXTkEE/JnXMX7ljzR9myG1rIarPiZqjApZxcQ6054fW6bfww
	tI0+wu22HRnA1gY31uX5hZb4/Z7QcCnKZK9ZJR7HJ+ekClVp8ivZy1Xwm4KOAJF5fS7sp3
	TXZDHzwiA89XbQfiNqCxAcy9Wqf5YGTO+fBWsCx0cdesGC4iAhBbSV2XG3fp0g==
Message-ID: <8e4a1afd-f82c-4262-b05b-ff5a1c18bee6@valdikss.org.ru>
Date: Wed, 11 Sep 2024 01:07:08 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: ValdikSS <iam@valdikss.org.ru>
Subject: Re: hid-lenovo breaks middle mouse button on tpIIkbd
To: Harald Welte <laforge@gnumonks.org>
Cc: linux-input@vger.kernel.org
References: <Ztwoai8_1L0rJkYp@nataraja>
Content-Language: ru, en-US
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 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
 OEcVmRU/pw5/zoQyQg==
In-Reply-To: <Ztwoai8_1L0rJkYp@nataraja>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 07.09.2024 13:18, Harald Welte wrote:
> Dear ValdikSS,
> Dear Linux Input maintainers,

Hello Harald,
Nice to meet you, I know you from Osmocom project!

You found a REGRESSION (and not in hid_lenovo)! Look below.

> The keyboard has a small slider swithc to select between Android and
> Windows mode.  I've set it to "windows" mode, but couldn't observe any
> difference in the bug in both modes.

You need to use Windows mode only. Android mode does not have all the 
capabilities.

> The keyboard shows up as /sys/kernel/debug/hid/0005:17EF:60E1.000F

Same for me.

> 
> == btmon
> 
> * the events are visible on bluetooth with "BTMON". Middle mouse button
>    press+release looks like this:
> 
>> ACL Data RX: Handle 10 flags 0x02 dlen 11
>        ATT: Handle Value Notification (0x1b) len 6
>          Handle: 0x001c
>            Data[4]: 04000000
>> ACL Data RX: Handle 10 flags 0x02 dlen 11
>        ATT: Handle Value Notification (0x1b) len 6
>          Handle: 0x001c
>            Data[4]: 00000000

Hrm, these events are generated when the keyboard is not in "native" 
mode (when the kernel module is not loaded for example).

Here's what the middle button should generate in "native" mode (over 
Bluetooth):

> ACL Data RX: Handle 2048 flags 0x02 dlen 15
       ATT: Handle Value Notification (0x1b) len 10
         Handle: 0x0024
           Data[8]: 0004020000000000
> ACL Data RX: Handle 2048 flags 0x02 dlen 15
       ATT: Handle Value Notification (0x1b) len 10
         Handle: 0x0024
           Data[8]: 0000020000000000


But you're right, something does not work correctly.

The keyboard correctly enters native mode only after pairing or full 
Bluetooth reloading. Middle button does not work for me if the keyboard 
is just disconnected or powered off/on.

This seems to be because Bluetooth layer does not disconnect the input 
device upon disconnecting Bluetooth, and reconnecting the keyboard just 
"resumes" the input device, but does not re-initialize it properly. You 
can see that by not-lid left LED indicator (ESC button). It should be 
lid by default if initialized properly.

I haven't thoroughly used the keyboard for about a year, and last time I 
used it, I don't remember such issue.

Just booted up Fedora 39 from ISO (not updated, release from November 
2023) on 2 of my computers, and yes, it works correctly: the keyboard is 
detected as new input device (in dmesg) on every power off/power on 
cycle, and initialized correctly every time, middle button works.

Fedora 40 ISO (from 15 Apr 2024) — does not work, power off/power on 
results in broken middle button, keyboard is NOT detected as new input 
device in dmesg upon off/on (it "resumes" old input device).

Known good configuration from Fedora 39:
kernel 6.5.6
bluez 5.69

Known bad configuration from Fedora 40:
kernel 6.8.5
bluez 5.73

Old Fedora 39 doesn't ever detect the keyboard as "bluez-hog-device", 
maybe that could be the clue.
All I can say is that lenovo_hid is not the culprit — I tried to use my 
old module and it doesn't work on a new system either.

I don't have much time to run bisect right now, sorry.

