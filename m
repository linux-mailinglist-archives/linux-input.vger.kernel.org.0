Return-Path: <linux-input+bounces-16672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09300CD4EE3
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 09:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C363019193
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 08:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED1630BB91;
	Mon, 22 Dec 2025 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSrINbub"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7530BB94
	for <linux-input@vger.kernel.org>; Mon, 22 Dec 2025 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390773; cv=none; b=kF5OUrSlbNoeTRTBgQeqLYxhXh97fm/134WXaFb9+2QJ1Acuog1ZSsnMxm5NY4TrN8yJY/+jAaxWgLknF/2/3s804VCKr8Sv0lZLzdebSSToD4Y7k6/LzDdC8doMIMadB7Go9XCTKizxmwCqxqrm77Ke/c9jdFw2xSEbgb155L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390773; c=relaxed/simple;
	bh=7NnfB95d/qjSb47h2oPcevWqYAT/LhhPCnd3bmfXZg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTQan0WpVGxeIKKnedNsODn8Id+F+siXEAuV4SOCQ5Dps6LnVEwjcnZOAKe/xjxTbGldVWzj8Y2LgH1giuH/X9le5bc2MUrRblLY+s1LfbGC2EeICIncp1nwgEJsrm0erPi0mugI7p0KZeyOZNPJ/kcpLbKnr8W6t426p6mdKKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSrINbub; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so1944513a91.1
        for <linux-input@vger.kernel.org>; Mon, 22 Dec 2025 00:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766390770; x=1766995570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2Fdnpcojf4DLWy5W3E6d4c2QXgA2ovsHAVLQ3QTW4Y=;
        b=mSrINbubZ4EP9+SL4tKlClUS93XULf2sXIM0WJ2zFUSIAzOGBS44oddw7CTbr2k4WP
         k9kvA16/hnyr9U1dD0xCS2/jGfJeNI8RKwFgu1hyKirOr5iY60ebR2erE3beb7yQwDmA
         xiek6xvilcAlNpw+9QnWeTiTUfoBsDNSvCmG1duIaz8IUh3sYA5e+gXfu7TWj5xR3qiu
         oHdXgLwpkjBqKxOaHZEQkkoZUxrCmCqme4hWEpDxiqayQCjumKR594bAISf3vOv3GI5F
         +xVGRlzTx+SmPfqShGEMlPNOTIOl1iD9ZZmoU9Dqgtmh7dY6rmkB4gE/HEBAfHNgbvIe
         Cj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766390770; x=1766995570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2Fdnpcojf4DLWy5W3E6d4c2QXgA2ovsHAVLQ3QTW4Y=;
        b=bSsFEQJjBKU5aMhvwojCzqmRcGbYlLYI73RXm8L9yTQjZstL3njMy2M/ydPLViqakI
         T4IVPg7UT0W0Cx42PVOaikCU0w8wAJruQP+OZmJ60jHG0E6qsHVdNHVHbcaChZxlIWBC
         ysI/cPwPxyB9TvM2CvNVHYvrx1SwByXbnlnUdSsgZDpLXSx2P28Kfve/T+tXkx65AUu8
         4DzDryeP/6m2ZQCzYJWdwDbDU12q7+2FdH+9t/0xNWxcy8Q4ziH4oLmpc3lARf/YixR9
         SWmKw7MKiSN8dQ/Ag4kAuCaoDzLGWWZMiqyl2MEVuW2TdS1B0uH6oB5o9vfUro+Tgdph
         auPg==
X-Forwarded-Encrypted: i=1; AJvYcCWouwPXqHVtCamHF8mRlz18uz4Y/fsbvY+JoIa1Rh+vKZfm+ubyBo8Ck5B8jD0xOl9i/NDNbzc+hEdWJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM41Vsc7fFgF4TKxIIHX3igqGES/LkDw97gwGql5bZkHAI7rBo
	a6TZ2eMsvrYgdGsau1BeGXof3EtqUlBRiaeWAAXenYI07RIsHhO0decG
