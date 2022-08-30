Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D48E5A622D
	for <lists+linux-input@lfdr.de>; Tue, 30 Aug 2022 13:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbiH3LjM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 07:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiH3LiN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 07:38:13 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4E01636DC;
        Tue, 30 Aug 2022 04:36:36 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 3943E40009;
        Tue, 30 Aug 2022 11:36:22 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [v2 5/5] HID: logitech-hidpp: Remove hard-coded "Sw. Id." for HID++ 2.0 commands
Date:   Tue, 30 Aug 2022 13:36:15 +0200
Message-Id: <20220830113615.4414-5-hadess@hadess.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830113615.4414-1-hadess@hadess.net>
References: <20220830113615.4414-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some HID++ 2.0 commands had correctly set a non-zero software identifier
directly as part of their function identifiers, but it's more correct to
define the function identifier and the software identifier separately
before combined them when the command is sent.

As this is now done in the previous commit, remove the hard-coded 0x1
software identifiers in the function definitions.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-logitech-hidpp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 9c8088d8879e..31e2ca97e0ad 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -859,8 +859,8 @@ static int hidpp_unifying_init(struct hidpp_device *hidpp)
 #define HIDPP_PAGE_ROOT					0x0000
 #define HIDPP_PAGE_ROOT_IDX				0x00
 
-#define CMD_ROOT_GET_FEATURE				0x01
-#define CMD_ROOT_GET_PROTOCOL_VERSION			0x11
+#define CMD_ROOT_GET_FEATURE				0x00
+#define CMD_ROOT_GET_PROTOCOL_VERSION			0x10
 
 static int hidpp_root_get_feature(struct hidpp_device *hidpp, u16 feature,
 	u8 *feature_index, u8 *feature_type)
@@ -937,9 +937,9 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 
 #define HIDPP_PAGE_GET_DEVICE_NAME_TYPE			0x0005
 
-#define CMD_GET_DEVICE_NAME_TYPE_GET_COUNT		0x01
-#define CMD_GET_DEVICE_NAME_TYPE_GET_DEVICE_NAME	0x11
-#define CMD_GET_DEVICE_NAME_TYPE_GET_TYPE		0x21
+#define CMD_GET_DEVICE_NAME_TYPE_GET_COUNT		0x00
+#define CMD_GET_DEVICE_NAME_TYPE_GET_DEVICE_NAME	0x10
+#define CMD_GET_DEVICE_NAME_TYPE_GET_TYPE		0x20
 
 static int hidpp_devicenametype_get_count(struct hidpp_device *hidpp,
 	u8 feature_index, u8 *nameLength)
@@ -1969,8 +1969,8 @@ static int hidpp_touchpad_fw_items_set(struct hidpp_device *hidpp,
 
 #define HIDPP_PAGE_TOUCHPAD_RAW_XY			0x6100
 
-#define CMD_TOUCHPAD_GET_RAW_INFO			0x01
-#define CMD_TOUCHPAD_SET_RAW_REPORT_STATE		0x21
+#define CMD_TOUCHPAD_GET_RAW_INFO			0x00
+#define CMD_TOUCHPAD_SET_RAW_REPORT_STATE		0x20
 
 #define EVENT_TOUCHPAD_RAW_XY				0x00
 
-- 
2.37.2

