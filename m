Return-Path: <linux-input+bounces-16349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31712C8A9B7
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D1C5F34DB7A
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 15:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85A8331A48;
	Wed, 26 Nov 2025 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mflbm747"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D80F331A41;
	Wed, 26 Nov 2025 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170642; cv=none; b=tQLrR9Mrk2qbFv02wBs65n3Ver+eCIIbExYr5jS/9Tg2pzArsLh83qSuZwVHeiMyV9pKTUVxXSOgNZn6E0YG/wAFBlykltVEqQkFhFrvpyG58DoGqbGIxcMvf+L1r+qsRA/NY/zM9lDaUzxXvYuaV9+aRtZykXuNq3skQBERpBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170642; c=relaxed/simple;
	bh=93be/c2+9mmx0Bv5I/4ONpGOJ9CKJXWb90GZB5aaF/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s8yG/c+XX7Naec3oBlVKnUavL4WcYJM3j4FU6ZQIDSOOIinhBRGPE/JEKignzpKxyXmPzkKjfBrM09AJ5dfKm4Sm9S0jCvFCRkgO5h8shvPabpboLxqmRTWG7THuP+7WLOk0e20aXaFZxkD2SJrhG7U9TpMNi8LOsbDxwCkDA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mflbm747; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF28DC4CEF8;
	Wed, 26 Nov 2025 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764170642;
	bh=93be/c2+9mmx0Bv5I/4ONpGOJ9CKJXWb90GZB5aaF/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mflbm747J+BxMITV+DXKH/oCxA2uFosQZ5Pj6wRoavNhLidHDAa/kur2LtZ7x0Obp
	 ajD62e0XiDPzlPC7OVgEE4IBzdABH/EbS4pkBY+Eiy/r1TePUpGcfjIV0KNNn6Ho8B
	 AXpdzOPjNiu7Zq1YXqcAdaiSdTMvpg3RTtCO152C6EjZLqiNom+GPvE/6+BnXRpZ46
	 MkALc6DoEX2GGBv7AVITmaqBWb4T7BdqJuyL2NH2je/raFwVB83sZaBOupFY8lLQYv
	 D3M9kqiPBXIiaRieDP+UI8MY9FDdd9JsGgOkpOvgahsqkKX5HJoK2QVyBAgi6CoLNn
	 cDvLq8cuqRvew==
Date: Wed, 26 Nov 2025 16:23:59 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
cc: roderick.colenbrander@sony.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: playstation: Add missing check for
 input_ff_create_memless
In-Reply-To: <20251117082808.1492-1-vulab@iscas.ac.cn>
Message-ID: <1q8728r5-s1r0-oqro-n251-631p198861n8@xreary.bet>
References: <20251117082808.1492-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Nov 2025, Haotian Zhang wrote:

> The ps_gamepad_create() function calls input_ff_create_memless()
> without verifying its return value,  which can lead to incorrect
> behavior or potential crashes when FF effects are triggered.
> 
> Add a check for the return value of input_ff_create_memless().
> 
> Fixes: 51151098d7ab ("HID: playstation: add DualSense classic rumble support.")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/hid/hid-playstation.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 63f6eb9030d1..aea8d6cf46a2 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -769,7 +769,9 @@ ps_gamepad_create(struct hid_device *hdev,
>  #if IS_ENABLED(CONFIG_PLAYSTATION_FF)
>  	if (play_effect) {
>  		input_set_capability(gamepad, EV_FF, FF_RUMBLE);
> -		input_ff_create_memless(gamepad, NULL, play_effect);
> +		ret = input_ff_create_memless(gamepad, NULL, play_effect);
> +		if (ret)
> +			return ERR_PTR(ret);

I am not deeply versed in this particular driver's code, but don't you 
leak input_dev allocated by ps_allocate_input_dev() here?

Thanks,

-- 
Jiri Kosina
SUSE Labs


