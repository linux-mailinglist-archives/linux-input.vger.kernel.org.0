Return-Path: <linux-input+bounces-1173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C94CD827E30
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 06:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2F0CB23395
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 05:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669D022073;
	Tue,  9 Jan 2024 05:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ESNGQscg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F813AE2
	for <linux-input@vger.kernel.org>; Tue,  9 Jan 2024 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28beb1d946fso2283653a91.0
        for <linux-input@vger.kernel.org>; Mon, 08 Jan 2024 21:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1704777037; x=1705381837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEgaCDdnwo0fD24sb4/z6MOqtwJ556s/e7KBa+2g7Wk=;
        b=ESNGQscgH3havAQCuIB/4sxbhtAPYOzu5brHsR+Yl4CtLmWvQ+XwOU2s37YPo+JnhK
         Ko81YKtDccycTnYMnHsVmcbLajv4oQTglsXuGSGUOZTRgY+WJ9kWdjj4lCkvM6kEagWm
         of7hS7B+Oqo5XxESQePXE/g8mmJ87fFidX4kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704777037; x=1705381837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEgaCDdnwo0fD24sb4/z6MOqtwJ556s/e7KBa+2g7Wk=;
        b=U9chsUcUUGNWNAbuEbjss+DdMb82lsUE2F4zTdWWQafn/q9KWFfOrF7viZHIFKHOv1
         RRdR2fewp8eK9sasPb7wudT2e5EIYRlDf6/B9lI5EA7APomtbzInjlkHj73O+YD5q5n/
         CM50pQv+dVc4MC0e8YGLuwdJ3XfB0sr73q9BC5a7ItwoAXbxez2fcstUp/4dlpRnRqBQ
         hPYmtcXgGftdc7BBSbnu0S8a75jIL6+Qb7/LFJxtpzMpfAUoDsZyewoJIBDc5pnkhOwg
         MpaOZLL4ualHaf9SKKpMgVgR3dGgcLh6Ejn4k8/Yg+EAmd7qWLXeG59u090FVmZn8xvM
         bwMw==
X-Gm-Message-State: AOJu0Yytn0XO0xlUD2mNPT3/b36jqOZqQGDMAsjCQ7tJhEcWg94Nl3kp
	OdBfFTiA6ZMRoKkQrUO1f9khMIxLZ+HS
X-Google-Smtp-Source: AGHT+IFBhLSo9xU3RAGTu1aDwRcvVUlpQ6O1HOcZpIUBL2rfaShUonCxJhJaczNPcJRzxCZzdbZzpQ==
X-Received: by 2002:a17:90b:378c:b0:28c:b445:ade7 with SMTP id mz12-20020a17090b378c00b0028cb445ade7mr2700299pjb.4.1704777037168;
        Mon, 08 Jan 2024 21:10:37 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090ac88c00b0028aecd6b29fsm7344115pjt.3.2024.01.08.21.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 21:10:36 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
X-Google-Original-From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	mingo@redhat.com,
	tglx@linutronix.de
Cc: x86@kernel.org,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	zackr@vmware.com,
	linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com,
	namit@vmware.com,
	timothym@vmware.com,
	akaher@vmware.com,
	jsipek@vmware.com,
	dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	horms@kernel.org,
	kirill.shutemov@linux.intel.com
Subject: [PATCH v5 4/7] input/vmmouse: Use VMware hypercall API
Date: Mon,  8 Jan 2024 21:10:14 -0800
Message-Id: <20240109051017.58167-5-amakhalov@vmware.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240109051017.58167-1-amakhalov@vmware.com>
References: <20240109051017.58167-1-amakhalov@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/vmmouse.c | 78 ++++++++++-------------------------
 1 file changed, 22 insertions(+), 56 deletions(-)

diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
index ad94c835ee66..fb1d986a6895 100644
--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -21,19 +21,16 @@
 #include "psmouse.h"
 #include "vmmouse.h"
 
-#define VMMOUSE_PROTO_MAGIC			0x564D5868U
-
 /*
  * Main commands supported by the vmmouse hypervisor port.
  */
-#define VMMOUSE_PROTO_CMD_GETVERSION		10
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_DATA	39
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_STATUS	40
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_COMMAND	41
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_RESTRICT   86
+#define VMWARE_CMD_ABSPOINTER_DATA	39
+#define VMWARE_CMD_ABSPOINTER_STATUS	40
+#define VMWARE_CMD_ABSPOINTER_COMMAND	41
+#define VMWARE_CMD_ABSPOINTER_RESTRICT	86
 
 /*
- * Subcommands for VMMOUSE_PROTO_CMD_ABSPOINTER_COMMAND
+ * Subcommands for VMWARE_CMD_ABSPOINTER_COMMAND
  */
 #define VMMOUSE_CMD_ENABLE			0x45414552U
 #define VMMOUSE_CMD_DISABLE			0x000000f5U
@@ -76,30 +73,6 @@ struct vmmouse_data {
 	char dev_name[128];
 };
 
