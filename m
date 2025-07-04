Return-Path: <linux-input+bounces-13371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E6AF85C5
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 04:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB70D1C8503C
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 02:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A6B4B5AE;
	Fri,  4 Jul 2025 02:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="TbRmZRq8"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8B1FC3
	for <linux-input@vger.kernel.org>; Fri,  4 Jul 2025 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751597552; cv=none; b=Wmdkb+Ql640+JemtPtt2JU7KHp++Bc3v5IW1TYY+NMIxezdMDTVbUGoBzniTt6UZIEQB5o9SRdDQC09PoOcsOes19aNpOaNTGwiCzwTPOu9aAo2i/odj6ncTb8E/ggNXBCIN/khRqCOdVr8ArbEZGKuBDyl+RgvA7bTcOI1zjdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751597552; c=relaxed/simple;
	bh=7qmXRQDNI94DH3EDik/IKCxHr1fWpjoqEWEU9PiQF9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WMUodBlqOteNtGqAH4Jj4v1l+Q0mNK4pm3Kfga2tZCNeHlgXihXcPnO9LaBSc586FKd9e/lk3/aBP6CZ9Kui4rm4PBkGZFoQ5GwWN+Ma8rl1tezmEi+YZ58tI/tKjh4jE6cZUK8YULWI7fY4m1bPvzvhxnrNegp1gpG2pPJgGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=TbRmZRq8; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751597541; bh=7qmXRQDNI94DH3EDik/IKCxHr1fWpjoqEWEU9PiQF9Q=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TbRmZRq8JligIqIpJeYg4CjVXHee7TnqF+oDpxaXEjcowprjxdRMnNEW2wm6WPfio
	 cGmJwc/fDDSc+04/FMTyalwFChdL9P7bkCM3lqfliBFS1/H1ZCaNvH1RqGKSRdVKhE
	 jHFS1GuEhpBg+iuTZHq7Ek9m2anQD0UsvTjWHfKN7OShc8vjMORELiHMD8zC9O7deM
	 VgQJVpWaTqXPCH7yQoiWpW2tCTGjsl8MAGwgH6J1Fztzn66jYcpejsPO+3JpFaeSye
	 /BJvzct7DIU1pTi2z6Fc7odOYOPdTZyH1NnQ2hFZLK1i+FZYhboy/DnbEFxQtkLoOa
	 6yciXpv3RHBwQ==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 26B39A01E;
	Thu,  3 Jul 2025 19:52:21 -0700 (PDT)
Message-ID: <92a568ca-e08f-423a-9de0-3f5b2946e721@endrift.com>
Date: Thu, 3 Jul 2025 19:52:20 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xpad - Added Acer NGR 200 Controller
To: Nilton Perim Neto <niltonperimneto@gmail.com>,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 gregkh@linuxfoundation.org
References: <20250608060517.14967-1-niltonperimneto@gmail.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20250608060517.14967-1-niltonperimneto@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/7/25 11:04 PM, Nilton Perim Neto wrote:
> This patch adds the NGR 200 Xbox 360 to the xpad device tree and also Acer's VendorID
> 
> Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 7746530da030..100aaaa7a5cb 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -177,6 +177,7 @@ static const struct xpad_device {
>  	{ 0x05fd, 0x107a, "InterAct 'PowerPad Pro' X-Box pad (Germany)", 0, XTYPE_XBOX },
>  	{ 0x05fe, 0x3030, "Chic Controller", 0, XTYPE_XBOX },
>  	{ 0x05fe, 0x3031, "Chic Controller", 0, XTYPE_XBOX },
> +	{ 0x0502, 0x1305, "Acer NGR200", 0, XTYPE_XBOX },

Shouldn't this be XTYPE_XBOX360?

>  	{ 0x062a, 0x0020, "Logic3 Xbox GamePad", 0, XTYPE_XBOX },
>  	{ 0x062a, 0x0033, "Competition Pro Steering Wheel", 0, XTYPE_XBOX },
>  	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
> @@ -521,6 +522,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
> +	XPAD_XBOX360_VENDOR(0x0502),		/* Acer Inc. Xbox 360 style controllers */
>  	XPAD_XBOX360_VENDOR(0x056e),		/* Elecom JC-U3613M */
>  	XPAD_XBOX360_VENDOR(0x06a3),		/* Saitek P3600 */
>  	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz Xbox 360 controllers */

Vicki

