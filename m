Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA9D3E9DC7
	for <lists+linux-input@lfdr.de>; Thu, 12 Aug 2021 07:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhHLFJO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Aug 2021 01:09:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230244AbhHLFJO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Aug 2021 01:09:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C49B60FC4;
        Thu, 12 Aug 2021 05:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628744929;
        bh=zX7meERf8RcqrhN1l20qBVnHyZJMJ1djMNZakDOUmFY=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=bo+5tKWXljFFhGBhWCk1xZ+zSvFSO0BY24KL7tW8D33OlaBmrZ27+8fyigg7MZENC
         P9LVeEPsSY3Brqf6kLJzKeJeKK/vpkoW0BU6tf7YdnUi/SWs0kF1KBSLfYzeKplmqr
         GYSO5zmrhaPJUKGPIdj/Q9j1T2q86N19OrxIpHChuFldHg2ErcrKkQnYa3tMFMNKIq
         1NfhYfrWDlInO2MmoTS12JDUGa817sYmooMs0mUEJrUHlaN1Qz2m7YONZHe+i1szlo
         xfRpSyMk5xqUwN9r9QylvpcOHqpFOquODHkRUqqRGI61HfF3bXsgaDgFE/NJ46WXIy
         VcRQCgEM2/F5g==
References: <20210812001250.1709418-1-dmanti@microsoft.com>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Dmitry Antipov <daantipov@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, jeff.glaum@microsoft.com,
        Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
Date:   Thu, 12 Aug 2021 08:04:40 +0300
In-reply-to: <20210812001250.1709418-1-dmanti@microsoft.com>
Message-ID: <874kbv1c82.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi Dmitry,

Dmitry Antipov <daantipov@gmail.com> writes:
> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
> and presents itself as a HID device. This patch contains the changes needed
> for the driver to work as a module: HID Core affordances for SPI devices,
> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
> itself is being prepared for a submission in the near future.

commit log should be broken down at 72 characters

> Signed-off-by: Dmitry Antipov dmanti@microsoft.com

this is not the correct way of adding your Signed-off-by line, I'm
afraid. It should look like this:

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>

> ---
>  drivers/hid/hid-core.c      |  3 +++
>  drivers/hid/hid-ids.h       |  2 ++
>  drivers/hid/hid-microsoft.c | 15 +++++++++++++--
>  drivers/hid/hid-quirks.c    |  2 ++
>  include/linux/hid.h         |  2 ++
>  5 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 7db332139f7d..123a0e3a6b1a 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
>  	case BUS_I2C:
>  		bus = "I2C";
>  		break;
> +	case BUS_SPI:
> +		bus = "SPI";
> +		break;
>  	case BUS_VIRTUAL:
>  		bus = "VIRTUAL";
>  		break;

this should come as its own patch since it's not directly related to $subject

> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 8f1893e68112..5c181d23a7ae 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -885,6 +885,8 @@
>  #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER	0x02fd
>  #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
>  #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
> +#define SPI_DEVICE_ID_MS_SURFACE_G6_0	0x0c1d
> +#define SPI_DEVICE_ID_MS_SURFACE_G6_1	0x0c42
>  
>  #define USB_VENDOR_ID_MOJO		0x8282
>  #define USB_DEVICE_ID_RETRO_ADAPTER	0x3201
> diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
> index 071fd093a5f4..50ea1f68c285 100644
> --- a/drivers/hid/hid-microsoft.c
> +++ b/drivers/hid/hid-microsoft.c
> @@ -27,6 +27,7 @@
>  #define MS_DUPLICATE_USAGES	BIT(5)
>  #define MS_SURFACE_DIAL		BIT(6)
>  #define MS_QUIRK_FF		BIT(7)
> +#define MS_NOHIDINPUT		BIT(8)
>  
>  struct ms_data {
>  	unsigned long quirks;
> @@ -367,6 +368,7 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	unsigned long quirks = id->driver_data;
>  	struct ms_data *ms;
>  	int ret;
> +	unsigned int connect_mask;
>  
>  	ms = devm_kzalloc(&hdev->dev, sizeof(*ms), GFP_KERNEL);
>  	if (ms == NULL)
> @@ -376,20 +378,25 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  
>  	hid_set_drvdata(hdev, ms);
>  
> +	connect_mask = HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
> +			HID_CONNECT_HIDINPUT_FORCE : 0);
> +
>  	if (quirks & MS_NOGET)
>  		hdev->quirks |= HID_QUIRK_NOGET;
>  
>  	if (quirks & MS_SURFACE_DIAL)
>  		hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
>  
> +	if (quirks & MS_NOHIDINPUT)
> +		connect_mask &= ~HID_CONNECT_HIDINPUT;
> +
>  	ret = hid_parse(hdev);
>  	if (ret) {
>  		hid_err(hdev, "parse failed\n");
>  		goto err_free;
>  	}
>  
> -	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
> -				HID_CONNECT_HIDINPUT_FORCE : 0));
> +	ret = hid_hw_start(hdev, connect_mask);
>  	if (ret) {
>  		hid_err(hdev, "hw start failed\n");
>  		goto err_free;

it looks like adding connect_mask could also be done as a separate
patch where the first patch just converts the existing code to use
connect_mask and addition for both G6 IDs is done separately

> @@ -450,6 +457,10 @@ static const struct hid_device_id ms_devices[] = {
>  		.driver_data = MS_QUIRK_FF },
>  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS),
>  		.driver_data = MS_QUIRK_FF },
> +	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0),
> +		.driver_data = MS_NOHIDINPUT },
> +	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1),
> +		.driver_data = MS_NOHIDINPUT },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(hid, ms_devices);
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 51b39bda9a9d..01609e5425b9 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -506,6 +506,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_DIGITAL_MEDIA_3KV1) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_POWER_COVER) },
>  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_PRESENTER_8K_BT) },
> +	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0) },
> +	{ HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1) },
>  #endif
>  #if IS_ENABLED(CONFIG_HID_MONTEREY)
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MONTEREY, USB_DEVICE_ID_GENIUS_KB29E) },
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 9e067f937dbc..32823c6b65f6 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -684,6 +684,8 @@ struct hid_descriptor {
>  	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
>  #define HID_I2C_DEVICE(ven, prod)				\
>  	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
> +#define HID_SPI_DEVICE(ven, prod)				\
> +	.bus = BUS_SPI, .vendor = (ven), .product = (prod)

Adding this helper should be done as a seperate too.

-- 
balbi
