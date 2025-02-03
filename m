Return-Path: <linux-input+bounces-9738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF2DA26640
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55C7B165829
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2919211A08;
	Mon,  3 Feb 2025 21:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdUxdf6h"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C669210F58
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 21:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619840; cv=none; b=K1QZTo8Y5gObYN5q2VyuSRDRMpR8GxB+wxFgwtOy46/VMdBz2lPX6OS3ftrsWcXk9M61d5lBYpC5i8fS1qhLeooQ9aaDkQ19cSbLWK7HDaNgfugMAZb0wHA48RZ6+BjWMzNXQXeTbs3agcgvCVYLgX5ofqngZ0wBGYoUXWDihKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619840; c=relaxed/simple;
	bh=v0+gldag2tUiaaZPZE9acnP6cWUjrqcuntcV+ufiniE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dOFEAhriw4Bm4YlrIV2zEXURrBOaUteEwyA1Roml2EwjLP5Hh39YDnz6e7OCRuI8h4Hv9YQg6eTZ3kCsXgeNmBaUOkptsOF23gaTmUz1bF/PGmxo0yjft+Mn41UIkbUu62lhd4rd8b96gxpn1ltQodPZgwx5drdQZXPG5oideu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdUxdf6h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F358C4CEE5;
	Mon,  3 Feb 2025 21:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738619840;
	bh=v0+gldag2tUiaaZPZE9acnP6cWUjrqcuntcV+ufiniE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tdUxdf6hDIFMdyankQE2ZRVDS5OlbCws0wSGbeAES5CNYH3jyB3O66PdwIM14iQT5
	 IosMHl3CXi9IBBlpHaFBZpVypo/fXs9Vk3++KAtycazQBSGEzOMj6d5JMGEyXja7pC
	 oZ9AzeJV7asUfoQyOL+hloFFC/HRRsmKkprSZBfo30yz46j60UgEROsxzNUG/ETQOf
	 7d3O0bvDy581je6k022Y60mjZ3pFPXFwsFkHWkjidBS+XJy8iqPoYUp62ffYMj3gIg
	 Grq8DYAQDn1e+rKNeDmfCNS0QpjNw8gVw1owwboGj5jkyMau7IBgll62pn62WM9i2R
	 GgNU9zasr24Cg==
Date: Mon, 3 Feb 2025 22:57:17 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Alex Henrie <alexhenrie24@gmail.com>
cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
In-Reply-To: <20250117061254.196702-1-alexhenrie24@gmail.com>
Message-ID: <9r2390oo-6p84-5645-8po7-68pqr1p41p03@xreary.bet>
References: <20241001055146.543800-1-alexhenrie24@gmail.com> <20250117061254.196702-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Alex Henrie wrote:

> The Omoton KB066 is an Apple A1255 keyboard clone (HID product code
> 05ac:022c). On both keyboards, the F6 key becomes Num Lock when the Fn
> key is held. But unlike its Apple exemplar, when the Omoton's F6 key is
> pressed without Fn, it sends the usage code 0xC0301 from the reserved
> section of the consumer page instead of the standard F6 usage code
> 0x7003F from the keyboard page. The nonstandard code is translated to
> KEY_UNKNOWN and becomes useless on Linux. The Omoton KB066 is a pretty
> popular keyboard, judging from its 29,058 reviews on Amazon at time of
> writing, so let's account for its quirk to make it more usable.
> 
> By the way, it would be nice if we could automatically set fnmode to 0
> for Omoton keyboards because they handle the Fn key internally and the
> kernel's Fn key handling creates undesirable side effects such as making
> F1 and F2 always Brightness Up and Brightness Down in fnmode=1 (the
> default) or always F1 and F2 in fnmode=2. Unfortunately I don't think
> there's a way to identify Bluetooth keyboards more specifically than the
> HID product code which is obviously inaccurate. Users of Omoton
> keyboards will just have to set fnmode to 0 manually to get full Fn key
> functionality.
> 
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
> ---
>  drivers/hid/hid-apple.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 7e1ae2a2bcc2..9767d17941d0 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -545,6 +545,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
>  		}
>  	}
>  
> +	if (usage->hid == 0xc0301) /* Omoton KB066 quirk */
> +		code = KEY_F6;
> +

Sorry, it's not clear to me from the changelog why it's not possible to 
make this quirk apply only in case we're known to have 0x5ac/0x022c 
device. Is this VID/PID shared with other, differently-behaving devices?

Thanks,

-- 
Jiri Kosina
SUSE Labs


