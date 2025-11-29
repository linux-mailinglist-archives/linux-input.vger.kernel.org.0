Return-Path: <linux-input+bounces-16396-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E1C93520
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 01:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 481EE4E05C5
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 00:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3364B13A86C;
	Sat, 29 Nov 2025 00:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay5CPxsL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840813BB44
	for <linux-input@vger.kernel.org>; Sat, 29 Nov 2025 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376346; cv=none; b=C37Br0FpueC/n2z3QFwhSdtjDQC7PWGVbNGbiOInK4B+unznlGvZfRAPQRv2Uyig1D0WUKJyfo5NrFIsbjE3b4yTKfg3GTRQhpuRSxb3zfLnwsLqIBurplBXNo4F18ReOBfEEIINVsf7dzJ7DxyRR362iqIJ3W8879KR0Mwxrpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376346; c=relaxed/simple;
	bh=IuCeBnCA12nf/Fqu5eYQSw4oiYf3AXHYMr3vFYEVRiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O68gZburpIB5S1a0CSqGKq/PPl730QK5K4WjpzE2BH+z/rAX6I/T4QmSItiHNNFX3eo9ApyxU9NLHdeTExki2CYEuM9kjQdy7JogKIISjJw7hl+ormfUwraTIjHlbOh94SEsYJBMoNQVDEMvIlb9HIbs/tbMcbne+cgcAGN+x/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay5CPxsL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297dd95ffe4so21085945ad.3
        for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376344; x=1764981144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQatbXiS4IDF8tyOs0fGlxPqW6GCHi1/Lga4WQU56dE=;
        b=Ay5CPxsLDZtDkM7DFTHBsEvCcPU1/D5R/I1Jz1elHU243BDW12dDboEm+veKI8X4+T
         R5NGs7ceoL7gRqDV1dZojc5nZmSVHtJEJxz2jcGKMwFlxyb2GU9s5SiYnWf5tgpuHLIp
         UEAqXJgJI2zLz6g2J+s6flxPLJ4ErJyD/ZhKavFSV4y5x/DFeLBX+sp7MHC2SrAWdeyo
         sRdLG1uCJg8PjHzM6sYIa5HG0NdomvK2SxY4XAsnglVjWVd6wrTvULw3bgfrkKcdRgNW
         no1JSrsqy99TXvBd84WuGSAAeOZWyQhH9Ahfl3TpLXDaEUGWi+Mc6PglEdckLoJx3xRu
         Ds2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376344; x=1764981144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQatbXiS4IDF8tyOs0fGlxPqW6GCHi1/Lga4WQU56dE=;
        b=N7E5o8dV4Ewy3fWIUArokxFIbiKLCSoG0R4ih3rnaZ9vy1iVMOnD2sZ95Ck6PdfPhB
         mAJAZoitzTNCjglbU5gbR9TTClQPz1e4FYFaw/Do/b2VlIV+FexuF6+fKLEbBaKW5jmW
         J/sX5o7LvQXNZ5X6KYbhrxiBr5bS5SQGuIPUog7VknZiqfmnJvXgjyhjEVuLh8xZssM8
         h2StAgLhWswJxNJOcjkIpEMirN3KweSw9lVOIu/GR0jfW9QYX/FW3dth+dWwOT2JDzmV
         eBJ9rNtGRO4uYf0HYHjTFJEZWBIDXtE/cUiBKZooNFSuX4L+wcX0EfBlgR/p3kAQhMBO
         857A==
X-Forwarded-Encrypted: i=1; AJvYcCWaSp1ibWisB17yRXVfU8uQK5xl8aBkxZbBrMuIRsf5xu3L3t+gxQaEbFtTb5VVNjZ9gydbn4rUnbU6Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbcKq0sqMdC1NVrTEBNYOfdNd0/lKEsLv/0NLrOCWwBOm1/4S
	ImuxA+GgraevOLkrTfPNAII2eOstbwvb33Us7P/f5YxUWPCWDmDH3K55
X-Gm-Gg: ASbGnctlqqCwqdeteCYb5cq29eGM/k20UQ7sPf//P1B4jbmz93sQ8DahK7BrXPMAngm
	V91lZlZWescbbEQ7oaO/QQR3g/0vYdRiR94k0MbQnYh8UdGnCgwSW+enmiFjEr+L7tse19pC2pz
	iLO3n168HtEOv2WICNvqomvFO3QL0KqwPs9d4rHuLeYnZSZTpy6cwg6nGxTOKn65yAtRlre5a5B
	Zqm1IQZOETejuaAEDGvkuhzPy5xXIKYXBcZIow4OrTB8sR+y6AGjmuZF1e/QY0KK/GdLxHcky6Y
	sDVpQU4BY+FDWn2JUbShk0e+4wLWDFDvtxy3IpzIc6OwxneZX+ylE8NuQlNS0FnfmZu5Kpy547r
	gTtanMzseTRJ0Lq9iBLVcxyByJarVByNWFldp0kido//5en1/xBZS0+DmUqO4+5Be89XE7leot/
	YkOQCrURL0Lk2o1mY0t+uZm3qZmzJCYgr2UbEZKy78D5tOrs5HASzT0XI54qzYVq4ibg==
