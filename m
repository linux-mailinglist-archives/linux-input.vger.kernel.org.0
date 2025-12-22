Return-Path: <linux-input+bounces-16669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DADECCD4E92
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 08:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8563C3005FCB
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 07:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA19B309EE2;
	Mon, 22 Dec 2025 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pssg19UH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDDC2F744F
	for <linux-input@vger.kernel.org>; Mon, 22 Dec 2025 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390078; cv=none; b=SFEFnOBL97WHj0APJ9C1P/Sr/HV6hhz7q1fYREnmLGYcc2pszdIuE+BPCnjspQ0e1BXdyTTjZp54H1AIQfHZwoNINCcWXVnpV6LVrIdizAXmqEWZpJ+UqCWHVo+T9LNWkdzAJTNlmNELBhbJ83lkT+0zzs8PG8cWPECe5wyfBPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390078; c=relaxed/simple;
	bh=UHumVlp0hDrc+aArdj9OYhxkrOQymT/iINQenJNiR4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gu2KOtcqlTKiiPi78NGV3sz9dGL25IrGyMmlzFHKrAlYfF9JNXymO+2+4DIfCfpQnv48Uv/AWwOkERUKijHZYw8J1fgqBR4MvLRsRJySyD7zxeqr22CTO4z9K5hDasiwy6vbtgJSRO9hKHKspTqtE8zsu3w9mWYXGT51YF49Urc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pssg19UH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0bae9aca3so52433325ad.3
        for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 23:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766390076; x=1766994876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qndtHWfW06dckpElKkP6xvx4XoqOJlh2je2hZQh6sms=;
        b=Pssg19UH2nQrJz8kEqgSwgK7AtVs4cxDM29vxCgl9KVaucLoWDcHjP8Dq5MA1zhmmW
         f+dBN3dV7kfcXsK6fOpJTJ6BOHLfrDu1ch0FzY3gyYhLFhj/ekR4+pdoO192BXLFjrpS
         lGz2+M1BeV+Z1EsCUtlDwGdQFrrU2Q0OVNxwM0PpceMgaEgdwmUc6LJbsnLK5D7yHtZM
         9e+uwDJZLKewPhYtVGdEwG1xOzbhC+JeclFJCU7QqMJR5zWOr1vktYL2zvaYXVbhczoS
         l23BlQFu+pTipLxGPJYaZ7KvsiRXFSFAZeU9FGS1K9DbVP5F6027XQ40Hp0K20FXJuFE
         NH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766390076; x=1766994876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qndtHWfW06dckpElKkP6xvx4XoqOJlh2je2hZQh6sms=;
        b=gSLrlR2hRrseW6TNA/EZc17VZo9rTIJxH9ruguMDLkVqMjnjoPiZ1eXGmZE2bcHi9e
         tzp+KbbYJMs2AG70Tb2LlbcpJyw/CRj10fhIrjJTqQrUg7e2ezVvG+BJoiF7j7xYaE0m
         ahrq0Db9ZSSqbvTf+iN50PlrXst8B0dBVvvE5QxiTgWy9jP01903WUQ+XZw24Enb2RQg
         W7pmbVDuJUFlc2jOsDi3MfNEyry6wneGTsPtru+dnTXM/+B/vX8GrvLjc+5+bJtXhJdF
         qsfvxL7p93T7oHZOQRom9FgXUhozUyrJW0Dkel2+1Vs3y/w51Ky0rXqYJI0n8LLNfXEP
         9jvw==
X-Forwarded-Encrypted: i=1; AJvYcCWZOuKZwcipnIQty5riz4RSEPA8l+HEFdKNfYgbVKY2ZA9hpRnG85MWV69vp49oQ4r+esQ3OFXTQwAbhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT22xdwsomSiG19wJNVBZvkuuafN0cjA1C8IS0dayMDZX1PJRo
	QUrkNqKsCYXW5P4fuFhHycABJN75wVIWwwQ41+iAdxbMP1/0saMA2X8Zo66LlJ3m
X-Gm-Gg: AY/fxX4Hp927rqZ85gDaqlmlGd/soM2hjc1hJoQdijSAf45qmQAni9CjBgk/6E4LsfP
	Gv8VI1IZ4Jr2VXbAOWYgzTtfYGx2Yqey5+DxdaW5UUcdA8mlBiA+U2lHmAnqfffrTdz2/3ZdojK
	0yQm53l5J1ZLqhbw1+3NsCw78BvON5meGQ4szLQx9OIEPmWPzFmbwRY/AlSPvGX+8xLAWK1OzZg
	uJkkeN9OTnVfpJjexDEhDEjEFeh71pCTjwx3qwYVHwQzLwZmm0ns44GqbHaXN294OPim9jPmpRq
	NGvejDQxKJ0iN5Ud9NEua576RBxqUb+tVIneDnOjunTeynZ42kDN4C7b27wopxtd+SgJu1M5pVD
	aEA3nPtYhZ4Z7C9o9uzRWrjRNhRPyOwD+/F6cfZrXJvNBmtxT1jpgoff6fRaTFqvTUxUdZY633k
	9lSUfUV+LX3bU4Po5TY3diB2CUWNt05BaFR4qD8rYDstDluKt8BDMdtlJdQR2eYc2+Yn2FHJ9LZ
	lXAbgyFnPItZyBk6Qk5LHhvbrmbkW4N
