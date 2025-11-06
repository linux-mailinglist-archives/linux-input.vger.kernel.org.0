Return-Path: <linux-input+bounces-15914-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14B6C3D33C
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 20:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080F53B4E6A
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 19:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6EB34FF74;
	Thu,  6 Nov 2025 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AWglvvoV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02060350D4E
	for <linux-input@vger.kernel.org>; Thu,  6 Nov 2025 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456257; cv=none; b=hxBsy/U6PeT1LyjP9+xzat+akXcvEuDOZOpg8pvdjWfXIhRQLJJnrGxRFpTcCLpNl7rIFC+5453XssDhy+47+1CrZheeDNBSO+BS72aw/qCZh7+lPp6GZpmuZV75UXyDnE+WAU1+PM+T5A/9EfsNDJm+d/qiIm9Fhs6Ui5beut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456257; c=relaxed/simple;
	bh=PiE1JSiDJcStD2RHibggWsPF9a17+Lt2FO8XirCeh+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIp39dxFSi7B5J0NvrnTdEhJWmVL5PByUuIU2Nw+zwK+szhGou1Yu6NuummcuRxrh9EowuZiVZ+oYDmv/Zl6ubPhHnu1dUhWPTkIKKJ/topClc1DdB9/3V2rl0Sxayv5TLWTZEtg3KXz2k/iuyKxB4Neg0CeOTdTLMEF7s8TbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AWglvvoV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640b1d0496aso1582a12.0
        for <linux-input@vger.kernel.org>; Thu, 06 Nov 2025 11:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762456254; x=1763061054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiE1JSiDJcStD2RHibggWsPF9a17+Lt2FO8XirCeh+U=;
        b=AWglvvoVoVeIKCfrIEOovf9MlWz8mNcffqoQ3nZcJST9WjhlZmOwDWjkQxuBZG63Cf
         Pwq1BojFwZThH4IwM6KgzvWVTumDB/m1uriPLvA6wRzXTibjN/8vqST2dBGwE1culyIp
         xY5HU8FtLqrVmM51GNoZ3zIXHul5QlAnLMBIdBzZ6Q1WkN3ju6cmWW32xaJjlEtNFzAI
         jG3xRpzES6Uno7LRwvoAQhMNgRA7isFgWKq3+J0VTojpZuGAtXMz/YDPbENXEbCC60aQ
         DHu4DTjbU61BLRirmuDWFIA3Z65cjgIU5IYQTY3VySWTAKY/xU3KKP5xAxfit2oSBXOp
         nHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456254; x=1763061054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PiE1JSiDJcStD2RHibggWsPF9a17+Lt2FO8XirCeh+U=;
        b=OGFbJHSQ8+2rRS0cuC0XOJywZPfIy6kgpKR+tKSuFHbhwKcza6Hdu2IQiXodiSrnh4
         QgTdU5N7Nc/L9+oxumNORXHQI5Bk4Ydk923SX04rGFxWexe+JOcz+iXtazYyOR6qo6GZ
         K04dvJVk2WwvPRcMLDsEXIdSoNJqOtZrmtc0usH+YnGB+rfjtv3YdF9T+MvWt8psSKmG
         bM+TAkb3vdqpEJFmP9NW+sCPR/S6HEpiFGG2Agg2fvqIEFCMc10a4rVTiPhLE+IJKRRJ
         tPH3zA1tdK0E5YAVcXkkxr8EGWu5pK8A45Zrw1Kv8uRkD5R/Nzv+bUW4glxprUGjC+Qv
         w9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnoAzj8p2wZAa4GBadnYHxAlDkKXWUtuJVtHTJFnJewbZ+UjBe0LejU5ScxhmfpMOpb/mPhHRhE4Bu2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4dFaIGDuR38dHrho4nub8OZz9+0bkAhCI1F6pokVnOmaVgU4
	ZYirBwOErnIUyVuCB9mr/eaMB082BabhiacOUH2LlCrFgZOTUnbzdzObqqbM/uRQCMBUSI7wwe1
	Q/7mE1seuaaZUBiA58i2Dbf6HrYKKKWOze5iZQ6ql
