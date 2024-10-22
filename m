Return-Path: <linux-input+bounces-7611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389E9A9D71
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 10:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2645283333
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 08:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E703187864;
	Tue, 22 Oct 2024 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwqCG5zN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2D14EC4E;
	Tue, 22 Oct 2024 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729587099; cv=none; b=rws0qHrh4qKovx3n2r8ixXKPcQhsaH/vUNikeJpNizbpYMiJlFugYme/wpKe7rRmmC9kSgloPxKt3iK1Y2vd52QRyf/ySdBP5ieCP3183VUZHTpi1qHWGjCyxce5/s7+LFRfHfI6zGwKvpsl4qMSldttnsn7BHYDnQTsjDZVCUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729587099; c=relaxed/simple;
	bh=qqV0Cw4G1rGc92pDeHBVr7u8eN+MvnuOQbCULxR7YYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aN/fPvvgioiBKg3fEmwlxEl5yvojjy9F0A2T4GSUk6yOXe1mQJVVKM/XU7MgQ8C+rWHxJzrF4JFAUUynVehxWUiMt5KBI/7ZsNVmwMDK21c+50EpSbHI/N5LuE3P4k61WeZfixinSTjw21mSKiE/cxm5jQ4KjZdnwG36PfbYVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwqCG5zN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EA6C4CEC3;
	Tue, 22 Oct 2024 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729587098;
	bh=qqV0Cw4G1rGc92pDeHBVr7u8eN+MvnuOQbCULxR7YYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GwqCG5zNGfobP04GollHwemOFiANjht8MfZD3gxpn6uaLoUFbUbYSTiaPR4Wt3laM
	 t07Y8I07CLJh1SAAZ0QP4iwPUk5eMpI/pQfu7tJkPDEJKel5WyRt485nf0jItrY/Bw
	 5+Wl1O5ruAySb/iltex/+2c52o5dPeejaTP4YF1utDh27taZx0TZBPPp3KD//DFz9Q
	 A0T1OTMxxSkNixYaeV820T4xhY/xr5ttvfqMx6v0KWPfqemzYgL07bPO/15SrFSSzB
	 58zoVib349eXauKxN1a0iDAPNm3QkKrOVckmrTab5kf4mrKmtIsc2H8up/cs3wVWuq
	 ef5wX85Bd77Fg==
Date: Tue, 22 Oct 2024 10:51:33 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>, 
	Werner Sembach <wse@tuxedocomputers.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
References: <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>

On Oct 22 2024, Hans de Goede wrote:
> Hi Armin,
> 
> On 21-Oct-24 10:26 PM, Armin Wolf wrote:
> > Am 11.10.24 um 17:26 schrieb Pavel Machek:
> > 
> >> Hi!
> >>
> >>>> 1.
> >>>> https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
> >>>> -> Should be no problem? Because this is not generally exposing wmi
> >>>> calls, just mapping two explicitly with sanitized input (whitelisting
> >>>> basically).
> >>> It would be OK to expose a selected set of WMI calls to userspace and sanitizing the input of protect potentially buggy firmware from userspace.
> >>>
> >> I don't believe this is good idea. Passthrough interfaces where
> >> userland talks directly to hardware are very tricky.
> >>
> >>> Regarding the basic idea of having a virtual HID interface: i would prefer to create a illumination subsystem instead, but i have to agree that we should be doing this
> >>> only after enough drivers are inside the kernel, so we can design a
> >>> suitable interface for them. For now, creating a virtual HID
> >>> interface seems to be good enough.
> >> I have an RGB keyboard, and would like to get it supported. I already
> >> have kernel driver for LEDs (which breaks input functionality). I'd
> >> like to cooperate on "illumination" subsystem.
> >>
> >> Best regards,
> >>                                 Pavel
> > 
> > Sorry for taking a bit long to respond.
> > 
> > This "illumination" subsystem would (from my perspective) act like some sort of LED subsystem
> > for devices with a high count of LEDs, like some RGB keyboards.
> > 
> > This would allow us too:
> > - provide an abstract interface for userspace applications like OpenRGB
> > - provide an generic LED subsystem emulation on top of the illumination device (optional)
> > - support future RGB controllers in a generic way
> > 
> > Advanced features like RGB effects, etc can be added later should the need arise.
> > 
> > I would suggest that we model it after the HID LampArray interface:
> > 
> > - interface for querying:
> >  - number of LEDs
> >  - supported colors, etc of those LEDs
> >  - position of those LEDs if available
> >  - kind (keyboard, ...)
> >  - latency, etc
> > - interface for setting multiple LEDs at once
> > - interface for setting a range of LEDs at once
> > - interface for getting the current LED colors
> > 
> > Since sysfs has a "one value per file" rule, i suggest that we use a chardev interface
> > for querying per-LED data and for setting/getting LED colors.
> > 
> > I do not know if mixing sysfs (for controller attributes like number of LEDs, etc) and IOCTL
> > (for setting/getting LED colors) is a good idea, any thoughts?
> 
> I wonder what the advantage of this approach is over simply using HID LampArray
> (emulation), openRGB is already going to support HID LampArray and since Microsoft
> is pushing this we will likely see it getting used more and more.
> 
> Using HID LampArray also has the advantage that work has landed and is landing
> to allow safely handing over raw HID access to userspace programs or even
> individual graphical apps with the option to revoke that access when it is
> no longer desired for the app to have access.
> 
> HID LampArray gives us a well designed API + a safe way to give direct access
> to e.g. games to control the lighting. I really don't see the advantage of
> inventing our own API here only to then also have to design + code some way to
> safely give access to sandboxed apps.
> 
> Note that giving access to sandboxed apps is a lot of work, it is not just
> kernel API it also requires designing a portal interface + implementing
> that portal for at least GNOME, KDE and wlroots.
> 
> Personally I really like the idea to just emulate a HID LampArray device
> for this instead or rolling our own API.  I believe there need to be
> strong arguments to go with some alternative NIH API and I have not
> heard such arguments yet.

Agreed on everything Hans said.

I'll personnaly fight against any new "illumination" API as long as we
don't have committed users. This is the same policy the DRM folks are
applying and it makes a lot of sense:
We can devise a lot about this new API, but if we don't have users for
it, it's energy wasted.

When I mean users, I'm not talking about an example in the kernel tree
or some quick prototype. I mean talking to the existing folks already
doing that and getting their stamp of approval and have an actual
integrated prototype.

We know that OpenRGB and probably others will implement LampArray, if
not for Linux, at least for Mac and Windows. So we will have users for
this protocol. A new Linux specific protocol should be discussed with
them, but I doubt that they'll be happy writing an entirely new
abstraction layer because of Linux.

Cheers,
Benjamin

