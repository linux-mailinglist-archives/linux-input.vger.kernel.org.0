Return-Path: <linux-input+bounces-14981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A6B91698
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 15:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C153A6E40
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 13:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9752D3720;
	Mon, 22 Sep 2025 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljBsVDgQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4E30DEA3;
	Mon, 22 Sep 2025 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758547964; cv=none; b=KAi6fOWXnJaRNZXxXLRa10QtUkzQww2sS0NX4gYTqrvxs0kVv3NFPLB2s2M2Ptse+45yPlbjNo99wjomBxo+iOvEzLnejDqoIw1hnExBYQ6nd6Wi/9oFG/B2xRilh8m1vJUpF6Awyt4ReQYXZpsXnN9t4pWq7OMhcAKeoGAYS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758547964; c=relaxed/simple;
	bh=CgD0LDOvRKAImBomzyORs0c8gU8JUpoVxd9ZVau31MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYiTNUWTUB0rH19FcLPD9gd1DM6STOB03ZTQ2tImkw+oZH/cy5BF258SJ1pKT9LFbHejQgTVpw+o1/eR/h95L61dfip6rR59shKvFlWkEHZ8XqOQcOV4xQMyPYTUIW8G7aUXvlPSqjRhyqJIbeULIm+kH8b0/DhVT70fqkzbtgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljBsVDgQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C47C4CEF0;
	Mon, 22 Sep 2025 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758547964;
	bh=CgD0LDOvRKAImBomzyORs0c8gU8JUpoVxd9ZVau31MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljBsVDgQK2ixds4KNlJf8YJIc/gXXiwqonIdavrPhn/u7yQ3OD6VPXfagv2gDd3+L
	 Go54UdTIdSt4Ce+qIaQg5KOR0+aFsSJ5x7oGTpT1UmWWTtkiHooe05aqH0fhUm+30o
	 4yzY2BdNNdEBrY7UN5O4uNue/LmC8+vsvte7FPAUSNuTAXp8V2Io0qxA4WxBFa77LB
	 qSRlhAOVyzQODnDUTsw6Adb3HFMP5ArvySFl3o9qXS1QmszePs6BR8waDgmc1YnBVS
	 9KTsvQZlj+8Vf7EpI66O+wgEsg++chtzWaLuOYGIm6J0y7+E5vJOa0iE43/Kbtq8w9
	 4KdgWn4N2mLOA==
Date: Mon, 22 Sep 2025 15:32:40 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Yinon Burgansky <yinonburgansky@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: Touchpad multitouch leaves ghost fingers
Message-ID: <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy>
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>

Hi,

On Sep 21 2025, Yinon Burgansky wrote:
> When using the touchpad with multi-finger gestures, ghost fingers sometimes
> remain.
> This is reproducible with `hid-replay hid-recorded.txt`: after the
> recording, two ghost fingers remain on the touchpad,
> so a subsequent single-finger tap is interpreted as a triple tap.
> Tapping with three or four fingers resets the device state.
> 
> I compared `hid-recorded.txt` to `evtest.txt` for the same events and it
> appears the problem occurs when the device sends a single HID report that
> changes the contact count from 3 -> 1,
> while the kernel's evdev stream removes only one contact (3 -> 2) instead
> of clearing the two removed contacts.
> The following are the exact events where the issue first appeared:
> 
> hid recorder:
> 
> ```
> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id: 0 | # | X: 792
> | Y: 378
> # | Confidence: 1 | Tip Switch: 1 | Contact Id: 1 | # | X: 564 | Y: 403
> # | Confidence: 1 | Tip Switch: 1 | Contact Id: 2 | # | X: 383 | Y: 542
> # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0 | Scan
> Time: 43407 | Contact Count: 3 | Button: 0 | #
> E: 000085.948315 30 03 03 18 03 7a 01 07 34 02 93 01 0b 7f 01 1e 02 00 00
> 00 00 00 00 00 00 00 00 8f a9 03 00
> # ReportID: 3 / Confidence: 1 | Tip Switch: 0 | Contact Id: 1 | # | X: 564
> | Y: 406
> # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0 | Scan
> Time: 43615 | Contact Count: 1 | Button: 0 | #
> E: 000085.960958 30 03 05 34 02 96 01 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 5f aa 01 00
> ```

Actually, this doesn't seem to be 3->1 but 3 ->0:
- first report has all 3 touches with "Tip Switch: 1" -> 3 touches
- second report has only one report of a touch with "Tip Switch: 0", so
	the kernel thinks only Contact Id 1 has been released.

What we are missing here is a common defect in some touchpad: "not seen
means up". And so we need the multitouch class
`MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU`.

And following the libinput report, it seems you already found this
yourself :)

Unfortunatelly, because your touchpad is an integrated one using I2C, we
can not dynamically assign this quirk at boot so testing will require
you to recompile the hid-multitouch module or inserting a HID-BPF
module.

I would lean toward providing a small HID-BPF program while the kernel
is being fixed as this will be a much quicker way of fixing it for you
(but the kernel will still need to be fixed).

How does that sound?

Cheers,
Benjamin

> 
> evtest:
> 
> ```
> Event: time 1758384424.367216, -------------- SYN_REPORT ------------
> Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> value 0
> Event: time 1758384424.380922, type 3 (EV_ABS), code 54
> (ABS_MT_POSITION_Y), value 378
> Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> value 1
> Event: time 1758384424.380922, type 3 (EV_ABS), code 53
> (ABS_MT_POSITION_X), value 564
> Event: time 1758384424.380922, type 3 (EV_ABS), code 54
> (ABS_MT_POSITION_Y), value 403
> Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> value 2
> Event: time 1758384424.380922, type 3 (EV_ABS), code 53
> (ABS_MT_POSITION_X), value 383
> Event: time 1758384424.380922, type 3 (EV_ABS), code 54
> (ABS_MT_POSITION_Y), value 542
> Event: time 1758384424.380922, type 3 (EV_ABS), code 1 (ABS_Y), value 378
> Event: time 1758384424.380922, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP),
> value 547800
> Event: time 1758384424.380922, -------------- SYN_REPORT ------------
> Event: time 1758384424.393487, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> value 1
> Event: time 1758384424.393487, type 3 (EV_ABS), code 57
> (ABS_MT_TRACKING_ID), value -1
> Event: time 1758384424.393487, type 1 (EV_KEY), code 333
> (BTN_TOOL_DOUBLETAP), value 1
> Event: time 1758384424.393487, type 1 (EV_KEY), code 334
> (BTN_TOOL_TRIPLETAP), value 0
> Event: time 1758384424.393487, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP),
> value 568600
> ```
> 
> This is an old issue (at least a year old) that I still encounter
> occasionally. I originally reported it downstream:
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/1194
> 
> ```
> uname -a
> Linux fedora 6.16.7-200.fc42.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Sep 11
> 17:46:54 UTC 2025 x86_64 GNU/Linux
> ```
> 
> Please let me know if you need anything else,
> Thank you!

