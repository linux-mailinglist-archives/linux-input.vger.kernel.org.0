Return-Path: <linux-input+bounces-14204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D6B2E4BE
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 20:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 553B0188E65D
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 18:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DCD273803;
	Wed, 20 Aug 2025 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THi96t5M"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA136CE0C;
	Wed, 20 Aug 2025 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755713594; cv=none; b=ozeb6B+IKDnoCD7bS+lmggW7r5iTrALRqxtjwV7Ax/fnD3txB0bzV2mC+y6bNSXqywgI9h2tdmRp/Y2pRxpFVBDq5Wp27GATpBPYzJN5hyIpMztAaViUPOwYLNdwDlK6RF+ggmv2w1N70oQaGtnf5osZRNDOEMIYo0YnGTwNlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755713594; c=relaxed/simple;
	bh=U4XxtLW5tXCGpupZxQAOI2qgtW8qRObiwM9ZU2+Uo7Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hSLsWNYliYfWXNCTpc0H3K5xopbnI/fXndg3gTG30vMwkbPpeSawMZ6vExAx41NCBx3JkZpUUYigu1ZHcW5Ko4dyj3WYWdkJq0OregBD/Enygn+o6XnjSAY1Sh3pFh3gJ+YZRXcRRt8LwzGax/4AcbyswJFP1q+8y3yWGy1pBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THi96t5M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F36C4CEE7;
	Wed, 20 Aug 2025 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755713593;
	bh=U4XxtLW5tXCGpupZxQAOI2qgtW8qRObiwM9ZU2+Uo7Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=THi96t5MHqQlys4O1q7PDgFZrfy4jZ/lz4oKbYxLlb1CYWyKV5jEB4sxxKUbb1uHv
	 vi8PCs6zvxQaTVFMMPE8YUcjlXuBblFA2YgZe40F1Igp8pDW5KwntDTR9O+P5IGejt
	 nyCyzcsjPNhZytm0cGbwdA57/sFtqx5IYtVpVaKkF+ACYALOoxljnPXMCmSutE4fdG
	 +VTVin1GQz5GRHhpir+RV1fDtgtH5ooAYLKrGsCNzYXGjyrv64O9wQPyBTyf7k5Te+
	 myYb042H8grK81/Udvrntuo6aY3xQBxm6bhs5pSH3+Lgimd8A5CggCW7Jh9n3ixHS4
	 s5f/sHcT5bEsA==
Date: Wed, 20 Aug 2025 20:13:10 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Matt Coffin <mcoffin13@gmail.com>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, 
    Bastien Nocera <hadess@hadess.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech: Add ids for G PRO 2 LIGHTSPEED
In-Reply-To: <20250820074951.1120397-1-mcoffin13@gmail.com>
Message-ID: <7410n255-8p7s-s107-09ps-nr6r65oq706s@xreary.bet>
References: <20250820074951.1120397-1-mcoffin13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Matt Coffin wrote:

> Adds support for the G PRO 2 LIGHTSPEED Wireless via it's nano receiver
> or directly. This nano receiver appears to work identically to the 1_1
> receiver for the case I've verified, which is the battery status through
> lg-hidpp.
> 
> The same appears to be the case wired, sharing much with the Pro X
> Superlight 2; differences seemed to lie in userland configuration rather
> than in interfaces used by hid_logitech_hidpp on the kernel side.
> 
> I verified the sysfs interface for battery charge/discharge status, and
> capacity read to be working on my 910-007290 device (white).
> 
> Signed-off-by: Matt Coffin <mcoffin13@gmail.com>
> ---
>  drivers/hid/hid-ids.h            | 1 +
>  drivers/hid/hid-logitech-dj.c    | 4 ++++
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 5a1096283855..37dc42380373 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -907,6 +907,7 @@
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
> +#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2	0xc543
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
>  #define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER	0xc548
>  #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 34fa71ceec2b..cce54dd9884a 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1983,6 +1983,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>  		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
>  	 .driver_data = recvr_type_gaming_hidpp},
> +	{ /* Logitech lightspeed receiver (0xc543) */
> +	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2),
> +	 .driver_data = recvr_type_gaming_hidpp},
>  
>  	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 10a3bc5f931b..aaef405a717e 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4596,6 +4596,8 @@ static const struct hid_device_id hidpp_devices[] = {
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },
>  	{ /* Logitech G Pro X Superlight 2 Gaming Mouse over USB */
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC09b) },
> +	{ /* Logitech G PRO 2 LIGHTSPEED Wireless Mouse over USB */
> +	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xc09a) },
>  
>  	{ /* G935 Gaming Headset */
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87),

Applied to hid.git#for-6.17/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


