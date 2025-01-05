Return-Path: <linux-input+bounces-8885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10408A0180D
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 05:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56ACF7A1811
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 04:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DAB5258;
	Sun,  5 Jan 2025 04:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="VGPo5ao5"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C671876
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 04:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736052011; cv=none; b=IyDYcgTc0axhz5txtDDsnhKOar9Wb9US0abbo950o1YuTURUDVSl9Kx3bS5RIO3s4ZADQ9DnDs2e4ZE+hhYT7MUsaYOcEHnyE9HgAVhBsTEAlWuIVU7cek9Sxs2qB7SWCSkviN4g/r0omDuX7hfH4oKR7bUtIZumW/g+4c7ar0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736052011; c=relaxed/simple;
	bh=kiTg+cBZ1GnxlxxoA8K9EcV1zBBfD3qKW08Us3F08Wg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=peMXSbHyNrQpyEr+yXSj28MEapasp3zkWRImUyMlDsm6l6rg0gzF/pwx5V3nGvetNKROsxRv5EBHJEC97pTuvnSCIiFgySzmAEt4YPS5zrnM3k342sOW0Y2fhtzJVHO+EmVWxoxbL+LU1PAUib6O+WAVXq3NGsRNNMXM95coDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=VGPo5ao5; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 14D72A0B5;
	Sat,  4 Jan 2025 20:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1736051538; bh=kiTg+cBZ1GnxlxxoA8K9EcV1zBBfD3qKW08Us3F08Wg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VGPo5ao5L7GZ6NC2MEcmk3qx9kADh/xINXm9Bl9o1xaxss7o7D4BG47N+WoKSoPsJ
	 jU0OsqvZueXmRP6gVnVbDuBnwOvOF6fV3MOyS94tOVHy6KYwG1bXYR63ZB0rqdZBfM
	 NlLYM8ylRy9IL6L0zDTLBjXTlOI2d3ysv/D+fMnqdCka3SD/yvNSUgGqPMgnNiFwMt
	 6iACmbxWNDU8STjgpvwlY98bSJoC84HUmptFRTwsf9YveEyhdXNfFC0d7p/bRL8Hyf
	 qJjdJFfL8xnVFx7m5+5T62gvBunHHy2SYGeZsMgTAT3wCwjcR51/ykprmmWCIW6ltu
	 GxaYWlv+jOhMw==
Message-ID: <b97ec85d-75aa-4ddd-8baa-683628260863@endrift.com>
Date: Sat, 4 Jan 2025 20:32:17 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: hid-steam: Fix Lizard Mode disabling
From: Vicki Pfau <vi@endrift.com>
To: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org
References: <20241225155507.30288-1-eugenyshcheglov@gmail.com>
 <2f88805c-7f4e-48a6-bcda-29a15879825b@endrift.com>
 <CALepYkLaAfRW1OvCOoj9-+xUXDtUUW6rf+tVPLjSX2o3VEOaSA@mail.gmail.com>
 <cec5ed7c-5f35-4d65-99a3-92abe63c5b24@endrift.com>
Content-Language: en-US
In-Reply-To: <cec5ed7c-5f35-4d65-99a3-92abe63c5b24@endrift.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Eugeny,

Apologies for before. The timing was very frustrating as I had intended to take the week off, and it'd been a while since I'd worked on this driver, but I wanted to address this immediately. I decided to look into it further because it sounded like you did in fact find a bug.

On 12/26/24 9:24 PM, Vicki Pfau wrote:
> 
> 
> On 12/26/24 5:54 AM, Eugeny Shcheglov wrote:
>> Hi, Vicki,
>>
>> First, I should explain the motivation behind this change. I'm a developer of a gaming platform based on SteamDeck. My app runs in kiosk mode, and the system boots directly into the app, so I need to be able to read Gamepad values by default.
>>
>> Let's ensure that we are on the same page and that I understand the driver behavior correctly.
>>
>> There is one hardware mode: "Gamepad" mode (probably we can call it something like a "Full" mode), where all inputs from buttons, pads, and switches are processed. "Lizard Mode" is a possibility to filter input, right? So, if Lizard Mode is enabled, it gives us a
>> possibility to change modes between Gamepad (full input) and Desktop (mouse/keyboard only) by pressing the "Options" button OR automatically when the Steam client is opened.
> 
> This is not at all accurate. Lizard mode is handled by firmware in the controller board itself and when enabled emulates a keyboard and mouse in addition to the gamepad controls. If lizard mode is disabled, then that emulation is disabled. Game/desktop modes are handled exclusively in the driver. They do different filtering of inputs based on if the evdev node is open or not. I forget the exact specifics and would need to review the code. If you want fine control over how all of this works, you can open the hidraw manually and parse it. The format is well-documented in the driver, and opening the hidraw disables all of this stuff (though you will need to send the heartbeat manually to keep lizard mode off--it automatically turns back on if a watchdog turns off).
> 
>>
>>> Switching between gamepad and desktop modes is already blocked when lizard_mode is disabled. See line 1053 in steam_mode_switch_cb.
>>
>> No, it doesn't. Mode switching happens on line 1052, right before the "if (!lizard_mode) return" condition in the steam_mode_switch_cb.
> 
> Oh, yes, come to think of it that should probably be on the other side of that early return.

You were correct that this was broken. I'm working on a more minimal patch to fix just this and another related issue I discovered in the process of retesting this.

> 
>>
>> Logically, the "lizard_mode=0" option should disable the possibility to filter the input. However, when I tried setting "lizard_mode=0" on my SteamDeck, nothing changed except that the mouse was gone, along with the haptic pulse during mode switching. I'm still able to switch the joystick inputs on and off.
> 
> Yup, that's because lizard mode is literally just the keyboard/mouse emulation. Since without that desktop mode is useless, it disables the mode changing. Or it should. It looks like that might not be handled entirely correctly, as you just said.

Indeed, as you described, turning the joystick on and off even when lizard mode is disabled is a bug.

> 
>>
>>> All in all, this patch doesn't actually "fix" anything.
>>
>> Well, in that case, what should "lizard_mode=0" do? As I mentioned before, on my SteamDeck, it only disables the haptic pulse and "desktop mode" functionality like mouse input.
> 
> Vicki
> 

After I do more testing I'll submit the new patch. It's pretty minimal, only a +3/-3 diff.

Vicki


