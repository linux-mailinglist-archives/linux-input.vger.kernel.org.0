Return-Path: <linux-input+bounces-16289-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5DC7CD49
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 12:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A26563566A0
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A42D2FD69B;
	Sat, 22 Nov 2025 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="bpLM2k3K"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB72C21C0;
	Sat, 22 Nov 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809278; cv=none; b=MXEgCaRB35dxCEAdCJiIAA0zN4RFTF/hwW3TAhcN5WeOvQ3wN64CUtYSqhaTYSG2bpEAbVA3a4Z+aORQOZliz2UbmnaduQX7PvwyGq6/qqZDcZmMlm6111LSYcCK2yN8rP8LtWvnZ4Rg5tEluUqvwOZTG5Bbe/5x2JWmB/CR+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809278; c=relaxed/simple;
	bh=zO4f9VUYjv/sscdxqaH+70uVPdWsPvk0GXbf3o5ZoCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgM+wQxMcojoxzt2D8gYHFtCuBeO+zSEUzcGL1BxEXvZSG6NofkvvghqRLIo7tzlcWnaN2JpSmsXs69Z1INFbUAan4inElQnMEhDTjdG4CS4VhVhWByVBEdKJ8/S/2BiMFMRF0nn+AFvJPu1pgQliVlP4OyTHCXD2yvj4f9ah8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=bpLM2k3K; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id D0BB3C01F9;
	Sat, 22 Nov 2025 13:01:08 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 0114DC1444;
	Sat, 22 Nov 2025 13:01:05 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 179A21FFF8A;
	Sat, 22 Nov 2025 13:01:03 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763809264;
	bh=2+IOiilG1DstSliMP3aXmVgr+mEZAABS+fC9QTKffuk=; h=From:To:Subject;
	b=bpLM2k3K6lVC0TVaUCTR7B+Slt+Q8bN7cN0i1WaWoR+8Z6/vGDbAvTDRIc+nWDVl1
	 vWP+sdzP3CK7CxQjmkOh8zucgblRwxSe1yfRWKK1S+OHoSL2U93CiJjhUEqSiEKNuZ
	 P0dFN7mI4S+QGZ0F4wvrMifYzekAlQoM1lPzn0Ej6G/48FTHUdGw8mrZZ3fj+ni6hb
	 qolNBCwGWL2HAPCTXq+gFgnLnCBCrd8melP+/pxt76mMA5VvDBy9vmgx3M7Mf8hAl1
	 bTwB6BJKaHZPZC8X6MzSyPt0qsBiGJbPXCIc8n0GIjxWyywOe6mX1xwnEH8JNf5CBW
	 sf8dV/FWOvmig==
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
Subject: [PATCH v10 04/11] HID: asus: fortify keyboard handshake
Date: Sat, 22 Nov 2025 12:00:25 +0100
Message-ID: <20251122110032.4274-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>
References: <20251122110032.4274-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176380926462.360157.1587252261292235308@linux3247.grserver.gr>
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
 drivers/hid/hid-asus.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index c1a36a8beb35..2a412e10f916 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -49,7 +49,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define FEATURE_REPORT_ID 0x0d
 #define INPUT_REPORT_ID 0x5d
 #define FEATURE_KBD_REPORT_ID 0x5a
-#define FEATURE_KBD_REPORT_SIZE 16
+#define FEATURE_KBD_REPORT_SIZE 64
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
 
@@ -395,13 +395,37 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
 
 static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
 {
+	/*
+	 * The handshake is first sent as a set_report, then retrieved
+	 * from a get_report. They should be equal.
+	 */
 	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
 		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
 	int ret;
 
 	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
-	if (ret < 0)
-		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
+	if (ret < 0) {
+		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
+		return ret;
+	}
+
+	u8 *readbuf __free(kfree) = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
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
+			 FEATURE_KBD_REPORT_SIZE, readbuf);
+		/*
+		 * Do not return error if handshake is wrong until this is
+		 * verified to work for all devices.
+		 */
+	}
 
 	return ret;
 }
-- 
2.52.0



