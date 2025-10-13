Return-Path: <linux-input+bounces-15380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD0BD32B8
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 15:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500BF3C650D
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 13:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EDA2749C4;
	Mon, 13 Oct 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctsMrDw9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE324A079
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361587; cv=none; b=VAPiveknttVwng8RHxWmcjI+/Ekqp4yfVH+LBm+KspV+q0/OyjwyxXZr57b5kXvWDQV46uPDbD3wrlBoHt2b8gfsOfHBH2+gqZcAxXEhHjV7ZaEN/mVdMK9IdKJoQgpfs3o64ONKGahfCKlSB0zLJeD/+gK7WmoZa3HryzA2uLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361587; c=relaxed/simple;
	bh=hmoG2D2uWmbK3ZnQ4PzumWQE5wxc1xo/v8u8S/CiP5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCZc6hd83XGXreSo1EIwjUIs+Mz4feuQsqOJSIfSn/ykFrVRyawM1piyAWjosiQqnsBzX70VrmXB8FzI7S07OXmZaAoKx09ffMN2c3WWQeQJmyTiFNta4uHclhN//IHtalPLmuITygTkNZVYTbSYSldSuD4Q3FfrYPItXgYM2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctsMrDw9; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7ea50f94045so62349376d6.1
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760361585; x=1760966385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/EEJZgh8MeXJ23MQLJxa+c7vgI4rPFQhWD8rPWK2IE=;
        b=ctsMrDw9k4jxOspfqa3fxXRNwRqmn6sO79lirzntFS1y11LD4ltzTneZOpxlRYSswM
         Adm5Wx8OZN6Vn4cSvK52hIYY0y34YogJHKZYd7UkNklEGsPTO/eD+WHw6JLjAZ1tfMt2
         r6jG0K6f3LQQ6bl/gpw+gu+V1xy6kuiWDfEoaHRi40n0LD8EouPM6++OT4buFv2IjVqL
         M9sNtUSgRWuKNPbb0apTSBJH5eryGqMLdVnRT/QW8JlvNb66pFImaDbb3fZc32JFmRwE
         5H4zE0JLSsTKY38KcC7Extf9CKJBLxdO7sdz+ZndpqGUD7kDnh4T7nbwetN1CTBJ4BSW
         toew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361585; x=1760966385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/EEJZgh8MeXJ23MQLJxa+c7vgI4rPFQhWD8rPWK2IE=;
        b=hqP6L5pSBK8ssCH4OMPgsA/b88NPp8Fcgswd373W+yG1PZV2kWQ8AQTTM/ncWOpU0F
         Dj/yrnlLzh/kPSuFiXFzof/EwtkLf/miCmR01xfHqD28nMQXqpmXbyqfDB4dpcG8Ni8i
         7nKXVLsyjUqRY6tGYqmi7E6bILtZGNMHaSYy4gWXXwtNlIbi3ZqR/2cmmh6I8km9THa6
         +hNWLtOAVds2O2tHzVyNk9iKKPSIFszzBymtzTUeza7fAF9AdLv5DNsId/k0OXMWQnOK
         klQ8fKUbVAhdMj/52P2QQfTKdZlK3Tn9lWB95qC1fCavqpJjtT62DO+6g/kwVcZQ3F6P
         U7gA==
X-Forwarded-Encrypted: i=1; AJvYcCVo1mUNGNmZ/sT9BUbaMg+edp3J84ewddx0RhYq+tSjG/0ZxK7/hpW6h3Rph+WYIxsoki0ZM6zKxEVnxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzlacxUZIE2UCpwFXiytCW25o0c8fJ/tBwCzb4vGbj6SMxwWfm
	gVM6oFBShkXNtPWbbJa7GonED2UzPcZR7eM71FRi6v5M6PBkB3MGal7tjpU2cJfV/vmHBjzav6V
	1QNqCRL4bNSUYrm1K2qb8J74/4L4B902B/bI64MKE