X-Gm-Gg: ASbGnctbOiDBeXgoEDMAgCEfG6FQaidGZz7h8TAOhnKum5Kxfn3f/X2a50pY6HjpRlp
	IByqFb18d0FGuWn5FVR9XnvMD/GXnrBElJlBab8ajg6lxu11lClYxxDelhPSC7uTfF83m6swnSH
	SAoBRy+qsd6XaTbC2UVXALBuuOPT/bQd1SaHGnHNVyCIimlgJpJNnTwKfEoO9mcM3CzYI2j6/gA
	xZbECzGw60DfHGe3DYU9/wC/t0NHp8fMpNKhGr9wSCx3qbTZYxdfCjN0qtXAuFrHyV6Ns9PgCh6
	7zgEqVJqCsxnnHNPLci+3fTWsg==
X-Google-Smtp-Source: AGHT+IESrQi4zDHvFSKZGD8SNhw5Go3/r7d3tFkShr/FCBXyRY3a4AWFaFCgegQDVZI3hGKzMyupQejYon8ZAVGwWLw=
X-Received: by 2002:a05:6402:5356:20b0:63c:1167:3a96 with SMTP id
 4fb4d7f45d1cf-6414094d3fcmr6748a12.5.1762456254141; Thu, 06 Nov 2025 11:10:54
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030160643.3775606-1-superm1@kernel.org> <s0qn1098-s856-1942-48q7-n3691sn109qs@xreary.bet>
 <17f02b01-c71e-4e2e-9e91-757731f3fc2e@kernel.org> <CAE_wzQ_YvCh8a83mm3QG7LwMWo2CKEAMvRS7+CpJcq1r7MEBZA@mail.gmail.com>
In-Reply-To: <CAE_wzQ_YvCh8a83mm3QG7LwMWo2CKEAMvRS7+CpJcq1r7MEBZA@mail.gmail.com>
From: Dmitry Torokhov <dtor@google.com>
Date: Thu, 6 Nov 2025 11:10:38 -0800
X-Gm-Features: AWmQ_bn_fHCNGopeTvxIgS00srGlULHbXcAAObDmo3uQDJPzpwTNSYOy0z6Pm7Q
Message-ID: <CAE_wzQ8U5mKgWvquM7BZeKcb4VxORK6DSaUsxoAnfZ9qQgHoRw@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-input: Extend Elan ignore battery quirk to USB
To: Hans de Goede <hansg@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, "Mario Limonciello (AMD)" <superm1@kernel.org>, mario.limonciello@amd.com, 
	bentiss@kernel.org, =?UTF-8?Q?Andr=C3=A9_Barata?= <andretiagob@protonmail.com>, 
	linux-input@vger.kernel.org, Kenneth Albanowski <kenalba@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 7:47=E2=80=AFAM Dmitry Torokhov <dtor@google.com> w=
rote:
>
> Hi Hans,
>
> On Fri, Oct 31, 2025 at 2:13=E2=80=AFAM Hans de Goede <hansg@kernel.org> =
wrote:
> >
> > Hi Jiri,
> >
> > On 31-Oct-25 10:07 AM, Jiri Kosina wrote:
> > > On Thu, 30 Oct 2025, Mario Limonciello (AMD) wrote:
> > >
> > >> USB Elan devices have the same problem as the I2C ones with a fake
> > >> battery device showing up.
> > >>
> > >> Reviewed-by: Hans de Goede <hansg@kernel.org>
> > >> Reported-by: Andr=C3=A9 Barata <andretiagob@protonmail.com>
> > >> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220722
> > >> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > >
> > > Now applied.
> > >
> > > We'll have to come up with something more sophisticated once/if Elan =
ever
> > > starts producing devices with real battery ...
> >
> > Actually the provided HID battery is intended to be for
> > when a stylus is used and to report the stylus battery
> > values then.
> >
> > There is an email thread somewhere with some of the ChromeOS folks
> > talking about dropping the ELAN quirk for I2C touchscreens and
> > indeed replacing it with something more sophisticated. IIRC
> > the ChromeOS folks mentioned they would work on / provide patches.
> >
> > +To: Dmitry, Dmitry do you have any input on the ChromeOs issue ?
>
> +Kenneth Albanowski has been wrangling with support of Elan and other
> vendor styli, I'll let him comment.

Kenneth is currently busy with some internal projects and asked me to
pass the following:

We recommend that userspace components do not generate alerts for
power supplies that report "status" as "unknown". For a lot of styli
we start with "unknown" and 0 level until after we get a first real
report and update the state to "discharging" or "full" and only hen we
may start showing the indicator.

On ChromeOS we also have tech for clarifying "1%" and other bad
reports, currently specific to USI styluses using a S/N filter.

Kenneth will try to share more details next week hopefully.

Thanks,
Dmitry

