Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A901D26C73
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 21:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733147AbfEVTex (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 15:34:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387471AbfEVTbT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 15:31:19 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D49E217D4;
        Wed, 22 May 2019 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558553477;
        bh=WkxAnb2XTpt9fXrX1Fshz0xP0Zg9UDU8KBt774ofzLw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1cSI7JITRlefmPhBejF8tbnw0viU7FwjhS9iAYfN7dBEAAWtvDseGJHZLzE3n8kVH
         zppYdznK5ye8E9zza4MCbT//MWSJO45rXx2X5G5T7qr1FHkU0uWhoqrSjI+UJPhFCz
         LMXiY6CQ5/SoqB7JPpJKXQ6CX1mXAvbWiGhEL4ic=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 037/114] HID: logitech-hidpp: use RAP instead of FAP to get the protocol version
Date:   Wed, 22 May 2019 15:29:00 -0400
Message-Id: <20190522193017.26567-37-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522193017.26567-1-sashal@kernel.org>
References: <20190522193017.26567-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 096377525cdb8251e4656085efc988bdf733fb4c ]

According to the logitech_hidpp_2.0_specification_draft_2012-06-04.pdf doc:
https://lekensteyn.nl/files/logitech/logitech_hidpp_2.0_specification_draft_2012-06-04.pdf

We should use a register-access-protocol request using the short input /
output report ids. This is necessary because 27MHz HID++ receivers have
a max-packetsize on their HIP++ endpoint of 8, so they cannot support
long reports. Using a feature-access-protocol request (which is always
long or very-long) with these will cause a timeout error, followed by
the hidpp driver treating the device as not being HID++ capable.

This commit fixes this by switching to using a rap request to get the
protocol version.

Besides being tested with a (046d:c517) 27MHz receiver with various
27MHz keyboards and mice, this has also been tested to not cause
regressions on a non-unifying dual-HID++ nano receiver (046d:c534) with
k270 and m185 HID++-2.0 devices connected and on a unifying/dj receiver
(046d:c52b) with a HID++-2.0 Logitech Rechargeable Touchpad T650.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-logitech-hidpp.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 3198faf5cff4d..38d9deb03d16c 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -449,13 +449,16 @@ static int hidpp_root_get_feature(struct hidpp_device *hidpp, u16 feature,
 
 static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 {
+	const u8 ping_byte = 0x5a;
+	u8 ping_data[3] = { 0, 0, ping_byte };
 	struct hidpp_report response;
 	int ret;
 
-	ret = hidpp_send_fap_command_sync(hidpp,
+	ret = hidpp_send_rap_command_sync(hidpp,
+			REPORT_ID_HIDPP_SHORT,
 			HIDPP_PAGE_ROOT_IDX,
 			CMD_ROOT_GET_PROTOCOL_VERSION,
-			NULL, 0, &response);
+			ping_data, sizeof(ping_data), &response);
 
 	if (ret == HIDPP_ERROR_INVALID_SUBID) {
 		hidpp->protocol_major = 1;
@@ -475,8 +478,14 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 	if (ret)
 		return ret;
 
-	hidpp->protocol_major = response.fap.params[0];
-	hidpp->protocol_minor = response.fap.params[1];
+	if (response.rap.params[2] != ping_byte) {
+		hid_err(hidpp->hid_dev, "%s: ping mismatch 0x%02x != 0x%02x\n",
+			__func__, response.rap.params[2], ping_byte);
+		return -EPROTO;
+	}
+
+	hidpp->protocol_major = response.rap.params[0];
+	hidpp->protocol_minor = response.rap.params[1];
 
 	return ret;
 }
-- 
2.20.1

