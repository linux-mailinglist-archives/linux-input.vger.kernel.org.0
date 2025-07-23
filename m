Return-Path: <linux-input+bounces-13657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9DB0E990
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 06:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7001A54711E
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 04:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07DE20FAB4;
	Wed, 23 Jul 2025 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUIE1sE6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4848E2AD32;
	Wed, 23 Jul 2025 04:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753244465; cv=none; b=Qa+jqVILDB3ZtRdvxoUJLsQOoFaIcJFxiRDitiALuP3nvvWjMqGB4x53+KYlZgoKl2eCOccg9nmuqvjYlgJUgZX0Y82lSMbrCoKY1f0VU4l86YU+khKqMgqVIjuRBUUDB9Tur5ytSL5Xhl7D8gOXqKNP8ynxT7brk7p6s6pKJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753244465; c=relaxed/simple;
	bh=EoF6OFrEqWTgKOYLKgUsL4jSlvHXgxgW1CAaWNfIaBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbpI/17A3dD3PKncV0NraSSCdM8O6Gtbe/XN13oup02nqoymJng9HPkB8gXud1qmeU/0u7quF9x9hH8fjrDYwWZ5lCLB3vCnXSw3aCYUFZAX26ixWaCLAIcUNKI21+buPViuDaBPocAfHGaupLmMiHNpdP8q2utRsRpF4FTWNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUIE1sE6; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so47870406d6.0;
        Tue, 22 Jul 2025 21:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753244463; x=1753849263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnSoeE82WIAXnzmVCGZ0YCIY5bJ46g6NHyFKV4Yr2Oo=;
        b=bUIE1sE6MeVL5BtOhokRBUPHCzDlpYVSzM0Hpf1k2d/Fqrhyxnb+fsehOMVSgIZV6k
         eh/9ya+8AqCsn0BiQkGrglYl8TbGch/N+Ei8fZSWPVFVmCYSQu2nE8y/22R8hEybyHl2
         sEWwDTMJ/jt3kEssqn/++axXz+M8+WnDaUh497WC1xJqscD31nLnuDib1THavZysRf8+
         jAQEM1gstCVabY84WhKhIDIwAN6ZapentcEYxEYsLBvqbeFlnMU80TSPzDVqHsmGqxmf
         pZXXu3zYxmp3qMnBt1oIT9EEarcvHqFKHgwDGxWqw26pz7yyMuUPtahimi7R2VIwDNdS
         7bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753244463; x=1753849263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnSoeE82WIAXnzmVCGZ0YCIY5bJ46g6NHyFKV4Yr2Oo=;
        b=HICMP3Aqb/WLdDv0tCGtmAtL1dOo0YzJ0nPosnwABTMmnNuYvCAV1G5qWinSrEuNUF
         Yvgn1r7Olkvlhmd1dFvPG9WUMPEx4eVRYVutcfSq/0GSa10K3TsZGkARYEiYOQj23D1q
         69014wC9SQ791T1jrqfO0aoHHfs7GDtDr7DtchsRMDsMi1vXmYk5r7WROMaxC3d0s5XL
         InYrZK78SBsKIzC4mI7VKU7kSRjpkjAkXh+g8LV3H7E2dxqEmgY8zUCv5XBTltNi5WOU
         P1YLX1BMFR8/8CW6sxulzZW/+UsCpIVl+GjYG5qs+zmTByCO1gffjfQhQSxgzUUoKbp/
         5bnw==
X-Forwarded-Encrypted: i=1; AJvYcCVbsh4EOjj0/1fOrQ+eGKTn7h3LOzC3dg1jAMUJlP8lI9XaQBGAvZQPg5qqJpYcVqrkNoWHN84QGwXmlw==@vger.kernel.org, AJvYcCVkotEFfxTQO9QKXicTAYVMYNrwBv6v/EyQ41Q9jovQtZTkbXPUmEF5g2mdwi65imuV+GssyMwV2RxnJnXR@vger.kernel.org
X-Gm-Message-State: AOJu0YxnCsRWOtb7Y31nKsBWmd/KZY3VJ/yDq79aiFZgtzKh6NfB/+3D
	0js9RvgRHH25R2HubzDqKB87mVcXtvsf5r0+QtD+TyWVl24lOzHhiYViLCOu45zTmHW/wS8AUUX
	86MM+0FlQZZfmk8V38wlEYIfh4dX9fO8=
