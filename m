Return-Path: <linux-input+bounces-12022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9DA9E7C1
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 07:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0B63AE84D
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 05:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D418C31;
	Mon, 28 Apr 2025 05:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrlKUGxm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD923DE;
	Mon, 28 Apr 2025 05:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745818229; cv=none; b=NFYRY8UUUW8FrvFNunSSEWckEaORLnjqqyrySlPkkjOW6Tb6gnkLcu85DswYskm2702z9gwSq0z/12IttEBdSUhFGyXKTDivM+wyPTRU7vRlUnb7zv4PZKX4cTOXiv89pin4Bhwr/X4SQ2wLsWd4Cju/o8/v/gUPu9VKyH/AZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745818229; c=relaxed/simple;
	bh=RV+6d3vBAxJN1ELCPGKND9EjSArrhTlq6/VIyBYsyZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHEeQXtGEoPIxsNVwStW5ruyTb189J4Qhmz+Bt6AILbSi9aFmWh1vcCeXLm26E99K4dhs5zqt/TX+yvEMz2LT6w7E3i7/idXyqhyukwP8+MIcXfJ2cYdu+lWv0lmGutbun91+tfYUHqlk39q3CqG4xSk2sUSL2UDhhSVcAcnCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrlKUGxm; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so3016629a12.3;
        Sun, 27 Apr 2025 22:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745818227; x=1746423027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GxEmjasGq7pyNh4crl/y6uvWlzIOvpEG1gyWf0NOUEw=;
        b=GrlKUGxm3kEye54RNH45cP8QfNlvzDTWE72/8/sfCCn4nm8TTvvhJWmrUZDgSZ9+ad
         qzdE5Ht26F8l3RwiHycI9+ybGz2A5SeFbUxMIkd40mQMQXMLe7WRBkxaMSnBCKRXzOIA
         fHb4sCqk2O5bIow35TlSIZ4S/KuSVWGArtX18KYHjM/4BEVSKiZi420rMCpS3V4TvOO9
         nb8eXgmBuZz/GMjNTbqM+HhJIsHvIgEwr1JReseArksuEWOA7Uv2jO6UUHqujX2c5k42
         HKCc2gR8lVxuNddnB2ptwKaGuQ70B9midGnFYonnB3BAnGcZj9A2l7yUE5YSDsmlvjxk
         8IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745818227; x=1746423027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxEmjasGq7pyNh4crl/y6uvWlzIOvpEG1gyWf0NOUEw=;
        b=ODd/tk60ksPHtAVBfZbl6I1E4O4zSWjf8Jz0aeiCd7Qu7A4eYlTWw2AIG20p9N9xOr
         RK/emU64z3VIpBbZYghAbdI+IIRJJ48ZuAVrMRkwZ+k85JXGEWsAvzHWauofQRF4uRGy
         kHDkbX4UmMdh+aUQowiSP3T/emzmm7bSadzvG3dGc+O1OsA+U4NnFtnWpTTwGaQppJBc
         BoR3pKsFLBaZ36osqVObhksJi74vKPokMO/9HNYbu3tlr0eOln6qUBMsKeWyouTsbjT/
         8XCKeXRDPHNWXUEIWtbyFAsM5qvEEc7pacqAzmeBC1EsWp8JMl4Rwt+KOLNH2X+Crlnu
         /YHA==
X-Forwarded-Encrypted: i=1; AJvYcCVF01ct7ISKZCJcs7Tea5oRqmeJadYVtbqU95uAXZu6Py1XQ9GNz2yHYglQf8s9fmvAy/DCNEeRriKQIiGP@vger.kernel.org, AJvYcCXNgm1CmGatvrv7/tCeeqp/1+QFl8DEiWTmvPimDizuDdoXXxGnR3bgcj5YTsulov+b7YLCB0a5r5BiuSuRyMyp6C7kgw==@vger.kernel.org, AJvYcCXZdC5hKdJc0bHN/n2ry9sCKZ/mjXGBoh/a5CdJ2W2LqEwYW7pMiti/BtX2K7LUeGr+6uEaemC8xy+0XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB7JpQTiINgNenR4RlsqD9PY4z6c9jjvmJ+4/NQl1pliryR9al
	KQ1m6OuD8sBnG4cZsvieygAxnvBES3Yl1ftZr2nLCstReOBF05ib
