Return-Path: <linux-input+bounces-5283-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B4945C7F
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 12:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 054BC283C01
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 10:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831061DE86F;
	Fri,  2 Aug 2024 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlpQORBp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5981B1DE85D;
	Fri,  2 Aug 2024 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722595949; cv=none; b=GgBPH8cLiNzyEWCsq9Jm+sVQiv1Yjxl3NCoBK5RRiZsLjBeJfIp4p4tJsYKJC7AM+LEweeQ+SCj94IrS6uiv/rQvDLk1u/ZuUL2exHyCqf1FNPL6sF5cQNwIPRsxHtcgBC2x5UvKGI/py+av1xoTVnelpA5HqIRouYpCr4E5sNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722595949; c=relaxed/simple;
	bh=Dsah45Y/KHqlc4tvbqi7GZ6iAsFDWEfJZezDlhque04=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=p9M/5z90XRBuxxj5WcZ2cDdL9ggLKrohElaO2FnoOlJD9T0GEgA9yRPKBzGqKRvi6eV61oFs1KLTFdg64LDs/YRuU3/6EBd2UX6mCbdhoROcBrtZevF1FRW7dA1B9yOv5iPN3joZhrsFXT261e9U8wy3hVtY4g99J3larjQknjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlpQORBp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D4EC32782;
	Fri,  2 Aug 2024 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722595949;
	bh=Dsah45Y/KHqlc4tvbqi7GZ6iAsFDWEfJZezDlhque04=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LlpQORBpXAFAKQIJweJDU+4vrjyXc1koXzSa0QTv1KuD7nX4R4NNT/Pz9p6hD+mmr
	 WN60xpK8biJ31LpG62vqE5yjoGIEda31UBK8/so1tjQZgPJxzqaLXPOF3ITaJpSD/T
	 Fe8SwKC61Qqzz/wtQHovGWy+n61mOLeH2oZhvqkfkuZVR7+ibsMJvgN4Rq494mMIro
	 80+hq64c4CuXhXXyqlLkOSUlCDDCwnNiQ0RssP9vT93tIjaDDb4oO7RBNoOv+TJPqm
	 hSAVGHQnTFWs9j1pAFZluQUYEGdol3thYc7N6sAb9qsUNFGsdspE81E6GOKlLoIzi+
	 3ejjEowMf+oYQ==
Date: Fri, 2 Aug 2024 12:52:25 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Luke D. Jones" <luke@ljones.dev>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid-asus: add ROG Ally X prod ID to quirk list
In-Reply-To: <20240724223125.44914-1-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2408021251150.12664@cbobk.fhfr.pm>
References: <20240724223125.44914-1-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jul 2024, Luke D. Jones wrote:

> The new ASUS ROG Ally X functions almost exactly the same as the previous
> model, so we can use the same quirks.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-asus.c | 3 +++
>  drivers/hid/hid-ids.h  | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 9010f12a221e..e5f6664bac0f 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1255,6 +1255,9 @@ static const struct hid_device_id asus_devices[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> +	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index fdf2d480533b..57f1f1bc5eb6 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -212,6 +212,7 @@
>  #define USB_DEVICE_ID_ASUSTEK_ROG_RAIKIRI_PAD		0x1abb
>  #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
>  #define USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD	0x1a83
> +#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X		0x1b4c

I've applied the patch, but got a conflict here, because I don't see 
USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD in my tree, nor in Linus' tree.
What tree was this patch generated against?

-- 
Jiri Kosina
SUSE Labs


