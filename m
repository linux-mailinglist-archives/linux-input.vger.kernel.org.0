Return-Path: <linux-input+bounces-12021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C9A9E2EE
	for <lists+linux-input@lfdr.de>; Sun, 27 Apr 2025 14:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65CD517C8C7
	for <lists+linux-input@lfdr.de>; Sun, 27 Apr 2025 12:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A12EF9D9;
	Sun, 27 Apr 2025 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4JM9Qar"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173F23C9;
	Sun, 27 Apr 2025 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745756134; cv=none; b=lp8Yu1XqY6y4nX0kRswKPB0YOaUy9ozYMI+1SeMyqe2utt5BimY/w5qXYiSPRTR9Lq/fek4/HGwI2hZ0ZUvAmBHQHBdz8A4Y5hk1MrHr61PboPxuSFC5LOoUeZAlRn24q63N8GM/LR6COVM4OvLZ+MtvaZZNT2WGJ0TuOhkjyyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745756134; c=relaxed/simple;
	bh=U3NP7B/PHBroS53dRzmZmiKYRWXqgxpvciX4t3NzLqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGeQ+Qm2Nh+qcHUW+7GiV0nXowRIu6X1L1uzeXbIWRjbu98iGz/WQD1cr+/MJRRsMggMMbfu4/BehW7dOXjCGfJdMFbaFveDIka1lp6fwDgOVw0/q97RCDQmGjf6GL9rJAZ+TKxIpz64FrR5RnMJTw+hIK89QXN+CiqXu1b03Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4JM9Qar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35223C4CEE3;
	Sun, 27 Apr 2025 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745756134;
	bh=U3NP7B/PHBroS53dRzmZmiKYRWXqgxpvciX4t3NzLqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H4JM9Qar+ZWgsREalacGFyRuAxvWtWycXcUnFvFfTqEyFl7rGB2nE4oW3GxDiStJJ
	 a1B2wgoKILYrlNdW5luXE0/CA9lYhWhVDE/p9tDjn+8uufSpvkdzyY/fi+qMGxI54j
	 966QA13jggg7B9DbPQ6Nw9GT2Iy0EW0zMSIKLmOhu945vJHPBSLu4GQkLDaB3mIcSe
	 3mCiamQdSTODEK3xT0lA9nYp5eg0IqFt+kPlpyFQD+XrsVrvC6fgnViY2T7/pYhdyU
	 VckOcuob6wSjeGSYjlG1jYgH0ZIE20KnmdJUO7S5n9ke2qFNLpxfyx0PIfx7GkZQyj
	 RTqHW/9BudCtA==
Message-ID: <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>
Date: Sun, 27 Apr 2025 07:15:31 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Pavel Machek <pavel@ucw.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
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
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aA3KXNCKKH17mb+a@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/27/25 01:10, Pavel Machek wrote:
> Hi!
> 
>>>>>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>>>>>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>>>>>> to lock the screen. Modern hardware [2] also sends this sequence of
>>>>>> events for keys with a silkscreen for screen lock.
>>>>>>
>>>>>> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
>>>>>> emitted by driver to META + L.
>>>>>
>>>>> Fix gnome and kde, do not break kernel...
>>>>
>>>> I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
>>>>
>>>> That's going to break modern hardware lockscreen keys.  They've all
>>>> obviously moved to META+L because that's what hardware today uses.
>>>
>>> Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
>>> screen locking, no?
>>
>> This was actually the first path I looked down before I even started the
>> kernel patch direction for this problem.
>>
>> GNOME doesn't support assigning more than one shortcut key for an action.
> 
> So if I want to start calculator on meta+c on internal keyboard, and
> have calculator button on USB keyboard, I'm out of luck?

Yeah AFAICT that's the case.

> 
> Sounds that should be fixed :-).

GNOME is commonly known to try to have a very simplistic UX instead of 
exposing more knobs and buttons.

Adding support for multiple key combinations in a UX means convincing 
the GNOME design team to support this, followed by actual changes.

> 
> Alternatively, you can just turn KEY_SCREENLOCK into META+L inside
> Gnome.
> 
> BR,
> 									Pavel

Or I can just go back to changing this locally in the PMF driver and it 
works everywhere without needing to convince every userspace to make a 
change to add special mappings.

As there isn't appetite from input maintainers to have a mapping in the 
input layer I think I'll go that direction for a v5.

