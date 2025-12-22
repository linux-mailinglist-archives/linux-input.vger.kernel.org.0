Return-Path: <linux-input+bounces-16670-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE0CD4E95
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 08:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2221B3005A85
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 07:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D04B30AD1A;
	Mon, 22 Dec 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvGwXDhk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17E30B510
	for <linux-input@vger.kernel.org>; Mon, 22 Dec 2025 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390085; cv=none; b=pSNjXtV7DahhtHgeC8IIYZ95HnbFP80uU4NswJHOEBfD8/Men1k/+FrYRSlvpuuwmubadBGEeG+wqTl8+s1biilLUT6X2szJd8ygbFiug/aDdjcSjixtFWNyKtsottj1yCVq+elI2V6LN7wcjgZjMqJbUG0X1WNfWVPMNIsq0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390085; c=relaxed/simple;
	bh=7NnfB95d/qjSb47h2oPcevWqYAT/LhhPCnd3bmfXZg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iugDinoMiHt3k7r8be76LT/lisPUj4qEfVro6nsDJ7gkrhveL2lbdumfsllReiq1ALYQvx2nfEkMR9HXubnw8IHIo87i5iwPllPx+ZSqJdg+cAdqjiDNg9CrC5ekGidBjuHDeUQcBQL4kAEc7nXrtm2TjSCt2tX321FlWw0NUEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvGwXDhk; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so3074243a91.3
        for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 23:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766390083; x=1766994883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2Fdnpcojf4DLWy5W3E6d4c2QXgA2ovsHAVLQ3QTW4Y=;
        b=XvGwXDhkEfsCE+BPLgxA5Y8mI7i1tfBlKnVE1KLqPeKaDOSKYF9xtxzoFr9U1DisHU
         6B/S48xf0YzgXLSgkooHYB1AujDfz6Mr/Ojue4AvI22wCWhHI1cEWQEp61DPDSRwECdU
         LqUlhr9VGfghNtq8pq31YXw0T601ktZ6TdK7rq4ao3gOWbNSPJXj0+TpwC+4FNhc8XjE
         x5TYgSArFDxKYujEOHBzH87l/41fK0wPAmImA1OdNMxrfoaG1Q7Ozp9YFRpP5NzmcflZ
         +MMmzQpiqFoK8zhbqrfXQ/yEh/qDam/KSYv4f6r85tuc4J5xcArirOrZAERSUgsrP8FG
         bzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766390083; x=1766994883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2Fdnpcojf4DLWy5W3E6d4c2QXgA2ovsHAVLQ3QTW4Y=;
        b=Ur/JjPRaIybfYnHgwu+Eu32DycWRt3f8rZMjPdkgk3nTC46I+31xgcJFKHFTxS0UD4
         zdIMNWs4K4SdaRc34IYUUUKl31DttT73yAnoMLVlgGd0mN4e0iOdYza8/Flej/0gjIbJ
         wmaP2bxh6iYxNMLEkeN1nI5+V6ivRqy9rzaJ4uGmknuLical6metiURo5rnaqWUyE6vd
         bP0vgKmPQ11eIx4IsyZlEfRg5lhgGt+4XCJptaI5pHw8d1Hw8jw/HCUhBrr04pxyDTCY
         czgVB9Rb3A4V5U+1AirF/ytrgT9JGfV5GCeczA8rD4T/n/MmTDX6vxK9RnRdSzGH1pEP
         p7xg==
X-Forwarded-Encrypted: i=1; AJvYcCU3YBjvlf+TcTdsDD7B3m3UTNWo75nkh6ZaM+nWVBbOjwsQs/2ARB4FPonlwm32nQIDVTtE033FEEFujw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ3YcmONdcJPjjSnHwOOhdt8NYe6FnnxTt7jDO0GVCAwN7ITdZ
	rFnKt0+jaYEDpdh5UAG5IeK0FfMmrQsahkuIouHCfo+PLyJJPU7RmIf9
X-Gm-Gg: AY/fxX4EcLBD6pOKdKAD0s5CUmuodNXbsu+6iDAv5ZQAxGP6QtN7OrpVDk9qsnsfMOr
	hkGs5Ai2kQF8Hj1GT9epzAJQZmmVXvSKTC2fIkMDLTnl7RHZJr+ZHYOu5IZ6uxDgm/Tc24zALE0
	84mYpp2EWWsJRpcP2bawalwui8F521bRE3QMuWmF3Ol7dLNxLim4zIrHDqDo53dn182q53vE+Sc
	uj3+tn1DfcPFSwW4poqi2Xamg9zrR4EkTKc9SzrRTpj1jg6GGAvbV/ftSGGyO99Y/ZZmDNkVeIS
	4KFFQscf9jnDsOmPvRCiciW3/nVSHCViMFuoCRk6cyM3pfdj40pOj64HcMTjhXKsUDBuU93ZYJk
	rOpOeytdPYTaSMUqngcLLEp8bZlpxjrEktG0PM8iNwuy4rahRqIUloXLkLM4qKzM1yB6UbFdf5F
	mU2sFXMadcyTtgrJJqzwRlJ2o9+L3vDmrPYIZerFOY6BbmDtpdn6Q9nQ6KbEIDCszfGuIQJAgfV
	GZTsAvHn1X53me8laMwddcpzX8Uv8xc
X-Google-Smtp-Source: AGHT+IH/OFUvCngYOR3K32kl/U4IoD3+OzQzJiEWoGID+0Z4tD3qKdKr5jNEUslAMvkAajcn2w6BBg==
X-Received: by 2002:a17:90b:3c47:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-34e921cbcdbmr8418450a91.28.1766390082739;
        Sun, 21 Dec 2025 23:54:42 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1.lenovo.com (zz20234032476F6CA7C5.userreverse.dion.ne.jp. [111.108.167.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7bcsm12025951a91.13.2025.12.21.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 23:54:42 -0800 (PST)
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
Subject: [PATCH v2 2/2] Documentation: hid: intel-ish-hid: Document PRODUCT_FAMILY firmware matching
Date: Mon, 22 Dec 2025 16:53:46 +0900
Message-ID: <20251222075346.955637-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251222075346.955637-1-vishnuocv@gmail.com>
References: <20251222075346.955637-1-vishnuocv@gmail.com>
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


