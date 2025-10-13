Return-Path: <linux-input+bounces-15414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE0ABD3834
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 702D63B8B92
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30031E8332;
	Mon, 13 Oct 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsRl/NI/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A26BA34;
	Mon, 13 Oct 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365751; cv=none; b=AYMb86/RsCGfha0ARjGu+WMxGTLZIhnb/pq9jhIoejUacmrYbtNiOAo3yccptUFiEjdXLJird1GzpQQ2hXiXS986kpgzItLnzPXuvt6kxcLhwOl0l/AaOyhIKTnseuA6QXYlDp42vDQvw44EGjWLUnOZ0qgntfikElG+I/3pDkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365751; c=relaxed/simple;
	bh=F/2NhTvQoYcHrCoEWLDdV3Gco6Uc84RYWpYsa5Dnf6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNNakTxz0oOBrQdcxkGeQyMOLMXv+ZUYoa1Yci8iAGcWL4aU+ejMQLnOx2B5cisNgpPQM0/NiwcXiDhu6McqDfKkY5ZnnV+i1DO99ueepPqjEJNEQmCfyxtQXc6xI15X5tgF2BvIx0UUrB5sdQr8RTE0y/qo1f0cjZs3uf46qtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsRl/NI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997A6C4CEE7;
	Mon, 13 Oct 2025 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760365751;
	bh=F/2NhTvQoYcHrCoEWLDdV3Gco6Uc84RYWpYsa5Dnf6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CsRl/NI/GDGOUS2eEJYxa1ThhC3yAF9KEAGeSMpwZdyS1BfePHQ/DBHLmsdQjlyRL
	 SvOgfDalU+O+Cq4xQx3W/8b/SMzL54LgCGnhSimpDtO6LWJxtNHnArYdKC1QQ6sy7h
	 1CG2XI5VnCcRvCxxqFLUYT4pwfurJA6TQ0er6ZgsVn0o4sWlEzQwHpNIi/cp5kA0Z9
	 Xnt1m7Qv8cHgVMmBpzQEfJsIm7JimTNzmWr7vIaN9TSwJ7gR3oiZrVw0fAW6beg7g4
	 Qeb1gvEjP1tKc3UNAhdHk7IP+B2Jo1AUaIGrQZqUkjW9bNYChfmI6pI0ODml6ZPqea
	 BB+/hba8BPb0g==
Date: Mon, 13 Oct 2025 16:29:05 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jonathan Denose <jdenose@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Jiri Kosina <jikos@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Lucas GISSOT <lucas.gissot.pro@gmail.com>
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
Message-ID: <auypydfkhx2eg7vp764way4batdilzc35inqda3exwzs3tk3ff@oagat6g46zto>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
 <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
 <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
 <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org>
 <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
 <04df1bb8-8409-4ece-a21c-4c71592eb852@infradead.org>
 <CAMCVhVMO4y9P=Y3SWvY6BvA1sUK2o=Gn6Hk2UpaueNN=6CNHZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVMO4y9P=Y3SWvY6BvA1sUK2o=Gn6Hk2UpaueNN=6CNHZQ@mail.gmail.com>

