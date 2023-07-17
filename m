Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A1F7558D4
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 02:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjGQAYI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sun, 16 Jul 2023 20:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjGQAYH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jul 2023 20:24:07 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98BEE47
        for <linux-input@vger.kernel.org>; Sun, 16 Jul 2023 17:24:05 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5ADD20005;
        Mon, 17 Jul 2023 00:24:02 +0000 (UTC)
Message-ID: <a18e5a46e53f0abf58d5d0e4171d225aa1e7872e.camel@hadess.net>
Subject: Re: [PATCH v2 2/2] HID: logitech-hidpp: Add support for the Pro X
 Superlight
From:   Bastien Nocera <hadess@hadess.net>
To:     Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
        jikos@kernel.org
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        lains@riseup.net
Date:   Mon, 17 Jul 2023 02:24:02 +0200
In-Reply-To: <20230716182320.85483-2-mavchatz@protonmail.com>
References: <20230716182320.85483-1-mavchatz@protonmail.com>
         <20230716182320.85483-2-mavchatz@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2023-07-16 at 18:23 +0000, Mavroudis Chatzilazaridis wrote:
> This patch adds support for the Pro X Superlight over wired USB.
> The device now reports the status of its battery.
> 
> Co-developed-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
> V1 -> V2: Addressed review comment for commit message
> 
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 129b01be488d..34fc4f7b254a 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4620,6 +4620,8 @@ static const struct hid_device_id
> hidpp_devices[] = {
>                 .driver_data = HIDPP_QUIRK_CLASS_G920 |
> HIDPP_QUIRK_FORCE_OUTPUT_REPORTS },
>         { /* Logitech G Pro Gaming Mouse over USB */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
> +       { /* Logitech G Pro X Superlight Gaming Mouse over USB */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },
> 
>         { /* G935 Gaming Headset */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87),
> --
> 2.34.1
> 
> 

