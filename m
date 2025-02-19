Return-Path: <linux-input+bounces-10188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A6A3B058
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 05:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCDEB1737F5
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 04:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B1E1A3BD7;
	Wed, 19 Feb 2025 04:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="ZIKcKwAQ"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AA75A4D5
	for <linux-input@vger.kernel.org>; Wed, 19 Feb 2025 04:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739939214; cv=pass; b=ltT35X7PKbMhMn2aLG5iOJuL2RZ31noiU/9FTZZTHy2HAQmaRhR2LG7VNwQavJ99GWDu4sHuSLFcyfmQcAXds6R/GvJaiVDdec+HyNwFqE3jmy258lDaC4LZ+JnhoAxxYGTrgmeuXiTaR+ZRJFfAsS8MKgbzL4M2I5hjnndY+o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739939214; c=relaxed/simple;
	bh=Kbk910SDfs6ZNzzOA6HcBDEK/Q+puf2AT9+7zlDw93Y=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=by3njLlasqz0TT1p/Js9W3e0IP9TS0pBi3yBEGLFPYscBXCiPA8zWRrrz8Kak6Oith8UmYsaONIgsBYd6NAAoOMR8aJV4wY1f9rsfNmksV3f0lrhbnMr/BCzkWhfcfnK2hpgF0puMpDs23+4EIZ715/ImrzlRGBGt4B27nlFGiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b=ZIKcKwAQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739939207; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NhSRw+Xftg2Yuc1snvjd7dpxh3wde9oWEZWwHHQ7lBtnc7irDp4JIyR58A0urTbM96nIPrquQ7DFCSwnUVWpLRqMdTOCVHx1wuO9gjEqTkuqZ+rylPSKqrFRtaxnKTUlmUuy4MP5uYIWCYBNz3FTYNztaAoCjqsk/5FrMHt9Jg0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739939207; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HsuTu48X5j91tfs4OCTEud8RKO46MOU9DmlA3f6y5p4=; 
	b=eSUY3X6ZIXqJivitiq+qe5QZwUkJHYdGk4a6tDz914HM0lYg7bmtXJFzREhO1/s9S8ytfaHS/ycsYhBYegBpkuYV2EYwEQykcpP5mAbm2kjD53td8Aav7ctT/rC/nwnNtIMgN1YtJNDagGxIcKuXWeHGNpJeSF2AoXeXIY3Wfic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739939207;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HsuTu48X5j91tfs4OCTEud8RKO46MOU9DmlA3f6y5p4=;
	b=ZIKcKwAQ6EwZYWZd0zQm8Kkl0ImxiTHS4P22XvSKd+Jbj5KsXYjosawP33sKjipD
	IiByzu9XvkQC+uv/quV0XMA1mqGFYIsuVarYp8ZMj3YhorOXL7zPYWktzHPT0+pQpzZ
	uC4g/aM3q2hZhvjSUPPfqABp4VIq/C7C6CTR/H0o=
Received: by mx.zohomail.com with SMTPS id 173993920533967.6740575880599;
	Tue, 18 Feb 2025 20:26:45 -0800 (PST)
Message-ID: <d93bc0dc-ea4b-4ec9-bd76-a480d53196f9@collabora.com>
Date: Wed, 19 Feb 2025 09:27:24 +0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com
Subject: Re: [PATCH] Input: xpad - Allow disabling Xbox One support
To: Vicki Pfau <vi@endrift.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org
References: <20250219013824.3955748-1-vi@endrift.com>
Content-Language: en-US
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
In-Reply-To: <20250219013824.3955748-1-vi@endrift.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/19/25 6:38 AM, Vicki Pfau wrote:
> The xpad driver has historically had lackluster Xbox One controller support.
> Multiple out-of-tree driver projects have started up with the eventual goal of
> getting merged upstream, but they require either blacklisting xpad or building
> a custom version without Xbox One support to avoid the drivers stepping on each
> other. In advance of one of these drivers getting upstreamed, this patch add
> supports for disabling Xbox One support to avoid the need for downstream
> changes.
I've been looking at this problem. This makes sense to put the xpad's Xbox One
support behind a config. If this xpad's support used to work flawlessly, we don't
have needed this new config option. But as we have issues which other downstream
drivers can solve, this config option will help a lot and solve the first problem
for those downstream drivers.

