Return-Path: <linux-input+bounces-1981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBB85C371
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 19:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9B51C20D5E
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 18:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE77379920;
	Tue, 20 Feb 2024 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oza1j5RQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E293D78B63;
	Tue, 20 Feb 2024 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708452730; cv=none; b=CcMLdVmaSQccdYqaaK7sW84t05Y0Hn2qw7IbGQrR3sy7bSRphZ7RZcdwjEW16AZlkmZWdGoCP+capGuam5nt4XY9A9QzhJg60Izbjhas8K/v+yK/ScfLGwZ0Nte5zIwjkYg30RamzWn9B6M2kIiE3xdW0zosqrMEg2YxWolwh2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708452730; c=relaxed/simple;
	bh=K4Pg2ukWWO9VgdQeMinN/m7rs4wCWBDd0u5fathmfgM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ny5F97dmW0/kvIhaMAivJDuWRsUc8Znt8oLhe+/eNF26L6fUHiNFKUcrXbE6nrSZiphrlbG5SA8oZJvAOnx54mxlRnqS40znuVZ4Q8p4zn7N6qra7z25Zgz7O5xicnSv91CloWdTdZcJORksF7wsuwCqi1Ab/S/Ob/xR6KyYlN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oza1j5RQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d6fe64a9bso656355f8f.0;
        Tue, 20 Feb 2024 10:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708452727; x=1709057527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cx6laXczgEnaoQTUR4D8qlYDX1ToRaSpNxIMxiJrew4=;
        b=Oza1j5RQhngT/yKG/0fN3pO4tPxOKqr03J7QJYnUFT7yNe8ENj0+xFRwLe7aeYXn6b
         FJ3TYXMmOEsWsuVq/8VA9KjfnMVjRHEWC3bUNvps2Ch4OmSGXnLf2ikKeHGZ10zvlnPv
         MbBEt6G5Wm16ihVtKt636wTRQty+RZknGRQKrjdhJTh3VedhFL6LVGsA9odE8mMFhSxR
         WGvuh/F2FPLl0CUrNDnQ+xzyHTyOby6RrXUgaJIqKIjUlKgPpyjWgiOeqNBDo3NfBHkP
         vjEB7iwXm7IJ2jZBeTu3gg67lPeGp7UnUcB2qouwu0KhjGmZQVk4buw/akSchB+4AL4j
         QmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708452727; x=1709057527;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cx6laXczgEnaoQTUR4D8qlYDX1ToRaSpNxIMxiJrew4=;
        b=kUZsIX22YuHO/Ek7pUNhvMV/qL8v1vaJAaYxc/AEsYg5ySl4WW1DHBK0I1+q0hLXC/
         Zy6kNPBkt7Ct93AHG2JQqF5ga3LrCUN4MqXnp7XvEQ5yyFXlcbT/6DJuY/yQ9N3J+IIw
         LoANA73R4ZdUZ804kMdtKjiPunyHiOKC6HDbvcksjwOih3gLAaAmA81NS+o3uE90YhCM
         u3Se3ntQROKgpeAjMHKJ2p75iAUxO/5fx0IO3vnaT/kq7rShzWhok+IyXXviv15Qcz4W
         3/6/PPHRWuLg+8YTXbQEcKhsVx1h32lMMCb3qCNTldaHF6i7cAX2A8WkNR/cX5q8TI7P
         8UIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWprq+P13MsWtIV6Hi+R6BCWJPM7K12b+LRO4S0DNkomvy/mvkFtAx/xmcvwaOiPYNg3VZox55lhscsk09NpSwSTe9KKowqTY4z4k2kR7jasyhmgkdTXixnk5Xr9/xNyZ8jKno=
X-Gm-Message-State: AOJu0YzqMviqlKJQC863M5Jw1Jua8MK0KymuBhu27pY2MbV+GtKSLBRz
	etSt48UIWV0n0gewRnvU44ODTohwsbA1377M9pyPMREkavrEdYs7
X-Google-Smtp-Source: AGHT+IEnj5STeqAnpBo732KVTQcITKGLCyco89kcAdtWrY01nn8u9AnHown+reJHgBoTeA2Nsro8dA==
X-Received: by 2002:a5d:660e:0:b0:33c:f9d6:fb20 with SMTP id n14-20020a5d660e000000b0033cf9d6fb20mr12318593wru.45.1708452727034;
        Tue, 20 Feb 2024 10:12:07 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:befe:8ded:1f46:cf9a? ([2a01:e34:ec5f:c111:befe:8ded:1f46:cf9a])
        by smtp.gmail.com with ESMTPSA id k35-20020a05600c1ca300b00410cfc34260sm16013966wms.2.2024.02.20.10.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 10:12:06 -0800 (PST)
Message-ID: <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
Date: Tue, 20 Feb 2024 19:12:04 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
Content-Language: fr-FR, en-US
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/02/2024 à 12:35, Thorsten Leemhuis a écrit :
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> Hi, Thorsten here, the Linux kernel's regression tracker.

Hi, thanks for replying (even if I find your tone a bit harsh, but I 
don't blame you - and since English is not my native language, maybe I'm 
mistaking).

