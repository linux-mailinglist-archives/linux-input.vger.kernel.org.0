Return-Path: <linux-input+bounces-11956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F130DA9A7B7
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4191A4429E8
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4403721FF2B;
	Thu, 24 Apr 2025 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9mhJGqa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAA215160;
	Thu, 24 Apr 2025 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486977; cv=none; b=AizFsswum4tfVayN4dC6uffZFy1HJMiW2jY35qLssS5Wq8oooDu+yitvlt67aP1xhxL2yedfZCBogLoYWkUIZniLwVeDfzDsscB3XFxvZ08xo/qjrB5uuK2ADh17hBc4aLohDiz2Ys9291sWFORMfBejAwLC50M/xE0ndsiDXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486977; c=relaxed/simple;
	bh=mfeCcXFSUEV+RTnqle7bb/IIg22D0C5n7aVqcoTgifk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kzqtNEwWrQqIi8Lb+XchdIo1tZbTyzFR2Q7HSIDI7WHasAMzbMM2nRlZ4/EsYErNi3/27pKd5euXfIQUnQLB3pE8siFqmndbXp73v+JF/cFcLILQpLE2XRxvdQl9soTXoNZU3CJO33cAuNJEZ+9cXkdvMm/AS2q6K3khacaQxiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9mhJGqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F340FC4CEE3;
	Thu, 24 Apr 2025 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745486976;
	bh=mfeCcXFSUEV+RTnqle7bb/IIg22D0C5n7aVqcoTgifk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j9mhJGqacugISBGmT0Kl6bE52iRL2p6d5TUvfxOVkpBJ+IeB84fWDXePhxcjR5EKx
	 Iz9zHz8DPjvVrnhjOJAOLp5Ix6fV6QKQPe5S1L/q9MMLkdA55gttUW14ut1UC/A/g6
	 HL38MUklR4SvlOorZjCfUhVCQ4f+rve77fGjTS3VttFyAzPF8Ds349m3YQ3e/GmCjf
	 5UybVUhESwvhbYDuYlXrH3QawrmC7Um4AvAWDY1k5W48NLh7+lC+01MkgN6nVZKsCm
	 0yTcL/hGHD4ol59lyhMy5HH40Pny6I96aAE0IuYApRO/Shk23cFbtqvvsuVuAdN2Mf
	 2Vz91TQ9SvTIQ==
Date: Thu, 24 Apr 2025 11:29:33 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add quirk for Chicony Electronics HP 5MP
 Camera
In-Reply-To: <20250312063532.551938-1-acelan.kao@canonical.com>
Message-ID: <s3ns5747-ps0n-1no0-1qqq-prq39onr7o79@xreary.bet>
References: <20250312063532.551938-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Chia-Lin Kao (AceLan) wrote:

> The Chicony Electronics HP 5MP Camera (USB ID 04F2:B82C) reports a HID
> sensor interface that is not actually implemented. Attempting to access
> this non-functional sensor via iio_info causes system hangs as runtime PM
> tries to wake up an unresponsive sensor.
> 
> Add this device to the HID ignore list since the sensor interface is
> non-functional by design and should not be exposed to userspace.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/hid/hid-ids.h    | 1 +
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 7e400624908e..5fdea9116a3e 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -297,6 +297,7 @@
>  #define USB_DEVICE_ID_ASUS_AK1D		0x1125
>  #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
>  #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
> +#define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA	0xb82c
>  
>  #define USB_VENDOR_ID_CHUNGHWAT		0x2247
>  #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 5d7a418ccdbe..452fac15550b 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -370,6 +370,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS2) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACER_SWITCH12) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA) },

Given the changelog, did you mean to add this device to hid_ignore_list[] 
instead of hid_have_special_driver[]?

Thanks,

-- 
Jiri Kosina
SUSE Labs


