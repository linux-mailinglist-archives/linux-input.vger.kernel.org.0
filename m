Return-Path: <linux-input+bounces-15369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C7706BCE7DB
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 22:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 88C1C4E436F
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 20:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E77D1ACEAF;
	Fri, 10 Oct 2025 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ha9mGzI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92831F151C
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760128219; cv=none; b=I5HjjqsAWSlYpAxjujvIpeMxVwEJN4/LzciWYB/+Tx+QGP55S1lKkTRy3Nq15iYjmA3Pz69TkOxHvFTOVeTznjrm9LPV+LZubA1x0/oafCqxKJqOBLplmTC23lqxHzCJpKjI0lNKxhBsvDrqLGTk2gtBHSAKxYS6WBYdcD/3sHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760128219; c=relaxed/simple;
	bh=v2/k8ZBfgqIfQM1A7XfXWIbtHIBC0CbPjCHyajnO5fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+hHRtPaEL2AAJPXdPL/fugBpk4YCO1cr5foEbCbqoCmRxwqViDfW+Mp6dpZzh/J0v55/rUX2ytR15i5/wxTOAAjgngptr06g/hNx4xUaDZv4wGSQ/3xsx9KbOq6D7OuZx2Coz7uLBihSwaTyyHT5G78Sc7PxJnfT1TdJrcsgE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ha9mGzI; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8608f72582eso142127285a.2
        for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760128216; x=1760733016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJzF06najOg1Gcry9ekDHccVFcYFO2BDN8L+sxgb1tU=;
        b=3ha9mGzIax4aYkKl8xOnU4DQBxx/EPGoAxduHIfuGy7GlioACusQiut9MG9tg6mPFF
         7NGxPvzkOhlyk30r0WzP+PTQGC6mPkV+I1L3qmtfBmBV+qVkvE69w6CG8V+2RO21RP18
         mukg8iw/bSzDbQrONE5SUTEUStEwDr9WF3FOZ+fRK1nPe2F00TQOFuKqrrN/vBlKLJ/8
         MYhJ/Y12ir+VDN/7O4kLrNFGYwiu3WuF5KyshTtdHp7gjS4hzu96MEA2ak83NbCjUdKC
         1sq5eAUrVifXgph2SLT/Di9SgDPfqMo3yaGSYKEXE5ZAwW8AklNnLjxs/n7VC1cOI3U/
         gZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760128216; x=1760733016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJzF06najOg1Gcry9ekDHccVFcYFO2BDN8L+sxgb1tU=;
        b=Y5gmLzFJcdTYz5MCsbAmu1bMfPeehOOAmYhnJtzBzRi/Pn3G6Cv+ao8VmkU2Qgy1Kb
         SMMuF+jdDWxMxUyXyHuZb1yMwbhLHsvUqMb5rymFuAOfdxhgRNVLCVFK3BsIp2umbbbm
         WYxWngmACE6nB5mRTx0kUsUNeklvcfv1YkbbfJeSHmHQoOGeWKTBKtlAk1hvavu0JtNy
         +rXjdfRgmgARFmfbOzXQ6iBr0Kk3EX2PzMhU1ifMFYYVNjv21fLMks6lL9b6qh6zEgpU
         h/pgdMRywW1I/Ks0iux3ToSKeuzf4Hmtqq1kLrUgJDjEKoWtDgZ8IkDOtSBrabBYMNAc
         asuw==
X-Forwarded-Encrypted: i=1; AJvYcCWrEWKYVm7bCS49UUblcqKG4lOD75XBKBjiOIqwSkKgXmbBCdHLSHsULk0rgJn4cII1wEJmvHaNqiXOqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYWVPIhx6qFdwvsTiueOecBde+K3BnURrhHYTK2ZSFmaBbTKr3
	3xLtn/WjAzyaK4ShIRX2fjk5yBAlxNTXl3jNS89yE4QZHvHhcg0n2lJYpKM82leSPGQ+i7rNUv6
	rH0BpvuNKPqVuc5TPmUAxYyehiqVGt3qPj0qaJN5a
X-Gm-Gg: ASbGnctwr3OIQV7rtUpAVRPfnDyt2/zWJYvC9taov7iUOxUTNbyx87IDfMgCwfEFG2G
	N64pUn2WTzBUReayFHDwgfBtI5186vx7R3wzUYrFEA9i4ydls2cmR458o6/UngPNzHNudMNTMBS
	FJJbA1tCPvXosoXYFv0g7EpZdocbY/d8vQuNg4bvHWqLsFYSx9T0/aJZvBBsQvRLXaTCLDZFfbl
	CwNGzIReLM9gmLjdPxpqfIE5zSd7PkTe5/vMn+jwzVybGrF/Aq6ANieweaeC9zRqQ==
X-Google-Smtp-Source: AGHT+IEMVwnTb4u9A7SPuNQIjjbJTQej8wCEMMZ/mrxOBPqDW1KfOrO0BqvUY2xxY9mL+cfawvweaEhANedvgVaLwP4=
X-Received: by 2002:a05:622a:2b0f:b0:4b7:aeda:634b with SMTP id
 d75a77b69052e-4e6eabe6b64mr184459821cf.0.1760128216221; Fri, 10 Oct 2025
 13:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com> <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org> <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
 <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org>
