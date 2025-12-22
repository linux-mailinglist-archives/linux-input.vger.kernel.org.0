Return-Path: <linux-input+bounces-16671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AC7CD4EDA
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 09:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 469C430076B8
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 08:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A25330BB86;
	Mon, 22 Dec 2025 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4GQxMzI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6383C24E4C3
	for <linux-input@vger.kernel.org>; Mon, 22 Dec 2025 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390768; cv=none; b=uyTs3y9vQIoyvF5h4HMGbu++HlkywPRerq+7sDIIXDVhpim3i7lpORn9eVBSs5U4eCwfTV6MI9TqAOemvJ1MDyCaUf8VgVsz3LitIAmyVaX2AVUxpUt+5DmlH9pez024cFrTgoPbJ3dnjWv26yXjoBcZwRKU3MfGWa08nzGpFrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390768; c=relaxed/simple;
	bh=e4lomm4dQoXyplwfCFD6ts8MxpYp7skOEaioYQvgTIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIQIWweN3swUZ6hGMYbajZEC/oTK0cBQrylBeYjhbfTfBqzFtKqLAi6eiubdizZ4NMXCJBz9oc53IyBUBVX8aYlxEFW88wOvXCMmV2786Xli1uIwl5HTfr/xlLTpat069GCDzETRDan8j1Tipw0mluTfKadq83HLERxTUbTkuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4GQxMzI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so3154052a91.0
        for <linux-input@vger.kernel.org>; Mon, 22 Dec 2025 00:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766390764; x=1766995564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vwaOegezfUGFtkdmQG91NRUULYH7tFQw4sLTEMvhqk=;
        b=E4GQxMzIClXrR/Nwlv1owqPz76yfGPoHGnGWvEgwtYbM1+n7y+O0PzXpKtJEg0lzq+
         n8x4eoYtHj6qfo1vSf7zAEbYajzjdt1MHjWy/Q8EYjodEIdQkvQ8qXVYpOlcMXlFGbA1
         sE33LN1y8weI/p3WshDkOY9N/WXGogwwGOrghrMRVqsqSfV+ZAxnmGP8Q0uu6lUFVExB
         g89mXAHKkfu83f0Nqc0d4LTl7k85azlDKVqNJaf4dg28rbtZr4WLPdT8Ca68xnM6SmD2
         zBQ8IcPJ8i4znD++CEFrHKmAODLVzPlDXNuhP3s/FzjycAjoiaYbGfooeABkZamgOyhy
         v2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766390764; x=1766995564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vwaOegezfUGFtkdmQG91NRUULYH7tFQw4sLTEMvhqk=;
        b=xIKkzxgxnaPdakuavpBt7BfpyFL+qjY+10Apw+1GkrF/q6lTnKmf12tk643STtc3Px
         +/i0vzfWl6xARaNaaZSdg2FXCf17j0H458uGazyh00UTj96/tEABLHJLcJWFs37wm54s
         +keQu2xSo+hCRIQJlycUENReWuZw9Y9OKf069npn3X6ER8dQcLJp7jqWk5lC73uuW5uz
         n4GMWuoC11RczMTM0LaAXU4IgB+TNElFgl45aLjgCiPLGd85dU3T+0SQ3ORsdGBkN4o9
         ypOMUbNr523bErwZs0RMGI20SWLVghNQr56/B2XbsWtUgkfsZ1t/ahFbD+5EPB7LpUKk
         5q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX84AzkM0xGYW+bA3FzMeZAOyiIhZN6+1f6mVCraM+EDUMHKJH9XD+za4tgW6jQIJy34z5cUYsuFrF/4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNxO/MsArhkley58mQpHOhAqKSvnSuFmtuFnIgNqbXweHCeXsi
	d9OBKTyvoOL1vh43S0khUDIZmHgyNd5FGg+m41+i/FJsg9EY2JCl09tvFL51sL2l
