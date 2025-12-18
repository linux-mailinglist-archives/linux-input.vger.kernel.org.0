Return-Path: <linux-input+bounces-16624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C4CCC315
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 15:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BC6D302BC51
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 14:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279CB348445;
	Thu, 18 Dec 2025 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9RozuyB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617034844F
	for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066552; cv=none; b=mQ60hDO8CVT0ZGoSgHqhu/qLICsWB5y6o4ObhhId4gZIDU5I7Qnq1SMa7WZZH40xQLz1UcOTiOHpydKiu0CSq23DwOBUHOOgVk9vnLR4qdWgFJVT6Qu/zplFVXcwH1iXz0Th0S3CWMs+RkJ/oZdB+udUs+SodkNDmO7SVxniGvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066552; c=relaxed/simple;
	bh=uXsYw4BMXblO7+NMUU9UjQ3f7LsDnLZEz6JggLZbXoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NaUYhXxXk+zZECX9enBE8k1oJR5onWN6PzKW8m95eE/dI3DOlBIawjVdvIpazYgU7mkQuhkhWQUe8v2/ruFnEaCME/jl8C3yEdnmZ19ZiJ4C8KXkCEGgGx38kfeFaS/AtskqmfPvNAdlmVYPckGjdHNFmNUw8u7ZH3J/9p4ra1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9RozuyB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a12ed4d205so6121295ad.0
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766066550; x=1766671350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qy7yr6TYl7qBNDOiMigFkaOEjleqGx1BiLtsVMF5T4c=;
        b=F9RozuyBoTTYKSlTJWfastBilDkfa2EBlzb7uLchf3DNJYpdS96ZOQfBIc8QF/mDsT
         gT68kkmfWn6aTvqwW7FPvuftDaLrVnGRqmYptswgO0yfitZmZTlI+MDq1qqmenFb2FMq
         ZVrvolww0+gYk9HVpaG/N7d6QkrHSM5TWmInbfiqG69KmrBMu/EO27tNlfcAnu7CvAdy
         CdxgZm9+h245OFKqo/jLN8kKZg3lwY8l8qbcoSvqdaSgT/7OPj4xEHJtrrJqb4xYvdwt
         oyse4C+GXN/oxqLe6G193ekcaufmOi/348NpYDlptfXXCw2iafpUMI2s8Q7PlLBdKUCU
         sNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066550; x=1766671350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy7yr6TYl7qBNDOiMigFkaOEjleqGx1BiLtsVMF5T4c=;
        b=DfL2O5L+37KmgIZ1i7ddCinaCi+F74jgsd0V034d+EwFodt7Otg2/E3rOeKkf2cL6y
         rQ77uk3TUegi70Rj8RMcObgiP/FS7wVpabKe/KJcMOFf5AI2k3vVRI5bFwX2Ca5HBBom
         FkJGji9wddnEFqbFKR0VCUlqUT+oqjARrKYm+6CQg8hpx0ZrtTSHP4oPgyVn9XKRex8E
         cDJV0H6sxtsHVO9PlobbX+rltu7Q7mP6e2ytSP+i9NoVeIMnjl31PJnEnIAGlxXJE108
         xommUrBoFRmT7fBN4I/2+hVvTdDaux9hKPBETXqQEkjoHO89IECVAZb6KHyJK6I0W5sH
         8aUA==
X-Gm-Message-State: AOJu0YzxUqMVKQgLA9mGB651jY15ezJNFT3ot7NCsVNo2k+Lz0+TvqM5
	YCJ4JMh8mX0yHbTue2YqQG8I2QGoVYrrCqzKWjk+shfPh2N8+JFci/0t