X-Gm-Gg: ASbGnctPs8gQ/1glgD2ESgdJlHYGFWvA0S8K9U7vsE3ueqL9KKEqjV3pBMG5Pnj+8ch
	v5bzWg0rE689ZOdryzgHx23+b9mlwTcqUHujSpyxTRPosXNUNAjZZVpIfxU4jY3q8/slSqRPZFJ
	Y+5wLd1qSOqDRXwxpRd9UCQc6/yfV7kHkaTqMGyVcyosOEtOa83RgOtibAf4L6sP+38g8xNf46j
	sXBYEHiAAWW9kay2e1dusF7rzkvtPkyNIqjO3rI4U5/rVgh3heI4kCYVnGRue4z5eVoZ010OcEv
X-Google-Smtp-Source: AGHT+IGFOFnbszcLV7TMKE9XA+0FyYK4F1vsUUOPmdJlwRqTEuUndJtsgO2G2uIU5eNIQtnZia+hsgk9/Kk1UcHHzcU=
X-Received: by 2002:ac8:758e:0:b0:4d6:c73f:de88 with SMTP id
 d75a77b69052e-4e6f396e281mr217487431cf.3.1760361584510; Mon, 13 Oct 2025
 06:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com> <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org> <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
 <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org> <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
 <04df1bb8-8409-4ece-a21c-4c71592eb852@infradead.org>
In-Reply-To: <04df1bb8-8409-4ece-a21c-4c71592eb852@infradead.org>
From: Jonathan Denose <jdenose@google.com>
Date: Mon, 13 Oct 2025 08:19:33 -0500
X-Gm-Features: AS18NWDz6WOml_kDvWWGqpzSlWYyUNjuwuF6ooBTtjwnBUyDba4AkLfjodlq7AE
Message-ID: <CAMCVhVMO4y9P=Y3SWvY6BvA1sUK2o=Gn6Hk2UpaueNN=6CNHZQ@mail.gmail.com>
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

On Fri, Oct 10, 2025 at 5:52=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/10/25 1:30 PM, Jonathan Denose wrote:
> > Hi all,
> >
> > Thanks for looking into this.
> >
> > On Fri, Oct 10, 2025 at 1:55=E2=80=AFPM Randy Dunlap <rdunlap@infradead=
.org> wrote:
> >>
> >> Hi,
> >>
> >> I think I found it... see below.
> >>
> >>
> >> On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> >>> [Top-Posting for easier consumption]
> >>>
> >>> Mainly writing this mail to bring Lucas GISSOT in here, who reported =
the
> >>> same error yesterday here:
> >>> https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
> >>>
> >>> Lucas there suggested:
> >>> """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
> >>> hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
> >>> Kconfig updated."""
> >>>
> >>> And Randy: Thx for the closer investigation! It explains some of the
> >>> "that feels odd, am I holding this wrong" feeling I had when reportin=
g this.
> >>>
> >>> Ciao, Thorsten
> >>>
> >>> On 10/10/25 06:50, Randy Dunlap wrote:
> >>>> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> >>>>> On 8/19/25 01:08, Jonathan Denose wrote:
> >>>>>> From: Angela Czubak <aczubak@google.com>
> >>>>>>
> >>>>>> Define a new structure that contains simple haptic device configur=
ation
> >>>>>> as well as current state.
> >>>>>> Add functions that recognize auto trigger and manual trigger repor=
ts
> >>>>>> as well as save their addresses.Hi,
> >>>>>> Verify that the pressure unit is either grams or newtons.
> >>>>>> Mark the input device as a haptic touchpad if the unit is correct =
and
> >>>>>> the reports are found.
> >>>>>>  [...]
> >>>>>> +config HID_HAPTIC
> >>>>>> +  tristate "Haptic touchpad support"
> >>>>>> +  default n
> >>>>>> +  help
> >>>>>> +  Support for touchpads with force sensors and haptic actuators i=
nstead of a
> >>>>>> +  traditional button.
> >>>>>> +  Adds extra parsing and FF device for the hid multitouch driver.
> >>>>>> +  It can be used for Elan 2703 haptic touchpad.
> >>>>>> +
> >>>>>> +  If unsure, say N.
> >>>>>> +
> >>>>>>  menu "Special HID drivers"
> >>>>>
> >>>>> I suspect this change is related to a build error I ran into today:
> >>>>>
> >>>>>   MODPOST Module.symvers
> >>>>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] u=
ndefined!
> >>>>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-mul=
titouch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-m=
ultitouch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-mult=
itouch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multito=
uch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multi=
touch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multit=
ouch.ko] undefined!
> >>>>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147:=
 Module.symvers] Error 1
