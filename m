Return-Path: <linux-input+bounces-177-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AF7F2E75
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 14:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B4628188E
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB534A9B0;
	Tue, 21 Nov 2023 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR3ePWLZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD532168CB;
	Tue, 21 Nov 2023 13:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746AAC433C9;
	Tue, 21 Nov 2023 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700573877;
	bh=dM931tHIvx5PgNza4hqCxEgSnaT/GM+RuhzruNQGcQs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sR3ePWLZlRHca+ae7IPYtfSGqAr0/bHVAEqyfaDO2CzV+1wt9BrIgYtWnTv0+Kx/r
	 N341b6KrUP6Vmukg2st+9QUzrJefvybEWb8tD4G50EXn2shObI+eXkvp4525Gbm0fs
	 cmSgYPw9EM/WrUUeiWhn384sL2hLAb4tqZOu3fZE03IAYi/PKtKkJEgNXMK7Tc61nh
	 zt3Kaag7f/XOZhN20FSBRD3ainOgbo1Qgka96I26IeyV8B6Y91nny6F+orzA04dzL+
	 CmqCyKlwzCuavAC8afoYMjJUTXO+qCacucfx8M2QZb8JzFjru3+XKuVm3GSNQsp+Lh
	 jERuwSl9YY8+Q==
Date: Tue, 21 Nov 2023 14:37:52 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Regressions <regressions@lists.linux.dev>, 
    Linux Input Devices <linux-input@vger.kernel.org>, 
    Thorsten Leemhuis <regressions@leemhuis.info>, 
    Mavroudis Chatzilazaridis <mavchatz@protonmail.com>, 
    =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, 
    Bastien Nocera <hadess@hadess.net>, LinuxCat <masch77.linuxcat@gmail.com>, 
    Marcelo <mmbossoni@gmail.com>, Takashi Iwai <tiwai@suse.de>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
In-Reply-To: <ZVyr-of1X4RudpWG@archie.me>
Message-ID: <nycvar.YFH.7.76.2311211435050.29220@cbobk.fhfr.pm>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com> <ZVyr-of1X4RudpWG@archie.me>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Nov 2023, Bagas Sanjaya wrote:

> Hi Thorsten and all,
> 
> On Thu, Nov 02, 2023 at 09:11:42PM +0700, Bagas Sanjaya wrote:
> > Hi,
> > 
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> > 
> > > Hello,
> > > After upgrading from 6.5.9 to 6.6.0, my keyboard started acting really weird in its wireless mode, key actions sent are completely wrong, see video attached. 
> > > 
> > > Most keys are perceived as either E, 3 or F7, with F8 and <, as well. 
> > > 
> > > Modifier keys (CTRL, ALT, ALT GR, Shift and Super) are working normally, as well as media control keys (pause/play, previous, next, mute and sound up/down).
> > > 
> > > The keyboard works as expected if it's wired.
> > 
> > Another reporter bisected the regression:
> > 
> > > Bisected to 
> > > 
> > > 9d1bd9346241cd6963b58da7ffb7ed303285f684 is the first bad commit
> > > commit 9d1bd9346241cd6963b58da7ffb7ed303285f684
> > > Author: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> > > Date: Sun Jul 16 18:23:44 2023 +0000
> > > 
> > > HID: logitech-dj: Add support for a new lightspeed receiver iteration
> > > 
> > > The lightspeed receiver for the Pro X Superlight uses 13 byte mouse reports
> > > without a report id. The workaround for such cases has been adjusted to
> > > handle these larger packets.
> > > 
> > > The device now reports the status of its battery in wireless mode and
> > > libratbag now recognizes the device and it can be configured with Piper.
> > > 
> > > https://github.com/libratbag/libratbag/pull/1122
> > > 
> > > Co-developed-by: Filipe Laíns <lains@riseup.net>
> > > Signed-off-by: Filipe Laíns <lains@riseup.net>
> > > Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> > > Reviewed-by: Bastien Nocera <hadess@hadess.net>
> > > Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> > > 
> > > drivers/hid/hid-ids.h | 1 +
> > > drivers/hid/hid-logitech-dj.c | 11 ++++++++---
> > > 2 files changed, 9 insertions(+), 3 deletions(-)
> > 
> > See Bugzilla for the full thread.
> > 
> > Anyway, I'm adding this regression to regzbot:
> > 
> > #regzbot introduced: 9d1bd9346241cd https://bugzilla.kernel.org/show_bug.cgi?id=218094
> > #regzbot title: Logitech G915 Wireless Keyboard key event only detects few key codes
> > #regzbot link: https://streamable.com/ac6l8u
> > 
> 
> There's no reply from culprit author nor linux-input people (did they miss
> this regression?). And on Bugzilla, other reporters replied that reverting
> the culprit fixed the regression.
> 
> FYI, there's similar Bugzilla report on [1].

As there was no reaction from Mavroudis in order to figure out why he is 
not observing the issues the other reporters do and what to do to fix 
those, I already do have revert in my queue for -rc3.

My first guess would be that the extra buttons in the extended report are 
not properly reflected in the emulated report descriptor, but that 
wouldn't explain why it worked for the author of the commit.

So revert it is, and once Marvoudis resurfaces, we can try again for some 
of later releases.

-- 
Jiri Kosina
SUSE Labs


