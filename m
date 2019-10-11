Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E06AD3B98
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 10:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbfJKIto (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 04:49:44 -0400
Received: from orion.archlinux.org ([88.198.91.70]:41392 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfJKIto (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 04:49:44 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id EC5C115C20A53D;
        Fri, 11 Oct 2019 08:49:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (unknown [154.53.1.40])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Fri, 11 Oct 2019 08:49:35 +0000 (UTC)
Message-ID: <403b3e7f6d276e47c447e6ea56a3370b03c3298c.camel@archlinux.org>
Subject: Re: [PATCH v4 1/4] HID: logitech: Add MX Mice over Bluetooth
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Mazin Rezk <mnrzk@protonmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com>
References: <uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com>
Organization: Archlinux
Content-Type: text/plain; charset="UTF-8"
Date:   Fri, 11 Oct 2019 09:49:34 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.34.1 
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2019-10-11 at 00:57 +0000, Mazin Rezk wrote:
> On Saturday, October 5, 2019 9:04 PM, Mazin Rezk <
> mnrzk@protonmail.com> wrote:
> 
> > This patch adds support for several MX mice over Bluetooth. The
> > device IDs
> > have been copied from the libratbag device database and their
> > features
> > have been based on their DJ device counterparts.
> 
> No changes have been made to this patch in v4. However, it should be
> noted
> that the only device that has been thoroughly tested in this patch is
> the
> MX Master (b01e). Further testing for the other devices may be
> required.
> 
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 0179f7ed77e5..85fd0c17cc2f 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3773,6 +3773,24 @@ static const struct hid_device_id
> hidpp_devices[] = {
>  	{ /* MX5500 keyboard over Bluetooth */
>  	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
>  	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> +	{ /* MX Anywhere 2 mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
> +	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
> +	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ /* MX Anywhere 2S mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
> +	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ /* MX Master mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> +	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
> +	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> +	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ /* MX Master 2S mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
> +	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{}
>  };
> 
> --
> 2.23.0
> 

The series now looks great, thanks!

Benjamin, I can confirm that up to now all BLE devices don't have short
reports. I am not sure if you still want to only enable tested devices
but from an architectural standpoint everything here should be fine.

Mazin, you can have my

Reviewed-by: Filipe Laíns <lains@archlinux.org>

for the series.

Thank you,
Filipe Laíns
