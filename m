Return-Path: <linux-input+bounces-12023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBFA9E7D5
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 07:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B143B0492
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 05:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC679185E7F;
	Mon, 28 Apr 2025 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKB61EZi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D2046B5;
	Mon, 28 Apr 2025 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745819498; cv=none; b=jbS0LemhYAKVI7zx1TvFOcTQw7VbO5FhcWHlQZkeCdR94keByRsxGCoqjjlYHnsbpRJEY/PSVsbp7SROy8VnaJA7/1TziLfcTR4Cpnu1oRQdapaf6rBacS+tdXiAYVJMXkqeWhTb/lwAAQTgOqAd4cDwGG0sGkiR++I03kYPC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745819498; c=relaxed/simple;
	bh=fBWfZMks/xNpDQZPHQn7cdiv6dcEzlGaK2uFCX0L0LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRe/HlfAaC8tQip3r/b7Fs/US61pvLkrYXyxPNF1HWBPvU3yh1zNg4SNFzVZs9S4aFB1NBRmbtw2iwOUpfzHt9TRi4XqQXJDbpg+UZALpr4k7cv363h4EbJEQPrWcS0roqGFNVq5ZWkoIOFTQZ45Bd0g1zbA+SsHv6hraVz3aUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKB61EZi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22423adf751so44296185ad.2;
        Sun, 27 Apr 2025 22:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745819496; x=1746424296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aJj6MHwH4JxPx3ZC0hjq4LRz4vzPTDlUe19nZjMz/Z0=;
        b=dKB61EZifrkvucAvBSKSssxuJr9QRwwxpkx/eeF5I0lW8wyJnOiFrQdCf7WREXrstX
         QGkyXtUK7OHE5c/yZDGC/zLtceKSG5SY/Os5dcD8PK7JmOhKWvKaE6w3o1kzd9k0Oji6
         XAyGSyk1HHQo/5hidvg4RhF0BN1jZigEAs38Ome52A1pk/Cg1siBukTgdySuktY2Zf6J
         HlXRADFVdeAhOlrrcXjar9P9TP6ERyg3hw7/JeSA1o9CB3nqB5YcHE73zrj2AvLRADtT
         Xy7fRPMuGWbkR5KWRdTBk0medFfhL6wvfglXKDn5HnCQ4RpsBx7hDZDcsCQPFD1MUKxv
         btuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745819496; x=1746424296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJj6MHwH4JxPx3ZC0hjq4LRz4vzPTDlUe19nZjMz/Z0=;
        b=OPGPSUWi+kxzcaZZohG5MJSVYckTBGXQVbjO+EYCa+IMMuO7UGm4MHNXzl+ZeBGlFm
         HFzkO4PvGVoXBx9Eby9Nl3X7uvE5vE06BXY9iEDj8j6YWT/shvFOlen73nyRPEqXitdl
         9gDu1bPfnacdhoFT2Q1yD9R3nnyoTr2Si84fwz0qycopsEPodu5fqkd1O4dhOhqOTtd2
         huwhHXDY4uBXZHMBYr/fKKV8kbF8j6s6YfTBcmuiQu3prE/qK4BkJVEE1eFng1RuMZ+C
         CHto6XYlvhzK3JQDqs2IxsHzw5YmeO1S6MOAXfBcIziUQpSFlTmaXRu/mhcaBHLD/ecN
         3UKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHyi3MuIClhRWV9ag/b1Lwb6tKgcqf4XNdeQKsXtR6L8Jj0yXTlAELBlHgQ8CL4gLGLqhyqITmHjMkqjL2@vger.kernel.org, AJvYcCUiUdVaq4zdis1Ozxij9ucD6tcdMEPSzN2vUeOMDKc6DKKipOSGRuKMzLZevMi/M0y6kexG/TuxAMYKf3cIoDNRJvg2Fw==@vger.kernel.org, AJvYcCVw9rmpcq3+ydg4ytMpNCzSYF95EeZG8RPgH2JwK5oBFIOd3ns5KUe3xHHC+NpLpQ47bCgtEiGyDCULQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHpp0H+Infd93gVbJOp8pEo6X8Av/bd77H63qKrblbERi7HYB
	FaceYkSdXA5UYUv2hYj90m9DokVIx2iaUnZfw1+YD64isWdKQwGL