X-Gm-Gg: ASbGncsam/J4wt4nAcH/0ZYKaSLumGyBNTYf8xPzIjua9WSYTgREO+lGVJ29HRRo32Z
	H0eTNOjmTo/DH1mc42FkO05LO0LUTwNMobTD6W1jEB5WIgX8fhz4TBGZakMZ2fe55dpQ2PpT2ND
	iVWlObmMrCCWJAzbQCoohdusWMYv4h+Vo3a+xCb4frZvhJ7yyiP0HOGcnSJOYkTljxzXF7ApE8j
	GvUYP0Q
X-Google-Smtp-Source: AGHT+IGve8RdGerNKNlwdfvNf43Vece8Ci6gGQKnPm2DUYk6UuGaBWRtdG4uiDffwpe+PLh49As42r3NWxlw1DnAcGY=
X-Received: by 2002:a05:6214:1cc7:b0:701:9d0:1408 with SMTP id
 6a1803df08f44-707005665ebmr21777976d6.20.1753244463009; Tue, 22 Jul 2025
 21:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet> <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
 <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
 <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com>
 <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com> <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
In-Reply-To: <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Tue, 22 Jul 2025 21:20:52 -0700
X-Gm-Features: Ac12FXxtyj5Iktvw2h48FN9HHbyvHxb1JQF3H7P0JI1rNXbWxVkvDZZRpEFjxIk
Message-ID: <CAEc3jaBkyPgnWjkZX6XjT6YKn4sAmHpOrtwp_+UMruS-hwUz_Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have asked someone in Tokyo for some more clarification as well. As
I said my worry is that it really isn't this simple...

Separately we are now starting to formally study Bluetooth audio. That
one is difficult, but at least less messy on the plumbing side as it
is all HID based.

Thanks,
Roderick

On Tue, Jul 22, 2025 at 9:04=E2=80=AFPM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Cristian,
>
> Thanks for the information on the audio patches in the sound tree. We
> weren't familiar with that part.
>
> I talked a bit with my team members as well. In general audio is
> getting some bigger attention (will see where that goes). I'm getting
> a bit worried that the HID and usb driver need much closer coupling,
> the current coupling not being enough.
>
> I don't know the USB audio spec too well, but it is more on the
> digital interface and a DAC. I'm not sure on the exact circuitry on
> the DualSense, but there is a lot of logic in the console drivers for
> volume handling where adjustment of the volume talks to the HID layer
> to send a new output report. I suspect they had very good reasons for
> it (e.g. for headphone also dealing with different impedances).
>
> So I'm not sure how the volume control is really supposed to work, but
> I would think to do it properly it requires some interaction between
> the audio and HID drivers. Just letting the audio side do it right
> now, is more about leveraging the range of the DAC I guess versus a
> proper audio amplification stage.
>
> Just thinking of things from the user perspective, they should have a
> unified volume control. I don't know how other devices are doing it,
> but I think we need to think a bit further and we need to reconsider
> how things work....
>
> Thanks,
> Roderick
>
> On Tue, Jul 22, 2025 at 1:03=E2=80=AFAM Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
> >
> > Hi Roderick,
> >
> > On 7/22/25 9:18 AM, Roderick Colenbrander wrote:
> > > Hi Cristian and Jiri,
> > >
> > > One thing I forgot to bring up is whether it is best to have the audi=
o
> > > plug logic have its separate input device or have it be part of an
> > > existing (e.g. main gamepad). The patch currently creates a separate
> > > input device. Originally we added multiple input devices (gamepad,
> > > touchpad and sensors) due to axes and button collisions really.
> > >
> > > For this feature there is no collision. There are not many devices in
> > > the kernel, which support these audio EV_SW. I see for example the
> > > Switch 2 controller has a mini jack port as well. Some xbox
> > > controllers too (though audio not supported in the kernel from a quic=
k
> > > glance or at least no HID or xpad driver features for them).
> > >
> > > I don't have a strong opinion yet. Initial feeling was perhaps have i=
t
> > > on the 'main' input device. But on the other hand, I'm not sure what
> > > software is normally listening for these kinds of EV_SW events. What
> > > would be listening for this like a pipewire?
> >
> > For now this is going to be used by the usb-audio driver which contains=
 a
> > quirk [1] creating the jack controls for headphone and headset mic,
> > respectively.  This will further setup an input handler for each of the=
m in
> > order to intercept the related hotplug events.
> >
> > But it can be also used directly from ALSA/pipewire, e.g. for monitorin=
g,
> > hence it think it's best to keep it as an audio dedicated input device.
> >
> > Regards,
> > Cristian
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/tree/sound/usb/mixer_quirks.c#n540

