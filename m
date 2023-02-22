Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE89869FE86
	for <lists+linux-input@lfdr.de>; Wed, 22 Feb 2023 23:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjBVW3l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Feb 2023 17:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbjBVW3k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Feb 2023 17:29:40 -0500
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7145BBB
        for <linux-input@vger.kernel.org>; Wed, 22 Feb 2023 14:29:39 -0800 (PST)
Date:   Wed, 22 Feb 2023 22:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1677104978; x=1677364178;
        bh=PF32fj3r58mRXl+i17PTQ+A7Cf4XnSBKlnUY8CpV/hE=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=QOMya/f/5fP91uhGup2MDpc7xCJc6IIjTQiUXdSLJSeAqsKLbgN+JN+sWq3ciMN40
         RtFOahV9odcvO0Vy7jxANPM+TbdCjmzZan5mvRqByH1bnv7T208wYSwXa0Cfyu5C2F
         0Xj8WWKJ1js/FUuyFXVPMCAlFr9yO/kL8NK8NFZQDtmwMjrkiCDFHybVJ31SGBk5dU
         qD0bDWyxuAlQcM3KzEMkUvPBRzWLQuJcUN07i/U6eQpxT4OmKtYBPMb5wU9Ya+Dkq2
         i+HGXlI6OqYsimWC5HU2r+SkSIEGuYQnkanjuZPh5HmSMW4Nwczl193UguuNT9mmio
         21TDHVNZjBILw==
To:     linux-input@vger.kernel.org
From:   Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, lains@riseup.net,
        Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Subject: [PATCH 2/2] HID: logitech-hidpp: Add support for the Pro X Superlight
Message-ID: <20230222222800.83077-2-mavchatz@protonmail.com>
In-Reply-To: <20230222222800.83077-1-mavchatz@protonmail.com>
References: <20230222222800.83077-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Pro X Superlight. Tested over USB.

Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 9c1ee8e91e0c..62683a712f8e 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4350,6 +4350,8 @@ static const struct hid_device_id hidpp_devices[] =3D=
 {
 =09=09.driver_data =3D HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_R=
EPORTS},
 =09{ /* Logitech G Pro Gaming Mouse over USB */
 =09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
+=09{ /* Logitech G Pro X Superlight Gaming Mouse over USB */
+=09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },

 =09{ /* MX5000 keyboard over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
--
2.34.1


