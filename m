Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F424755047
	for <lists+linux-input@lfdr.de>; Sun, 16 Jul 2023 20:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjGPSYC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jul 2023 14:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGPSYB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jul 2023 14:24:01 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDF01B1
        for <linux-input@vger.kernel.org>; Sun, 16 Jul 2023 11:24:00 -0700 (PDT)
Date:   Sun, 16 Jul 2023 18:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1689531836; x=1689791036;
        bh=YbnC/ao1sJ0SEeVgWN8yzejyjpAjHfef0xMigHZll8E=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=SdkNl7U3qSH0PC2n4vrQ4WLKxqJMCvMNJmrukNXhcgXr4bXPYBqxc++vbNCs0pOhJ
         ax0mtrM4+bQqDKFttmzx27Jnf6CHWxyLBmI/2ExSuLnJfwTEFE8O3ZjIh/wekQhux8
         MPTqdQL4QvToHcB7l9/XPbhW8cpTqYdsAGYP2PbF853a06lGHI1RKBcK2gF89FFW0L
         bsrlBfDQKrLyax6C/wncBrQx+8e6MihanPL4UxHrS9k+2C4ONWD+wuTrnY8UjMocBr
         UMvhFrhjLT7gb5GjBIh6DYtwg1w0NWSvzlCxO70/kxIhg09hAF5FgWu+OcAnxvuVKX
         U6iqsLzpmYgxA==
To:     jikos@kernel.org
From:   Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        lains@riseup.net, hadess@hadess.net,
        Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Subject: [PATCH v2 2/2] HID: logitech-hidpp: Add support for the Pro X Superlight
Message-ID: <20230716182320.85483-2-mavchatz@protonmail.com>
In-Reply-To: <20230716182320.85483-1-mavchatz@protonmail.com>
References: <20230716182320.85483-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Pro X Superlight over wired USB.
The device now reports the status of its battery.

Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
V1 -> V2: Addressed review comment for commit message

 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 129b01be488d..34fc4f7b254a 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4620,6 +4620,8 @@ static const struct hid_device_id hidpp_devices[] =3D=
 {
 =09=09.driver_data =3D HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_R=
EPORTS },
 =09{ /* Logitech G Pro Gaming Mouse over USB */
 =09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
+=09{ /* Logitech G Pro X Superlight Gaming Mouse over USB */
+=09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },

 =09{ /* G935 Gaming Headset */
 =09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87),
--
2.34.1