X-Gm-Gg: AY/fxX5azMrBgPb8fH+P+AQI831CpyA/kVn7HxQO5ph+iIY+u5xxu0KcLzyTbPGyfY1
	2JFksLKdBxvzYGKNj2RFui3RsxDFe60xoHKI9paV2RyqwMhJOR9RULcxeGoBvTu6ysjYtD4upr1
	uqaBdU0GsGNeZ20T0hkbW3EJlov9MyGzBo19Y8JdEZ/t1k79INDA9pA6umQKoCM5MmOnv8FS1uK
	SEth9GSwQcOUj1XFvXe4t7YmGCYeC+uQD5sFhjsDr2Q0yTzuRkrNQ4U0JZvN9GG9qqgalEhdWoE
	llVMmBAXPMk6ZZ22LQ9ZbrwWcP65HnPgNQfK1euQUXbATlI1QCjKTT8Q1LUT+U/J3WnCMX1sEKZ
	HA/8txhJ7tRklyeYl+jx7srz991aEA9HrF8L4XJxjARMMV6j7Hx8H9vp7YEOJNQOTvKmDHg5cr0
	g+wQ+ezDQIidHjxaYj53oiGX9zCRau7O8QBqSqp6IFVQIEgds8Jj6Cr+5pnwIyLDAfSt363h6NF
	cIvobqy6HOObL8EMGReX4Ux35ymCZQc
X-Google-Smtp-Source: AGHT+IEGRyFS0Tv7fIK6EPDf770ukZVJpvB608i8Q1wJrgT+Euv9n5wfIRSBU3nihnzBkM+dzx27bw==
X-Received: by 2002:a17:90b:4f41:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-34e921b73b5mr8612011a91.23.1766390764509;
        Mon, 22 Dec 2025 00:06:04 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1.lenovo.com (zz20234032476F6CA7C5.userreverse.dion.ne.jp. [111.108.167.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm5622557a91.6.2025.12.22.00.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:06:03 -0800 (PST)
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
Subject: [PATCH v3 1/2] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based firmware  matching
Date: Mon, 22 Dec 2025 17:05:11 +0900
Message-ID: <20251222080512.956519-1-vishnuocv@gmail.com>
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
Changes in v3
- Removed the duplicate defenition of ISH_FW_FILE_VENDOR_FAMILY_FMT
---
Changes in v2
- Indent corrected
- More comments added
---
 drivers/hid/intel-ish-hid/ishtp/loader.c | 58 +++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index f34086b29cf0..ffa2042bb316 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -195,13 +195,19 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 	return 0;
 }
 
+/* Patterns with PRODUCT_FAMILY */
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FAMILY_FMT "intel/ish/ish_%s_%08x_%08x.bin"
+
 #define ISH_FW_FILE_VENDOR_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_SKU_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_NAME_FMT "intel/ish/ish_%s_%08x_%08x.bin"
 #define ISH_FW_FILE_VENDOR_FMT "intel/ish/ish_%s_%08x.bin"
 #define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
 
-#define ISH_FW_FILENAME_LEN_MAX 56
+#define ISH_FW_FILENAME_LEN_MAX 72
 
 #define ISH_CRC_INIT (~0u)
 #define ISH_CRC_XOROUT (~0u)
@@ -228,6 +234,12 @@ static int _request_ish_firmware(const struct firmware **firmware_p,
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
@@ -256,8 +268,9 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 				struct device *dev)
 {
 	const char *gen, *sys_vendor, *product_name, *product_sku;
+	const char *product_family;
 	struct ishtp_device *ishtp = dev_get_drvdata(dev);
-	u32 vendor_crc, name_crc, sku_crc;
+	u32 vendor_crc, name_crc, sku_crc, family_crc;
 	char filename[ISH_FW_FILENAME_LEN_MAX];
 	int ret;
 
@@ -265,14 +278,55 @@ static int request_ish_firmware(const struct firmware **firmware_p,
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