Reviewed-by: Muhammad Usama Anjum <Usama.Anjum@collabora.com>

> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/Kconfig |   6 ++
>  drivers/input/joystick/xpad.c  | 164 +++++++++++++++++++--------------
>  2 files changed, 102 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 7755e5b454d2..abfda29df47c 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -320,6 +320,12 @@ config JOYSTICK_XPAD_LEDS
>  	  This option enables support for the LED which surrounds the Big X on
>  	  Xbox 360 controllers.
>  
> +config JOYSTICK_XPAD_XBOXONE
> +	bool "Xbox One gamepad support in xpad"
> +	depends on JOYSTICK_XPAD && INPUT
> +	help
> +	  Say Y here if you want the xpad driver to support Xbox One controllers.
> +
>  config JOYSTICK_WALKERA0701
>  	tristate "Walkera WK-0701 RC transmitter"
>  	depends on HIGH_RES_TIMERS && PARPORT
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index b434a465bf72..3dbaf6945024 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -133,10 +133,6 @@ static const struct xpad_device {
>  	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
>  	{ 0x03f0, 0x038D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wired */
>  	{ 0x03f0, 0x048D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wireless */
> -	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
> -	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
> -	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },		/* v2 */
> -	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },
>  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
> @@ -151,14 +147,7 @@ static const struct xpad_device {
>  	{ 0x045e, 0x028f, "Microsoft X-Box 360 pad v2", 0, XTYPE_XBOX360 },
>  	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
>  	{ 0x045e, 0x02a9, "Xbox 360 Wireless Receiver (Unofficial)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> -	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
> -	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
> -	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
> -	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> -	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
> -	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_PROFILE_BUTTON, XTYPE_XBOXONE },
> -	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
>  	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
>  	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
>  	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
> @@ -198,7 +187,6 @@ static const struct xpad_device {
>  	{ 0x0738, 0x4740, "Mad Catz Beat Pad", 0, XTYPE_XBOX360 },
>  	{ 0x0738, 0x4743, "Mad Catz Beat Pad Pro", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
>  	{ 0x0738, 0x4758, "Mad Catz Arcade Game Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> -	{ 0x0738, 0x4a01, "Mad Catz FightStick TE 2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0738, 0x6040, "Mad Catz Beat Pad Pro", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
>  	{ 0x0738, 0x9871, "Mad Catz Portable Drum", 0, XTYPE_XBOX360 },
>  	{ 0x0738, 0xb726, "Mad Catz Xbox controller - MW2", 0, XTYPE_XBOX360 },
> @@ -209,8 +197,6 @@ static const struct xpad_device {
>  	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
>  	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
>  	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
> -	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
> -	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
>  	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
>  	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
>  	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
> @@ -233,33 +219,10 @@ static const struct xpad_device {
>  	{ 0x0e6f, 0x011f, "Rock Candy Gamepad Wired Controller", 0, XTYPE_XBOX360 },
>  	{ 0x0e6f, 0x0131, "PDP EA Sports Controller", 0, XTYPE_XBOX360 },
>  	{ 0x0e6f, 0x0133, "Xbox 360 Wired Controller", 0, XTYPE_XBOX360 },
> -	{ 0x0e6f, 0x0139, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x013a, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x0164, "PDP Battlefield One", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x0165, "PDP Titanfall 2", 0, XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x0201, "Pelican PL-3601 'TSZ' Wired Xbox 360 Controller", 0, XTYPE_XBOX360 },
>  	{ 0x0e6f, 0x0213, "Afterglow Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
>  	{ 0x0e6f, 0x021f, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
> -	{ 0x0e6f, 0x0246, "Rock Candy Gamepad for Xbox One 2015", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02a0, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02a1, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02a2, "PDP Wired Controller for Xbox One - Crimson Red", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02a4, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02a6, "PDP Wired Controller for Xbox One - Camo Series", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02a7, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02a8, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02ab, "PDP Controller for Xbox One", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02ad, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02b3, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
> -	{ 0x0e6f, 0x02b8, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x0301, "Logic3 Controller", 0, XTYPE_XBOX360 },
> -	{ 0x0e6f, 0x0346, "Rock Candy Gamepad for Xbox One 2016", 0, XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x0401, "Logic3 Controller", 0, XTYPE_XBOX360 },
>  	{ 0x0e6f, 0x0413, "Afterglow AX.1 Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
>  	{ 0x0e6f, 0x0501, "PDP Xbox 360 Controller", 0, XTYPE_XBOX360 },
> @@ -271,10 +234,6 @@ static const struct xpad_device {
>  	{ 0x0f0d, 0x000d, "Hori Fighting Stick EX2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x0f0d, 0x0016, "Hori Real Arcade Pro.EX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x0f0d, 0x001b, "Hori Real Arcade Pro VX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> -	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa (USA) Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> -	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
> -	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> -	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
> @@ -294,9 +253,6 @@ static const struct xpad_device {
>  	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
>  	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
>  	{ 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> -	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> -	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
> -	{ 0x1532, 0x0a29, "Razer Wolverine V2", 0, XTYPE_XBOXONE },
>  	{ 0x15e4, 0x3f00, "Power A Mini Pro Elite", 0, XTYPE_XBOX360 },
>  	{ 0x15e4, 0x3f0a, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
>  	{ 0x15e4, 0x3f10, "Batarang Xbox 360 controller", 0, XTYPE_XBOX360 },
> @@ -343,8 +299,6 @@ static const struct xpad_device {
>  	{ 0x1bad, 0xfa01, "MadCatz GamePad", 0, XTYPE_XBOX360 },
>  	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
>  	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
> -	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
> -	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
>  	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
>  	{ 0x2345, 0xe00b, "Machenike G5 Pro Controller", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> @@ -353,9 +307,6 @@ static const struct xpad_device {
>  	{ 0x24c6, 0x530a, "Xbox 360 Pro EX Controller", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x531a, "PowerA Pro Ex", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5397, "FUS1ON Tournament Controller", 0, XTYPE_XBOX360 },
> -	{ 0x24c6, 0x541a, "PowerA Xbox One Mini Wired Controller", 0, XTYPE_XBOXONE },
> -	{ 0x24c6, 0x542a, "Xbox ONE spectra", 0, XTYPE_XBOXONE },
> -	{ 0x24c6, 0x543a, "PowerA Xbox One wired controller", 0, XTYPE_XBOXONE },
>  	{ 0x24c6, 0x5500, "Hori XBOX 360 EX 2 with Turbo", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5501, "Hori Real Arcade Pro VX-SA", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5502, "Hori Fighting Stick VX Alt", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> @@ -364,20 +315,14 @@ static const struct xpad_device {
>  	{ 0x24c6, 0x550d, "Hori GEM Xbox controller", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> -	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
> -	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
>  	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
>  	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
> -	{ 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
> -	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
> -	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
>  	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
>  	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
> -	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
>  	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
> @@ -389,6 +334,63 @@ static const struct xpad_device {
>  	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
>  	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
>  	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
> +	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
> +	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
> +	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },		/* v2 */
> +	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },
> +	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
> +	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
> +	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
> +	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
> +	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
> +	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_PROFILE_BUTTON, XTYPE_XBOXONE },
> +	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
> +	{ 0x0738, 0x4a01, "Mad Catz FightStick TE 2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
> +	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0139, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x013a, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0164, "PDP Battlefield One", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0165, "PDP Titanfall 2", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0246, "Rock Candy Gamepad for Xbox One 2015", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02a0, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02a1, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02a2, "PDP Wired Controller for Xbox One - Crimson Red", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02a4, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02a6, "PDP Wired Controller for Xbox One - Camo Series", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02a7, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02a8, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02ab, "PDP Controller for Xbox One", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02ad, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02b3, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x02b8, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x0346, "Rock Candy Gamepad for Xbox One 2016", 0, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa (USA) Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
> +	{ 0x1532, 0x0a29, "Razer Wolverine V2", 0, XTYPE_XBOXONE },
> +	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
> +	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
> +	{ 0x24c6, 0x541a, "PowerA Xbox One Mini Wired Controller", 0, XTYPE_XBOXONE },
> +	{ 0x24c6, 0x542a, "Xbox ONE spectra", 0, XTYPE_XBOXONE },
> +	{ 0x24c6, 0x543a, "PowerA Xbox One wired controller", 0, XTYPE_XBOXONE },
> +	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
> +	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
> +	{ 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
> +	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
> +	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
> +	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
> +#endif
>  	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
>  };
>  
> @@ -484,26 +486,19 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
>  	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
>  	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
> -	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
> -	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
>  	XPAD_XBOX360_VENDOR(0x056e),		/* Elecom JC-U3613M */
>  	XPAD_XBOX360_VENDOR(0x06a3),		/* Saitek P3600 */
>  	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz Xbox 360 controllers */
>  	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
> -	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
>  	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
> -	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
>  	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x0db0),		/* Micro Star International X-Box 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
> -	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori controllers */
> -	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori controllers */
>  	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries controllers */
> -	XPAD_XBOXONE_VENDOR(0x10f5),		/* Turtle Beach Controllers */
>  	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
>  	XPAD_XBOX360_VENDOR(0x11ff),		/* PXN V900 */
>  	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
> @@ -511,7 +506,6 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane Xbox 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x146b),		/* Bigben Interactive controllers */
>  	XPAD_XBOX360_VENDOR(0x1532),		/* Razer Sabertooth */
> -	XPAD_XBOXONE_VENDOR(0x1532),		/* Razer Wildcat */
>  	XPAD_XBOX360_VENDOR(0x15e4),		/* Numark Xbox 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech Xbox 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
> @@ -520,27 +514,38 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOX360_VENDOR(0x1a86),		/* QH Electronics */
>  	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
>  	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
> -	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
>  	XPAD_XBOX360_VENDOR(0x2345),		/* Machenike Controllers */
>  	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA controllers */
> -	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA controllers */
>  	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
>  	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
> -       XPAD_XBOXONE_VENDOR(0x294b),            /* Snakebyte */
>  	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
>  	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
> -	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
> -	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
>  	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
>  	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
>  	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
> +	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
> +	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
> +	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
> +	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
> +	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
> +	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori controllers */
> +	XPAD_XBOXONE_VENDOR(0x10f5),		/* Turtle Beach Controllers */
> +	XPAD_XBOXONE_VENDOR(0x1532),		/* Razer Wildcat */
> +	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
> +	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA controllers */
> +	XPAD_XBOXONE_VENDOR(0x294b),		/* Snakebyte */
> +	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
> +	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
>  	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
> +#endif
>  	{ }
>  };
>  
>  MODULE_DEVICE_TABLE(usb, xpad_table);
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  struct xboxone_init_packet {
>  	u16 idVendor;
>  	u16 idProduct;
> @@ -696,6 +701,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
>  	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumbleend_init),
>  	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumbleend_init),
>  };
> +#endif
>  
>  struct xpad_output_packet {
>  	u8 data[XPAD_PKT_LEN];
> @@ -752,7 +758,9 @@ struct usb_xpad {
>  
>  static int xpad_init_input(struct usb_xpad *xpad);
>  static void xpad_deinit_input(struct usb_xpad *xpad);
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
> +#endif
>  static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
>  
>  /*
> @@ -990,6 +998,7 @@ static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned cha
>  	rcu_read_unlock();
>  }
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  /*
>   *	xpadone_process_packet
>   *
> @@ -1155,6 +1164,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
>  	if (do_sync)
>  		input_sync(dev);
>  }
> +#endif
>  
>  static void xpad_irq_in(struct urb *urb)
>  {
> @@ -1188,9 +1198,11 @@ static void xpad_irq_in(struct urb *urb)
>  	case XTYPE_XBOX360W:
>  		xpad360w_process_packet(xpad, 0, xpad->idata);
>  		break;
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  	case XTYPE_XBOXONE:
>  		xpadone_process_packet(xpad, 0, xpad->idata);
>  		break;
> +#endif
>  	default:
>  		xpad_process_packet(xpad, 0, xpad->idata);
>  	}
> @@ -1202,6 +1214,7 @@ static void xpad_irq_in(struct urb *urb)
>  			__func__, retval);
>  }
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  /* Callers must hold xpad->odata_lock spinlock */
>  static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
>  {
> @@ -1233,6 +1246,7 @@ static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
>  
>  	return false;
>  }
> +#endif
>  
>  /* Callers must hold xpad->odata_lock spinlock */
>  static bool xpad_prepare_next_out_packet(struct usb_xpad *xpad)
> @@ -1240,9 +1254,11 @@ static bool xpad_prepare_next_out_packet(struct usb_xpad *xpad)
>  	struct xpad_output_packet *pkt, *packet = NULL;
>  	int i;
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  	/* We may have init packets to send before we can send user commands */
>  	if (xpad_prepare_next_init_packet(xpad))
>  		return true;
> +#endif
>  
>  	for (i = 0; i < XPAD_NUM_OUT_PACKETS; i++) {
>  		if (++xpad->last_out_packet >= XPAD_NUM_OUT_PACKETS)
> @@ -1418,6 +1434,7 @@ static int xpad_inquiry_pad_presence(struct usb_xpad *xpad)
>  	return xpad_try_sending_next_out_packet(xpad);
>  }
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  static int xpad_start_xbox_one(struct usb_xpad *xpad)
>  {
>  	int error;
> @@ -1468,6 +1485,7 @@ static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num)
>  	xpad->last_out_packet = -1;
>  	xpad_try_sending_next_out_packet(xpad);
>  }
> +#endif
>  
>  #ifdef CONFIG_JOYSTICK_XPAD_FF
>  static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect *effect)
> @@ -1527,6 +1545,7 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
>  		packet->pending = true;
>  		break;
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  	case XTYPE_XBOXONE:
>  		packet->data[0] = GIP_CMD_RUMBLE; /* activate rumble */
>  		packet->data[1] = 0x00;
> @@ -1544,6 +1563,7 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
>  		packet->len = 13;
>  		packet->pending = true;
>  		break;
> +#endif
>  
>  	default:
>  		dev_dbg(&xpad->dev->dev,
> @@ -1723,6 +1743,7 @@ static int xpad_start_input(struct usb_xpad *xpad)
>  	if (usb_submit_urb(xpad->irq_in, GFP_KERNEL))
>  		return -EIO;
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  	if (xpad->xtype == XTYPE_XBOXONE) {
>  		error = xpad_start_xbox_one(xpad);
>  		if (error) {
> @@ -1730,6 +1751,7 @@ static int xpad_start_input(struct usb_xpad *xpad)
>  			return error;
>  		}
>  	}
> +#endif
>  	if (xpad->xtype == XTYPE_XBOX360) {
>  		/*
>  		 * Some third-party controllers Xbox 360-style controllers
> @@ -2032,8 +2054,10 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
>  		if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC) {
>  			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129)
>  				xpad->xtype = XTYPE_XBOX360W;
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  			else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208)
>  				xpad->xtype = XTYPE_XBOXONE;
> +#endif
>  			else
>  				xpad->xtype = XTYPE_XBOX360;
>  		} else {
> @@ -2048,6 +2072,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
>  			xpad->mapping |= MAP_STICKS_TO_NULL;
>  	}
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  	if (xpad->xtype == XTYPE_XBOXONE &&
>  	    intf->cur_altsetting->desc.bInterfaceNumber != GIP_WIRED_INTF_DATA) {
>  		/*
> @@ -2058,6 +2083,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
>  		error = -ENODEV;
>  		goto err_free_in_urb;
>  	}
> +#endif
>  
>  	ep_irq_in = ep_irq_out = NULL;
>  
> @@ -2232,6 +2258,7 @@ static int xpad_resume(struct usb_interface *intf)
>  	if (input_device_enabled(input))
>  		return xpad_start_input(xpad);
>  
> +#ifdef CONFIG_JOYSTICK_XPAD_XBOXONE
>  	if (xpad->xtype == XTYPE_XBOXONE) {
>  		/*
>  		 * Even if there are no users, we'll send Xbox One pads
> @@ -2240,6 +2267,7 @@ static int xpad_resume(struct usb_interface *intf)
>  		 */
>  		return xpad_start_xbox_one(xpad);
>  	}
> +#endif
>  
>  	return 0;
>  }


-- 
BR,
Muhammad Usama Anjum

