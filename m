Return-Path: <linux-input+bounces-274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C04817FB010
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 03:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F16321C209DA
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 02:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA2128EF;
	Tue, 28 Nov 2023 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htaYmkDT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BDE18E
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 18:25:17 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c9b5c12898so423431fa.2
        for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 18:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701138316; x=1701743116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTGKuRKgw1gyU3q0dRaE4dt9OEt0uw3tiemq3j9lezQ=;
        b=htaYmkDThwYSRViAC92J0R24r38Vh9m0txCbrx+nsfkcsTY9GAYxveSw3DWuhYg7H3
         9R7vgBqWLHq7A5AK+LvuE6bkOzUgQIzyZeupAaymjNSAVkU+TH/iorvw6QhEJhMGhO6W
         xdfOELZFXbg28WGcARCFKI2nwy0id79B9nkRcIFUN+PZhMaUiBhETusLG08eTBAN8Z1G
         iOJ/t6nrZTEQCRfsuZfkgMEB7UBIFBh0b/Puc6rMnTRU5gKrN+FZX9f88kHV966HmGgy
         xjL89m+Q2O3SitHOg1xOJyCeQTARBCXFqsxi+jd8tbUkSAIF6NxjhUWh7g4ZIUrYzFAv
         kyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701138316; x=1701743116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTGKuRKgw1gyU3q0dRaE4dt9OEt0uw3tiemq3j9lezQ=;
        b=FOARzItXlmF+Sy9ZVAlXytBr3y9SDLBp6PgVItikyD8eUbhT+miBXQO6QVEbAcpc/n
         CzMngAPNwlKXR1o0e3lyprPei11djjLIrLw6x6j+7eWY4bWnAYVsbCWPnc0YvptcEv5K
         GZXaPc0tAgIjlnEq/oqcuqBwqF7s7jki+26PYy38TBN+8BEsWPXHtE2uGL8jXVkdMaWl
         ODD5Smo1vLUMbIwnkcxVQxNYntsvA5ntBuK5d5rpy1MhdXaDQjOHb6bHWoGybC/p7tKM
         IkxSHW2GaRaThFI4bIPWHbgFdesp31OHhGEzFQycR67YKFBSdyrB9qfkrsAXc64hOprn
         tZyA==
X-Gm-Message-State: AOJu0Ywbg+TFqPQ9J2EHd+w21m6kjot1d4y2Oq4ZUMaWSLzDN65ab/Q2
	p3/DPqjynhgN9xRd01AWnz+e1yfBJJ+LIRsvMUur8p5K
X-Google-Smtp-Source: AGHT+IFAHwXOs1LKOHPwU6ykMOL6rTXR6LUBQ38OH0zVMl6NYnwnIPDpKN3X5KY8CfUm6bdcWyNvpcMZGBrJAH0yxQ4=
X-Received: by 2002:a05:651c:316:b0:2c9:9741:f694 with SMTP id
 a22-20020a05651c031600b002c99741f694mr5247797ljp.5.1701138315587; Mon, 27 Nov
 2023 18:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <o-hu9PCGr9R5LPS2ZnqssxnR22SBfwuDa0xuSsPwr3op3vBs1lbSsyH7RZMxkw7Ro2EuEzXbekDPrbiFoJ_R2_TzDlQ1g5zDaCogEU2w0sI=@protonmail.com>
 <CAEc3jaBpdY0J8hwJ6FMBOi5JH3Z-pEPxP38RYD0Y74+9=cfUOw@mail.gmail.com>
 <ivOCP7WJIYExbRiOtMQq1_X5Lrm691_Jzu2MB_EoHi94WQwoWQtn0YUt2Bf20BQ6BSNuIOZBrrJ5rYTzag5mWGlrn2Yfis9TziSb6VfPxbY=@protonmail.com>
 <CAEc3jaCSUWXPZo=nvYkWhvOuJYT7xmh4QcBajmrs4GWY6u5OVw@mail.gmail.com> <P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZCQuqoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=@protonmail.com>
