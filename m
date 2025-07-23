Return-Path: <linux-input+bounces-13656-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5FB0E96B
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 06:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F59C16A816
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 04:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932CE157E99;
	Wed, 23 Jul 2025 04:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdKSCOpn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9D1C27;
	Wed, 23 Jul 2025 04:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753243499; cv=none; b=SHjVvFnuiDJxxx5wXSjGWtRaonukYC6dWQilsyB2HmrO2pcb7cAVONeStpdrc729Q09LU2D7z8EYy58i9Z7eaHiveO538UOt28oUNAjqb0WDmn9oLwfa+JOTRvIzsjAdNHxsOc/m1X3Url648zpVBpRU4D7FrLN5HthFrEYp0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753243499; c=relaxed/simple;
	bh=Bjpq9zILZ+v0ZduWgs+2/JvAp7rrPpmh2KEN9Jhw4Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mw1dXdzLSuS/EQugsAWGGFqFVnqdYSsXC0zM/oTSs1Eq6KrF24taVYLMvk5vXJJ+Ah9wLOGKT6pei543ZkJCvVUzJNKlrgEtAzKWXtB2jMl3mZUl6lKU/f8Q6o34pMggTVN5vfo8Dxydm32SkIbtNJQXlEmrVgiAmROO/k7oqjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdKSCOpn; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fada2dd785so64246806d6.2;
        Tue, 22 Jul 2025 21:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753243497; x=1753848297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B0JHRbIo76WzdOWhLIw9dEbjkosd0Uoq5EEBqueE7c=;
        b=ZdKSCOpnhZIRkRgWivUV2ZD7yBEF5NBzL6mx/EsvPCmwPwSpG2bUjDPYw3dphtQENb
         X3iOgc62e03WwDNgsBtK+WLcFDO1IRe5R4r06AH635dzLtKGQqKnewOp0xDY6duD61iZ
         SFSUEPaXZFpUq6GfuZ5lTtj248F4HEaXclqVOvDIQuoHAyRod9w3peD5OwSCmGbiHGVj
         9+v4B6v4PNAq8JxKZuVjscWH9xNRdvqzeyCdUG8kWNv0iBteoDHd9fTRRyxjmMMkh8sm
         DtpLA/OzCRKvi0UUAdVpFqPnA17GiUe/wBUKWpO64Ytff78auBRzuni9e+Zig3mQQ8qR
         yqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753243497; x=1753848297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B0JHRbIo76WzdOWhLIw9dEbjkosd0Uoq5EEBqueE7c=;
        b=BVQzuqgXVDtDLbNTM4085gGlj+gSbPKNrfdxbutWSLfme6DD7NHJEOe9cjJwmXslKC
         GIKHQ1bpUjGh4112fqFXbRcfVMrnDIURzQ7pK6GKIqpPH3UlsjLR8Tm9o09MHehu8Vvj
         RAtBpxXXI9p7Xuu3pnhgFEH6VZ+bC6AcNqcpt9R13PZL2I7Zo4fTmoTWOW1/cVRbIAX6
         TDc452vowDF4/VYpP11u/z7HXYKKtYe+JVYr1AYnXDOSJ+sPjXolctxVM8JhtD/wqd5B
         G2tx+aH9oFYBE1YEx9X8HuHNfK1/6F5lJy4GE1XCFilKEbkRaVQZfIPl1Y2wIpRbRGS5
         u92A==
X-Forwarded-Encrypted: i=1; AJvYcCVXYb1VVa/+OKRX1ycLZbtDo2fmjottK/73OW7ThOpOVqAUCImuLeDV+dOG8T8K9kaYvccqoDH2H4snTtvL@vger.kernel.org, AJvYcCWgwEZTkub9eeQdBKkySQLhYw+HQnJPeRmi6dyw051b5nrO09aEqOPkngqr3TXHSQPDVsW/YgH7bOLpyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykJkvxmmEU7EVvA7IMRRYa7Xx6ekmtYuYRHWXdWWIfNtnULGXV
	6Nz+rSz7MNzPFoOmiiks8E/QyABNT8yeXhcMW6dhIdGncw1xb5h+xp/VrGmVEpVgzh1YAd23zv4
	T+KGgWseEKOa+mZX9A7rAYeYeBEiAC3s=
