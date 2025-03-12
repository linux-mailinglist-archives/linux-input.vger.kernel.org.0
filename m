Return-Path: <linux-input+bounces-10744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF5A5E1E2
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 17:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CBA23A1331
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 16:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2311D63C7;
	Wed, 12 Mar 2025 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDkUNrsm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760CB1D5176
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741797505; cv=none; b=OO4rkezK9i0fsMCo8C7xX4Y///VL1uj+EuInP9VS6JDBo60JeJGK7lELSIgs10hL0iwhJrVihkAOsfKut7e4FuycaEvCNyPuK60WcSbm5OYWrfM9UNwgbA1y0FU8KrfMrDOHxncznj6gyJYG2y2rb1y1V8GvIHVlstoDp25gp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741797505; c=relaxed/simple;
	bh=MYbPgsSSTbXHOKNCVsrBa+khgnS30trXHgGHOX7fpTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdwZuQwQo7MVY6gVxwYqSJp+d/PjcEYUJyC4SysGW2Oj7PafgW1JVBo6l/b5ubNnI4kxnP1TLjUFsWTLGTs/b+8to9BmVEP++9DAfaqJfKXJ5S1yPENZNVA6d1H/tZRGtmjn57JphkbcD18Bzxp5ASR0u8wU1XVBs78amZs0LWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDkUNrsm; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f47ed1f40dso53172837b3.1
        for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741797502; x=1742402302; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PWMvjqoG4PmYMkFhFnwSTfw/41lcy/Yf+MPMJe1avQs=;
        b=aDkUNrsmPPnjEHU8ld94Bmqx/26UVsUbIeCgdjjoKEFeZ1rHASokemDBciJ1fpgY40
         Hp1lB7Po1vfNCOWUH6jWnhGHRZ3QiANniHIxSVnXjMr0NlJh5L0yWpuhj5p6Cidkd/Ng
         eU2M7nc/Ef9A9T6FH87ctk4gz3n+SWO+WWYlNb59LKTQW50blOrE5O/1jbU5qxO9kI6s
         f5mNTM8RiYAq/pswWf9YK0Sr1MzJGwWGfxH94Syi9+B05JfUl/Lpx1Lf9IBCBaDE7kUr
         sSXJ1wTMEtpKUj+hJQqxwb733XWXD+sFtW3HJQQx1DSXVnvUNsFEfHwWy/tqW/Dlrn6e
         2uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741797502; x=1742402302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWMvjqoG4PmYMkFhFnwSTfw/41lcy/Yf+MPMJe1avQs=;
        b=I+o8ZvmMQiuKKr2W1psAgozHeLNuSYjLzW1JY3+LrJavURlVrLOV6U6tpUBznIr4Fw
         H+isdUy4PKu+jXwiu4zDtDP34vCnnoepdP+vbAQ3hxubi+RAHNVyozkSantbWeLYn8Wl
         j6ittehWATE3LCb8CH2h0E9fSbn9id5cbufpow0StwpweIlVavLXMpji68/ukOKz/I3z
         Y6REUVrei9/4cavMYImUwrkX0AbAu9HXJimCezana6z5vfGZM42VxEP0MLSW2T5NrHIo
         E3bjTgC7KTPF5BmEuGyAS9TAT7h19b3nPQDIaG+u2QCUWXd+9YMRtYoRwA+SETYz5hyc
         lfDw==
X-Gm-Message-State: AOJu0Yz1SkXYdW369efUM4g5XfyPAUU1/5EvMWPLAIOQG4w807/KLb/Y
	rf+HgoTPVS3xedEJTCzwafo3xBvHs7GcBiaxYH0V5sNq5Jk9exrCMRExMRrNCZpClEX056BK+Ql
	eQ+76+gXlkh0bRETZJxt94S85thOL6nerw1L4Ow==
X-Gm-Gg: ASbGncsDHF9unO13fzeZsCzJQZxFCWvEDluXyuP0ztfNJdKigoOPeaniQfJCZs0dGy4
	Dqn2m9T4k9an9aN95uBtEw1jY6f9xyojCn3CzZ0sgbtaEsZpOULcvWrL7LjbsmMEHfNHshPmcb9
	wjyKDpyDBZ/CMTyTL44zEbC35oAeY=
X-Google-Smtp-Source: AGHT+IF2xEFWCrikZfliJNB2lM4hSiQmPAiCSkA5sRBCIxHIv16c9jysGet7Q4HogxcW0/+3QeUV+C91qICnBumZxN8=
X-Received: by 2002:a05:690c:4a08:b0:6fb:b524:48bc with SMTP id
 00721157ae682-6febf3c50eamr309529367b3.35.1741797502400; Wed, 12 Mar 2025
 09:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306115021.797426-1-ulf.hansson@linaro.org> <Z8_Fgx4YWwdpB1XK@google.com>
In-Reply-To: <Z8_Fgx4YWwdpB1XK@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 17:37:46 +0100
X-Gm-Features: AQ5f1JoliOGPF-F0YWgpla13D9eZPFgX9P5KQ4-iPccTWglWP4z50wRhj4Ebo4g
Message-ID: <CAPDyKFqp0874O500j1StQgVyr_fQud6eJTqzQW_GqEj49Yt6bA@mail.gmail.com>
Subject: Re: [PATCH] Input: hisi_powerkey: Enable system-wakeup for s2idle
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 06:09, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Hi Ulf,
>
> On Thu, Mar 06, 2025 at 12:50:21PM +0100, Ulf Hansson wrote:
> > To wake up the system from s2idle when pressing the power-button, let's
> > convert from using pm_wakeup_event() to pm_wakeup_dev_event(), as it allows
> > us to specify the "hard" in-parameter, which needs to be set for s2idle.
>
> I was looking at pm_wakeup_event() and pm_wakeup_dev_event() and I am
> afraid I do not understand the distinction. Why would we want to
> abort suspend by only by some wakeup sources and not by others? And why
> does a driver need to know whether a system uses s2idle or some other
> implementation of low power state?

Good question!

In regards to waking up. The CPU that wakes up from suspend-to-idle
may actually decide to just go back to idle, without doing a full
system resume - unless there is a wakeup that requires the system to
resume.

In suspend-to-ram a wakeup will always trigger a full system resume.

In most cases a driver doesn't really need to distinguish between
these cases, yet the wakeup APIs are designed to allow it. That's the
reason why pm_system_wakeup() needs to be called (controlled by "hard"
in-parameter to pm_wakeup_dev_event()).

>
> FWIW we have Chromebooks that use S0ix and Chromebooks that use S3 as
> well as ARM Chromebooks and I do not think they use
> pm_wakeup_dev_event() variant.
>
> I'm cc-ing Rafael to give us some guidance.

Good, let's see if there is something I failed to explain.

>
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/input/misc/hisi_powerkey.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
> > index d3c293a95d32..d315017324d9 100644
> > --- a/drivers/input/misc/hisi_powerkey.c
> > +++ b/drivers/input/misc/hisi_powerkey.c
> > @@ -30,7 +30,7 @@ static irqreturn_t hi65xx_power_press_isr(int irq, void *q)
> >  {
> >       struct input_dev *input = q;
> >
> > -     pm_wakeup_event(input->dev.parent, MAX_HELD_TIME);
> > +     pm_wakeup_dev_event(input->dev.parent, MAX_HELD_TIME, true);
> >       input_report_key(input, KEY_POWER, 1);
> >       input_sync(input);
> >
> > --
> > 2.43.0
> >
>
> Thanks.
>
> --
> Dmitry

Kind regards
Uffe

