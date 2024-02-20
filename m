Return-Path: <linux-input+bounces-1978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566385BAB0
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 12:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D116282088
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 11:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209AB664DA;
	Tue, 20 Feb 2024 11:36:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924BE664A5;
	Tue, 20 Feb 2024 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708428965; cv=none; b=UoBoFofmzOUR2u8VgGXq0Yr4BaS6KQj3CBAzc+Qj0X1t0IXC7Txg3v9QSxPilSROu4b1G4Nv62LyYtR6QfQrFI55sJCcaW9LPbGwdnJij/UfH9WUUd0ZLrm5mRe2aK/OsUXg/wGnMuVMXEQsXwVbTNaAlp+SwOIhmGlQYCkmBuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708428965; c=relaxed/simple;
	bh=qHcLJNWxTJQToh5G2HiZBIotoKh5+JiFDgH6sfVxauA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0cZidHApNZv30sfcTDX8AcEGNNy7Ftj8svgqsSTmByWk7Y5ij1DvClKFDKDB+r1zXwg20DCnmM5tnytrANjXwbVrVXAEcaF9XuChLA7STKvgQuuftUouBOw3p34HKkRwXchCI8+dFzVrG7a5Jk7JROyXskWzDEcSljzXRUblok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rcOPk-0000VS-3L; Tue, 20 Feb 2024 12:35:56 +0100
Message-ID: <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
Date: Tue, 20 Feb 2024 12:35:54 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>,
 Linux Stable Mailing List <stable@vger.kernel.org>
Cc: Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708428962;707a7236;
X-HE-SMSGID: 1rcOPk-0000VS-3L

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

Hi, Thorsten here, the Linux kernel's regression tracker.

On 16.02.24 12:51, Raphaël Halimi wrote:
> 
> (sorry for the long CC list, it looks quite long to me, but I tried to
> follow the issue reporting guide as closely as possible)
> 
> Since patches [1], [2] and [3] were applied to the kernel, there is a
> regression with Lenovo ThinkPad Compact USB Keyboard (old model, not II).
> 
> [1]
> https://github.com/torvalds/linux/commit/46a0a2c96f0f47628190f122c2e3d879e590bcbe
> [2]
> https://github.com/torvalds/linux/commit/2f2bd7cbd1d1548137b351040dc4e037d18cdfdc
> [3]
> https://github.com/torvalds/linux/commit/43527a0094c10dfbf0d5a2e7979395a38de3ff65
> 
> The regression is that a middle click is performed when releasing middle
> button after wheel emulation.

How did you identify these three commits? Or do you just suspect that
it's one of them?

And did you try to check which of the three is the actual culprit?
Either by reverting them on top of master or by checking the parent for
each of the commits (git show '2f2bd7cbd1d^' shows the parent for
2f2bd7cbd1d).

> The bug appears randomly, it can be after 5 minutes or 1 hour of
> keyboard usage, and can only be worked around by unplugging/re-plugging
> the keyboard. (I ended up resorting to simulate an unplug/replug, with a
> script which echoes 0 then 1 to /sys/bus/usb/devices/<id>/authorized,
> since I was afraid to damage the Micro-USB outlet by physically
> unplugging/re-plugging too much).
> 
> Those spurious clicks are very annoying, since they can open links in
> new tabs when scrolling in Firefox, or pasting text when scrolling in
> terminals, or other unwanted stuff.
> 
> I witnessed it with latest kernels (Debian unstable) as well as stable
> kernels (Debian 12 Bookworm, stable).
> 
> On Debian Stable, the last working kernel was 5.10.127, the regression
> appeared in 5.10.136 (i read all changelogs on kernel.org between those
> two releases but couldn't find anything about hid-lenovo, so I can't
> tell exactly in which release the regression appeared, Debian upgraded
> directly from .127 to .136).

Why not bisect between .127 and .136 then?

> I reported it in Debian [4], and apparently I'm not the only person
> suffering from it [5].
> 
> [4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#32
> [5] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#42
> 
> I would understand that such bugs would end up in a development kernel
> like the ones provided by Debian Unstable, but not with stable kernels
> like the ones provided by Debian Stable.

A bug report like yours can do the trick sometimes, as it might be
enough to ring a bell for one of the developers. But given that nobody
replied yet it looks like that is not the case. Then you most likely
will need to perform a bisection to identify the exact commit that broke
things.

FWIW, I'm currently working on a new document describing the bisection,
maybe it's of help for you:
https://www.leemhuis.info/files/misc/How%20to%20bisect%20a%20Linux%20kernel%20regression%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html

Ciao, Thorsten

P.S.: To be sure the issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced v5.10.127..v5.10.136
#regzbot title HID: lenovo: Lenovo ThinkPad Compact USB Keyboard
sometimes sends middle-click
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

