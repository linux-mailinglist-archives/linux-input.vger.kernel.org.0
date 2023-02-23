Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102796A04CD
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 10:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbjBWJad convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 23 Feb 2023 04:30:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbjBWJab (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 04:30:31 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2273F53EDB
        for <linux-input@vger.kernel.org>; Thu, 23 Feb 2023 01:30:29 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id DE3C4E0002;
        Thu, 23 Feb 2023 09:30:26 +0000 (UTC)
Message-ID: <7a5f563caf0c2b5a033960915d9497d47a194378.camel@hadess.net>
Subject: Re: [PATCH 2/2] HID: logitech-hidpp: Add support for the Pro X
 Superlight
From:   Bastien Nocera <hadess@hadess.net>
To:     Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
        linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, lains@riseup.net
Date:   Thu, 23 Feb 2023 10:30:26 +0100
In-Reply-To: <20230222222800.83077-2-mavchatz@protonmail.com>
References: <20230222222800.83077-1-mavchatz@protonmail.com>
         <20230222222800.83077-2-mavchatz@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2023-02-22 at 22:29 +0000, Mavroudis Chatzilazaridis wrote:
> This patch adds support for the Pro X Superlight. Tested over USB.
> 
> Co-developed-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>

This patch is:
Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 9c1ee8e91e0c..62683a712f8e 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4350,6 +4350,8 @@ static const struct hid_device_id
> hidpp_devices[] = {
>                 .driver_data = HIDPP_QUIRK_CLASS_G920 |
> HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
>         { /* Logitech G Pro Gaming Mouse over USB */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
> +       { /* Logitech G Pro X Superlight Gaming Mouse over USB */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },
> 
>         { /* MX5000 keyboard over Bluetooth */
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
> --
> 2.34.1
> 
> 