X-Gm-Gg: ASbGncvCjh333dFF+/j0ImSNc8IrA7w1+0+ogaVWngBBrA4//DQe+01ASshu2uW/oG8
	9mo7HnJj5MOgV4i737LK1ii4B403vghtHOVIjjQ+kauC3tV+0gIa6ECSE3u4mXR41G+80dZ6O1j
	4i8nyoSrv+ZOEiSs2VxEKP7QI7x8MCo08EVDVoL+Rm5tEjXfrd7VKDqSxqPEHx4FPmgkUs6JzbZ
	yn4hhzqiUKPcrxi3hlif675wnJBxPpZ2WMrB1Bt4T8W50kPs92jqkyHgaTIHKSu0PosZKD+IKbF
	HJX9IBdT+HMQHv5Nngohcrpk83vFEJDPy1JCEsiO
X-Google-Smtp-Source: AGHT+IFxeCckgDAxwSP5wKRWrr/r2XG1A/wLGdPDm4FZKGt8MDYuIBQVnSfXYlzvxngWGiR/7mDiOw==
X-Received: by 2002:a05:6a20:2d22:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-2045b754682mr15117186637.20.1745818227473;
        Sun, 27 Apr 2025 22:30:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941eecsm7327900b3a.54.2025.04.27.22.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 22:30:26 -0700 (PDT)
Date: Sun, 27 Apr 2025 22:30:24 -0700
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
Message-ID: <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
 <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
 <aA3KXNCKKH17mb+a@duo.ucw.cz>
 <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>

Apologies for extended absence...

On Sun, Apr 27, 2025 at 07:15:31AM -0500, Mario Limonciello wrote:
> 
> 
> On 4/27/25 01:10, Pavel Machek wrote:
> > Hi!
> > 
> > > > > > > In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
> > > > > > > to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
> > > > > > > to lock the screen. Modern hardware [2] also sends this sequence of
> > > > > > > events for keys with a silkscreen for screen lock.
> > > > > > > 
> > > > > > > Introduced a new Kconfig option that will change KEY_SCREENLOCK when
> > > > > > > emitted by driver to META + L.
> > > > > > 
> > > > > > Fix gnome and kde, do not break kernel...
> > > > > 
> > > > > I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
> > > > > 
> > > > > That's going to break modern hardware lockscreen keys.  They've all
> > > > > obviously moved to META+L because that's what hardware today uses.

Vendors do all kind of weird things. They want to ship their
peripherals here and now and they do not care of shortcuts will change a
few years down the road.

FWIW there are plenty of external keyboards that use KEY_SCREENLOCK and
do not emit any shortcurts. Anything that is "Woks with Chromebooks"
will use KEY_SCREENLOCK.


> > > > 
> > > > Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
> > > > screen locking, no?

KDE by default recognizes Meta+L combination (which used to be
Alt+Ctrl+L), Screensaver key, and allows users to define their custom
shortcuts.

I also wonder how many other DEs beside Gnome do not recognize
KEY_SCREENLOCK.

> > > 
> > > This was actually the first path I looked down before I even started the
> > > kernel patch direction for this problem.
> > > 
> > > GNOME doesn't support assigning more than one shortcut key for an action.
> > 
> > So if I want to start calculator on meta+c on internal keyboard, and
> > have calculator button on USB keyboard, I'm out of luck?
> 
> Yeah AFAICT that's the case.
> 
> > 
> > Sounds that should be fixed :-).
> 
> GNOME is commonly known to try to have a very simplistic UX instead of
> exposing more knobs and buttons.
> 
> Adding support for multiple key combinations in a UX means convincing the
> GNOME design team to support this, followed by actual changes.

So there is a simple and wrong way of fixing this (introducing a
hardcoded combination for  shortcut du jour in the kernel) and
complicated one of making one of poplar DEs behave better and be more
flexible. We will not be adding the wrong one to the kernel.

If someone wants to do this kind of translation they are free to have a
tiny uinput daemon.

> 
> > 
> > Alternatively, you can just turn KEY_SCREENLOCK into META+L inside
> > Gnome.
> > 
> > BR,
> > 									Pavel
> 
> Or I can just go back to changing this locally in the PMF driver and it
> works everywhere without needing to convince every userspace to make a
> change to add special mappings.
> 
> As there isn't appetite from input maintainers to have a mapping in the
> input layer I think I'll go that direction for a v5.

I think this would be a mistake. I'll mention that on the other posting.

Thanks.

-- 
Dmitry

