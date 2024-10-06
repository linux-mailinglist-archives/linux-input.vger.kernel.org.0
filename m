Return-Path: <linux-input+bounces-7102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2970991C6F
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 05:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89C2E1C2133D
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 03:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A8D14A0A4;
	Sun,  6 Oct 2024 03:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Vmu7Jt0W"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E251C01;
	Sun,  6 Oct 2024 03:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728186432; cv=none; b=D9YILm4QGRnjU61pXV4X1/avlaRR9t9qMy9GXqC9c/J6ooBPnqQfFfiOcpGhUVuhkZfWax+5VYWWSJG4yDOZ4VLut8jhl3vZnmdEEhkEG46G/f0Y2pdkl3CaKxji38IoHlB1OeYK96FN9T2mXZkQ5stKAVThw09dVopbaPPvQPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728186432; c=relaxed/simple;
	bh=FgUI5vIs7CPoln+/89pl/nBaWdv3Lqng894uL+niwD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaMXn3BsswTxa2Oq7dwUMSOQPCS91x1fX2Ycp/q5m3xyYLqOVjpU5W+5kNbW9aHzxsbWB4Q4+2h6lrQzImBPkUH9sBex5zWu6CBTbBI6q1UXcZKXQIbDnYS85qRo+eQyrMtoGPmKqZHD4IDTb2pwWaJ/W/nqotDNA120+5hH0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Vmu7Jt0W; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=p9cXIAoTIyIixdgGIeBS0WxofOTy2wq3A8SOEu93cYo=;
	t=1728186426; x=1728618426; b=Vmu7Jt0Wn3LuZ5phSBACw3pinV8UmDjYl4IKQWbT4YYj/AE
	1eoZkj8zF8movANRVutf1leQTAWIc5FMfB0FwLNJPuQ3qXFpoemwuet1rtBaOGDR7dGIgufT9I70x
	YhejjZQFjTJT2YzbtxYxz3qLawKyAPIB8Ufb1cvrtbO6AjPR5N2mxlFRlT7FmSlnpedDWSSt9zb/A
	qf6HGt8BqRRXkRT3vgOjRp9uqBwq649J8UrsOO4CtCIuqQFeFuyoHBBFvPvEKbTZ/Onn+kLw+4Kmn
	8+REez3YHqWj1lulDcbWuTug8cY2z3DBOtmHq1gWhnvIzpZ0BcTwCvEVsz9g5+1A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sxIEV-0003ZD-Pc; Sun, 06 Oct 2024 05:46:59 +0200
Message-ID: <5c666a9c-e10b-4eea-b2e7-3f781e177c19@leemhuis.info>
Date: Sun, 6 Oct 2024 05:46:59 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HID: i2c-hid: Touchpad not working on Thinkpad Z16
 Gen 2
To: Jose Fernandez <jose.fernandez@linux.dev>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Hans de Goede
 <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Johan Hovold <johan+linaro@kernel.org>, Nam Cao <namcao@linutronix.de>
Cc: linux-input@vger.kernel.org, regressions@lists.linux.dev
References: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728186426;d5262585;
X-HE-SMSGID: 1sxIEV-0003ZD-Pc

On 06.10.24 01:01, Jose Fernandez wrote:
> I'm using Fedora 40 with the vanilla kernel built from the 6.12-RC1 [1]. There
> is a regression that causes the touchpad to stop working on my Thinkpad Z16 Gen
> 2 (Sensil touchpad). dmesg shows this on 6.12-rc1 when filtering by `hid`:

Could you try latest git instead of rc1 if you haven't yet? E.g. the
latest packages from your "[1]". I wonder if this is
https://bugzilla.redhat.com/show_bug.cgi?id=2314756
which is fixed by a3f9a74d210bf5 ("Revert "Input: Add driver for PixArt
PS/2 touchpad"") [v6.12-rc1-post]
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a3f9a74d210bf5b80046a840d3e9949b5fe0a67c
).

Ciao, Thorsten

> [    0.134369] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.134370] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.134371] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.134372] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    1.214845] hid: raw HID events driver (C) Jiri Kosina
> [    1.214881] usbcore: registered new interface driver usbhid
> [    1.214882] usbhid: USB HID core driver
> 
> and this in 6.10.12 (touchpad working):
> 
> [    0.143812] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.143814] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.143815] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.143815] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    1.244550] hid: raw HID events driver (C) Jiri Kosina
> [    1.244588] usbcore: registered new interface driver usbhid
> [    1.244589] usbhid: USB HID core driver
> [    2.291822] hid-generic 0018:2C2F:0027.0001: input,hidraw0: I2C HID v1.00 Mouse [SNSL0027:00 2C2F:0027] on i2c-SNSL0027:00
> [    2.349966] hid-generic 0018:056A:5383.0002: input,hidraw0: I2C HID v1.00 Mouse [WACF2200:00 056A:5383] on i2c-WACF2200:00
> [    2.357724] hid-multitouch 0018:2C2F:0027.0001: input,hidraw1: I2C HID v1.00 Mouse [SNSL0027:00 2C2F:0027] on i2c-SNSL0027:00
> [    2.516529] wacom 0018:056A:5383.0002: hidraw0: I2C HID v1.00 Mouse [WACF2200:00 056A:5383] on i2c-WACF2200:00
> 
> The regression doesn't seem to be race-related. I've restarted and re-logged
> multiple times, and the issue reproduces consistently.
> 
> [1] https://copr.fedorainfracloud.org/coprs/g/kernel-vanilla/mainline-wo-mergew/
> 
> 


