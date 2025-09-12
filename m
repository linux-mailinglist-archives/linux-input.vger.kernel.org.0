Return-Path: <linux-input+bounces-14659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 306AAB5537C
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 17:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB3FAC67BA
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 15:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD06331283C;
	Fri, 12 Sep 2025 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnLdzByC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE76D30B527;
	Fri, 12 Sep 2025 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690886; cv=none; b=fK2MgVZkaBm6ggUnaEv4/AWZ9CWKp0HpsowokoNdsio638UYtyiFiYf7HIRMG4vHKDdBKx4t+eElCBXzpS+06kG/zgxN1L6MkSRocfqP0jnkdsoM/CjXPyTjkTIb6K7dBmMSGOqSXaHx0+as9kGU5WRmsZwOgAjvF9MXCTmhdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690886; c=relaxed/simple;
	bh=HJT2W/XLgduGOfKvUGYrXnc6PKzTr4R+1Hb+LsmTYSo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RssfxPslK3lldiE4tFu2FUBnADH0tKj0Ib/tvk9NuOcDxqYqcMcBwa/p7YdetI+qFZEcUIFEEuKbvLBnw5+pcq6QUgL8iGyoDD2byi6AdxY1HWkJeBgvBhNz0c1TDj048GK12GP4l1wMYOZjVk0bFoooaT8e54xxC9QsULOvzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnLdzByC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79D0C4CEF9;
	Fri, 12 Sep 2025 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757690886;
	bh=HJT2W/XLgduGOfKvUGYrXnc6PKzTr4R+1Hb+LsmTYSo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tnLdzByCPjTlW5RQ+LYGPdcEcICs9RUF+50bhNZRfHpfNdEw5pCdyV57X19DRYOcm
	 uvSJl1eS4KGc2BClJccYLOMbVcWC+8wygAdyI1pEgcvAE5mpkiuwt/KEe+25GYMc8m
	 NnH0Bjk1VLXKZoosdATyuWJdbHPuzFlaJGrXt8l4SxpYTzoi2NGp+OcRBQPDVdCJU9
	 ye09wGGOIER3xqsDj+O457SyXljR4Tu63dbVBLFx0FGfOOHTZOS7+OyosomHyBkZhL
	 4Dncj8KRgx5enRt9c3zymLvzThwSZFnjpyowtTIVfabNG9aKPErqncbPkLKVBNzUjq
	 e5w9uLg8BatrQ==
Date: Fri, 12 Sep 2025 17:28:03 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Jonathan Denose <jdenose@google.com>, Jonathan Corbet <corbet@lwn.net>, 
    Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
    Angela Czubak <aczubak@google.com>, Sean O'Brien <seobrien@google.com>, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH v3 00/11] HID: Implement haptic touchpad support
In-Reply-To: <vyhhm3x6nfdfw6gbgluq3sjr6bzamhear7nec6xdi5wfxq7wcz@cx2egj4yr5sp>
Message-ID: <4267074p-78q9-54p9-8q43-2ro1n03259os@xreary.bet>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com> <CAMCVhVOUn-un9N_Bv00RVJ7kAw1O+AHgAHOzSGM6UuMBZVdtYw@mail.gmail.com> <vyhhm3x6nfdfw6gbgluq3sjr6bzamhear7nec6xdi5wfxq7wcz@cx2egj4yr5sp>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Sep 2025, Benjamin Tissoires wrote:

> > > Angela Czubak (11):
> > >       HID: add haptics page defines
> > >       Input: add FF_HAPTIC effect type
> > >       Input: add INPUT_PROP_HAPTIC_TOUCHPAD
> > >       HID: haptic: introduce hid_haptic_device
> > >       HID: input: allow mapping of haptic output
> > >       HID: haptic: initialize haptic device
> > >       HID: input: calculate resolution for pressure
> > >       HID: haptic: add functions handling events
> > >       Input: MT - add INPUT_MT_TOTAL_FORCE flags
> > >       HID: haptic: add hid_haptic_switch_mode
> > >       HID: multitouch: add haptic multitouch support
> > >
> > >  Documentation/input/event-codes.rst    |  14 +
> > >  drivers/hid/Kconfig                    |  11 +
> > >  drivers/hid/Makefile                   |   1 +
> > >  drivers/hid/hid-haptic.c               | 580 +++++++++++++++++++++++++++++++++
> > >  drivers/hid/hid-haptic.h               | 127 ++++++++
> > >  drivers/hid/hid-input.c                |  18 +-
> > >  drivers/hid/hid-multitouch.c           |  47 +++
> > >  drivers/input/input-mt.c               |  14 +-
> > >  include/linux/hid.h                    |  29 ++
> > >  include/linux/input/mt.h               |   1 +
> > >  include/uapi/linux/input-event-codes.h |   1 +
> > >  include/uapi/linux/input.h             |  22 +-
> > >  12 files changed, 858 insertions(+), 7 deletions(-)
> > > ---
> > > base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> > > change-id: 20250625-support-forcepads-0b4f74fd3d0a
> > >
> > > Best regards,
> > > --
> > > Jonathan Denose <jdenose@google.com>
> > >
> > Hi all,
> > 
> > Please let me know if there is anything else needed from me.
> > 
> 
> Dmitry, I've just re-reviewed and tested this series. I'm fine with it.
> Can you give us your ack on the input bits?

Dmitry, did you have time to review the input bits, please?

Thanks,

-- 
Jiri Kosina
SUSE Labs


