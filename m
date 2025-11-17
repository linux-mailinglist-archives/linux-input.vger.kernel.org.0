Return-Path: <linux-input+bounces-16141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F7C623D5
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 04:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8051C4E120D
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 03:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DDD2853EF;
	Mon, 17 Nov 2025 03:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUVLwY4D"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507361F17E8;
	Mon, 17 Nov 2025 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763349881; cv=none; b=XSUiT48n/ocl60+/RnK3HJdqKDVEjG/3xj9xElFG7CYbLzPH01e0xAO2VnfcUaeEtfi24i99aeNOBJJEcIarLlkQTq/C2Kbc/CcZ9BTBkM9X78ysz6M4T6ZEx7roAtEBzQT86Xo8UVZslq0yW7ky+ayo4dp3URhBDnuwiXMJ/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763349881; c=relaxed/simple;
	bh=x+XhgeVHLUrLi3NnCeNSYtVlxK0YeeFXYLEBLruRiKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLLXNK9z9VV8VaiwXRiqP7lTBP4JVAHwLBFQNDcHWVEWn1monY2UqPKK3R7hGhGYRRZEjSXCjHmO2ZjlOqC+z/tkgSyr/K5s47cVryQ0sHHgnmop4zGlABlE2GrN6QJSEmjnxPkt8YRA6jKsr6dho13B5e1jllQN1EYEexVNeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUVLwY4D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763349880; x=1794885880;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x+XhgeVHLUrLi3NnCeNSYtVlxK0YeeFXYLEBLruRiKU=;
  b=RUVLwY4DSX7WN+5Mo7HghmOsUr3d/od4PncctQ4zGeSmx8pcSTLSpWV4
   BtWGqldNRyk9XTMtF6vasqU+WpLuO7AzaQUbWHqpY7EI4GMA1HSZP42Xy
   t7rJ0ciftGeK3KkN5zneQo73SMMU8UVJ3oPy8AkDOIWUZUtvbBbLd1XLU
   auHWpDZFbU7kubBtn9xwhy1VQ91viBXt8cVI1fNP64vmyajof1F5KLgPZ
   LDyUQ0cbTHO8GpZ6t2+dvjNBbz00oBVDOIdmphq9b/P9rSx91UcCt3oLE
   uyu2poAQADIPuUwrvwWB2M5mMh/FlHJZlgjsw7dfY5BqHO0HsfRc72coG
   g==;
X-CSE-ConnectionGUID: tiJBrD4GRI+zH45e1Ldx0A==
X-CSE-MsgGUID: l5M90Rp0SKqj6jv57q1W5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65055054"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="65055054"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 19:24:39 -0800
X-CSE-ConnectionGUID: eh220uVhT6aUMI96lZipiw==
X-CSE-MsgGUID: RZ/EZoXOSgilnOrsO0kJIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="213732610"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 19:24:37 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	junjie.cao@intel.com
Subject: [PATCH] Input: ti_am335x_tsc: clamp coordinate_readouts to DT maximum (6)
Date: Mon, 17 Nov 2025 11:23:58 +0800
Message-ID: <20251117032358.891822-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DT binding (ti,am3359-tsc.yaml) sets ti,coordinate-readouts to a
maximum of 6. The MFD parent also enforces that
(readouts * 2 + 2) + adc_channels <= 16 and fails probe if this
is violated, so the touchscreen subdriver will not even probe
in those cases.

Clamp coordinate_readouts > 6 to 6 in the subdriver to align with the
binding and keep behavior sane if invalid platform data bypasses schema
checks. Keep the existing default to 5 for non-positive values.

No functional change with valid DT.

Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 drivers/input/touchscreen/ti_am335x_tsc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 73980142f492..0534b2ba650b 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -389,6 +389,10 @@ static int titsc_parse_dt(struct platform_device *pdev,
 		dev_warn(&pdev->dev,
 			 "invalid co-ordinate readouts, resetting it to 5\n");
 		ts_dev->coordinate_readouts = 5;
+	} else if (ts_dev->coordinate_readouts > 6) {
+		dev_warn(&pdev->dev,
+			 "co-ordinate readouts too large, limiting to 6\n");
+		ts_dev->coordinate_readouts = 6;
 	}
 
 	err = of_property_read_u32(node, "ti,charge-delay",
-- 
2.43.0


