Return-Path: <linux-input+bounces-15664-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A8BFE277
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 22:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBC374E8A68
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 20:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFB42F9C23;
	Wed, 22 Oct 2025 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhTz/Stu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAE2F549F
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 20:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164689; cv=none; b=DMglMRazLN4umgua+XmgMbqg6otAuIdBUe6m97gD6IIQA9REseEgVFX2NUxpgXsUSJ6wXabAWmB1S/YYD9V1nUa1QMrLCQGoGXZI24qWI+hBUGhvrXZvUJYESzQcVSSa/DRX+TOjrOZ1P0IHEwIuEDjFRrH40OMaemGTM0wkzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164689; c=relaxed/simple;
	bh=Lh6dW7DHWi6v7GhAsSzdgwRm4VvmSILNHb9M+uDnhAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6nYvJs8rt2VYDjtUVsJY2n1YybbFaB43tndy5+pYqOy1bSbst3LkN3/oJWRiOWl+pJuzKzLNQx+146iTc86S0vd9Uyh4iq6aVHoExU6lL5Kd3qFYjFyJRexqqfFKaUVcs3DF9GAfduOok1vFdJ366IVgCMJ5EVJogxs9E/y/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhTz/Stu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a226a0798cso43064b3a.2
        for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761164687; x=1761769487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Bx7FEgIxtf1pLVS5K11GWxotS0kabqxZBF1gAq0R14=;
        b=EhTz/StuV5KGOW51hwUQPno8AFrJT5vv4ZfHJf93X/y68CpuCuN2hrH0WlVlaQT6qu
         Ktufo4fHl9l8EnBV8UYku7cWAW8N/d0qzdYo4gFZO9a/bf+oMXry4rm40rrm2gDg64Ei
         JmrBSYcDVj8uzCXFjvy55Z37EVXNBrSghfy9bakVuuOX8dbEQKd0OqnUDoHCqCwrJ1jF
         0hqcp7ztgVxKTCcmydYgsGkLcF4NQ1B8OgPf4/L1mZIq6AqptWUooHEdbIxqCpXCdrSZ
         u8KhqUuihUNhjBv9ZRziT8KkVRR+sVmjyyiJAZ9bFXyUiuHEDuc+862AmhGZkCszVM21
         PikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761164687; x=1761769487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Bx7FEgIxtf1pLVS5K11GWxotS0kabqxZBF1gAq0R14=;
        b=DUdif+zUDF9aNu7qRRlL0T1uMwosbOOU1wR2U5S3Hj6uGYw2mW2G4YwZv4lgF5xM/h
         OBE8OIJCp+Cg+PsB/U1VzR2q7DPXRf/QfJMDiwW+PzQ6N8fpdoXGbEYwrZiwSogWmQ2Y
         t0FXTp9GNfAkpBvX0W2WjtCE4Vau4FdVjHhrRcWcBfQOqcAMloIPuBzCSiQJz9o5s1oF
         kxpSLSmIXfCYHLbLzVTx+GizqDNck/oPdRTd07UYYNKQMvB+ywf93pGlvtrfuV1XNB2X
         H6HVqWz43Jljw03gT61TEb0IqlTGkZDqN5qyzO6Q+NooIiCbbIGOF9tm/yCw95UDfaCg
         rRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdVpw/HVfs3ql8FQ5GlcYwS5NVPByFxIBDDsvj4j1cDj9U/ibAAwKv4hWWzjZFWJJ7WbZD4LqS/LlNzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3aWNjy32NQSj5+LdTBAnAXKOvNQwk2lIVhcOoi10Brxc8hrpX
	l2Pic6mrNtQjuGVJujzwn0BqisoRQYFFKXLeghA+y1Z6rVf8JMotbK9L
X-Gm-Gg: ASbGnctdOSnlD3loVncxC7PmBlRkyiW/r+UAEyclqk4MTPlctQP0WHrar31G0ZwX+Da
	X6Nl3szmU1lkh6dHciLyP7RWddgErC29b0d7g6P5s5Eoa8mSOOBl+El32Jgm76l6uKqjZ8hBEVH
	Txb/GAYaubXemCf3pQo9b1UY4ChgDiwjhT/6SulCrBXC5Ee6kUAN+okeZEI6jJ/A+/g+zEmSfxI
	v6YjFssiKq7tJOII4V8ouVbEt0PYgUkQkSmPOpU3UIEc7ABEbpRWaTyhVh3Oa5TgIz1+Ywpm91P
	m4XpW+I2GGLGEozcra6i+mluvn5s81ohBFY/WyKE3JvOn/A4j4mIBF0AHYTmyLelF+bNCvxs6tB
	svJmRMWQSTkdES4vm7J/N91wDfeqgzzuiU7KxSdOfd0xvQRMv86YmwYc2hZgt6SHjSyuFpL2KwB
	sMO1o70Sw957wRvqn7lKefn9QTO0dwT1WUbaThqCJpflkXOlb0zg==
X-Google-Smtp-Source: AGHT+IGOo2oLikL23UA8DEpFwJqGrva5sRrlgk0zACArWqx5qkwzdKQ9hLvW9AadUTvO7cSP3eya3Q==
X-Received: by 2002:a05:6a20:939d:b0:2fb:62bb:e0e with SMTP id adf61e73a8af0-334a8610fe8mr26702608637.32.1761164686718;
        Wed, 22 Oct 2025 13:24:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274abf6d5sm114634b3a.33.2025.10.22.13.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:24:46 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:24:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
