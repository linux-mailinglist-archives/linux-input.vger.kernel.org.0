Return-Path: <linux-input+bounces-3209-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520A8AFEBF
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 04:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5851F2457D
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 02:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C48484D1F;
	Wed, 24 Apr 2024 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="t8zzO1WD"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0583CCA
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713926894; cv=none; b=Ljey35lsU/UAOQgsgDBpA4XBQbIKwduR04pRW+/FISTEN9DPZ8hI/qsshdAB1tJtEVNATndCRmGp1XsjRJebRbzk9tnsoRAnEHkOEr8ttjT8XHMgQavUBmmK7TAqnpBcfMV0qnpi9WIZi1+2fOtrUKX+3G8v4UO9OTAZLvSPK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713926894; c=relaxed/simple;
	bh=uWfZs+TFIa3syOEiwFYI+qn10CQjh/01tvvXg9NR85k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lNTMAnSwSxn2+REDu3ACEygx2IzkLyswtSRZntWl2WOScQP88IHMJEZmiW8UjVayrJkswt0LNKFsO0Pi+/z/Pv7bz40IQTvk8wuT/IK7BjAVnUq1XALZDSH94j8xhglRbYNx5KZ0UVyZHuTbra502Sp4VaOBRdK2BqLBr2cY9Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=t8zzO1WD; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.22] (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 0F024A028;
	Tue, 23 Apr 2024 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1713926892; bh=uWfZs+TFIa3syOEiwFYI+qn10CQjh/01tvvXg9NR85k=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=t8zzO1WDP/oLyj7BGGwt0wDPXL70jwlAy8qnc1TPijZVMnNG6UxsrCU1Fo4OibDXQ
	 BSZHUnTTmYJuyPGKJN/Kq2Axxcsr82am4rtzDcLHg9kJOGLcYaITG7YxwkEOT5rqOI
	 Y6xQVAfOEytfIBHMUaSpjzAMjxhGuOtrC6bBxv2q2UoT1RZHJMM/Sxm8Ap4rSV0C0d
	 7sCKg8zbcZQo4LIzHQR4/MgOB4PmIekSOUd8WGQG2lqZEDMt5N1XJVhUc+skzECRiA
	 E5xpd+RA6LuhUq07bqyjv5fvhGdcK9wFlCeshA7w94yXbBtd42J3KB/NhENJALOGFW
	 ZnNzPV32MZ63w==
Message-ID: <a81e8d5f-34d0-44d4-9c32-377fa04d097a@endrift.com>
Date: Tue, 23 Apr 2024 19:48:11 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: xpad - add support for ASUS ROG RAIKIRI
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
References: <20240404035345.159643-1-vi@endrift.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20240404035345.159643-1-vi@endrift.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Dmitry,

On 4/3/24 8:53 PM, Vicki Pfau wrote:
> Add the VID/PID for ASUS ROG RAIKIRI to xpad_device and the VID to xpad_table
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index bf3a7c1824f8..a7ce6258a2fa 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -202,6 +202,7 @@ static const struct xpad_device {
>  	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
>  	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
>  	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
> +	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
>  	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
>  	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
>  	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
> @@ -474,6 +475,7 @@ static const struct usb_device_id xpad_table[] = {
>  	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
>  	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
>  	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
> +	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
>  	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */

Can you please review this patch?

