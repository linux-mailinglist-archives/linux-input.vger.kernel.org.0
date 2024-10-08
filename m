Return-Path: <linux-input+bounces-7139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7EA994084
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59115287552
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 08:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE3E1FF7DE;
	Tue,  8 Oct 2024 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHnww3WP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57440208A7;
	Tue,  8 Oct 2024 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728371755; cv=none; b=EU8avcF6EKQaTq//EjQETrRQMJ4lUSnZtA9RzTn1ZnfBDpC9df3v+fpSIB57yF0GJyua0RpVY0mZWozJq1zThRg0F0AJsTxnVOhDMSmHrwo1d+6xk1eSpfiD7Ze2YM+kRrXSKh41lziK5+sr6vw7CBXECpfFr6UmqRU1FBqRfUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728371755; c=relaxed/simple;
	bh=Kj9xot+Cc5gXKsItGYymzN0HhpTgvCvZ2UPo9Mfh0eY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HDh1k/PbolWt6qR9arGEphzqr6r2CEFBvoVPyyBemD+pQWpCSbg4eFfo8+QQTYybB+KBRyfGKXXwS4G0QSZxeBvypNChObvixCMZ+ttRtO3B8z0tHGcd3oV1lmh28x6q+UJvl4V6F86VAoUlPcV29CwTvFh2fgUXs5INRXvtc10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHnww3WP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95795C4CECC;
	Tue,  8 Oct 2024 07:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728371755;
	bh=Kj9xot+Cc5gXKsItGYymzN0HhpTgvCvZ2UPo9Mfh0eY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iHnww3WPpKHuxyiog2qMUFN45L/GLVeUObWK6ckRnmOVfm0fkXYm7qNJpUftLwU29
	 7dexTiLS9P1inQT7g+G/WTdsLf0UpxSKOlQTIIFecf7oxnZd+cQYxo46HdIUsVLmKh
	 /EEZNJRQV/ieEQ1tosIgbp7DvyMDj/o+RLYZmcBHqFTKhuMYb4EXreQvGDM/n0Xfz5
	 5KvRDm1j4ybLwvf2JU5/d8pM5SvthjKGyuQR2JYGit6nGVpfS1iI6QRWYV/LUZYWnH
	 6u/7CMrPhxuqP+g8K1OOv7ZYhLlTNqvgLxF7twuT+p7ZRLUOy0+et6fBU0eejpc//R
	 IQ029XqdhbRvA==
Date: Tue, 8 Oct 2024 09:15:52 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
cc: bentiss@kernel.org, guanwentao@uniontech.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, zhanjun@uniontech.com
Subject: Re: [PATCH v2] HID: multitouch: Add quirk for HONOR MagicBook Art
 14 touchpad
In-Reply-To: <43824FB10AAAE5DD+20241007040803.205047-1-wangyuli@uniontech.com>
Message-ID: <nycvar.YFH.7.76.2410080915450.20286@cbobk.fhfr.pm>
References: <43824FB10AAAE5DD+20241007040803.205047-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Oct 2024, WangYuli wrote:

> It sometimes after reboot change output from Touchpad to Mouse,
> evtest show it output from "TOPS0102:00 35CC:0104 Touchpad"
> to "TOPS0102:00 35CC:0104 Mouse",and it works as A mouse.
> 
> Like GLO-GXXX, as a workaround, it is possible to call
> MT_QUIRK_FORCE_GET_FEATURE to force set feature in mt_set_input_mode
> for such special touchpad device.
> 
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1040
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
>  drivers/hid/hid-multitouch.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 99812c0f830b..a1e0c3db3d4c 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -2082,6 +2082,11 @@ static const struct hid_device_id mt_devices[] = {
>  		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>  			0x347d, 0x7853) },
>  
> +	/* HONOR MagicBook Art 14 touchpad */
> +	{ .driver_data = MT_CLS_VTL,
> +		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> +			0x35cc, 0x0104) },
> +
>  	/* Ilitek dual touch panel */
>  	{  .driver_data = MT_CLS_NSMU,
>  		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