In-Reply-To: <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org>
From: Jonathan Denose <jdenose@google.com>
Date: Fri, 10 Oct 2025 15:30:05 -0500
X-Gm-Features: AS18NWC9jtyWGxsfq47KH8p_oP-7oH2DqdyG9IYixNVF9rovGpbJyewtFlvrG6Y
Message-ID: <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Angela Czubak <aczubak@google.com>, "Sean O'Brien" <seobrien@google.com>, 
	Lucas GISSOT <lucas.gissot.pro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Thanks for looking into this.

On Fri, Oct 10, 2025 at 1:55=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> I think I found it... see below.
>
>
> On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> > [Top-Posting for easier consumption]
> >
> > Mainly writing this mail to bring Lucas GISSOT in here, who reported th=
e
> > same error yesterday here:
> > https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
> >
> > Lucas there suggested:
> > """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
> > hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
> > Kconfig updated."""
> >
> > And Randy: Thx for the closer investigation! It explains some of the
> > "that feels odd, am I holding this wrong" feeling I had when reporting =
this.
> >
> > Ciao, Thorsten
> >
> > On 10/10/25 06:50, Randy Dunlap wrote:
> >> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> >>> On 8/19/25 01:08, Jonathan Denose wrote:
> >>>> From: Angela Czubak <aczubak@google.com>
> >>>>
> >>>> Define a new structure that contains simple haptic device configurat=
ion
> >>>> as well as current state.
> >>>> Add functions that recognize auto trigger and manual trigger reports
> >>>> as well as save their addresses.Hi,
> >>>> Verify that the pressure unit is either grams or newtons.
> >>>> Mark the input device as a haptic touchpad if the unit is correct an=
d
> >>>> the reports are found.
> >>>>  [...]
> >>>> +config HID_HAPTIC
> >>>> +  tristate "Haptic touchpad support"
> >>>> +  default n
> >>>> +  help
> >>>> +  Support for touchpads with force sensors and haptic actuators ins=
tead of a
> >>>> +  traditional button.
> >>>> +  Adds extra parsing and FF device for the hid multitouch driver.
> >>>> +  It can be used for Elan 2703 haptic touchpad.
> >>>> +
> >>>> +  If unsure, say N.
> >>>> +
> >>>>  menu "Special HID drivers"
> >>>
> >>> I suspect this change is related to a build error I ran into today:
> >>>
> >>>   MODPOST Module.symvers
> >>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] und=
efined!
> >>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multi=
touch.ko] undefined!
> >>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-mul=
titouch.ko] undefined!
> >>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multit=
ouch.ko] undefined!
> >>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouc=
h.ko] undefined!
> >>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multito=
uch.ko] undefined!
> >>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitou=
ch.ko] undefined!
> >>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: M=
odule.symvers] Error 1
> >>>
> >>> The config where this occurred had this:
> >>>
> >>> CONFIG_HID=3Dy
> >>> CONFIG_HID_MULTITOUCH=3Dm
> >>> CONFIG_HID_HAPTIC=3Dm
> >>>
> >>> Changing the latter to "CONFIG_HID_HAPTIC=3Dy" fixed the problem for =
me.
> >>
> >> Sure, but that's just covering up the problem.
> >>> First, I get this build error:
> >>
> >> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-hapt=
ic.o
> >>
>
> ISTM that tristate is incompatible with this newly added Makefile
> line:
>
> +hid-$(CONFIG_HID_HAPTIC)       +=3D hid-haptic.o
>
> hid-* lists files that should be builtin, not loadable modules.
> These should all be hid-y.  AFAIK, hid-m is not useful.
> (A maintainer can correct me as needed.)
>
> So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
> hid-haptic.c and changing drivers/hid/Makefile to use
> obj-$(CONFIG_HID_HAPTIC_        +=3D hid-haptic.o
>
> fixes the build errors for me.
>
> Angela, Jonathan D., is there any reason that
> hid-haptic needs to be builtin instead of a loadable
> module?  It's no problem for hid-multitouch.ko to call
> into hid-haptic.ko (both as loadable modules) as long as
> hid-haptic.ko is loaded first.
>
As long as hid-multitouch.ko is able to call into hid-haptic.ko I
don't see any issues, but is there a way to enforce that when
CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
hid-multitouch.ko?
>
> Thanks.
>
> ~Randy
> ---
> ---
>  drivers/hid/hid-haptic.c |    3 +++
>  1 file changed, 3 insertions(+)
>
> --- linux.orig/drivers/hid/hid-haptic.c
> +++ linux/drivers/hid/hid-haptic.c
> @@ -10,6 +10,9 @@
>
>  #include "hid-haptic.h"
>
> +MODULE_DESCRIPTION("HID haptic touchpad support");
> +MODULE_LICENSE("GPL");
> +
>  void hid_haptic_feature_mapping(struct hid_device *hdev,
>                                 struct hid_haptic_device *haptic,
>                                 struct hid_field *field, struct hid_usage=
 *usage)
> ---
>  drivers/hid/Makefile |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- linux.orig/drivers/hid/Makefile
> +++ linux/drivers/hid/Makefile
> @@ -4,7 +4,8 @@
>  #
>  hid-y                  :=3D hid-core.o hid-input.o hid-quirks.o
>  hid-$(CONFIG_DEBUG_FS)         +=3D hid-debug.o
> -hid-$(CONFIG_HID_HAPTIC)       +=3D hid-haptic.o
> +
> +obj-$(CONFIG_HID_HAPTIC)       +=3D hid-haptic.o
>
>  obj-$(CONFIG_HID_BPF)          +=3D bpf/
>
>
--
Jonathan

