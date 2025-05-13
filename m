Return-Path: <linux-input+bounces-12344-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DFAB5FB8
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 00:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1D44A6C5B
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 22:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711E91E1C2B;
	Tue, 13 May 2025 22:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="dvhI/2aa"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF23213E67
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177152; cv=none; b=bi5QUvkTm5eVtJHTAh2dLz3+dC2zqwR2H1X+lstLDihht6R0kaAV+VqECL+d2Jn+q8Z7oJNOLT0VKIp3TJ2V4v7wqQLpf8QV6c0zgc93XsSJ9UiG8GYfjVtcV9jkjJGmmugikiZ9o9gFf7VPe2Lf97TTktuRAUHdYtPCmUeqMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177152; c=relaxed/simple;
	bh=6IHDjiCq5RWSFRV2jv2ey09vh6GTEyXp97u22KdgY+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T++Vy+vdSD1EM+iD2k1HgKZHC6eyLl9wyWfIKrRnVJSdhFerg1p7Tgc5CFMtVu7gV5hNV/4DKVM6LzgWlw5g7/lk99SX+4GdPsHbgwOk6Dq3vjmDLLLCQZrXMKi+n+XZn0jM5CfCWkKzYQrcrVArZQkYiOGUIJHS8vzTG1Sc1I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=dvhI/2aa; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1747177147; bh=6IHDjiCq5RWSFRV2jv2ey09vh6GTEyXp97u22KdgY+M=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dvhI/2aa71n/yemSTmSxRYs3rr1bHdvzbnuPMWsFY2Q/E1Q2SxYSp57D/bUG8bQRT
	 +7gyXmIXJdNopQOzOOm/NoG+TGdaW6PXVtMhosvh7cC5CY8OGDIYn0VvlvRfy5SR5t
	 aPJbfaC3mMpvg67lO22dIUAaRi3YoWnK9iuURPtsBCEkKEklQmEenqK220dSbBzXHk
	 HHqfibFSx+g9Uc5eDN1HJwqVLkFJNGcgkvpqoFNdY7cAn2PV98a2e0eVLBvSOa4naf
	 prV7o4Ok8ta+BDRu3GXxwBHKDZwbx6GMkSbFx65Tud5uXKVIcd69jNSh+mdcXgg2VH
	 IF3ApOqxF2izQ==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id E9C02A199;
	Tue, 13 May 2025 15:59:06 -0700 (PDT)
Message-ID: <4396b219-ddd7-48a9-bacb-ee563afcaadf@endrift.com>
Date: Tue, 13 May 2025 15:59:06 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] Input: xpad - Add more controllers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
References: <20250513225411.2718072-1-vi@endrift.com>
 <20250513225411.2718072-5-vi@endrift.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20250513225411.2718072-5-vi@endrift.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/13/25 3:54 PM, Vicki Pfau wrote:
> Adds support for a revision of the Turtle Beach Recon Wired Controller, the
> Turtle Beach Stealth Ultra, and the PowerA Wired Controller.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 7746530da030..03449571a19f 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -293,6 +293,9 @@ static const struct xpad_device {
>  	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
>  	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
>  	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
> +	{ 0x10f5, 0x7008, "Turtle Beach Recon Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
> +	{ 0x10f5, 0x7072, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },		/* bluetooth */
> +	{ 0x10f5, 0x7073, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },		/* wired */

Shoot, it looks like I submitted the wrong version of this patch. The bluetooth line shouldn't be there since this driver doesn't support the bluetooth interface. I'll submit a v2 of this specific patch, as it doesn't depend on any of the others in the sequence.

>  	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
>  	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
>  	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
> @@ -357,6 +360,7 @@ static const struct xpad_device {
>  	{ 0x1ee9, 0x1590, "ZOTAC Gaming Zone", 0, XTYPE_XBOX360 },
>  	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
>  	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
> +	{ 0x20d6, 0x2064, "PowerA Wired Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
>  	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
>  	{ 0x20d6, 0x400b, "PowerA FUSION Pro 4 Wired Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
>  	{ 0x20d6, 0x890b, "PowerA MOGA XP-Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },


