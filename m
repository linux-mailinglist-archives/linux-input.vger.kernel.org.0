Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3F46F95EA
	for <lists+linux-input@lfdr.de>; Sun,  7 May 2023 02:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjEGAim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 May 2023 20:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjEGAiS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 May 2023 20:38:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5D02E057;
        Sat,  6 May 2023 17:36:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5882861542;
        Sun,  7 May 2023 00:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F371C433EF;
        Sun,  7 May 2023 00:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683419780;
        bh=fhDc8Mr7f5Ce10PfnNegkzjN320l8qdJIDWbidJY/ZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gBIUbqBLCIR2ns1GsKfVbjrID8xZFnDUMygxMbRXQZZnHWH5p2yjXNj89TL6ufRUn
         u87NR8dt9O7WRG2T0LXTi8EVWzSyr6tVBv7L7x41vBt5EXl3k9ty/pBd5LJJKZ4Bnd
         1OHT2OECCrVev6ThBqyB0xJI/s6K2xZm8kmXAWKFYrFOZR4JdpYOqWZDgyDJSDdVkV
         h5gUdQk3f6ZeRngMmvNPXWMOKTWBWqueGqU+KsVidnHYLSO7+3OdLJay9jJoD2fyzY
         io9fpMTGtwrlbBCgBBuXH5hPtyL9+YaWfl25eh1MEd7vRWeeOpMcUc3YtpwW97aPa2
         yrAUjIYC354eg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sasha Levin <sashal@kernel.org>, jikos@kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 3/9] HID: logitech-hidpp: Don't use the USB serial for USB devices
Date:   Sat,  6 May 2023 20:36:03 -0400
Message-Id: <20230507003609.4079746-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003609.4079746-1-sashal@kernel.org>
References: <20230507003609.4079746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bastien Nocera <hadess@hadess.net>

[ Upstream commit 7ad1fe0da0fa91bf920b79ab05ae97bfabecc4f4 ]

For devices that support the 0x0003 feature (Device Information) version 4,
set the serial based on the output of that feature, rather than relying
on the usbhid code setting the USB serial.

This should allow the serial when connected through USB to (nearly)
match the one when connected through a unifying receiver.

For example, on the serials on a G903 wired/wireless mouse:
- Unifying: 4067-e8-ce-cd-45
- USB before patch: 017C385C3837
- USB after patch: c086-e8-ce-cd-45

Signed-off-by: Bastien Nocera <hadess@hadess.net>
Link: https://lore.kernel.org/r/20230302130117.3975-1-hadess@hadess.net
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-logitech-hidpp.c | 51 ++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 919551ed5809c..2fd64361884cf 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -903,6 +903,55 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 	return 0;
 }
 
+/* -------------------------------------------------------------------------- */
+/* 0x0003: Device Information                                                 */
+/* -------------------------------------------------------------------------- */
+
+#define HIDPP_PAGE_DEVICE_INFORMATION			0x0003
+
+#define CMD_GET_DEVICE_INFO				0x00
+
+static int hidpp_get_serial(struct hidpp_device *hidpp, u32 *serial)
+{
+	struct hidpp_report response;
+	u8 feature_type;
+	u8 feature_index;
+	int ret;
+
+	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_DEVICE_INFORMATION,
+				     &feature_index,
+				     &feature_type);
+	if (ret)
+		return ret;
+
+	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
+					  CMD_GET_DEVICE_INFO,
+					  NULL, 0, &response);
+	if (ret)
+		return ret;
+
+	/* See hidpp_unifying_get_serial() */
+	*serial = *((u32 *)&response.rap.params[1]);
+	return 0;
+}
+
+static int hidpp_serial_init(struct hidpp_device *hidpp)
+{
+	struct hid_device *hdev = hidpp->hid_dev;
+	u32 serial;
+	int ret;
+
+	ret = hidpp_get_serial(hidpp, &serial);
+	if (ret)
+		return ret;
+
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%04x-%4phD",
+		 hdev->product, &serial);
+	dbg_hid("HID++ DeviceInformation: Got serial: %s\n", hdev->uniq);
+
+	return 0;
+}
+
 /* -------------------------------------------------------------------------- */
 /* 0x0005: GetDeviceNameType                                                  */
 /* -------------------------------------------------------------------------- */
@@ -3651,6 +3700,8 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	if (hidpp->quirks & HIDPP_QUIRK_UNIFYING)
 		hidpp_unifying_init(hidpp);
+	else if (hid_is_usb(hidpp->hid_dev))
+		hidpp_serial_init(hidpp);
 
 	connected = hidpp_root_get_protocol_version(hidpp) == 0;
 	atomic_set(&hidpp->connected, connected);
-- 
2.39.2

