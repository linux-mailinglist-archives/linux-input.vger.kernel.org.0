Return-Path: <linux-input+bounces-1377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7958359F1
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 05:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B6D1F21252
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 04:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03B71C2E;
	Mon, 22 Jan 2024 04:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGvx8dyg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD91C2D
	for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 04:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705896204; cv=none; b=GQPUf1xKWlD5kgyKrI6lhKcn+zwsxWL1KD2yGt8IJad/wuHN3eqRTuEqBXfN7yU6zJ2Fa7r6nO8IUxegsQo+aYj8Zkp5TcIGBdO61IkonmCh6HxnOMSX3cvtOpVvnQKiSJveW4Sqa98uLsALmLaSUkV7OJndj6MaeosNuWSyMSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705896204; c=relaxed/simple;
	bh=UIZZM0JbqkOEbpL4hh9/Vq4fgVMsNrPMp/slWC7oAOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvD+p0GnTQ1qkAdqb+SjklHuNsmXnbS5x68bau96QGh75ipInrsDyWtG9PUXzk14fU/8xsHE0rhCv8od3o2z41XkpZj7YfecgJIpLnUhB3dp7muwiz/ctc0dGeFhD8w0GQc3DGZJbV8NglUf9s6AObdFgDTh9F0KSvRBLeBgICE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGvx8dyg; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5cf87cdc4c5so2201026a12.1
        for <linux-input@vger.kernel.org>; Sun, 21 Jan 2024 20:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705896202; x=1706501002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/aPvU/8Bid01l62DrdzYx1Ls0wvMFy2XAx9v1jGKg4=;
        b=gGvx8dyghG3L8aaEJV05HvLleXHWPQWgnpEJ+JpQoWTgDZpyTUhsxhz53d42yFbPjE
         Sci11+WxNmg8QB6r6sjE/Oex5oiZyMmprjo1jV984u08SuPeGS3f9n0mPXRalrAvfqIS
         HB1jVL6D+vq+J/uUYNI/ComtPnk8xTGZu478y01cfBbeRuPQ+2CnDjq1q+o0nWSQdxCX
         HUiM2PM4kMOc3LvkiqZpwxaqIUHn+3qbsLlAgwPxZwCERpkOjJVp5i1ufS85lXfLiobm
         3TG7aXMs3y0EjdGz+i+0VBS6Y4bQ7HqFyX76Yfl4+dhKgzvfJVLtRgAwCIEjqesVq/XR
         MstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705896202; x=1706501002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/aPvU/8Bid01l62DrdzYx1Ls0wvMFy2XAx9v1jGKg4=;
        b=Ye/KqrQTYQUNtmzWBZcg6SiV9NKPZ/1vrtvUg2e16oqK2nbCncQct8ZmqrgN560ncV
         vKgm6BnIv4ncLzD3Jwdl3aJKk/ZwmHI8hJIGewkBQ45pEnBX3sbePCWaV7Miegljynuy
         TzkmEY2mBuLBRH/9Sdz89j68POG9CdpVK5phEwbrSa/lQsvJoOWVM7f95S9ggb3apSmj
         Hk0rCfW+dNDKNaucPDiXKROj4Q8IOiu4k95kukVUHgNFKz7BG6HLiuG2oX4631o/sjva
         3Ryop77Clla9LMd0XEsUtzTMmtSWxooHSav5iQ+dUKG3/EcJlQgG5NcGpox4G9WTNFMv
         WaEQ==
X-Gm-Message-State: AOJu0YwWV2EBm7/QswXdoDQahnPXDqIPVK3+hyvjVcLgboBvL4ZJADqo
	wBYsxNu9nqt7gqhbYzdlgmqrDjP86XZ+PGHyAPlQOJFtZsG67Ppc
X-Google-Smtp-Source: AGHT+IGOEAng/qwWKPF1khoCyrbaI0EqQg1dZulZQY2gvrGAX985X6SFfLbndsqw4PS9kr2JlPcR0g==
X-Received: by 2002:a05:6a21:3391:b0:199:fe49:8ff9 with SMTP id yy17-20020a056a21339100b00199fe498ff9mr4604426pzb.2.1705896202357;
        Sun, 21 Jan 2024 20:03:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bfc:f713:b3b:5e6c])
        by smtp.gmail.com with ESMTPSA id fi33-20020a056a0039a100b006d9aa6592d0sm8682386pfb.82.2024.01.21.20.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 20:03:21 -0800 (PST)
Date: Sun, 21 Jan 2024 20:03:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: uinput - Allow uinput_request_submit wait
 interrupting
