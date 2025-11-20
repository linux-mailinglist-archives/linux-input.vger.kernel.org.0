Return-Path: <linux-input+bounces-16232-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68194C7349E
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E58D358958
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8412130CD8E;
	Thu, 20 Nov 2025 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="TafPh4Lt"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9827A93C;
	Thu, 20 Nov 2025 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631997; cv=none; b=lOl5GuVm0bM7o1L862Gl2LJcQu2cqw50N0vT+Vb3iU+lKCmICeE3E5AXIg4mo3Xd/iNm+yOsTphYm/Y5JscbyPnL0PzoVvS5QdF9hj6aKp2HIzdtF0Yb16gFJbs1TamGrKFt5BNWR1BmIxdoTKCJD/4rWAdMs+c3VmkOx/jeMWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631997; c=relaxed/simple;
	bh=CgGemqdrEFX0fCobHeAikO6gj72kpNIrSxh4ZmKnhls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPNTF2rMgsPJ/+hCM8hQclNO/hb2jMgpXvTe95/hFsXNeUJ/rReyBKB55/9n4FpN+unTskVBcpmPoyJ0JtFkrbvqbZEZEcxMXLhIIyTYs+r+sUP18xqFBCqKnMSDG2oo2/mv91RQAymvo3vth7gPTXIk2pOxuzhhGwJnS3QNkI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=TafPh4Lt; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id D8A8E5E61E;
	Thu, 20 Nov 2025 11:46:32 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 4C39F5E5EC;
	Thu, 20 Nov 2025 11:46:32 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B55D51FE2E1;
	Thu, 20 Nov 2025 11:46:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631991;
	bh=+/eOd+/32V6nu9WynOaEVZ4m9WyGKr6zjXw8fRaHFZ0=; h=From:To:Subject;
	b=TafPh4LtAPFzrndeLvtJ/tZjbI16JQdTqf+BtE2Vxb4Bpg6N7H22k7Lmt0TiYX+ql
	 5iwC4zyxXsZbJUcwfPuzFcdA9EkHW5IQ+5ydMOYVFAZvBj4Blj++NnR5aG+QRqMoLT
	 8fL5d2YBjVsPY83rK3twdKMMfRAGKA6Ag+B7bIxe6+wtX/uwYzEInUOCCSBiLj4etO
	 +XM1BKpDCC+TkA0Bopav03GBfFe0y0WbKdT2VbJqJXEL3D+zC7mshbQSl2hRxynZBm
	 6MlySkbdOShmWyVbDHFTG1Fij9BP6rF9N+3Dxr7Fvg7fdrFzSvf+lDww4McHmKKuJ0
	 /Gl1/0RUwBVPw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
Date: Thu, 20 Nov 2025 10:46:10 +0100
Message-ID: <20251120094617.11672-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120094617.11672-1-lkml@antheas.dev>
References: <20251120094617.11672-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363199140.1475065.12025952639067331988@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Handshaking with an Asus device involves sending it a feature report
with the string "ASUS Tech.Inc." and then reading it back to verify the
handshake was successful, under the feature ID the interaction will
take place.

Currently, the driver only does the first part. Add the readback to
verify the handshake was successful. As this could cause breakages,
allow the verification to fail with a dmesg error until we verify
all devices work with it (they seem to).

Since the response is more than 16 bytes, increase the buffer size
to 64 as well to avoid overflow errors.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 6de402d215d0..5149dc7edfc5 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define FEATURE_REPORT_ID 0x0d
 #define INPUT_REPORT_ID 0x5d
 #define FEATURE_KBD_REPORT_ID 0x5a
-#define FEATURE_KBD_REPORT_SIZE 16
+#define FEATURE_KBD_REPORT_SIZE 64
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
 
@@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
 
 static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
 {
+	/*
+	 * The handshake is first sent as a set_report, then retrieved
+	 * from a get_report. They should be equal.
+	 */
 	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
 		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+	u8 *readbuf;
 	int ret;
 
 	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
-	if (ret < 0)
-		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
+	if (ret < 0) {
+		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
+		return ret;
+	}
+
+	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
+	if (!readbuf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, report_id, readbuf,
+				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
+	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
+		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
+			FEATURE_KBD_REPORT_SIZE, readbuf);
+		/*
+		 * Do not return error if handshake is wrong until this is
+		 * verified to work for all devices.
+		 */
+	}
 
+	kfree(readbuf);
 	return ret;
 }
 
-- 
2.52.0