In-Reply-To: <P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZCQuqoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=@protonmail.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 27 Nov 2023 18:25:03 -0800
Message-ID: <CAEc3jaCrpbBADiAgSy-kTXqOj_XLy8QuV88GxqY38=2BvG0QZw@mail.gmail.com>
Subject: Re: Wrong inputs on DualSense Edge Wireless Controller
To: Alexander Koskovich <AKoskovich@protonmail.com>
Cc: "Colenbrander, Roelof" <roderick.colenbrander@sony.com>, 
	linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Thanks for testing. This indeed confirms the kernel side mapping
(hid-playstation) is right. Different software layers e.g. SDL2 and
others tend to do their own mappings. This type of mapping seems to be
incorrect (or even missing for DualSense Edge resulting in a default
fallback).

Thanks,
Roderick

On Mon, Nov 27, 2023 at 5:50=E2=80=AFPM Alexander Koskovich
<AKoskovich@protonmail.com> wrote:
>
> I tested in evtest, and it's reporting sane results (cross south, square =
west, etc). So this seems to be an issue outside of the playstation driver =
itself?
>
>
> On Monday, November 27th, 2023 at 2:40 PM, Roderick Colenbrander <thunder=
bird2k@gmail.com> wrote:
>
>
> > This seems a little weird to me. Would you be able to test in using evt=
est? It would rule out some of the other middle layers which can do their o=
wn remapping.
> > Thanks,
> > Roderick
> >
> > On Mon, Nov 27, 2023, 6:42=E2=80=AFAM Alexander Koskovich <AKoskovich@p=
rotonmail.com> wrote:
> >
> > > I was testing this in the Steam controller test, Cyberpunk 2077 (thro=
ugh GOG, not through Steam), and SuperTuxKart. All of these have wrong mapp=
ings for the Edge controller exclusively.
> > > For additional context I have a PS5 controller (non Edge) and it work=
s out of the box. This just seems to be an issue with the Edge variant.
> > >
> > >
> > > On Monday, November 27th, 2023 at 9:37 AM, Roderick Colenbrander <thu=
nderbird2k@gmail.com> wrote:
> > >
> > >
> > > >
> > > >
> > > > Hi Alexander,
> > > >
> > > > Sorry for the late reply, but I have been out for a few days. I'm n=
ot
> > > > aware of any button/axis mapping change between Edge and regular
> > > > DualSense. The HID reports stayed the same.
> > > >
> > > > I just did a quick check on my laptop also on Fedora 38 / kernel 6.=
5
> > > > and the mapping seems to be fine. In evtest, triangle reports
> > > > BTN_NORTH, square BTN_WEST, etcetera.
> > > >
> > > > The sticks, triggers and buttons seem to be fine as well. How are y=
ou
> > > > testing this?
> > > >
> > > > Thanks,
> > > > Roderick
> > > >
> > > > On Wed, Nov 22, 2023 at 4:18=E2=80=AFPM Alexander Koskovich
> > > > AKoskovich@protonmail.com wrote:
> > > >
> > > > > [Resending email due to lack HTML message rejected]
> > > > >
> > > > > Hello,
> > > > >
> > > > > I am currently on Fedora 39 (6.5.12-300.fc39.x86_64) and I am not=
icing that the inputs for this controller are wrong primarily on the right =
side of the controller.
> > > > >
> > > > > playstation 0005:054C:0DF2.000C: hidraw11: BLUETOOTH HID v1.00 Ga=
mepad [DualSense Edge Wireless Controller] on 10:3d:1c:fd:30:bc
> > > > > playstation 0005:054C:0DF2.000C: Registered DualSense controller =
hw_version=3D0x01000208 fw_version=3D0x01000036
> > > > >
> > > > > This is the current mapping that I'm seeing with the hid_playstat=
ion module loaded:
> > > > > "X" is actually "Square"
> > > > > "Square" is "Triangle"
> > > > > "Triangle" is "Circle"
> > > > > "Circle" is "X"
> > > > >
> > > > > Also the right joystick seems to be controlling "R2" instead of t=
he right joystick. "L2" and "R2" triggers control the joystick instead. It'=
s overall very weird. Has there been any similar reports to this?