X-Gm-Gg: ASbGncuyOTE6Dnemd6IlCvjqaSW2K/ON71G2DAa+MqcqWnEtGGmqpUTUEtuZ8l8hJXT
	HTmVa8UgauctnA5OzPvLKyPKP76UH9+c2u3A7uolhluPhIq00vohoy9wa+NMPHGNYkKpThDg129
	I8QNNQWSr12F8MhyKLFYFwT/Al0gBrrpk6BjFf1cpQ82G4mudJWbBCLy0g7hrzZwxemzJdD7Nes
	r7rsr78xM3EAlzL0KErGN0XZda6EsYwAst6pv6OxMAhCWjbCtzAx/zXNq5clJnbnSua09Zj89e5
	Qhvhygjn0MDMmOgNJBBCjcR8ykxvjQO3l388IWaK
X-Google-Smtp-Source: AGHT+IE56vErmrfFXk09hCFdzyV16haH4ppZQVgDpIFf/VM+2oiixXo4I+AHK1KpetrjF9SdAjZrLw==
X-Received: by 2002:a17:902:f651:b0:224:24d3:60f4 with SMTP id d9443c01a7336-22dbf5ef6bdmr161587605ad.15.1745819496211;
        Sun, 27 Apr 2025 22:51:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e75c9sm73670495ad.108.2025.04.27.22.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 22:51:35 -0700 (PDT)
Date: Sun, 27 Apr 2025 22:51:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>, 
	Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
Message-ID: <owigkmidrmavvcdewxx3fvqyp4klvchklgwbtpzncqiado4kwb@akuzxqxp5jpm>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
 <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
 <aA3KXNCKKH17mb+a@duo.ucw.cz>
 <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>
 <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>

On Sun, Apr 27, 2025 at 10:30:24PM -0700, Dmitry Torokhov wrote:
> Apologies for extended absence...
> 
> On Sun, Apr 27, 2025 at 07:15:31AM -0500, Mario Limonciello wrote:
> > 
> > 
> > On 4/27/25 01:10, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > > > > > In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
> > > > > > > > to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
> > > > > > > > to lock the screen. Modern hardware [2] also sends this sequence of
> > > > > > > > events for keys with a silkscreen for screen lock.
> > > > > > > > 
> > > > > > > > Introduced a new Kconfig option that will change KEY_SCREENLOCK when
> > > > > > > > emitted by driver to META + L.
> > > > > > > 
> > > > > > > Fix gnome and kde, do not break kernel...
> > > > > > 
> > > > > > I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
> > > > > > 
> > > > > > That's going to break modern hardware lockscreen keys.  They've all
> > > > > > obviously moved to META+L because that's what hardware today uses.
> 
> Vendors do all kind of weird things. They want to ship their
> peripherals here and now and they do not care of shortcuts will change a
> few years down the road.
> 
> FWIW there are plenty of external keyboards that use KEY_SCREENLOCK and
> do not emit any shortcurts. Anything that is "Woks with Chromebooks"
> will use KEY_SCREENLOCK.
> 
> 
> > > > > 
> > > > > Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
> > > > > screen locking, no?
> 
> KDE by default recognizes Meta+L combination (which used to be
> Alt+Ctrl+L), Screensaver key, and allows users to define their custom
> shortcuts.
> 
> I also wonder how many other DEs beside Gnome do not recognize
> KEY_SCREENLOCK.

So I poked around Gnome a bit. According to the gnome-settings-daemon
source code KEY_SCREENLOCK should be recognized. It is set up as
"screensaver-static" key which is hidden and shoudl not be changed by
user:

https://github.com/GNOME/gnome-settings-daemon/blob/master/data/org.gnome.settings-daemon.plugins.media-keys.gschema.xml.in#L504

    <key name="screensaver-static" type="as">
      <default>['XF86ScreenSaver']</default>
      <summary>Lock screen</summary>
      <description>Static binding to lock the screen.</description>
    </key>



> 
> > > > 
> > > > This was actually the first path I looked down before I even started the
> > > > kernel patch direction for this problem.
> > > > 
> > > > GNOME doesn't support assigning more than one shortcut key for an action.

It sure does even if it is not shown in UI. Poke around with
dconf-editor and look in /org/gnome/settings-daemon/plugins/media-keys/
and you will see plenty of "*-static" keys with multiple
keycodes/shortcuts assigned.

"touchpad-toggle-static" - ['XF86TouchpadToggle', '<Ctrl><Super>XF86TouchpadToggle']
"rotate-video-lock-static" - ['<Super>o', 'XF86RotationLockToggle']

and so on...

Maybe Gnome broke screen lock key in recent release?

Thanks.

-- 
Dmitry

