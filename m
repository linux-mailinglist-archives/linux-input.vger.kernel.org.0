Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD0178C05F
	for <lists+linux-input@lfdr.de>; Tue, 29 Aug 2023 10:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbjH2Ihd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 29 Aug 2023 04:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjH2Ihd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Aug 2023 04:37:33 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5F1A4
        for <linux-input@vger.kernel.org>; Tue, 29 Aug 2023 01:37:30 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 790B51C0002;
        Tue, 29 Aug 2023 08:37:27 +0000 (UTC)
Message-ID: <4a55062e038a2d46c770ff28f7c1de94c3595e95.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Add Bluetooth ID for the Logitech
 M720 Triathlon mouse
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
Date:   Tue, 29 Aug 2023 10:37:26 +0200
In-Reply-To: <20230827222438.43717-1-hdegoede@redhat.com>
References: <20230827222438.43717-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2023-08-28 at 00:24 +0200, Hans de Goede wrote:
> Using hidpp for the M720 adds battery info reporting and hires
> scrolling support.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Signed-off-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 129b01be488d..3786fcc93da0 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4640,6 +4640,8 @@ static const struct hid_device_id
> hidpp_devices[] = {
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb008) },
>         { /* MX Master mouse over Bluetooth */
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012) },
> +       { /* M720 Triathlon mouse over Bluetooth */
> +         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb015) },
>         { /* MX Ergo trackball over Bluetooth */
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01d) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e) },

