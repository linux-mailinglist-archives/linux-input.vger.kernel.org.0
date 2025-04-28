Return-Path: <linux-input+bounces-12043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8BA9F2BB
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 15:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1978516D6D0
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 13:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AF42686B7;
	Mon, 28 Apr 2025 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WffDrwpx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EA716A94A;
	Mon, 28 Apr 2025 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745848249; cv=none; b=eg+W+MAvuz55iDSGKlHd8HZ+ThpROSosrRQWXipnsQWyqye9aMyPnvGQ6EXzxjuTm/Suf1wPQeQUi9hpIgyZvf5qC/hyscjFmGsoAVTpo0vplXk0cnVQHd+9hAhoM4uwrrINv+Cyu6ckSOHpeKrap7GEVhqpjqKqACUI8yy5aew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745848249; c=relaxed/simple;
	bh=/EUQY98NFzeIEIUFDQZR6dkrXp0+5Uo3ivzFJbutpQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7G6ojXaBywmoebNP+WeimC83MiXtfiESTczHhBoKAmofeesmV3zW3STDeOBAdlTURoXmzPt+2C6V9spDy0KZSvGCOnho0FHCu2LU5Tde3ro8BoGfwtgep+SenfIaQTNJTVi1nMoqMCZ6sIu66YlpFClZHHXEd7A4iE1vXj8tio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WffDrwpx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468BBC4CEE4;
	Mon, 28 Apr 2025 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745848249;
	bh=/EUQY98NFzeIEIUFDQZR6dkrXp0+5Uo3ivzFJbutpQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WffDrwpxJBR6sKe7djK8zG6L8beJGTvRL4uFGMOX1XekZO84Dxt9hvuAWYcgr9Itm
	 A5dwuBOIIL8YW/4CjUCZQ27q8j4D2zB63rTtoQyu+JdnAedvhKC6Cuv8ecr9XCaaWy
	 nV8z3N+ZYF307mIcNoSZ92Y9b9be9khlhIyELyRd6B9ncNmyt+e4XyfV9c6ezfeR1F
	 kL9abguIPcPmGI7D0T46UDgLG5nHV2Amvx8icDl8J5iU+wPIe0DRzQo8idTR4EP5XH
	 twJr30Hib0vtMvop1V/Umo8tsd/3FcKdtCslh7t52sk9x/LDRp6o/WT6H5YB5D0Vat
	 FSxRc1nt83GFQ==
Message-ID: <a7e82a84-2610-4132-90a8-42b371f57fb0@kernel.org>
Date: Mon, 28 Apr 2025 08:50:46 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf <W_Armin@gmx.de>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
 <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
 <aA3KXNCKKH17mb+a@duo.ucw.cz>
 <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>
 <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>
 <owigkmidrmavvcdewxx3fvqyp4klvchklgwbtpzncqiado4kwb@akuzxqxp5jpm>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <owigkmidrmavvcdewxx3fvqyp4klvchklgwbtpzncqiado4kwb@akuzxqxp5jpm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/2025 12:51 AM, Dmitry Torokhov wrote:
> On Sun, Apr 27, 2025 at 10:30:24PM -0700, Dmitry Torokhov wrote:
>> Apologies for extended absence...
>>
>> On Sun, Apr 27, 2025 at 07:15:31AM -0500, Mario Limonciello wrote:
>>>
>>>
>>> On 4/27/25 01:10, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>>>>>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>>>>>>>>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>>>>>>>>> to lock the screen. Modern hardware [2] also sends this sequence of
>>>>>>>>> events for keys with a silkscreen for screen lock.
>>>>>>>>>
>>>>>>>>> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
>>>>>>>>> emitted by driver to META + L.
>>>>>>>>
>>>>>>>> Fix gnome and kde, do not break kernel...
>>>>>>>
>>>>>>> I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
>>>>>>>
>>>>>>> That's going to break modern hardware lockscreen keys.  They've all
>>>>>>> obviously moved to META+L because that's what hardware today uses.
>>
>> Vendors do all kind of weird things. They want to ship their
>> peripherals here and now and they do not care of shortcuts will change a
>> few years down the road.
>>
>> FWIW there are plenty of external keyboards that use KEY_SCREENLOCK and
>> do not emit any shortcurts. Anything that is "Woks with Chromebooks"
>> will use KEY_SCREENLOCK.
>>
>>
>>>>>>
>>>>>> Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
>>>>>> screen locking, no?
>>
>> KDE by default recognizes Meta+L combination (which used to be
>> Alt+Ctrl+L), Screensaver key, and allows users to define their custom
>> shortcuts.
>>
>> I also wonder how many other DEs beside Gnome do not recognize
>> KEY_SCREENLOCK.
> 
> So I poked around Gnome a bit. According to the gnome-settings-daemon
> source code KEY_SCREENLOCK should be recognized. It is set up as
> "screensaver-static" key which is hidden and shoudl not be changed by
> user:
> 
> https://github.com/GNOME/gnome-settings-daemon/blob/master/data/org.gnome.settings-daemon.plugins.media-keys.gschema.xml.in#L504
> 
>      <key name="screensaver-static" type="as">
>        <default>['XF86ScreenSaver']</default>
>        <summary>Lock screen</summary>
>        <description>Static binding to lock the screen.</description>
>      </key>
> 
> 
> 
>>
>>>>>
>>>>> This was actually the first path I looked down before I even started the
>>>>> kernel patch direction for this problem.
>>>>>
>>>>> GNOME doesn't support assigning more than one shortcut key for an action.
> 
> It sure does even if it is not shown in UI. Poke around with
> dconf-editor and look in /org/gnome/settings-daemon/plugins/media-keys/
> and you will see plenty of "*-static" keys with multiple
> keycodes/shortcuts assigned.
> 
> "touchpad-toggle-static" - ['XF86TouchpadToggle', '<Ctrl><Super>XF86TouchpadToggle']
> "rotate-video-lock-static" - ['<Super>o', 'XF86RotationLockToggle']
> 
> and so on...
> 
> Maybe Gnome broke screen lock key in recent release?
> 
> Thanks.
> 

Thanks for your feedback and looking into what GNOME is doing.  It sure 
/sounds/ like this should have worked with no kernel changes and GNOME 
has a bug with the lock screen key.

I'll abandon the kernel series.

