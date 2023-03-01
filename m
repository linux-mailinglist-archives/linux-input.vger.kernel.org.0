Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820886A6C3D
	for <lists+linux-input@lfdr.de>; Wed,  1 Mar 2023 13:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjCAMXQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Mar 2023 07:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCAMXQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Mar 2023 07:23:16 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945AA55BD;
        Wed,  1 Mar 2023 04:23:14 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 3560A40006;
        Wed,  1 Mar 2023 12:23:11 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH v2 1/6] HID: logitech-hidpp: Simplify array length check
Date:   Wed,  1 Mar 2023 13:23:05 +0100
Message-Id: <20230301122310.3579-1-hadess@hadess.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the compiler to force a 100-length array, rather than check the
length after the fact.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
New in v2, following a review comment in the 1f20 enablement patch.

 drivers/hid/hid-logitech-hidpp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index ff1fcebf2ec7..f55b2233dbea 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1356,7 +1356,7 @@ static int hidpp20_map_battery_capacity(struct hid_device *hid_dev, int voltage)
 	 * there are a few devices that use different battery technology.
 	 */
 
-	static const int voltages[] = {
+	static const int voltages[100] = {
 		4186, 4156, 4143, 4133, 4122, 4113, 4103, 4094, 4086, 4075,
 		4067, 4059, 4051, 4043, 4035, 4027, 4019, 4011, 4003, 3997,
 		3989, 3983, 3976, 3969, 3961, 3955, 3949, 3942, 3935, 3929,
@@ -1371,8 +1371,6 @@ static int hidpp20_map_battery_capacity(struct hid_device *hid_dev, int voltage)
 
 	int i;
 
-	BUILD_BUG_ON(ARRAY_SIZE(voltages) != 100);
-
 	if (unlikely(voltage < 3500 || voltage >= 5000))
 		hid_warn_once(hid_dev,
 			      "%s: possibly using the wrong voltage curve\n",
-- 
2.39.2