-/*
- * Hypervisor-specific bi-directional communication channel
- * implementing the vmmouse protocol. Should never execute on
- * bare metal hardware.
- */
-#define VMMOUSE_CMD(cmd, in1, out1, out2, out3, out4)	\
-({							\
-	unsigned long __dummy1, __dummy2;		\
-	__asm__ __volatile__ (VMWARE_HYPERCALL :	\
-		"=a"(out1),				\
-		"=b"(out2),				\
-		"=c"(out3),				\
-		"=d"(out4),				\
-		"=S"(__dummy1),				\
-		"=D"(__dummy2) :			\
-         [port] "i" (VMWARE_HYPERVISOR_PORT),		\
-         [mode] "m" (vmware_hypercall_mode),		\
-		"a"(VMMOUSE_PROTO_MAGIC),		\
-		"b"(in1),				\
-		"c"(VMMOUSE_PROTO_CMD_##cmd),		\
-		"d"(0) :			        \
-		"memory");		                \
-})
-
 /**
  * vmmouse_report_button - report button state on the correct input device
  *
@@ -147,14 +120,12 @@ static psmouse_ret_t vmmouse_report_events(struct psmouse *psmouse)
 	struct input_dev *abs_dev = priv->abs_dev;
 	struct input_dev *pref_dev;
 	u32 status, x, y, z;
-	u32 dummy1, dummy2, dummy3;
 	unsigned int queue_length;
 	unsigned int count = 255;
 
 	while (count--) {
 		/* See if we have motion data. */
-		VMMOUSE_CMD(ABSPOINTER_STATUS, 0,
-			    status, dummy1, dummy2, dummy3);
+		status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 		if ((status & VMMOUSE_ERROR) == VMMOUSE_ERROR) {
 			psmouse_err(psmouse, "failed to fetch status data\n");
 			/*
@@ -174,7 +145,8 @@ static psmouse_ret_t vmmouse_report_events(struct psmouse *psmouse)
 		}
 
 		/* Now get it */
-		VMMOUSE_CMD(ABSPOINTER_DATA, 4, status, x, y, z);
+		status = vmware_hypercall4(VMWARE_CMD_ABSPOINTER_DATA, 4,
+					   &x, &y, &z);
 
 		/*
 		 * And report what we've got. Prefer to report button
@@ -249,14 +221,10 @@ static psmouse_ret_t vmmouse_process_byte(struct psmouse *psmouse)
 static void vmmouse_disable(struct psmouse *psmouse)
 {
 	u32 status;
-	u32 dummy1, dummy2, dummy3, dummy4;
-
-	VMMOUSE_CMD(ABSPOINTER_COMMAND, VMMOUSE_CMD_DISABLE,
-		    dummy1, dummy2, dummy3, dummy4);
 
-	VMMOUSE_CMD(ABSPOINTER_STATUS, 0,
-		    status, dummy1, dummy2, dummy3);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_DISABLE);
 
+	status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 	if ((status & VMMOUSE_ERROR) != VMMOUSE_ERROR)
 		psmouse_warn(psmouse, "failed to disable vmmouse device\n");
 }
@@ -273,26 +241,24 @@ static void vmmouse_disable(struct psmouse *psmouse)
 static int vmmouse_enable(struct psmouse *psmouse)
 {
 	u32 status, version;
-	u32 dummy1, dummy2, dummy3, dummy4;
 
 	/*
 	 * Try enabling the device. If successful, we should be able to
 	 * read valid version ID back from it.
 	 */
-	VMMOUSE_CMD(ABSPOINTER_COMMAND, VMMOUSE_CMD_ENABLE,
-		    dummy1, dummy2, dummy3, dummy4);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_ENABLE);
 
 	/*
 	 * See if version ID can be retrieved.
 	 */
-	VMMOUSE_CMD(ABSPOINTER_STATUS, 0, status, dummy1, dummy2, dummy3);
+	status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 	if ((status & 0x0000ffff) == 0) {
 		psmouse_dbg(psmouse, "empty flags - assuming no device\n");
 		return -ENXIO;
 	}
 
-	VMMOUSE_CMD(ABSPOINTER_DATA, 1 /* single item */,
-		    version, dummy1, dummy2, dummy3);
+	version = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_DATA,
+				    1 /* single item */);
 	if (version != VMMOUSE_VERSION_ID) {
 		psmouse_dbg(psmouse, "Unexpected version value: %u vs %u\n",
 			    (unsigned) version, VMMOUSE_VERSION_ID);
@@ -303,11 +269,11 @@ static int vmmouse_enable(struct psmouse *psmouse)
 	/*
 	 * Restrict ioport access, if possible.
 	 */
-	VMMOUSE_CMD(ABSPOINTER_RESTRICT, VMMOUSE_RESTRICT_CPL0,
-		    dummy1, dummy2, dummy3, dummy4);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_RESTRICT,
+			  VMMOUSE_RESTRICT_CPL0);
 
-	VMMOUSE_CMD(ABSPOINTER_COMMAND, VMMOUSE_CMD_REQUEST_ABSOLUTE,
-		    dummy1, dummy2, dummy3, dummy4);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND,
+			  VMMOUSE_CMD_REQUEST_ABSOLUTE);
 
 	return 0;
 }
@@ -344,7 +310,7 @@ static bool vmmouse_check_hypervisor(void)
  */
 int vmmouse_detect(struct psmouse *psmouse, bool set_properties)
 {
-	u32 response, version, dummy1, dummy2;
+	u32 response, version, type;
 
 	if (!vmmouse_check_hypervisor()) {
 		psmouse_dbg(psmouse,
@@ -353,9 +319,9 @@ int vmmouse_detect(struct psmouse *psmouse, bool set_properties)
 	}
 
 	/* Check if the device is present */
-	response = ~VMMOUSE_PROTO_MAGIC;
-	VMMOUSE_CMD(GETVERSION, 0, version, response, dummy1, dummy2);
-	if (response != VMMOUSE_PROTO_MAGIC || version == 0xffffffffU)
+	response = ~VMWARE_HYPERVISOR_MAGIC;
+	version = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &response, &type);
+	if (response != VMWARE_HYPERVISOR_MAGIC || version == 0xffffffffU)
 		return -ENXIO;
 
 	if (set_properties) {
-- 
2.39.0