> >>>>>
> >>>>> The config where this occurred had this:
> >>>>>
> >>>>> CONFIG_HID=3Dy
> >>>>> CONFIG_HID_MULTITOUCH=3Dm
> >>>>> CONFIG_HID_HAPTIC=3Dm
> >>>>>
> >>>>> Changing the latter to "CONFIG_HID_HAPTIC=3Dy" fixed the problem fo=
r me.
> >>>>
> >>>> Sure, but that's just covering up the problem.
> >>>>> First, I get this build error:
> >>>>
> >>>> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
> >>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ha=
ptic.o
> >>>>
> >>
> >> ISTM that tristate is incompatible with this newly added Makefile
> >> line:
> >>
> >> +hid-$(CONFIG_HID_HAPTIC)       +=3D hid-haptic.o
> >>
> >> hid-* lists files that should be builtin, not loadable modules.
> >> These should all be hid-y.  AFAIK, hid-m is not useful.
> >> (A maintainer can correct me as needed.)
>
> More correctly, any .o that is listed as being built as part of
> hid.o should is going to be controlled by CONFIG_HID and should
> not its own have a Kconfig symbol at all.
>
> E.g. here:
>  hid-y                  :=3D hid-core.o hid-input.o hid-quirks.o
> hid-core, hid-input, and hid-quirks don't have their own
> Kconfig symbols.
>
>
>
> >> So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
> >> hid-haptic.c and changing drivers/hid/Makefile to use
> >> obj-$(CONFIG_HID_HAPTIC_        +=3D hid-haptic.o
> >>
> >> fixes the build errors for me.
> >>
> >> Angela, Jonathan D., is there any reason that
> >> hid-haptic needs to be builtin instead of a loadable
> >> module?  It's no problem for hid-multitouch.ko to call
> >> into hid-haptic.ko (both as loadable modules) as long as
> >> hid-haptic.ko is loaded first.
> >>
> > As long as hid-multitouch.ko is able to call into hid-haptic.ko I
> > don't see any issues, but is there a way to enforce that when
> > CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
> > hid-multitouch.ko?
>
> I only know of two possibilities though there may be more.
>
> a. use request_module(true, "hid-haptic");
>
> This would probably be used in the hid core somewhere, afterthe device ma=
tching is done.
>
> b. use udev. When a device that needs hid-multitouch is
> discovered, have udev load both hid-haptic and hid-multitouch.
>
>
> I see that hid-haptic.h is written so that it has stubs for
> when CONFIG_HID_HAPTIC is not enabled. Can hid-multitouch
> operate (in a reduced capacity) when HID_HAPTIC is not enabled?
> So that they are separate modules and hid-multitouch is not
> dependent on hid-haptic?
>
> There is probably a use case for hid-multitouch without having
> hid-haptic loaded since hid-multitouch existed without having
> hid-haptic around at all.
>
> It seems that you want both of them loaded. And then Lucas
> has reported a build error when HID_HAPTIC=3Dm and
> HID_MULTITOUCH=3Dy, so either (like Lucas said) HID_HAPTIC
> should be bool, not tristate; or in Kconfig,
> HID_MULTITOUCH should depend on HID_HAPTIC, which would not
> allow the problem config that Lucas reported.
> But that forces devices that want HID_MULTITOUCH to also
> have HID_HAPTIC loaded, even though they may not need it.
>
The idea behind these patches was that hid-haptic would depend on
hid-multitouch but not the other way around. I am fine changing
HID_HAPTIC to bool. That's what I had it as initially, but I was asked
to change it.

If everyone else is fine with that, I can send out a patch.
> --
> ~Randy
>
--=20
Jonathan

