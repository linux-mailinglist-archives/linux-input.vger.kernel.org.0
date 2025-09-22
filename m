Return-Path: <linux-input+bounces-14985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D13B924EC
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 18:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FB821889FF2
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 16:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A098931158C;
	Mon, 22 Sep 2025 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ks4itAs7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866030DD0C;
	Mon, 22 Sep 2025 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758559878; cv=none; b=RVGm9NY2tYVgBP66imfmeJmG692b+n6D2cqYPaqYbqsnLo4OJAZXJEqWyVft7gM+1JT/cFv3k4PjUKmpw4ICjZAweVwC5uIEtYnAkYTkIBhSbGG/Sc2HllgPqj6BTcmBuo2ZGOtifTJ0H7ToBdQgi2AgK19iM1lkW0Igx/6k2gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758559878; c=relaxed/simple;
	bh=wromW/7MJy80bawhhRtBGXV4DjkVdUaZawSuqapQwco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXALQjM5T0kNyvW6qVK5FQXRc4jENr4S9FdZXDCMbu7UEjBoNMmbcaY3qia6QCDoyL2IpPNL9jioZsJk07MGPTKqZ6Oc3jRGNoeyimOMrEYZPgns354B1LubDbWisGNGEiNxfmMyDo1DaS+hWYYJXjv+oah/HypeTbVwqofz/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ks4itAs7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE40CC4CEF0;
	Mon, 22 Sep 2025 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758559876;
	bh=wromW/7MJy80bawhhRtBGXV4DjkVdUaZawSuqapQwco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ks4itAs7WZOL0esfwkp+GTYKS2VqXeR7zT+4rijef7Ex6XiocbijGAfbGKZo62yC0
	 EdPdful70oc9ysUFkVhORoPnmdwxnjQzF7gDdv6s2MqgHeA5F+L4fhGmSEyicf8NDS
	 YgoqxsqBSdcK2IoSsGhE/NFvxrxhZbkbN1y9vmbGaguVL3MESXdn2NXM6YnSbhAXIr
	 rZ3+djV0ez3LRo2MDp/hnkRzbd0HD7V/WGHXLOb0XBLPD4yViOCiFoiGZmHWdo4pXM
	 4gJYtMTMpVtpl1FFiXJ8+HNy5tCIc3H6jKBA9rTfvem3KCjK5saaXAWU3Ty6HxrWR6
	 NlavCYHbN15Gg==
Date: Mon, 22 Sep 2025 18:51:13 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Yinon Burgansky <yinonburgansky@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: Touchpad multitouch leaves ghost fingers
Message-ID: <c3plpgl2zsx4do2odwdeowodkkdnfqpexlwqg5a5mckyibxlge@qai35f5yeswy>
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
 <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy>
 <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
 <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com>

On Sep 22 2025, Yinon Burgansky wrote:
> Hi Benjamin,
> 
> Thank you for the quick and detailed response. The solution sounds
> great! It will take me some time to learn how to code, build, and
> compile HID-BPF on my machine and figure it out. If you can provide me
> with additional guidance to speed up the process, I would greatly
> appreciate it!

Well, I was meaning that I would provide a HID-BPF MR ready to install
for you. But if you want to play with it, feel free to do so :)

For a jump start on HID-BPF:
https://libevdev.pages.freedesktop.org/udev-hid-bpf/tutorial.html

The advantage of HID-BPF is that we can drop the file in the filesystem
and then forget about it.

> 
> If it is a common issue, as you suggested, having public instructions
> to refer to would also be very helpful for others running into the
> same issue (e.g. the other 2 users from the libinput issue).

Yeah, once we get the MR out, we need to update the libinput bug.

My plan is to have the HID-BPF detect whether the quirk has been applied
or not and would gracefully remove itself once the kernel is fixed.

Cheers,
Benjamin

PS: please try to refrain from top-posting your reply. The usage is to
inline your reply or reply below, and there are docs that explain why.
You might get angry answers from people on the LKML if you top post :/