X-Google-Smtp-Source: AGHT+IH+tqI7TxrE3Powg5mDCkQtUgWbnSb7QtzYFL6VRXzqfB4juIiEGJZGEy2486ootGZ/7Fn4SQ==
X-Received: by 2002:a17:903:1aaf:b0:296:3f23:b910 with SMTP id d9443c01a7336-29baae45c56mr137888385ad.9.1764376343606;
        Fri, 28 Nov 2025 16:32:23 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:32:23 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 1/3] input: trackpoint - Enable doubletap by default on capable devices
Date: Sat, 29 Nov 2025 09:25:31 +0900
Message-ID: <20251129002533.9070-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129002533.9070-1-vishnuocv@gmail.com>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable doubletap functionality by default on TrackPoint devices that
support it. The feature is detected using firmware ID pattern matching
(PNP: LEN03xxx) with a deny list of incompatible devices.

This provides immediate doubletap functionality without requiring
userspace configuration. The hardware is enabled during device
detection, while event filtering continues to be handled by the
thinkpad_acpi driver as before.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v4:
- Simplified approach: removed all sysfs attributes and user interface
- Enable doubletap by default during device detection
- Removed global variables and complex attribute infrastructure
- Uses minimal firmware ID detection with deny list
- Follows KISS principle as suggested by reviewers

Changes in v3:
- No changes

Changes in v2:
- Improve commit messages
- Sysfs attributes moved to trackpoint.c
- Removed unnecessary comments
- Removed unnecessary debug messages
- Using strstarts() instead of strcmp()
- is_trackpoint_dt_capable() modified
- Removed _BIT suffix and used BIT() define
- Reverse the trackpoint_doubletap_status() logic to return error first
- Removed export functions as a result of the design change
- Changed trackpoint_dev->psmouse to parent_psmouse
- The path of trackpoint.h is not changed
---
 drivers/input/mouse/trackpoint.c | 51 ++++++++++++++++++++++++++++++++
 drivers/input/mouse/trackpoint.h |  5 ++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..67144c27bccd 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -393,6 +393,48 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
 	return 0;
 }
 
+/* List of known incapable device PNP IDs */
+static const char * const dt_incompatible_devices[] = {
+	"LEN0304",
+	"LEN0306",
+	"LEN0317",
+	"LEN031A",
+	"LEN031B",
+	"LEN031C",
+	"LEN031D",
+};
+
+/*
+ * Checks if it's a doubletap capable device
+ * The PNP ID format is "PNP: LEN030d PNP0f13".
+ */
+static bool is_trackpoint_dt_capable(const char *pnp_id)
+{
+	const char *id_start;
+	char id[8];
+	size_t i;
+
+	if (!strstarts(pnp_id, "PNP: LEN03"))
+		return false;
+
+	/* Points to "LEN03xxxx" */
+	id_start = pnp_id + 5;
+	if (sscanf(id_start, "%7s", id) != 1)
+		return false;
+
+	/* Check if it's in the deny list */
+	for (i = 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
+		if (strcmp(id, dt_incompatible_devices[i]) == 0)
+			return false;
+	}
+	return true;
+}
+
+static int trackpoint_set_doubletap(struct ps2dev *ps2dev, bool enable)
+{
+	return trackpoint_write(ps2dev, TP_DOUBLETAP, enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE);
+}
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -470,6 +512,15 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	/* Enable doubletap by default on capable devices */
+	if (is_trackpoint_dt_capable(ps2dev->serio->firmware_id)) {
+		int error = trackpoint_set_doubletap(ps2dev, true);
+		if (!error)
+			psmouse_info(psmouse, "Doubletap enabled by default!\n");
+		else
+			psmouse_warn(psmouse, "Failed to enable doubletap: %d\n", error);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index eb5412904fe0..3e03cdb39449 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -69,6 +69,8 @@
 					/* (how hard it is to drag */
 					/* with Z-axis pressed) */
 
+#define TP_DOUBLETAP		0x58	/* TrackPoint doubletap register */
+
 #define TP_MINDRAG		0x59	/* Minimum amount of force needed */
 					/* to trigger dragging */
 
@@ -110,6 +112,9 @@
 					   external device will be forced to 1 */
 #define TP_MASK_EXT_TAG			0x04
 
+/* Doubletap register values */
+#define TP_DOUBLETAP_ENABLE	0xFF	/* Enable value */
+#define TP_DOUBLETAP_DISABLE	0xFE	/* Disable value */
 
 /* Power on Self Test Results */
 #define TP_POR_SUCCESS		0x3B
-- 
2.51.0