X-Gm-Gg: AY/fxX7vh/OJ/4ufDX2YD3KywMkYerrxdNmoAHIx/7+E2r2/AFy0x/Af8VxtnCI/yxS
	4Y/b182JNQ6rxqJiHdGwcitm4SS3lzo4zN1wEMyzcGUgjbr9xLCekqIx2nn5HbzqXdFrlHDjKI5
	PPbYM0uQhTsEiuJn1S5jQp35WTkfnWCmbxGBNcNM6SJKmFN42eLKvSi7NediyfQhnYgbrc5F8Ku
	Gs7+oNBnWcEgjqMR2WgeYItIygR/69k2KmC4sCzTEm+1ObjSx5sDxsg61HGmrwZ1Zna8A5h+LS8
	KmCG/cujq/W50A9JBddrYTFFhUIkcLIhfvX2p1DrdFJ+VdwDL5YOnkF2ogsOpLhmVjcJnzOHiDZ
	cVzV5EYs+fpKNy6LTAeqwkzEt108emX7ZumvlZoOu2QmMGT40BM5u1KIRyUltiOfJEvK1IHzK8R
	a1NmQar6s1fWpRYmA3xL3gB2mLOWsfxC8+hpJMfaZMFQadptM+B1SMXelI6xZ//QyG6VjXwQ==
X-Google-Smtp-Source: AGHT+IHbCbd45FP2moVKES3mfTDFLYGy5S3GqM2Lr6M91pBqr9bk7gPqxYZ2xAokQQ9Mw3AkEyBsfQ==
X-Received: by 2002:a17:903:2308:b0:295:5945:2930 with SMTP id d9443c01a7336-29f23dd7126mr240542325ad.2.1766066547769;
        Thu, 18 Dec 2025 06:02:27 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d193cf98sm27504805ad.94.2025.12.18.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:02:26 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	vsankar@lenovo.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Richie Roy Jayme <rjayme.jp@gmail.com>
Subject: [PATCH] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based firmware matching
Date: Thu, 18 Dec 2025 23:00:03 +0900
Message-ID: <20251218140003.636901-1-vishnuocv@gmail.com>
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
 drivers/hid/intel-ish-hid/ishtp/loader.c | 50 +++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index f34086b29cf0..4559d460fd83 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -194,6 +194,11 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 
 	return 0;
 }
+/* Patterns with PRODUCT_FAMILY */
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 
 #define ISH_FW_FILE_VENDOR_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_SKU_FMT "intel/ish/ish_%s_%08x_%08x.bin"
@@ -201,7 +206,7 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 #define ISH_FW_FILE_VENDOR_FMT "intel/ish/ish_%s_%08x.bin"
 #define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
 
-#define ISH_FW_FILENAME_LEN_MAX 56
+#define ISH_FW_FILENAME_LEN_MAX 72
 
 #define ISH_CRC_INIT (~0u)
 #define ISH_CRC_XOROUT (~0u)
@@ -256,8 +261,9 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 				struct device *dev)
 {
 	const char *gen, *sys_vendor, *product_name, *product_sku;
+	const char *product_family;
 	struct ishtp_device *ishtp = dev_get_drvdata(dev);
-	u32 vendor_crc, name_crc, sku_crc;
+	u32 vendor_crc, name_crc, sku_crc, family_crc;
 	char filename[ISH_FW_FILENAME_LEN_MAX];
 	int ret;
 
@@ -265,6 +271,7 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 	sys_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
 	product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
 	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+	product_family = dmi_get_system_info(DMI_PRODUCT_FAMILY);
 
 	if (sys_vendor)
 		vendor_crc = crc32(ISH_CRC_INIT, sys_vendor, strlen(sys_vendor)) ^ ISH_CRC_XOROUT;
@@ -272,6 +279,45 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 		name_crc = crc32(ISH_CRC_INIT, product_name, strlen(product_name)) ^ ISH_CRC_XOROUT;
 	if (product_sku)
 		sku_crc = crc32(ISH_CRC_INIT, product_sku, strlen(product_sku)) ^ ISH_CRC_XOROUT;
+	if (product_family)
+		family_crc = crc32(ISH_CRC_INIT, product_family, strlen(product_family)) ^ ISH_CRC_XOROUT;
+
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
 
 	if (sys_vendor && product_name && product_sku) {
 		snprintf(filename, sizeof(filename), ISH_FW_FILE_VENDOR_NAME_SKU_FMT, gen,
-- 
2.51.0