Message-ID: <3df27pbmdhv3x5zsfdnyttkliqdetunxwhc5e6yfbqhcbz4e45@l7ddhswxl4tk>
References: <20251020152331.52870-1-hansg@kernel.org>
 <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
 <dfda82fc-1c35-4986-929d-d27ba877aab6@kernel.org>
 <jnlyr7m3q7etnipczqp22ix2ijovvoqnxnopjyrey7mtbryu3c@x7snlzka3euz>
 <7f2a89c3-de22-43fa-b714-626f12fc52be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f2a89c3-de22-43fa-b714-626f12fc52be@kernel.org>

On Wed, Oct 22, 2025 at 09:15:35PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 22-Oct-25 8:40 PM, Dmitry Torokhov wrote:
> > On Wed, Oct 22, 2025 at 08:24:46PM +0200, Hans de Goede wrote:
> >> Hi Dmitry,
> >>
> >> On 22-Oct-25 7:54 PM, Dmitry Torokhov wrote:
> >>> Hi Hans,
> >>>
> >>> On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
> >>>> Hi All,
> >>>>
> >>>> Here is a patch series for adding support for the electronic privacy screen
> >>>> on/off events send on e.g. Dell Latitude 7300 models.
> >>>>
> >>>> On these laptops the firmware does not allow querying the presence nor
> >>>> the status of the eprivacy screen at boot. This makes it impossible to
> >>>> implement the drm connector eprivacy properties API (1) since drm objects
> >>>> do not allow adding new properties after creation and the presence of
> >>>> the eprivacy cannot be detected at boot.
> >>>>
> >>>> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
> >>>> and modifies the dell-wmi driver to use these, so that we can still
> >>>> propagate these events to userspace for e.g. a DE to show an OSD.
> >>>>
> >>>> Dmitry, can we get your ack for the addition of the 2 new keycodes?
> >>>> I think it will be easiest if Ilpo merges the entire series through
> >>>> the pdx86 tree with your ack for the keycodes.
> >>>
> >>> Yes, that should be fine, although I wonder if this is best modeled as a
> >>> pair of keys or a single switch? I know we have touchpad on/off but I
> >>> wonder if it was the best option... Probably more convenient at some
> >>> point if it was done through the atkbd.
> >>
> >> EV_SW has the same problem as the drm property API. The mere presence
> >> of advertising a new SW_PRIVACY_SCREEN capability on an /dev/input/event#
> >> node would convey to userspace that there is an eprivacy-screen and we
> >> also would need to know the initial state (on/off) for using an EV_SW
> >> for this and we know neither presence nor status before hand (1).
> > 
> > How is this different form presence of KEY_PRIVACY_SCREEN_ON/OFF? They
> > also imply that there is a privacy screen.
> 
> I've never seen userspace change behavior depending on which keycodes
> are advertised as possibly being send by a device.

On Chrome OS we are trying to go by what peripherals report, but I can
see that it might not work for a generic Linux distro.

> 
> Typically userspace does not care of the initial state of keys (it
> assumes they all start unpressed), where as for switches the initial
> state matters and we cannot query the initial state here.
> 
> > If we really do not know if there is functionality present or not maybe
> > you can register a 2nd input device for the privacy switch upon
> > receiving the first event for it?
> 
> Yes that is one of the hacks which we use for SW_TABLET_MODE, but
> I do really see this as a hack and I would like to avoid this if
> possible.
> 
> >> The real issue is that the firmware does not tell us if there is
> >> an eprivacy screen. As mentioned the first time we find out is when
> >> the eprivacy screen gets toggled on or off.
> >>
> >> We are having similar issues with SW_TABLET_MODE which userspace
> >> uses to e.g. show / not show an on screen keyboard when a text
> >> entry field is focussed. So the mere presence of SW_TABLET_MODE
> >> can influence userspace without ever sending any events and we
> >> have all kind of special handling in various foo-laptop and
> >> intel-vbtn, etc. drivers for this, which I would like to avoid
> >> here.
> > 
> > Probably have a similar solution: delay registration of corresponding
> > input device until you know the existence/state?
> 
> Right that is already done in some cases. What complicates things
> wrt SW_TABLET_MODE is that we would like to have it present as soon
> as the driver probes so that a 2-in-1 which is booted in tablet mode
> behaves correctly from the start. Most of the firmware APIs for
> SW_TABLET_MODE support getting the initial state, but their implementation
> can be unreliable. So we only fallback to the delayed registration
> for known unreliable models, which requires quirks...
> 
> This is getting a bit offtopic but it does show why I'm not in
> favor of using EV_SW style input-devices when there is no reliable
> initial state.
> 
> >> So having ON / OFF EV_KEY events which we only generate when
> >> there is an actual eprivacy on/off event are by far the most KISS
> >> and fool proof solution.
> > 
> > This assumes you assign special meaning to it (i.e. pretend that it is
> > not really there until you see events).
> 
> As I see it there are 2 cases:
> 
> 1. We can query the presence and status of the eprivacy screen at
> boot, this would map nicely to a SW_EPRIVACY_SCREEN, but we already
> have the drm properties API for this and this was put in DRM because
> this ties the privacy screen to a specific output which is useful
> to know.
> 
> 2. The first thing we findout / hear about an eprivacy screen is
> a eprivacy on/off hotkey press. Notice the "hotkey" there iow
> this event gets send as the result of a key-press event.
> 
> For 2. I think that just modelling this as the key events which
> these also happen to actually be is much simpler then dynamically
> registering a second input device on the first such a key press
> 
> and I also think that the userspace side will be simpler with
> just key-press events rather then having to deal with the dynamic
> second device registration + reading an EV_SW .

OK, I agree that if you have a reliable way of querying the state you
can simply go with the DRM properties solution.

Since this keys are in effect notification only, not something that
userspace needs to actively handle, I don't suppose you can add another
state to the DRM privacy-screen hw-state: "unknown" and update it when  
the state becomes known?

Thanks.

-- 
Dmitry