>> [1]
>> https://github.com/torvalds/linux/commit/46a0a2c96f0f47628190f122c2e3d879e590bcbe
>> [2]
>> https://github.com/torvalds/linux/commit/2f2bd7cbd1d1548137b351040dc4e037d18cdfdc
>> [3]
>> https://github.com/torvalds/linux/commit/43527a0094c10dfbf0d5a2e7979395a38de3ff65
>>
>> The regression is that a middle click is performed when releasing middle
>> button after wheel emulation.
> 
> How did you identify these three commits? Or do you just suspect that
> it's one of them?

No, I didn't "just suspect" that it was one of them. I may not be a 
kernel developer but I'm an experienced sysadmin (25+ years). So please 
stop taking users for idiots.

First, I compared the three machines I used which have a keyboard with a 
TrackPoint: my desktop at home (external "Lenovo ThinkPad Compact 
Keyboard with TrackPoint" (not II, not Bluetooth), Debian unstable (I'm 
a DM), my desktop at work (same keyboard, Debian Stable) and my personal 
laptop (ThinkPad X270, internal keyboard, Debian Stable but with backports).

The machine at work had a 5.10 kernel at the time, and the other ones 
had a 6.6, but only the machines with an external keyboard exhibited the 
spurious middle-clicks. So I compared the loaded HID drivers, and 
noticed that both of them had hid_lenovo loaded, whereas the laptop did not.

Confident that I probably pinpointed the faulty driver, I simply looked 
at the file history on Github, and saw that those three commits were 
dated from after the time when the bug appeared ; moreover, the comments 
did mention stuff related to wheel emulation and spurious middle-clicks.

So, no, I didn't "just suspected" that they were responsible, but I hope 
you'll admit my method was sound, and that my conclusion is a pretty 
strong (to not say "almost certain") probability.

> And did you try to check which of the three is the actual culprit?
> Either by reverting them on top of master or by checking the parent for
> each of the commits (git show '2f2bd7cbd1d^' shows the parent for
> 2f2bd7cbd1d).

I admit I didn't. I didn't compile my own kernels for ages. I used to do 
it in the past, but I came to trust Debian's kernels and rely on the 
maintainers' work. But read below.

>> On Debian Stable, the last working kernel was 5.10.127, the regression
>> appeared in 5.10.136 (i read all changelogs on kernel.org between those
>> two releases but couldn't find anything about hid-lenovo, so I can't
>> tell exactly in which release the regression appeared, Debian upgraded
>> directly from .127 to .136).
> 
> Why not bisect between .127 and .136 then?

I heard of that term before (and I understand the mathematical meaning 
of it), but I never did it with a Git tree. I read the guide you 
mentioned below, but it seems much too complicated and too long to me 
for just verifying if those three commits are indeed the cause of the 
regression (which I'm almost sure of, as stated above).

So in the meantime, I decided to follow my hunch and recompile only the 
hid_lenovo module (following the guide at [6], updating it slightly by 
manually removing kernel signing options in .config, since I obviously 
don't have Debian's signing keys, and replacing "make 
SUBDIRS=drivers/..." with "make M=..." as suggested by make), after 
un-applying those three patches in reverse order.

[6] https://askubuntu.com/a/338403/387067

The HID modules built successfully, and after copying my modified 
hid-lenovo.ko to /usr/lib/modules/6.6.15-amd64/updates/ and running 
'depmod -a', the module loaded fine with Debian's kernel (I don't use 
Secure Boot on this machine).

I'll let a few days pass (remember, the bug doesn't happen immediately 
but only after a varying amount of time) and I'll report here if the 
spurious middle-clicks happened again or not.

Notes:

1/ Thank you for (indirectly) giving me this idea. Maybe this relatively 
simple procedure should be made available somewhere on Debian's wiki 
(instead of an outdated, but still useful, answer on AskUbuntu).

2/ Please note that I did it only for unstable kernel; unfortunately, I 
can't do the same for the stable kernel, since I don't have access to my 
  machine at work anymore (my freelance contract ended one week ago) and 
I don't have any other machine at home exhibiting this bug. So I won't 
be able to test it on a stable kernel.

>> I reported it in Debian [4], and apparently I'm not the only person
>> suffering from it [5].
>>
>> [4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#32
>> [5] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#42
>>
>> I would understand that such bugs would end up in a development kernel
>> like the ones provided by Debian Unstable, but not with stable kernels
>> like the ones provided by Debian Stable.
> 
> A bug report like yours can do the trick sometimes, as it might be
> enough to ring a bell for one of the developers. But given that nobody
> replied yet it looks like that is not the case. Then you most likely
> will need to perform a bisection to identify the exact commit that broke
> things.

Nobody amongst the developers, yes, I'll give you that. But the comment 
I linked from the Debian BTS, plus another bug report I found in the 
Input mailing list [7], show that I'm not the only user complaining from 
the recent regressions.

[7] 
https://lore.kernel.org/linux-input/CACSVgagaEHO2zoYQ8zDBrMT9OvT8R5B_h3dxfZuLQFAUBtKMmQ@mail.gmail.com

Regards,

-- 
Raphaël Halimi

