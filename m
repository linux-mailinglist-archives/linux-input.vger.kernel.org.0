Return-Path: <linux-input+bounces-16826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941ECFE580
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 15:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B707300A289
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 14:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C34F340DA6;
	Wed,  7 Jan 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqIz4iOC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E0634029C;
	Wed,  7 Jan 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795945; cv=none; b=QVbWzm/cQr5OMjbenP+q2mSCE0yhH+U/zyQpPMfrv4FIwIvX6IRIB2VZcEagHHmjH3aoQKoTyUu9btl4Y0TrphuqH+Hxt4+c2IakIZU1CIc07mzM8xqxVBJq990T4McmQsgmn+lI7JdmqJ8FFwNQjuPVZBGMEwcTlKiTlluNIpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795945; c=relaxed/simple;
	bh=++MDEOJwSeuJUIGGlQBmxFx+S4Ml89LbpBuXNh/Rclw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W92PMKqiaRJ3q9zCccQVTywbO+82BSKnIOKxkjvOCsuZlTj8yTLMyhxKL6X+0LNArGJOZBLsjVUnQJ41sQ7+t1MidATnlch2r5LkwnaX9QmMIx9c1tmALoIChhy7wlfrF8O8Cq32539aeqtTxiO23wj1PQKrcOucj0c9dhZ7U7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqIz4iOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53506C4CEF1;
	Wed,  7 Jan 2026 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795944;
	bh=++MDEOJwSeuJUIGGlQBmxFx+S4Ml89LbpBuXNh/Rclw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqIz4iOC9V3OBqq554qcZnQANbpfoVqXUoUcqnAdVUoJyCc2tJRsE5h8gMKB1GRSY
	 /HxFmsctwXheboVzlYaehzF+Ffcb8b3jW/AWsnD30iI0Yz88oEfX4s4MdVAbxMU/DX
	 CC+WlI6U2ag+bAuw3rQUfHGP/YhIuNIc0yqLezW4NX8LAsYsDFllY8IwyDYTeMbvPn
	 zps27QBcf0/3+RAcPnhmUKdBG1cOLc+u+u8Wbq5WSI42nHK/6rSEu1ocYMWHKxyT5a
	 zOSGeGjyMMncpPWTRd5CyBVtp/vTz+AINRetk68QoUvFhjDm8+ADynlVc3+DcgK8A1
	 eHAXTSDyt1RYA==
Date: Wed, 7 Jan 2026 15:25:40 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add another Chicony HP 5MP Cameras to
 hid_ignore_list
Message-ID: <sjljzdoam65der4eedu6a4zk7glnqmijh47oez7m5dp23oybqr@eet3zqhulxev>
References: <20260106151101.3775332-1-chris.chiu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106151101.3775332-1-chris.chiu@canonical.com>

On Jan 06 2026, Chris Chiu wrote:
> Another Chicony Electronics HP 5MP Camera with USB ID 04F2:B882
> reports a HID sensor interface that is not actually implemented.
> 
> Add the device to the HID ignore list so the bogus sensor is never
> exposed to userspace. Then the system won't hang when runtime PM
> tries to wake the unresponsive device.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>


This looks lie a resend of https://lore.kernel.org/linux-input/20260102065643.1832426-1-chris.chiu@canonical.com/T/#u

In the future, please mark them as such ("PATCH Resend"), or change the
version number. Ansd as a general rule of thumb, don't resend a patch
after just 4 days. Worse case, send a reply with a ping in the original
submission.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-ids.h    | 1 +
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index d31711f1aaecc..e8a1a86313b74 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -317,6 +317,7 @@
>  #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
>  #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA	0xb824
>  #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2	0xb82c
> +#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3	0xb882
>  
>  #define USB_VENDOR_ID_CHUNGHWAT		0x2247
>  #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index c89a015686c07..3cf7971d49743 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -769,6 +769,7 @@ static const struct hid_device_id hid_ignore_list[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
> -- 
> 2.34.1
> 

