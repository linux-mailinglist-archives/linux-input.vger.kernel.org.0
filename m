Return-Path: <linux-input+bounces-13948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C17EBB22A92
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 16:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD361AA3CBA
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB42629E0F8;
	Tue, 12 Aug 2025 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1U0UyAs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279CB28A3F8;
	Tue, 12 Aug 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008551; cv=none; b=qiLRp3DIgRTs3gJI1S7ZQEgjqhs6AW+j1b3ONBBnSJcxA3qJ7O+9BLqw+4DY3dh0XAWfUqvcl72OD60GnhrRt6kLDRTu9u3U3kIbaP/b5x7yOI7gWSqLF+tkp56YmuOxmsKNfT9gFbWACGJ5gX3tdDsP4cusMfAp31wSEm3I+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008551; c=relaxed/simple;
	bh=wvTzp8+AQYfzt3F6oGsyKg5JZ6dI0aeZv79Z3ja20yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACtzRQDMcyNtGp/iibz5ry3E2ga/xEPSB/vmLqaKIFOGHdKwLWq5AShgMIjeFFCKQMqLtoQEYhtPKYVPtqTRPeN73mw+u3XQdTY/EaSX9ZCGxWJwTslfRxa/4zDq9qSkDXJ95yaS/hoOk/H50CoiiVc1nimzPn1ukvJ8oxwM0BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1U0UyAs; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333ce76d5b0so16251631fa.2;
        Tue, 12 Aug 2025 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755008548; x=1755613348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcpKIbkkJ4pSqDu24V9dF5W5I5/jDQ9OW53xYwjzEUU=;
        b=A1U0UyAsIGxZ0eQV2+aSrMvY/UIO2gLHVeGRv/t7IBq66Ep2hKfon1KtWK+PUNSiij
         CPyVejvVTycveaWfQpLt1etOIZ5kMH6Tm9vQ6tUT5PRCqk2frDnga8E+U9l2vhAgVcWq
         UdV+DtWkJQBXOZNQLJeWQWWrDZD7dQO4mug1ESlzbwQFsDiP+0xJduoVZ7HSiQS41iHd
         pgQIx1TM2QUUu65m/EeDt9UDyxdyL6ENF6MFPoQR/mKzJh6TjDIhQrohiZlJ/3AJdZm1
         kMO6EdIy5JT+DgsLbOsp2ZczSjOBVERX8vMz8zzG46UT66K4EpepbHIZo5vHOKpZUZeZ
         2iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008548; x=1755613348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcpKIbkkJ4pSqDu24V9dF5W5I5/jDQ9OW53xYwjzEUU=;
        b=viLGSqMItWiRnKrckDELVB1yBVbYs4LwucItvtIc/pJ/5FfDCmT7eDjuSZwLiQGKYo
         8kLHGLVKrqh+onV351+e59jLSK37mUae0NmC9s5aRaz00ag6PTp6vVpNiB5Xl65k/Fcv
         5BXek+YgVXE0NEzu19PP8P3vI023T0ilOsiZDMg9RBcZmdzbgF2G7BnNghD7PiTsZ1tK
         jU6A18bZxmBJGc/+lybhnghZfUWayztOjoVKXPxLq8t+crrHOtP36wCg6E/FfjJ2av4g
         SSmxEmo85iVmjHXzxk4mkp9vGT0bPyYaredvGoCgNSor0gCTBCTwXWOw/totdbyNaBBZ
         bHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW62VWDIc9Jq1xOrlQyHLfvLK3i0KC9gywVKnz45WdlCbFGRYl16J7HqmK8TLcPJ1SYfqgXP1nya0hmTg==@vger.kernel.org, AJvYcCWjOOpZOa9tcB7OZcl7lLtOI7ONB1djNuvKknjyWXyd0sE6ZHpooNAcWYpQXCvcfiAiT7G6OiQKMWU2qMJA@vger.kernel.org, AJvYcCXocp8Zdos9JFFgwROgg5oAvt2rmGAo/tymRqmoRUBGx4sz66DhHatGKpD30gOgxbvgdpFa9SND@vger.kernel.org
X-Gm-Message-State: AOJu0YwSd+MPY1ZDh8hcNfhtgUQ+r2k3qtETCOku+bJ5kNJEwISwGYA6
	iFYCC1I91dix261pkoHOrNgUgoZQw3JHcWGridU1ap/Ft7Qv4PGob0SfBu/kteGM
