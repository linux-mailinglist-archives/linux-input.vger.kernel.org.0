Return-Path: <linux-input+bounces-13548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05043B059F3
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 14:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DDE07A2097
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 12:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336DC2DA748;
	Tue, 15 Jul 2025 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5UbclRT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0551A219E8;
	Tue, 15 Jul 2025 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582416; cv=none; b=CPzWCSMotksONEUIN5Q1/2NO9AXyhziAXeN6NKVF+cplB4tflitY81ATdmeN3Nt2r4Sim1IAo2jQ6uzo1ZjKaffTsMRYhP6y8ufMLcBQX3my0r5TOSuPpJNUodku7H6wBIv6j6/fD0GKBbviRXq5yJYdA1nf+zyb7SgMkILXI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582416; c=relaxed/simple;
	bh=V73S2HFgm/RUkKqy8R4LcWnV3iJ0WrBE+z/aujnj4N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1mPnTOH0amxD+H45HzAS6iooXjneXyFnaYuxtYGUIKU0G91XIzCY9kDROdEBv+zfpX2Yf/uVG3TpGeR1p87IM/TWuljAIEYu1e83hxXvJtTgpNDV3RSJDI7aBwVh1SE8U+0lohE/wYHBMn0DcJBRxydKE4syVY42DabWyDRLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5UbclRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DC8C4CEE3;
	Tue, 15 Jul 2025 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752582415;
	bh=V73S2HFgm/RUkKqy8R4LcWnV3iJ0WrBE+z/aujnj4N0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E5UbclRT8UyCj4JWDuz2UhGp42+dHY/OztyD1ZnnuYKd2l2b8X0YDo0jopMUbJNh0
	 OXYiMkOrbTVELfsjqRXFSB2HYsg0MlwSj50jsEZUfG1Zv6/FlNp3iPDCMKbxYezHkj
	 rtF2XyRDModokX/xkSr2AkrMou33rzFI1qBbeGKnCB2X02qbciQ3qUBPd9MxxMfRLV
	 YYdmFFtbqFI2xuf/UPqxXYkz3tndXQ/UdvXfKCJBHRSOKWfHiZaUjrCFLAYsF/S7dI
	 XuJXRqM6M2xckozZIcPFfMZZ/3pOKeTZoBTsr4wC833VbSC6Wk/E9U5jtn7+X/Wtji
	 z8Ka0JiGxg4MQ==
Message-ID: <e8f9f83d-2279-4d1b-9caf-27e00f3b0740@kernel.org>
Date: Tue, 15 Jul 2025 14:26:51 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: allocate a keycode for Fn+space
To: Anton Khirnov <anton@khirnov.net>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20250714150756.21197-1-anton@khirnov.net>
 <20250714150756.21197-2-anton@khirnov.net>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250714150756.21197-2-anton@khirnov.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Jul-25 5:07 PM, Anton Khirnov wrote:
> The Asus ExpertBook B9 laptop sends a WMI event when Fn+space is
> pressed. Since I could not find any information on what this combination
> is intended to do on this or any other Asus laptop, allocate a
> KEY_FN_SPACE keycode for it.
> 
> Signed-off-by: Anton Khirnov <anton@khirnov.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  include/uapi/linux/input-event-codes.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 3b2524e4b667..a49b0782fd8a 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -548,6 +548,7 @@
>  #define KEY_FN_S		0x1e3
>  #define KEY_FN_B		0x1e4
>  #define KEY_FN_RIGHT_SHIFT	0x1e5
> +#define KEY_FN_SPACE		0x1e6
>  
>  #define KEY_BRL_DOT1		0x1f1
>  #define KEY_BRL_DOT2		0x1f2