X-Gm-Gg: AY/fxX55oqj/jgPMs8sBFEMd/2lEAVxR1cgpgTER6cNUjwbpNxwjsDUyQ8BjtffwOlb
	5q+9CfLW/rUhJWW+lSEG9h3AF7jr4Y9byaJSY8PIf9FnHnv7cK+x+C5kHpyJH2ZnXMbxFJpPaXN
	x5fuHY+zZYYuVkQff/gcDhrBwaPCL2h8wQwD0IghVYmNYYZz5ZhbOblZPiCGx9uAIyjY7vKtkCw
	BByqM2wXQymqxqg+JX3kBP2xzX8GtP1n8uJjf94fdXOPXjzNL4CNmI+dRn4LSeCNepiQT65wSCJ
	jRZ+H20uB/TMAYOBfP1y8le8lxUycbAvez8V26Pb3Psvg+yfu/y62h1UmgyX2AH3KCgD+Sj64wJ
	GCKVSiMuASRsaOFiGe6TSZL8i8b3mqMSnuGuo0an50j0+N75cfUGj4enjoJSpCFvwY+D69foDGk
	lWmd2WOZIPOXPJqW+GAjXHZNQicyHzTnV8rs+oQbDWYH+FPA++LL2CNTd4iZ3SN8998nJC/Z1Z+
	BLtcG/4f8ktOQbO+DMQyWCHDk3G2qO/
X-Google-Smtp-Source: AGHT+IHwhpn/fb7A9/k1WMZFSZ8+UUJV7UQ969ESY5Lf0jsCicVtzq+LBU7c0024woSREPqweY0jpA==
X-Received: by 2002:a17:90a:c106:b0:34c:2f40:c662 with SMTP id 98e67ed59e1d1-34e71e2955bmr11901858a91.14.1766390770383;
        Mon, 22 Dec 2025 00:06:10 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1.lenovo.com (zz20234032476F6CA7C5.userreverse.dion.ne.jp. [111.108.167.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm5622557a91.6.2025.12.22.00.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:06:09 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	vsankar@lenovo.com
Cc: linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v3 2/2] Documentation: hid: intel-ish-hid: Document PRODUCT_FAMILY firmware matching
Date: Mon, 22 Dec 2025 17:05:12 +0900
Message-ID: <20251222080512.956519-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251222080512.956519-1-vishnuocv@gmail.com>
References: <20251222080512.956519-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ISH firmware filename matching rules, including the
new PRODUCT_FAMILY-based patterns and their search order.

This aligns the documentation with the driver behavior and provides
clear guidance for vendors supplying custom ISH firmware.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 Documentation/hid/intel-ish-hid.rst | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
index 2adc174fb576..068a5906b177 100644
--- a/Documentation/hid/intel-ish-hid.rst
+++ b/Documentation/hid/intel-ish-hid.rst
@@ -413,6 +413,10 @@ Vendors who wish to upstream their custom firmware should follow these guideline
 
 - The firmware filename should use one of the following patterns:
 
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}.bin``
   - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
   - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
   - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
@@ -420,16 +424,21 @@ Vendors who wish to upstream their custom firmware should follow these guideline
 
 - ``${intel_plat_gen}`` indicates the Intel platform generation (e.g., ``lnlm`` for Lunar Lake) and must not exceed 8 characters in length.
 - ``${SYS_VENDOR_CRC32}`` is the CRC32 checksum of the ``sys_vendor`` value from the DMI field ``DMI_SYS_VENDOR``.
+- ``${PRODUCT_FAMILY_CRC32}`` is the CRC32 checksum of the ``product_family`` value from the DMI field ``DMI_PRODUCT_FAMILY``.
 - ``${PRODUCT_NAME_CRC32}`` is the CRC32 checksum of the ``product_name`` value from the DMI field ``DMI_PRODUCT_NAME``.
 - ``${PRODUCT_SKU_CRC32}`` is the CRC32 checksum of the ``product_sku`` value from the DMI field ``DMI_PRODUCT_SKU``.
 
 During system boot, the ISH Linux driver will attempt to load the firmware in the following order, prioritizing custom firmware with more precise matching patterns:
 
-1. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
-2. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
-3. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
-4. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
-5. ``intel/ish/ish_${intel_plat_gen}.bin``
+1. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+2. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+3. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+4. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}.bin``
+5. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+6. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+7. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+8. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
+9. ``intel/ish/ish_${intel_plat_gen}.bin``
 
 The driver will load the first matching firmware and skip the rest. If no matching firmware is found, it will proceed to the next pattern in the specified order. If all searches fail, the default Intel firmware, listed last in the order above, will be loaded.
 
-- 
2.51.0


