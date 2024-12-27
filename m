Return-Path: <linux-input+bounces-8792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5349FD06A
	for <lists+linux-input@lfdr.de>; Fri, 27 Dec 2024 06:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 589847A1157
	for <lists+linux-input@lfdr.de>; Fri, 27 Dec 2024 05:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A0F1876;
	Fri, 27 Dec 2024 05:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="XKn593P9"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D593935958
	for <linux-input@vger.kernel.org>; Fri, 27 Dec 2024 05:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735277063; cv=none; b=sIV5bwZgsfqVZHK6UrfdwnOYwypQduWH1sIZskZk6h8c+NveiawLWjGV2o7/rDpuTFNOQ8Mcd4mI8aRRfzFLwGPC8H4v96yUMWoPr22sLsX6vI428NkhyEE4QEHvUJP4C4R3B4rU7iGF2KIzfNMi6tLc4jp9ALNUZbsWRAoMky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735277063; c=relaxed/simple;
	bh=C8AIoTGDJ5Q+BmcnsfWsK7ZAft2eLUYLNt5Iqqs/2wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1CiXeR6GnCPiuCUYqpZ87Jog4psRQTTRDRhCoXBLXtvuKg6U3X0LRS3s0hczp5+p5T/ys54gzIAshN/O8AnJotXd6jCxf5VSpvAV0LaaBmzS062OL8CmMxMPbqqSX/+bwjX6dhX+quq0+3sGfbYj4KJfrXcjJ9UyiDBPqJqhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=XKn593P9; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 58B1AA037;
	Thu, 26 Dec 2024 21:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1735277054; bh=C8AIoTGDJ5Q+BmcnsfWsK7ZAft2eLUYLNt5Iqqs/2wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XKn593P9QOa7pqu5EKt1M5IpBNGyue2nREBAg/rquIpO6Px83yncBcIpy+JRE+mia
	 XvYLujmLRelULGcK0isf/nIpfLJzLlQW9FxP1yyTW/6D3Hao1QKVZD3w+DwtTBR682
	 1sATqZoP2NnfLgGz8OpJlAu3HNgs0ROnOfIpGB39Sma9JA9NnVwukoWKRvNjsDVBbz
	 BU7bwyK7eMVrZmrfu48BdbqmYbmVAk4oi+s8V8MNy2p9zfkGUOqsW8SA/mMaqC3uL7
	 KzBfh2rt9+jinqUiuLK4rsEMOxKB1gcJ7Mjux3TgD8FOMYfUdPziM06muKzFYMNBxx
	 K5KKOgveMSEOg==
Message-ID: <cec5ed7c-5f35-4d65-99a3-92abe63c5b24@endrift.com>
Date: Thu, 26 Dec 2024 21:24:13 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: hid-steam: Fix Lizard Mode disabling
To: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org
References: <20241225155507.30288-1-eugenyshcheglov@gmail.com>
 <2f88805c-7f4e-48a6-bcda-29a15879825b@endrift.com>
 <CALepYkLaAfRW1OvCOoj9-+xUXDtUUW6rf+tVPLjSX2o3VEOaSA@mail.gmail.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <CALepYkLaAfRW1OvCOoj9-+xUXDtUUW6rf+tVPLjSX2o3VEOaSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/26/24 5:54 AM, Eugeny Shcheglov wrote:
> Hi, Vicki,
> 
> First, I should explain the motivation behind this change. I'm a developer of a gaming platform based on SteamDeck. My app runs in kiosk mode, and the system boots directly into the app, so I need to be able to read Gamepad values by default.
> 
> Let's ensure that we are on the same page and that I understand the driver behavior correctly.
> 
> There is one hardware mode: "Gamepad" mode (probably we can call it something like a "Full" mode), where all inputs from buttons, pads, and switches are processed. "Lizard Mode" is a possibility to filter input, right? So, if Lizard Mode is enabled, it gives us a
> possibility to change modes between Gamepad (full input) and Desktop (mouse/keyboard only) by pressing the "Options" button OR automatically when the Steam client is opened.

This is not at all accurate. Lizard mode is handled by firmware in the controller board itself and when enabled emulates a keyboard and mouse in addition to the gamepad controls. If lizard mode is disabled, then that emulation is disabled. Game/desktop modes are handled exclusively in the driver. They do different filtering of inputs based on if the evdev node is open or not. I forget the exact specifics and would need to review the code. If you want fine control over how all of this works, you can open the hidraw manually and parse it. The format is well-documented in the driver, and opening the hidraw disables all of this stuff (though you will need to send the heartbeat manually to keep lizard mode off--it automatically turns back on if a watchdog turns off).

> 
>> Switching between gamepad and desktop modes is already blocked when lizard_mode is disabled. See line 1053 in steam_mode_switch_cb.
> 
> No, it doesn't. Mode switching happens on line 1052, right before the "if (!lizard_mode) return" condition in the steam_mode_switch_cb.

Oh, yes, come to think of it that should probably be on the other side of that early return.

> 
> Logically, the "lizard_mode=0" option should disable the possibility to filter the input. However, when I tried setting "lizard_mode=0" on my SteamDeck, nothing changed except that the mouse was gone, along with the haptic pulse during mode switching. I'm still able to switch the joystick inputs on and off.

Yup, that's because lizard mode is literally just the keyboard/mouse emulation. Since without that desktop mode is useless, it disables the mode changing. Or it should. It looks like that might not be handled entirely correctly, as you just said.

> 
>> All in all, this patch doesn't actually "fix" anything.
> 
> Well, in that case, what should "lizard_mode=0" do? As I mentioned before, on my SteamDeck, it only disables the haptic pulse and "desktop mode" functionality like mouse input.

Vicki