Message-ID: <Za3pB5_n0udgD4d1@google.com>
References: <20231207063406.556770-1-vi@endrift.com>
 <20231207063406.556770-2-vi@endrift.com>
 <ZXNvQCFxPoH0-i-P@google.com>
 <b54584c2-9db8-4715-966a-6fdf57fdee1a@endrift.com>
 <853baa9e-1c76-4e61-b1f6-a1155ccb5dd7@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <853baa9e-1c76-4e61-b1f6-a1155ccb5dd7@endrift.com>

Hi Vicki,

On Thu, Dec 14, 2023 at 07:04:09PM -0800, Vicki Pfau wrote:
> Hi Dmitry
> 
> On 12/8/23 19:24, Vicki Pfau wrote:
> > Hi Dmitry,
> > 
> > On 12/8/23 11:32, Dmitry Torokhov wrote:
> >> Hi Vicki,
> >>
> >> On Wed, Dec 06, 2023 at 10:34:05PM -0800, Vicki Pfau wrote:
> >>> Currently, uinput_request_submit will only fail if the request wait times out.
> >>> However, in other places this wait is interruptable, and in this specific
> >>> location it can lead to issues, such as causing system suspend to hang until
> >>> the request times out.
> >>
> >> Could you please explain how a sleeping process can cause suspend to
> >> hang?
> > 
> > While I'm not 100% sure how it happens, given I found this by
> > reproducing it before I came up with a theory for why it happened,
> > my guess is that as it's trying to suspend all of userspace
> > programs, it suspends the process that owns the uinput handle, so it
> > can't continue to service requests, while the other process hangs in
> > the uninterruptable call, blocking suspend for 30 seconds until the
> > call times out.
> > 
> >>
> >>> Since the timeout is so long, this can cause the
> >>> appearance of a total system freeze. Making the wait interruptable resolves
> >>> this and possibly further issues.
> >>
> >> I think you are trying to find a justification too hard and it does not
> >> make sense, however I agree that allowing to kill the process issuing
> >> the request without waiting for the timeout to expire if the other side
> >> is stuck might be desirable.
> > 
> > This isn't reaching. As I said above, I discovered the patched line
> > of code *after* observing suspend hanging for 30 seconds while
> > trying to reproduce another bug. I wrote this patch, retested, and
> > found that it now suspended immediately, leading to a visible
> > -ERESTARTSYS in strace on coming back from suspend.
> > 

I must apologize, you indeed weren't reaching. As far as I can see,
putting tasks into the freezer (which happens during system suspend) is
done via delivering a fake signal to the task. So the task indeed needs
to be in an interruptible state, uninterruptible tasks result in system
failing to suspend.

> > I can post the reproduction case somewhere, but the test program is
> > only the evdev client end, with the uinput side being Steam, which I
> > don't have source code for.
> > 
> >>
> >> I think the best way to use wait_for_completion_killable_timeout()
> >> so that stray signals do not disturb userspace, but the processes can
> >> still be terminated.
> > 
> > There's already a mutex_lock_interruptable in uinput_request_send
> > that could cause this to fall back to userspace under similar
> > circumstances. The only difference I can find, which is admittedly a
> > bug in this patch now that I look at it again, is that
> > uinput_dev_event would get called twice, leading to the request
> > getting duplicated.
> 
> After further investigation, it seems this would still be the case
> even if the request times out--an invalid request would get left in
> the buffer, which means that while this is a new way to trigger the
> issue, it's not actually a new issue.

No, I disagree that it is the same issue. The timeout condition is
pretty much fatal, I expect the caller to exit or stop using the device
if request times out (because either the real device is not responding,
or userspace is not responding, and there is no indication that they
will start responding any time soon). That is why the timeout value is
so generous (30 seconds). In this case we definitely not expect the
request to be re-submitted, either automatically, or explicitly by
userspace.

If we make waiting on the request interruptible we may get interrupted
by a stray signal, and I do not know how both producer (the process
issuing the uinput request) and consumer of the request, will react to
essentially duplicate requests being sent.

I believe we can split this into 2 separate issues:

1. The fact that it is not possible terminate the producer process while
it is waiting for request to be handled (for 30 seconds). I think this
can be safely resolved by switching to
wait_for_completion_killable_timeout(). This will allow fatal signals to
break the wait, and for the process to exit.

2. Producer task failing to enter refrigerator and breaking suspend.
I wonder if the best way to handle that is for uinput to create and
register wakeup source, and then use __pm_stay_awake() and __pm_relax()
to indicate to the rest of the system that suspend is blocked. I believe
userspace should be able to handle this and repeat suspend attempt when
the condition clears...

Rafael, do you have any suggestions here? And I wonder, could we make
killable tasks also enter refrigerator?


Also, now that I think about it more, we should not use slot number for
request->id, as I expect the common situation is to have 1 outstanding
request, so all requests have id 0. Instead we should have a counter and
increase it. This way timeout handling will be more robust, we will not
mistake delayed response to the previous request as response to the
current one.

Thanks.

-- 
Dmitry

