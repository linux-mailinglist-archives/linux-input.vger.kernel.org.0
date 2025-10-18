Return-Path: <linux-input+bounces-15596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3ADBECD43
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 12:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73A0362112F
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 10:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736072EC093;
	Sat, 18 Oct 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ejEBdMyr"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D662EB87A;
	Sat, 18 Oct 2025 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782820; cv=none; b=LRFVt8onP8vrDON7RsnJyGAwez5b2LRkavxL4+yCpCvRcFDhuA1sX6yswqyQypDg+WVlEJ+VpSy//m6MsobnwDQulgc4agZUkQCj2h57CDIrZdt6A1+P6Il82wYy4UgGpTzltYanky/oCQRGaA6r2+3ndVm+RrourvHEfET5lEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782820; c=relaxed/simple;
	bh=xZuykDIIZVYAmZBy+EzMb5seZX+kKMYBe84ylHXRrGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hd3GQW89VA7NzcMLUUZTaHek/uGHCkgi01A+jQtYM6/lsHUceBQpL3cxH4Rki+VOS7ztS4VtNIyx2Pswj4leA3bRlkIa0zM45A9Np+YBZzPd0/eLbUWkYUappURFWAn4haRaq1ZC4i4LAxF7O+QBwIysnIS+RGqutGvRstpzYuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ejEBdMyr; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id A0A123FCC2;
	Sat, 18 Oct 2025 13:20:11 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 17D943FD2C;
	Sat, 18 Oct 2025 13:20:11 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 9EF561FDB77;
	Sat, 18 Oct 2025 13:20:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760782810;
	bh=Wz3GlE4QVqquzjEegGtzrVdHLIOLOYcwtZrBsurn9Po=; h=From:To:Subject;
	b=ejEBdMyrwWLyeB0gytbiKvDIkJgAs83fQfOdV7+xCI6e/UzURQWptPA+QFuKQZ6DV
	 E7vgMFgFiXMAljiJQUbZdUpKHahTCpnvqmM8OTZm/jxakGGk3Q0Tz7YGq8nxtizJXd
	 5T29kg65o1LtObOB/5OemruN+ZWDYx229I8anIieptyAo0vGacoprZ7qko+aRRpPDg
	 TNo2S2zXANK2FgkbCxZ6Fo+YOnNqnourQxuOu1/KgHEXHL0or5IRki3vP4Qz1po4Ws
	 69t+FYB+r9XWQruk8X2sYtIJtxaAPf6x4YnVPfZv8dhO4sCs5ypiz2IE3dN0D9yA3L
	 OwfZbFzZ8hXmw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 89.150.168.222) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v7 3/9] HID: asus: fortify keyboard handshake
Date: Sat, 18 Oct 2025 12:17:53 +0200
Message-ID: <20251018101759.4089-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018101759.4089-1-lkml@antheas.dev>
References: <20251018101759.4089-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176078281057.1198292.13430095886647870005@linux3247.grserver.gr>
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
index 4676b7f20caf..03f0d86936fc 100644
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
 
@@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
 
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
2.51.0



