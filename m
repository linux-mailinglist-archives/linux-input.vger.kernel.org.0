Return-Path: <linux-input+bounces-1205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C682A500
	for <lists+linux-input@lfdr.de>; Thu, 11 Jan 2024 00:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E07A1F243AB
	for <lists+linux-input@lfdr.de>; Wed, 10 Jan 2024 23:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5B74F8A0;
	Wed, 10 Jan 2024 23:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GjEXAmpl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE544F886
	for <linux-input@vger.kernel.org>; Wed, 10 Jan 2024 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cd65f803b7so29938281fa.1
        for <linux-input@vger.kernel.org>; Wed, 10 Jan 2024 15:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704930144; x=1705534944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx9HmcQEcblZ0PctKblTiQoSafk+55qkIdaYiVD4oBo=;
        b=GjEXAmpl9rYESPm3ZgVcYBM7kGwXLSd/kpk+NOP/hUiEKrOXsG/HvZGsn1nWRUdBKj
         CfU9UiPqIXY17PgUz3KGSCsgZtC4L8QNLrFgS/x/8DjWfOShQIi1JUuosRJYYPCwK8cI
         4eWtscTYiRam2aYPjyWGaui37MccrVI8CKmfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704930144; x=1705534944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx9HmcQEcblZ0PctKblTiQoSafk+55qkIdaYiVD4oBo=;
        b=jeI8Dv2HbGQBNYWAt17WN6I/SWvpE2Q0adeLiVqY/w59DwIa4675gihM+yPtRly8tD
         vFmNctMDJQGw8vLBN9Q1tAcsk97d1o+OHemeel90QWEUuLD2YwtZM/DVAsmA35wITa6+
         pVozoOI75x5ePMu9htYxMZzI4aO9gQG7xmFQiQMoHVXDOpZyLGJSj3FuTFXLoZHA8bS7
         avyUNxNV0IPISnZ03mi/C4D03/IuXLQ34YCnMKIx/Ft5KDwHiq1aHjqQv4bGT1+kFihM
         OsI6BEatdJSYvd1uAPOU+uPpNXZJ81jNBmNiM85LHQVIilD3e9zXZjQTM1WAYt1m7BzH
         ITDQ==
X-Gm-Message-State: AOJu0Yxyu2BBlA95MZ43Q4J/aK+zmRCzEt9lEfrMMEMHeTcl15i0hbBh
	0IlVrFPr0NP+L80GZDWDbtEv5cYA/6ZjPfJ5oDiO5ubVB5Ra
X-Google-Smtp-Source: AGHT+IG25KWe7lBAnxdYtTXEsvZq8IxZ3FsLF3cs+SKOslzEghUeo1BZZgyFhBNJGqAY1BBK0VYAk8hkzvDJqW4lSnk=
X-Received: by 2002:a2e:a4cc:0:b0:2cc:a7b9:2fa0 with SMTP id
 p12-20020a2ea4cc000000b002cca7b92fa0mr142451ljm.12.1704930144263; Wed, 10 Jan
 2024 15:42:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>
 <ZWF76ALANQwP_9b1@google.com> <CALNJtpUHHaq6g0wSuyaNBxtOE9kt6vDzdAGGu6j=JJdJmerDWQ@mail.gmail.com>
 <ZZ2eduF_h7lcBrSL@google.com>
In-Reply-To: <ZZ2eduF_h7lcBrSL@google.com>
From: Jonathan Denose <jdenose@chromium.org>
Date: Wed, 10 Jan 2024 17:42:13 -0600
Message-ID: <CALNJtpWr0h+r3=R2scxyCGzgbZ1C6FiYrCGWW1_aSVPBdmNc3Q@mail.gmail.com>
Subject: Re: [PATCH] Input: i8042 - add quirk for Lenovo ThinkPad T14 Gen 1
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>, 
	Hans de Goede <hdegoede@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, Takashi Iwai <tiwai@suse.de>, 
	Werner Sembach <wse@tuxedocomputers.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry,

Sorry I forgot to reply all, so I'm resending my other email.

On Tue, Jan 9, 2024 at 1:28=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Jonathan,
>
> On Mon, Nov 27, 2023 at 10:38:57AM -0600, Jonathan Denose wrote:
> > Hi Dmitry
> >
> > On Fri, Nov 24, 2023 at 10:45=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Jonathan,
> > >
> > > On Mon, Sep 25, 2023 at 04:33:20PM -0500, Jonathan Denose wrote:
> > > > The ThinkPad T14 Gen 1 touchpad works fine except that clicking
> > > > and dragging by tapping the touchpad or depressing the touchpad
> > > > do not work. Disabling PNP for controller setting discovery enables
> > > > click and drag without negatively impacting other touchpad features=
.
> > >
> > > I would like to understand more on how enabling PnP discovery for i80=
42
> > > affects the touchpad. Do you see it using different interrupt or IO
> > > ports? What protocol does the touchpad use with/without PnP? If the
> > > protocol is the same, do you see difference in the ranges (pressure,
> > > etc) reported by the device?
> > >
> > > Thanks.
> > >
> > > --
> > > Dmitry
> >
> > Without PnP discovery the touchpad is using the SynPS/2 protocol, with
> > PnP discovery, the touchpad is using the rmi4 protocol. Since the
> > protocols are different, so are the ranges but let me know if you
> > still want to see them.
>
> Thank you for this information. So it is not PnP discovery that appears
> harmful in your case, but rather that legacy PS/2 mode appears to be
> working better than RMI4 for the device in question.
>
> I will note that the original enablement of RMI4 for T14 was done by
> Hans in [1]. Later T14 with AMD were added to the list of devices that
> should use RMI4 [2], however this was reverted in [3].
>
> Could you please tell me what exact device you are dealing with? What's
> it ACPI ID?
>
> [1] https://lore.kernel.org/all/20201005114919.371592-1-hdegoede@redhat.c=
om/
> [2] https://lore.kernel.org/r/20220318113949.32722-1-snafu109@gmail.com
> [3] https://lore.kernel.org/r/20220920193936.8709-1-markpearson@lenovo.co=
m
>
> Thanks.
>
> --
> Dmitry

Thanks for your reply!

I'm not 100% sure which of these is the ACPI ID, but from `udevadm
info -e` there's:
N: Name=3D"Synaptics TM3471-020"
P: Phys=3Drmi4-00/input0