On Oct 13 2025, Jonathan Denose wrote:
> On Fri, Oct 10, 2025 at 5:52 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> >
> >
> > On 10/10/25 1:30 PM, Jonathan Denose wrote:
> > > Hi all,
> > >
> > > Thanks for looking into this.
> > >
> > > On Fri, Oct 10, 2025 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > >>
> > >> Hi,
> > >>
> > >> I think I found it... see below.
> > >>
> > >>
> > >> On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> > >>> [Top-Posting for easier consumption]
> > >>>
> > >>> Mainly writing this mail to bring Lucas GISSOT in here, who reported the
> > >>> same error yesterday here:
> > >>> https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
> > >>>
> > >>> Lucas there suggested:
> > >>> """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
> > >>> hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
> > >>> Kconfig updated."""
> > >>>
> > >>> And Randy: Thx for the closer investigation! It explains some of the
> > >>> "that feels odd, am I holding this wrong" feeling I had when reporting this.
> > >>>
> > >>> Ciao, Thorsten
> > >>>
> > >>> On 10/10/25 06:50, Randy Dunlap wrote:
> > >>>> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> > >>>>> On 8/19/25 01:08, Jonathan Denose wrote:
> > >>>>>> From: Angela Czubak <aczubak@google.com>
> > >>>>>>
> > >>>>>> Define a new structure that contains simple haptic device configuration
> > >>>>>> as well as current state.
> > >>>>>> Add functions that recognize auto trigger and manual trigger reports
> > >>>>>> as well as save their addresses.Hi,
> > >>>>>> Verify that the pressure unit is either grams or newtons.
> > >>>>>> Mark the input device as a haptic touchpad if the unit is correct and
> > >>>>>> the reports are found.
> > >>>>>>  [...]
> > >>>>>> +config HID_HAPTIC
> > >>>>>> +  tristate "Haptic touchpad support"
> > >>>>>> +  default n
> > >>>>>> +  help
> > >>>>>> +  Support for touchpads with force sensors and haptic actuators instead of a
> > >>>>>> +  traditional button.
> > >>>>>> +  Adds extra parsing and FF device for the hid multitouch driver.
> > >>>>>> +  It can be used for Elan 2703 haptic touchpad.
> > >>>>>> +
> > >>>>>> +  If unsure, say N.
> > >>>>>> +
> > >>>>>>  menu "Special HID drivers"
> > >>>>>
> > >>>>> I suspect this change is related to a build error I ran into today:
> > >>>>>
> > >>>>>   MODPOST Module.symvers
> > >>>>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
> > >>>>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
> > >>>>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
> > >>>>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
> > >>>>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> > >>>>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> > >>>>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
> > >>>>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
> > >>>>>
> > >>>>> The config where this occurred had this:
> > >>>>>
> > >>>>> CONFIG_HID=y
> > >>>>> CONFIG_HID_MULTITOUCH=m
> > >>>>> CONFIG_HID_HAPTIC=m
> > >>>>>
> > >>>>> Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.
> > >>>>
> > >>>> Sure, but that's just covering up the problem.
> > >>>>> First, I get this build error:
> > >>>>
> > >>>> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
> > >>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-haptic.o
> > >>>>
> > >>
> > >> ISTM that tristate is incompatible with this newly added Makefile
> > >> line:
> > >>
> > >> +hid-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
> > >>
> > >> hid-* lists files that should be builtin, not loadable modules.
> > >> These should all be hid-y.  AFAIK, hid-m is not useful.
> > >> (A maintainer can correct me as needed.)
> >
> > More correctly, any .o that is listed as being built as part of
> > hid.o should is going to be controlled by CONFIG_HID and should
> > not its own have a Kconfig symbol at all.
> >
> > E.g. here:
> >  hid-y                  := hid-core.o hid-input.o hid-quirks.o
> > hid-core, hid-input, and hid-quirks don't have their own
> > Kconfig symbols.
> >
> >
> >
> > >> So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
> > >> hid-haptic.c and changing drivers/hid/Makefile to use
> > >> obj-$(CONFIG_HID_HAPTIC_        += hid-haptic.o
> > >>
> > >> fixes the build errors for me.
> > >>
> > >> Angela, Jonathan D., is there any reason that
> > >> hid-haptic needs to be builtin instead of a loadable
> > >> module?  It's no problem for hid-multitouch.ko to call
> > >> into hid-haptic.ko (both as loadable modules) as long as
> > >> hid-haptic.ko is loaded first.
> > >>
> > > As long as hid-multitouch.ko is able to call into hid-haptic.ko I
> > > don't see any issues, but is there a way to enforce that when
> > > CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
> > > hid-multitouch.ko?
> >
> > I only know of two possibilities though there may be more.
> >
> > a. use request_module(true, "hid-haptic");
> >
> > This would probably be used in the hid core somewhere, afterthe device matching is done.
> >
> > b. use udev. When a device that needs hid-multitouch is
> > discovered, have udev load both hid-haptic and hid-multitouch.
> >
> >
> > I see that hid-haptic.h is written so that it has stubs for
> > when CONFIG_HID_HAPTIC is not enabled. Can hid-multitouch
> > operate (in a reduced capacity) when HID_HAPTIC is not enabled?
> > So that they are separate modules and hid-multitouch is not
> > dependent on hid-haptic?
> >
> > There is probably a use case for hid-multitouch without having
> > hid-haptic loaded since hid-multitouch existed without having
> > hid-haptic around at all.
> >
> > It seems that you want both of them loaded. And then Lucas
> > has reported a build error when HID_HAPTIC=m and
> > HID_MULTITOUCH=y, so either (like Lucas said) HID_HAPTIC
> > should be bool, not tristate; or in Kconfig,
> > HID_MULTITOUCH should depend on HID_HAPTIC, which would not
> > allow the problem config that Lucas reported.
> > But that forces devices that want HID_MULTITOUCH to also
> > have HID_HAPTIC loaded, even though they may not need it.

One way around it is to declare a stub struct haptic_operations and let
hid-haptic.ko fill in the function pointers when it loads and remove
them when it unloads. But it can be a little bit tedious, especially
because making it properly working involves RCUs (we don't want to have
mutexes everywhere).

> >
> The idea behind these patches was that hid-haptic would depend on
> hid-multitouch but not the other way around. I am fine changing
> HID_HAPTIC to bool. That's what I had it as initially, but I was asked
> to change it.
> 
> If everyone else is fine with that, I can send out a patch.

I'd still prefer hid-haptic to be tristate, just because
input_ff_memless is tristate as well. Right now distributions don't
support the FF bits, so enforcing this into the kernel seems a little
bit harsh on them and difficult to debug for early adopters.

That being said, that build failure is pretty bad. So please send a
(temporary) fix ASAP. If making it boolean solves the issue, then yes,
send a boolean fix and then we can revisit it. But right now the urgency
is to fix that.

And if making it proper tristate is too hard, then we can leave with
bool.

Cheers,
Benjamin

> > --
> > ~Randy
> >
> -- 
> Jonathan