X-Gm-Gg: ASbGncvnpTP0P7bSYIMDNB+/RCMG+YGUk8ieeGzahnAOEz+zE5SSATieMgOtstIIiLA
	5NTezsiqjAsYeX11VQ9Er3Mu853GFKzANtJz1yK/KTAfuDI7v6RO9AN19OC8ifSRy82Pk+2D5rv
	RGHkq99va6qolrzytNSK3butcJ2Z762MY+hSmUHxvdTKEiz2uYQwnuvVqNRadsvU/g4cRoxiaQt
	8FGX5/p
X-Google-Smtp-Source: AGHT+IGobJlql3KhOyaHzHzObFcHGL3P2fT/lL9IQknLtrK8aDFeJP6l5Rz7wvWRY6+rS0KcSAAsMoPzoanK4iFKTIQ=
X-Received: by 2002:a05:6214:762:b0:706:c9e5:c97c with SMTP id
 6a1803df08f44-707005453a5mr25206706d6.19.1753243496406; Tue, 22 Jul 2025
 21:04:56 -0700 (PDT)
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
 <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com> <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com>
In-Reply-To: <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Tue, 22 Jul 2025 21:04:45 -0700
X-Gm-Features: Ac12FXyU4xtcuLDOtF9r7yYktniqoqLLuYXY6w-3OgVQ26iNLNVY1SMSEgvhI6g
Message-ID: <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

Thanks for the information on the audio patches in the sound tree. We
weren't familiar with that part.

I talked a bit with my team members as well. In general audio is
getting some bigger attention (will see where that goes). I'm getting
a bit worried that the HID and usb driver need much closer coupling,
the current coupling not being enough.

I don't know the USB audio spec too well, but it is more on the
digital interface and a DAC. I'm not sure on the exact circuitry on
the DualSense, but there is a lot of logic in the console drivers for
volume handling where adjustment of the volume talks to the HID layer
to send a new output report. I suspect they had very good reasons for
it (e.g. for headphone also dealing with different impedances).

So I'm not sure how the volume control is really supposed to work, but
I would think to do it properly it requires some interaction between
the audio and HID drivers. Just letting the audio side do it right
now, is more about leveraging the range of the DAC I guess versus a
proper audio amplification stage.

Just thinking of things from the user perspective, they should have a
unified volume control. I don't know how other devices are doing it,
but I think we need to think a bit further and we need to reconsider
how things work....

Thanks,
Roderick

On Tue, Jul 22, 2025 at 1:03=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Hi Roderick,
>
> On 7/22/25 9:18 AM, Roderick Colenbrander wrote:
> > Hi Cristian and Jiri,
> >
> > One thing I forgot to bring up is whether it is best to have the audio
> > plug logic have its separate input device or have it be part of an
> > existing (e.g. main gamepad). The patch currently creates a separate
> > input device. Originally we added multiple input devices (gamepad,
> > touchpad and sensors) due to axes and button collisions really.
> >
> > For this feature there is no collision. There are not many devices in
> > the kernel, which support these audio EV_SW. I see for example the
> > Switch 2 controller has a mini jack port as well. Some xbox
> > controllers too (though audio not supported in the kernel from a quick
> > glance or at least no HID or xpad driver features for them).
> >
> > I don't have a strong opinion yet. Initial feeling was perhaps have it
> > on the 'main' input device. But on the other hand, I'm not sure what
> > software is normally listening for these kinds of EV_SW events. What
> > would be listening for this like a pipewire?
>
> For now this is going to be used by the usb-audio driver which contains a
> quirk [1] creating the jack controls for headphone and headset mic,
> respectively.  This will further setup an input handler for each of them =
in
> order to intercept the related hotplug events.
>
> But it can be also used directly from ALSA/pipewire, e.g. for monitoring,
> hence it think it's best to keep it as an audio dedicated input device.
>
> Regards,
> Cristian
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/sound/usb/mixer_quirks.c#n540