> 
> Thanks,
> Yinon
> 
> On Mon, Sep 22, 2025 at 7:11 PM Yinon Burgansky
> <yinonburgansky@gmail.com> wrote:
> >
> > Hi Benjamin,
> >
> > Thank you for the quick and detailed response. The solution sounds great! It will take me some time to learn how to code, build, and compile HID-BPF on my machine and figure it out. If you can provide me with additional guidance to speed up the process, I would greatly appreciate it!
> >
> > If it is a common issue, as you suggested, having instructions to refer to would also be very helpful for others running into the same issue (e.g. the other 2 users from the libinput issue).
> >
> > Thanks,
> > Yinon
> >
> >
> > On Mon, Sep 22, 2025 at 4:32 PM Benjamin Tissoires <bentiss@kernel.org> wrote:
> >>
> >> Hi,
> >>
> >> On Sep 21 2025, Yinon Burgansky wrote:
> >> > When using the touchpad with multi-finger gestures, ghost fingers sometimes
> >> > remain.
> >> > This is reproducible with `hid-replay hid-recorded.txt`: after the
> >> > recording, two ghost fingers remain on the touchpad,
> >> > so a subsequent single-finger tap is interpreted as a triple tap.
> >> > Tapping with three or four fingers resets the device state.
> >> >
> >> > I compared `hid-recorded.txt` to `evtest.txt` for the same events and it
> >> > appears the problem occurs when the device sends a single HID report that
> >> > changes the contact count from 3 -> 1,
> >> > while the kernel's evdev stream removes only one contact (3 -> 2) instead
> >> > of clearing the two removed contacts.
> >> > The following are the exact events where the issue first appeared:
> >> >
> >> > hid recorder:
> >> >
> >> > ```
> >> > # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id: 0 | # | X: 792
> >> > | Y: 378
> >> > # | Confidence: 1 | Tip Switch: 1 | Contact Id: 1 | # | X: 564 | Y: 403
> >> > # | Confidence: 1 | Tip Switch: 1 | Contact Id: 2 | # | X: 383 | Y: 542
> >> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> >> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0 | Scan
> >> > Time: 43407 | Contact Count: 3 | Button: 0 | #
> >> > E: 000085.948315 30 03 03 18 03 7a 01 07 34 02 93 01 0b 7f 01 1e 02 00 00
> >> > 00 00 00 00 00 00 00 00 8f a9 03 00
> >> > # ReportID: 3 / Confidence: 1 | Tip Switch: 0 | Contact Id: 1 | # | X: 564
> >> > | Y: 406
> >> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> >> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> >> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0
> >> > # | Confidence: 0 | Tip Switch: 0 | Contact Id: 0 | # | X: 0 | Y: 0 | Scan
> >> > Time: 43615 | Contact Count: 1 | Button: 0 | #
> >> > E: 000085.960958 30 03 05 34 02 96 01 00 00 00 00 00 00 00 00 00 00 00 00
> >> > 00 00 00 00 00 00 00 00 5f aa 01 00
> >> > ```
> >>
> >> Actually, this doesn't seem to be 3->1 but 3 ->0:
> >> - first report has all 3 touches with "Tip Switch: 1" -> 3 touches
> >> - second report has only one report of a touch with "Tip Switch: 0", so
> >>         the kernel thinks only Contact Id 1 has been released.
> >>
> >> What we are missing here is a common defect in some touchpad: "not seen
> >> means up". And so we need the multitouch class
> >> `MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU`.
> >>
> >> And following the libinput report, it seems you already found this
> >> yourself :)
> >>
> >> Unfortunatelly, because your touchpad is an integrated one using I2C, we
> >> can not dynamically assign this quirk at boot so testing will require
> >> you to recompile the hid-multitouch module or inserting a HID-BPF
> >> module.
> >>
> >> I would lean toward providing a small HID-BPF program while the kernel
> >> is being fixed as this will be a much quicker way of fixing it for you
> >> (but the kernel will still need to be fixed).
> >>
> >> How does that sound?
> >>
> >> Cheers,
> >> Benjamin
> >>
> >> >
> >> > evtest:
> >> >
> >> > ```
> >> > Event: time 1758384424.367216, -------------- SYN_REPORT ------------
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> >> > value 0
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 54
> >> > (ABS_MT_POSITION_Y), value 378
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> >> > value 1
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 53
> >> > (ABS_MT_POSITION_X), value 564
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 54
> >> > (ABS_MT_POSITION_Y), value 403
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> >> > value 2
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 53
> >> > (ABS_MT_POSITION_X), value 383
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 54
> >> > (ABS_MT_POSITION_Y), value 542
> >> > Event: time 1758384424.380922, type 3 (EV_ABS), code 1 (ABS_Y), value 378
> >> > Event: time 1758384424.380922, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP),
> >> > value 547800
> >> > Event: time 1758384424.380922, -------------- SYN_REPORT ------------
> >> > Event: time 1758384424.393487, type 3 (EV_ABS), code 47 (ABS_MT_SLOT),
> >> > value 1
> >> > Event: time 1758384424.393487, type 3 (EV_ABS), code 57
> >> > (ABS_MT_TRACKING_ID), value -1
> >> > Event: time 1758384424.393487, type 1 (EV_KEY), code 333
> >> > (BTN_TOOL_DOUBLETAP), value 1
> >> > Event: time 1758384424.393487, type 1 (EV_KEY), code 334
> >> > (BTN_TOOL_TRIPLETAP), value 0
> >> > Event: time 1758384424.393487, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP),
> >> > value 568600
> >> > ```
> >> >
> >> > This is an old issue (at least a year old) that I still encounter
> >> > occasionally. I originally reported it downstream:
> >> > https://gitlab.freedesktop.org/libinput/libinput/-/issues/1194
> >> >
> >> > ```
> >> > uname -a
> >> > Linux fedora 6.16.7-200.fc42.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Sep 11
> >> > 17:46:54 UTC 2025 x86_64 GNU/Linux
> >> > ```
> >> >
> >> > Please let me know if you need anything else,
> >> > Thank you!