X-Gm-Gg: ASbGncuKDW6J+QJrzabtVreEMo4jkHLXFCoWHnt7E2XVptOZSoo6wmq/zyGzNqBHly0
	peoeT72SejJ2ht54j82f6h1vRKRBvikCD+WnWNJWST0W8R8qFqWeC1pg7EYGH91pKoOmXlDGjMn
	3M3uwFmBlA6rv2RNoDOdDAdHMivW3qyLUKq0SbQbYC5uP6UKfG5Z+9o4+R3inoy/nMW3RUTihEO
	COIApRXmGm4TwDKOL9r8VzE6hmb0KPe0hJy89L1q6MhViYeJbRtPCwaT5QFU283BBlVC4F8dlzt
	lJyo/iojaPv939oIczsYarP6nEGeIvKuZMEeInHwUW2hh140AzTGrEZglgn3Zp2wOh5f1SZqdeG
	IEiKpKAT4UngINDVxOA==
X-Google-Smtp-Source: AGHT+IHKWoNPSuPfQkY2FlajET6OeeDqKV158/3+YMG2DH/8MFi/O/RkBlCFysKE+8wzMQ8EB8Slhg==
X-Received: by 2002:a05:651c:2123:b0:332:5b94:1b54 with SMTP id 38308e7fff4ca-333e52c78abmr11061fa.11.1755008547893;
        Tue, 12 Aug 2025 07:22:27 -0700 (PDT)
Received: from gmail.com ([185.209.199.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333b35f4d42sm13141361fa.37.2025.08.12.07.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:22:27 -0700 (PDT)
Date: Tue, 12 Aug 2025 15:22:19 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 RESEND] HID: multitouch: fix slab out-of-bounds access
 in mt_report_fixup()
Message-ID: <aJtOG7bqgC8wUxta@gmail.com>
References: <20250810180924.44582-1-qasdev00@gmail.com>
 <6o42n3q5-sq57-q7nq-rpn6-50np33r5ssqp@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6o42n3q5-sq57-q7nq-rpn6-50np33r5ssqp@xreary.bet>

On Tue, Aug 12, 2025 at 02:53:50PM +0200, Jiri Kosina wrote:
> On Sun, 10 Aug 2025, Qasim Ijaz wrote:
> 
> > A malicious HID device can trigger a slab out-of-bounds during
> > mt_report_fixup() by passing in report descriptor smaller than
> > 607 bytes. mt_report_fixup() attempts to patch byte offset 607
> > of the descriptor with 0x25 by first checking if byte offset
> > 607 is 0x15 however it lacks bounds checks to verify if the
> > descriptor is big enough before conducting this check. Fix
> > this bug by ensuring the descriptor size is at least 608
> > bytes before accessing it.
> > 
> > Below is the KASAN splat after the out of bounds access happens:
> > 
> > [   13.671954] ==================================================================
> > [   13.672667] BUG: KASAN: slab-out-of-bounds in mt_report_fixup+0x103/0x110
> > [   13.673297] Read of size 1 at addr ffff888103df39df by task kworker/0:1/10
> > [   13.673297]
> > [   13.673297] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-00005-gec5d573d83f4-dirty #3
> > [   13.673297] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/04
> > [   13.673297] Call Trace:
> > [   13.673297]  <TASK>
> > [   13.673297]  dump_stack_lvl+0x5f/0x80
> > [   13.673297]  print_report+0xd1/0x660
> > [   13.673297]  kasan_report+0xe5/0x120
> > [   13.673297]  __asan_report_load1_noabort+0x18/0x20
> > [   13.673297]  mt_report_fixup+0x103/0x110
> > [   13.673297]  hid_open_report+0x1ef/0x810
> > [   13.673297]  mt_probe+0x422/0x960
> > [   13.673297]  hid_device_probe+0x2e2/0x6f0
> > [   13.673297]  really_probe+0x1c6/0x6b0
> > [   13.673297]  __driver_probe_device+0x24f/0x310
> > [   13.673297]  driver_probe_device+0x4e/0x220
> > [   13.673297]  __device_attach_driver+0x169/0x320
> > [   13.673297]  bus_for_each_drv+0x11d/0x1b0
> > [   13.673297]  __device_attach+0x1b8/0x3e0
> > [   13.673297]  device_initial_probe+0x12/0x20
> > [   13.673297]  bus_probe_device+0x13d/0x180
> > [   13.673297]  device_add+0xe3a/0x1670
> > [   13.673297]  hid_add_device+0x31d/0xa40
> > [...]
> > 
> > Fixes: c8000deb6836 ("HID: multitouch: Add support for GT7868Q")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> > ---
> > v2:
> > - Simplify fix with a if-size check after discussion with Jiri Slaby
> > - Change explanation of bug to reflect inclusion of a if-size check
> 
> Applied to hid.git#for-6.17/upstream-fixes, thanks.
> 
Thanks Jiri. Would it also be possible to review this one:
<https://lore.kernel.org/all/20250810181041.44874-1-qasdev00@gmail.com/>,
I resent it but it probably got buried in your inbox.

Thanks,
Qasim
> -- 
> Jiri Kosina
> SUSE Labs
> 

