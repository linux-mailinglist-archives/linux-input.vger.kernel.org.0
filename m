Return-Path: <linux-input+bounces-16355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B777C8AD2C
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 17:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A155F3B0294
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D253101B2;
	Wed, 26 Nov 2025 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMdRf8JN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245D30C368
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173137; cv=none; b=DglAXxe6m8qq2k1imAqq2E1hJN/1oaKf7GfyQ5ngj8dkjPbK4oyDZYK/sjWJK6k3mHoBm9Ubc3v0LSbZDGGPa2oVsd3H9P6eFEIDKohqtSAq+pZQyGLiTU0X5Ge6YdHjakLfbKuwn3kCRVVDFjtmAl61IwIOrdQRtThBGVZ39C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173137; c=relaxed/simple;
	bh=B9vY30sBZgsukOPOx2kVg58OfBvptBiJbcruhn74bic=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gHeiZWQ+W8sJOvqNdYZpOm6S9QmKPvKEsWf9wFufO3mKOJApPxxLPps+ibIOu4YV8bS/f2h9Zmsw22Y5+uF6DfRn5piA3GHUPys+RT8fZ8/fYsSQj9LnPqy8D4HYD5vFpRZJBQpoTiIrwjPuGtnM/vB4yBcPPPYgTDFMSUBLcU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMdRf8JN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EB3C4CEF7;
	Wed, 26 Nov 2025 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764173136;
	bh=B9vY30sBZgsukOPOx2kVg58OfBvptBiJbcruhn74bic=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bMdRf8JNIZnp6SxKIeJukXjPeUDnuOCA06Fq8dbjzr6jAZR/SYkdKdvzKrN+gTtGK
	 dCk15IJgTAkI1y/p2ltWXvLp623pOHEu7JQOFhYBbOCrMhIT0tNzH5l4dIALrzY+Qc
	 4LMOkOkTI4bT40qddCarZGZTnRm0WDjPwCItdZu84Gmtz/qNx+6kqKL1gW7JHlHJxF
	 jGK8bKczUz//mvdo51LllACbcd75CXoAR0pnalbvtPwxjbPr/Vi3FZ3AlVLkhq/rRv
	 2N0Lf6JBRWjMKyS/kf8fY0qsBX6rvp4UAa8dy+w7Z4iXj37qDOp/bXMBMCTNAWyd9Y
	 uKijptt86E9IQ==
Date: Wed, 26 Nov 2025 17:05:33 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Jon Moeller <jmoeller@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Add palm rejection quirks to HP Spectre
 Trackpad.
In-Reply-To: <CABWf9sZuKy2=XjSo7WAB-9KanvDjhaXn-8P2J3_z2LgtcpwWDg@mail.gmail.com>
Message-ID: <r53o4606-5spn-57r3-12nr-1q5r486n4n2r@xreary.bet>
References: <CABWf9sZuKy2=XjSo7WAB-9KanvDjhaXn-8P2J3_z2LgtcpwWDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 9 Nov 2025, Jon Moeller wrote:

> This patch fixes an issue where palm rejection signals from the
> ELAN trackpad in HP Spectre laptops are ignored, causing lots of
> false touches.
> 
> Signed-off-by: Jon Moeller <jmoeller@gmail.com>
> ---
>  drivers/hid/hid-multitouch.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 179dc316b4b5..cb5d80172131 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -229,6 +229,7 @@ static void mt_post_parse(struct mt_device *td,
> struct mt_application *app);
>  #define MT_CLS_RAZER_BLADE_STEALTH 0x0112
>  #define MT_CLS_SMART_TECH 0x0113
>  #define MT_CLS_APPLE_TOUCHBAR 0x0114
> +#define MT_CLS_HP_SPECTRE_ELAN_HAPTIC 0x0115
>  #define MT_CLS_SIS 0x0457
> 
>  #define MT_DEFAULT_MAXCONTACT 10
> @@ -420,6 +421,13 @@ static const struct mt_class mt_classes[] = {
>   MT_QUIRK_APPLE_TOUCHBAR,
>   .maxcontacts = 11,
>   },
> + { .name = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
> + .quirks = MT_QUIRK_ALWAYS_VALID |
> + MT_QUIRK_SLOT_IS_CONTACTID |
> + MT_QUIRK_CONTACT_CNT_ACCURATE |
> + MT_QUIRK_CONFIDENCE |
> + MT_QUIRK_WIN8_PTP_BUTTONS,
> + },
>   { .name = MT_CLS_SIS,
>   .quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
>   MT_QUIRK_ALWAYS_VALID |
> @@ -2148,6 +2156,12 @@ static const struct hid_device_id mt_devices[] = {
>   HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>   USB_VENDOR_ID_ELAN, 0x3148) },
> 
> + { .driver_data = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
> + HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x32c8) },
> +
> + { .driver_data = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
> + HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x310a) },
> +
>   { .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
>   HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>   USB_VENDOR_ID_ELAN, 0x32ae) },

Thanks a lot for the patch.

Unfortunately it has been whitespace-damaged by your mail client, and so 
it can't be applied.

Could you please fix that on your side, and resubmit?

Thanks,

-- 
Jiri Kosina
SUSE Labs


