Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1942873446E
	for <lists+linux-input@lfdr.de>; Sun, 18 Jun 2023 01:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjFQXrm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Jun 2023 19:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjFQXrl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Jun 2023 19:47:41 -0400
X-Greylist: delayed 2238 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 17 Jun 2023 16:47:39 PDT
Received: from vuizook.err.no (vuizook.err.no [IPv6:2a02:20c8:2640::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BF010DB
        for <linux-input@vger.kernel.org>; Sat, 17 Jun 2023 16:47:39 -0700 (PDT)
Received: from [2400:4160:1877:2b00:f8a5:bd32:1108:a1af] (helo=glandium.org)
        by vuizook.err.no with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <mh@glandium.org>)
        id 1qAf3U-00CkNO-1z;
        Sat, 17 Jun 2023 23:10:07 +0000
Received: from glandium by goemon.lan with local (Exim 4.96)
        (envelope-from <mh@glandium.org>)
        id 1qAf3N-000Rrd-0T;
        Sun, 18 Jun 2023 08:09:57 +0900
Date:   Sun, 18 Jun 2023 08:09:57 +0900
From:   Mike Hommey <mh@glandium.org>
To:     linux-input@vger.kernel.org
Cc:     Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] HID: logitech-hidpp: add HIDPP_QUIRK_DELAYED_INIT for the
 T651.
Message-ID: <20230617230957.6mx73th4blv7owqk@glandium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

498ba20690357691103de0f766960355247c78be put restarting communication
behind that flag, and this was apparently necessary on the T651, but the
flag was not set for it.

Signed-off-by: Mike Hommey <mh@glandium.org>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index fdb66dc06582..4f227bc5c6b0 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4299,7 +4299,7 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* wireless touchpad T651 */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_T651),
-	  .driver_data = HIDPP_QUIRK_CLASS_WTP },
+	  .driver_data = HIDPP_QUIRK_CLASS_WTP | HIDPP_QUIRK_DELAYED_INIT },
 	{ /* Mouse Logitech Anywhere MX */
 	  LDJ_DEVICE(0x1017), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_1P0 },
 	{ /* Mouse logitech M560 */
-- 
2.41.0.6.ge371d37104