X-Google-Smtp-Source: AGHT+IGkSsQjzURUKUhgiOTawJNcPm/DRlaUNDx/jmEZK0IW2dONSTc4LiCI9ffpSr7PL9WeDDHOcA==
X-Received: by 2002:a17:903:41ca:b0:295:195:23b6 with SMTP id d9443c01a7336-2a2f2a498b6mr94156885ad.55.1766390076454;
        Sun, 21 Dec 2025 23:54:36 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1.lenovo.com (zz20234032476F6CA7C5.userreverse.dion.ne.jp. [111.108.167.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7bcsm12025951a91.13.2025.12.21.23.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 23:54:35 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	vsankar@lenovo.com
Cc: linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Richie Roy Jayme <rjayme.jp@gmail.com>
Subject: [PATCH v2 1/2] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based firmware  matching
Date: Mon, 22 Dec 2025 16:53:45 +0900
Message-ID: <20251222075346.955637-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for firmware filenames that include the CRC32 checksum of the
DMI product_family field. Several OEMs ship ISH firmware variants shared
across a product family while product_name or product_sku may differ. This
intermediate matching granularity reduces duplication and improves firmware
selection for vendor-customized platforms.

The newly supported filename forms are checked before existing patterns:

  ish_${gen}_${vendor}_${family}_${name}_${sku}.bin
  ish_${gen}_${vendor}_${family}_${sku}.bin
  ish_${gen}_${vendor}_${family}_${name}.bin
  ish_${gen}_${vendor}_${family}.bin

The legacy product_name/product_sku rules remain unchanged and continue
to provide fallback matching.

ISH_FW_FILENAME_LEN_MAX is changed to 72 to accommodate the product_family.

Tested with X9 series and X1 series.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Richie Roy Jayme <rjayme.jp@gmail.com>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes in v2
- Indent corrected
- More comments added
---
---
 drivers/hid/intel-ish-hid/ishtp/loader.c | 59 +++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index f34086b29cf0..5a7e7491f242 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -195,13 +195,20 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 	return 0;
 }
 
+/* Patterns with PRODUCT_FAMILY */
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_FMT "intel/ish/ish_%s_%08x_%08x.bin"
+
 #define ISH_FW_FILE_VENDOR_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_SKU_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_NAME_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_FMT "intel/ish/ish_%s_%08x.bin"
 #define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
 
-#define ISH_FW_FILENAME_LEN_MAX 56
+#define ISH_FW_FILENAME_LEN_MAX 72
 
 #define ISH_CRC_INIT (~0u)
 #define ISH_CRC_XOROUT (~0u)
@@ -228,6 +235,12 @@ static int _request_ish_firmware(const struct firmware **firmware_p,
  * for the given device in the following order, prioritizing custom firmware
  * with more precise matching patterns:
  *
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)
+ *   _$(PRODUCT_NAME_CRC32)_${PRODUCT_SKU_CRC32}.bin
+ *
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)_${PRODUCT_SKU_CRC32}.bin
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)_$(PRODUCT_NAME_CRC32).bin
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32).bin
  *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32)_${PRODUCT_SKU_CRC32}.bin
  *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin
  *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32).bin
@@ -256,8 +269,9 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 				struct device *dev)
 {
 	const char *gen, *sys_vendor, *product_name, *product_sku;
+	const char *product_family;
 	struct ishtp_device *ishtp = dev_get_drvdata(dev);
-	u32 vendor_crc, name_crc, sku_crc;
+	u32 vendor_crc, name_crc, sku_crc, family_crc;
 	char filename[ISH_FW_FILENAME_LEN_MAX];
 	int ret;
 
@@ -265,14 +279,55 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 	sys_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
 	product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
 	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+	product_family = dmi_get_system_info(DMI_PRODUCT_FAMILY);
 
 	if (sys_vendor)
 		vendor_crc = crc32(ISH_CRC_INIT, sys_vendor, strlen(sys_vendor)) ^ ISH_CRC_XOROUT;
+	if (product_family)
+		family_crc = crc32(ISH_CRC_INIT, product_family,
+				   strlen(product_family)) ^ ISH_CRC_XOROUT;
 	if (product_name)
 		name_crc = crc32(ISH_CRC_INIT, product_name, strlen(product_name)) ^ ISH_CRC_XOROUT;
 	if (product_sku)
 		sku_crc = crc32(ISH_CRC_INIT, product_sku, strlen(product_sku)) ^ ISH_CRC_XOROUT;
 
+	/* PRODUCT_FAMILY-extended matching */
+	if (sys_vendor && product_family && product_name && product_sku) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT,
+			 gen, vendor_crc, family_crc, name_crc, sku_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor && product_family && product_sku) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT,
+			 gen, vendor_crc, family_crc, sku_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor && product_family && product_name) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT,
+			 gen, vendor_crc, family_crc, name_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor && product_family) {
+		snprintf(filename, sizeof(filename),
+			 ISH_FW_FILE_VENDOR_FAMILY_FMT,
+			 gen, vendor_crc, family_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+}
+
 	if (sys_vendor && product_name && product_sku) {
 		snprintf(filename, sizeof(filename), ISH_FW_FILE_VENDOR_NAME_SKU_FMT, gen,
 			 vendor_crc, name_crc, sku_crc);
-- 
2.51.0


