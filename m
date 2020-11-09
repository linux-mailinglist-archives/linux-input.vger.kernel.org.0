Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C9E2AB798
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 12:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgKILzu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 06:55:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:37030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729038AbgKILzu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 06:55:50 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E1FE206ED;
        Mon,  9 Nov 2020 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604922949;
        bh=+JM9kGHHQbd+vs2uJhphVKhVEtGbzZBEFY8N/jcVdGg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SP2uREV97IEiFPFcvTkOPiL2gN/rSlaZV+JbK/VwXTpsJqi3X8qXgAgi1EX3sEsrp
         C9Dlyn61/XzEC0s/j2+/K6QhPnA+E/maneSO9EDUrE/rzAI+csUQgKYEw4mMzz1/iV
         u6H79N4JZvsScCrTPOrbjDbJo2XWS9kzjyKJXgXU=
Date:   Mon, 9 Nov 2020 12:55:46 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Chris Ye <lzye@google.com>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linzhao.ye@gmail.com
Subject: Re: [PATCH v2] Input: Add devices for
 HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
In-Reply-To: <20201101193452.678628-1-lzye@google.com>
Message-ID: <nycvar.YFH.7.76.2011091255280.18859@cbobk.fhfr.pm>
References: <20201101193452.678628-1-lzye@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 1 Nov 2020, Chris Ye wrote:

> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 74be76e848bf..cf55dca494f3 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -449,6 +449,10 @@
>  #define USB_VENDOR_ID_FRUCTEL	0x25B6
>  #define USB_DEVICE_ID_GAMETEL_MT_MODE	0x0002
>  
> +#define USB_VENDOR_ID_GAMEVICE	0x27F8
> +#define USB_DEVICE_ID_GAMEVICE_GV186	0x0BBE
> +#define USB_DEVICE_ID_GAMEVICE_KISHI	0x0BBF
> +
>  #define USB_VENDOR_ID_GAMERON		0x0810
>  #define USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR	0x0001
>  #define USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR	0x0002
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 0440e2f6e8a3..36d94e3485e3 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -84,6 +84,10 @@ static const struct hid_device_id hid_quirks[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_FREESCALE, USB_DEVICE_ID_FREESCALE_MX28), HID_QUIRK_NOGET },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTABA, USB_DEVICE_ID_LED_DISPLAY), HID_QUIRK_NO_INIT_REPORTS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_GREENASIA, USB_DEVICE_ID_GREENASIA_DUAL_USB_JOYPAD), HID_QUIRK_MULTI_INPUT },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_GV186),
> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_KISHI),
> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_DRIVING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FIGHTING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FLYING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },

Applied for 5.10, thanks.

-- 
Jiri Kosina
SUSE Labs

