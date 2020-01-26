Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 608D6149CD6
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2020 21:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgAZU2c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jan 2020 15:28:32 -0500
Received: from ams-node6.websitehostserver.net ([107.6.163.66]:34645 "EHLO
        ams-node6.websitehostserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726087AbgAZU2c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jan 2020 15:28:32 -0500
X-Greylist: delayed 2590 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 Jan 2020 15:28:31 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=welchs.me.uk; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1iuIIHLDXFgbIP0KUUM70+Fje7EhMg4VrZHvVRTSgKw=; b=ZJklnSWBRRBb4P0ApvH+OVF0qR
        JZWS+MnOcYi+wMV7zD8butsJuYD9vddeRTCllH43d/P+FF3wecIvRBTM4sZ35bhjxPO6C8lP4uAjl
        ugx/LrTAvB/bw09KERFl6I6q7tqiNbwkAE2fEUaLiskBS5DCPEnm0ZVZ6tZhjizWedh/ORvKXPu+H
        vpjXPMkEu3TG1wiPyu4jRarnMTlH9qCkTIeAtZvF3Jsb4JMmUJNFN+filcljRo00q0yzkof1dH2WK
        84j0qLaM/eqfB8poR30D9DdbXQWPVfVIjkYmCjhe9r721FEhONOInpAt5N5hqnXfSBIZeATV2o0zA
        jVO9+j8A==;
Received: from host86-133-53-79.range86-133.btcentralplus.com ([86.133.53.79]:37384 helo=hera.home)
        by ams-node6.websitehostserver.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <martyn@welchs.me.uk>)
        id 1ivnqR-0002ep-Ns; Sun, 26 Jan 2020 20:45:19 +0100
From:   Martyn Welch <martyn@welchs.me.uk>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martyn Welch <martyn@welchs.me.uk>,
        Conn O'Griofa <connogriofa@gmail.com>
Subject: [PATCH] HID: Sony: Add support for Gasia controllers
Date:   Sun, 26 Jan 2020 19:45:13 +0000
Message-Id: <20200126194513.6359-1-martyn@welchs.me.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ams-node6.websitehostserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - welchs.me.uk
X-Get-Message-Sender-Via: ams-node6.websitehostserver.net: authenticated_id: martyn@welchs.me.uk
X-Authenticated-Sender: ams-node6.websitehostserver.net: martyn@welchs.me.uk
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There seems to be a number of subtly different firmwares for the
Playstation controllers made by "Gasia Co.,Ltd". Whilst such controllers
are easily detectable when attached via USB that is not always the case
via Bluetooth. Some controllers are named "PLAYSTATION(R)3 Controller"
where as the official Sony controllers are named
"Sony PLAYSTATION(R)3 Controller", however some versions of firmware use
the exact name used by the official controllers. The only way I've been
able to distinguish these versions of the controller (when connected via
Bluetooth) is that the Bluetooth Class of Device incorrectly reports the
controller as a keyboard rather than a gamepad. I've so far failed to work
out how to access this information from a HID driver.

The Gasia controllers need output reports to be configured in the same way
as the Shanwan controllers. In order to ensure both types of Gasia firmware
will work, this patch adds a quirk for those devices it can detect and
reworks `sixaxis_send_output_report()` to attempt `hid_hw_output_report()`
should `hid_hw_raw_request()` be known to be the wrong option (as is the
case with the Shanwan controllers) or fails.

This has got all the controllers I have working, with the slight
anoyance that the Gasia controllers that don't currently get marked with
a quirk require the call to `hid_hw_raw_request()` to fail before the
controller finishes initialising (which adds a significant extra delay
before the controller is ready).

This patch is based on the following patch by Conn O'Griofa:

https://github.com/RetroPie/RetroPie-Setup/pull/2263/commits/017f00f6e15f04b3272ff1abae8742dc4c47b608

Cc: Conn O'Griofa <connogriofa@gmail.com>
Signed-off-by: Martyn Welch <martyn@welchs.me.uk>
---
 drivers/hid/hid-sony.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 4c6ed6ef31f1..d1088a85cb59 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -56,6 +56,7 @@
 #define NSG_MR5U_REMOTE_BT        BIT(14)
 #define NSG_MR7U_REMOTE_BT        BIT(15)
 #define SHANWAN_GAMEPAD           BIT(16)
+#define GASIA_GAMEPAD             BIT(17)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -2067,6 +2068,7 @@ static void sixaxis_send_output_report(struct sony_sc *sc)
 	struct sixaxis_output_report *report =
 		(struct sixaxis_output_report *)sc->output_report_dmabuf;
 	int n;
+	int ret = -1;
 
 	/* Initialize the report with default values */
 	memcpy(report, &default_report, sizeof(struct sixaxis_output_report));
@@ -2101,14 +2103,23 @@ static void sixaxis_send_output_report(struct sony_sc *sc)
 		}
 	}
 
-	/* SHANWAN controllers require output reports via intr channel */
-	if (sc->quirks & SHANWAN_GAMEPAD)
-		hid_hw_output_report(sc->hdev, (u8 *)report,
-				sizeof(struct sixaxis_output_report));
-	else
-		hid_hw_raw_request(sc->hdev, report->report_id, (u8 *)report,
+	/*
+	 * SHANWAN & GASIA controllers require output reports via intr channel.
+	 * Some of the Gasia controllers are basically indistinguishable from
+	 * the official ones and thus try hid_hw_output_report() should
+	 * hid_hw_raw_request() fail.
+	 */
+	if (!(sc->quirks & (SHANWAN_GAMEPAD | GASIA_GAMEPAD)))
+		ret = hid_hw_raw_request(sc->hdev, report->report_id,
+				(u8 *)report,
 				sizeof(struct sixaxis_output_report),
 				HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+
+	if (ret >= 0)
+		return;
+
+	hid_hw_output_report(sc->hdev, (u8 *)report,
+			sizeof(struct sixaxis_output_report));
 }
 
 static void dualshock4_send_output_report(struct sony_sc *sc)
@@ -2833,6 +2844,14 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (!strcmp(hdev->name, "SHANWAN PS3 GamePad"))
 		quirks |= SHANWAN_GAMEPAD;
 
+	/*
+	 * Some Gasia controllers are named "PLAYSTATION(R)3 Controller"
+	 * where as the official Sony controllers are named
+	 * "Sony PLAYSTATION(R)3 Controller".
+	 */
+	if (!strcmp(hdev->name, "PLAYSTATION(R)3 Controller"))
+		quirks |= GASIA_GAMEPAD;
+
 	sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
 	if (sc == NULL) {
 		hid_err(hdev, "can't alloc sony descriptor\n");
-- 
2.20.1

