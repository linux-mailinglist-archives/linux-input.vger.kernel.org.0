Return-Path: <linux-input+bounces-16016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F1C5099D
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 06:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 924CC3A91D4
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 05:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB0C2882B4;
	Wed, 12 Nov 2025 05:20:44 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B710942;
	Wed, 12 Nov 2025 05:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924844; cv=none; b=HrkTJU76FpiNRag2nrbfuch4bbWipSxc/QjS1P6+Sz0QKQnMymYasTi7BiCmgDiP1g4cvY6JcS75bOSHgf49iHqAiyqhGgA9OAl2UwxADccIaBnORMjcq04sQK/YrcO96rMc3jQ2XLyz85vz2rlUR7I0RQsCFgYwi9vl1bH6k6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924844; c=relaxed/simple;
	bh=sjMf6J4MTg3PbcktR1gxX8+WJqpyGMAtqNpV/pPagJY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=anNiTiIueKad/l6+P8a3kZn2Xa6hhVzf90HM4MOM5+8vVh77oJrd3T17PGmTG7Ngjkft+1SpVv13+8L0hHOJuQboO7IauRYV7ao6qbd0I0h9swhNSOXHCSOqiASf4M+Ygsz50/qoQ3RSsI1yZVc9N9w7hGGhE7nFm2z1XJkVCkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id BF72E1F2016B;
	Tue, 11 Nov 2025 21:20:33 -0800 (PST)
Message-ID: <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>
Date: Tue, 11 Nov 2025 21:20:29 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier
 QR30 (2d99:a101).
To: =?UTF-8?Q?Rodrigo_Lugathe_da_Concei=C3=A7=C3=A3o_Alves?=
 <lugathe2@gmail.com>, michal.pecio@gmail.com
Cc: bentiss@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com,
 stern@rowland.harvard.edu
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
 <20251112015356.1919586-1-lugathe2@gmail.com>
Content-Language: en-US
In-Reply-To: <20251112015356.1919586-1-lugathe2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rodrigo,

You might want to wait a couple of days before sending a v3 so other 
reviewers can get a chance to make comments.

You should include the HID: tag in the subject--
...] HID: Apply...

The patch should be sent

To:  the HID subsystem maintainers
bentiss@kernel.org
jikos@kernel.org

Cc:  at a minimum
linux-input@vger.kernel.org
linux-kernel@vger.kernel.org

plus any of the others already part of this thread.

On 11/11/2025 5:53 PM, Rodrigo Lugathe da Conceição Alves wrote:
> The USB speaker has a bug that causes it to reboot when changing the
> brightness using the physical knob.
> 
> Add a new vendor and product ID entry in hid-ids.h, and register
> the corresponding device in hid-quirks.c with the required quirk.
> 
> ---
> v2:
>   - Fixed title
>   - Simplified commit message
> 
> Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
> ---
>   drivers/hid/hid-ids.h    | 3 +++
>   drivers/hid/hid-quirks.c | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 0723b4b1c9ec..ece1bea0faa5 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -734,6 +734,9 @@
>   #define USB_VENDOR_ID_JESS2		0x0f30
>   #define USB_DEVICE_ID_JESS2_COLOR_RUMBLE_PAD 0x0111
>   
> +#define USB_VENDOR_ID_JIELI_TECHNOLOGY		0x2d99
> +#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */

Vendor ID 0x2d99 belongs to Edifier International Limited not Jieli
Can you change to USB_VENDOR_ID_EDIFIER instead and move to the 
alphabetically correct location?

> +
>   #define USB_VENDOR_ID_KBGEAR		0x084e
>   #define USB_DEVICE_ID_KBGEAR_JAMSTUDIO	0x1001
>   
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index bcd4bccf1a7c..d104f4829d93 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -110,6 +110,7 @@ static const struct hid_device_id hid_quirks[] = {
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_JIELI_TECHNOLOGY, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },

as above mentioned rename and move

>   	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },

Thanks for the patch!
Regards,
Terry Junge

