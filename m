Return-Path: <linux-input+bounces-11932-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F0CA974F7
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 20:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C9EA3ADDC8
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 18:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2392A298992;
	Tue, 22 Apr 2025 18:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhH6UMPZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A12980D3;
	Tue, 22 Apr 2025 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348223; cv=none; b=dZwXO/GwyLTByrEh0y38xWbWPEL+qCZG0J281Um0SZ5XPuEFbrMEOjr/+Cl/k0QijN2Hr6OCztucS0MGlq+UP3KSx7buDFOZMQo6lOwPBcaVodlblmUCSNJbKkBFZ3YHIcTmeXaSJ4Hz3Njfhqh1ma/IMJ6LBmI8q/X+gn1J9Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348223; c=relaxed/simple;
	bh=jC1gy4LFmGSfEydpPek5kRgg7hmUEfuZWyBzzvsHIfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p1vfc6bDn1qfMUDNGV8PnLDh3V9TEpORgiUeQAVX1sGxDsqi63Uw08mNDkJLOhyKU0OBDl8D/BuE/cli26KkZbfy6mvs+WY2ZKIZKhfAvR2/yA8OppdvQiOEaG9+XP8MhANxXqZDfnhtsNG0Y753DQ1H+FY3s0bg2j8eJXCLvsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhH6UMPZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745348221; x=1776884221;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jC1gy4LFmGSfEydpPek5kRgg7hmUEfuZWyBzzvsHIfg=;
  b=UhH6UMPZ4HNlOb0ChXji2WRPVzPeW0znE/uoFLT+vdt18pVLEbiiqmsk
   gy6VSRwCx4AA8UI6TNbtc+ffwOouVktSbsm/9WDqJKqiS4YqqUD+Or/n9
   3PvBEbyz6j2i0oVBL1a1Rj/QVaholLkUJKLcUtXDlFO32nWaEdDdHcRyA
   Kydb20wXPBu+GFkJBJm7J05d8NLMYZDSUrfx7iaaomODj/fXZrsdEkM0I
   iFPYkBvFAqCkVcQiFqHURkbdjroly6gR9aE6vg0U8qUTdzjuCA2Uif9d8
   UhpmgYhwPFmBRE+tI7wZyPsTW0RN/n+/OoXjjrVwoYSmxTIgibfbud0HN
   A==;
X-CSE-ConnectionGUID: rqumJ57RQwCwjMx/7Gw6ew==
X-CSE-MsgGUID: JPdV4SanRgKagVHLTvoaXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46804506"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="46804506"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:57:01 -0700
X-CSE-ConnectionGUID: /OgHg8DQTyaR5B+KadU+6Q==
X-CSE-MsgGUID: ywK3G+jBTG+NTuNeywNF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="131838260"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2025 11:57:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C0BA31E5; Tue, 22 Apr 2025 21:56:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] Input: atkbd - bail out when device path can't fit buffer
Date: Tue, 22 Apr 2025 21:56:57 +0300
Message-ID: <20250422185657.1949429-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When creating a physical device name in the driver the snprintf() takes
an up to 32 characters argument along with the additional 8 characters
and tries to pack this into 32 bytes array. GCC complains about that
when build with `make W=1`:

drivers/input/keyboard/atkbd.c:1194:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
 1194 |         snprintf(atkbd->phys, sizeof(atkbd->phys),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1195 |                  "%s/input0", atkbd->ps2dev.serio->phys);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix these by checking for the potential overflow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/keyboard/atkbd.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index adf0f311996c..e5d6880ceef6 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1178,10 +1178,10 @@ static void atkbd_set_keycode_table(struct atkbd *atkbd)
  * atkbd_set_device_attrs() sets up keyboard's input device structure
  */
 
-static void atkbd_set_device_attrs(struct atkbd *atkbd)
+static int atkbd_set_device_attrs(struct atkbd *atkbd)
 {
 	struct input_dev *input_dev = atkbd->dev;
-	int i;
+	int i, n;
 
 	if (atkbd->extra)
 		snprintf(atkbd->name, sizeof(atkbd->name),
@@ -1191,8 +1191,10 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
 			 "AT %s Set %d keyboard",
 			 atkbd->translated ? "Translated" : "Raw", atkbd->set);
 
-	snprintf(atkbd->phys, sizeof(atkbd->phys),
-		 "%s/input0", atkbd->ps2dev.serio->phys);
+	n = snprintf(atkbd->phys, sizeof(atkbd->phys),
+		     "%s/input0", atkbd->ps2dev.serio->phys);
+	if (n >= sizeof(atkbd->phys))
+		return -E2BIG;
 
 	input_dev->name = atkbd->name;
 	input_dev->phys = atkbd->phys;
@@ -1245,6 +1247,8 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
 			__set_bit(atkbd->keycode[i], input_dev->keybit);
 		}
 	}
+
+	return 0;
 }
 
 static void atkbd_parse_fwnode_data(struct serio *serio)
@@ -1331,7 +1335,10 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
 	atkbd_parse_fwnode_data(serio);
 
 	atkbd_set_keycode_table(atkbd);
-	atkbd_set_device_attrs(atkbd);
+
+	err = atkbd_set_device_attrs(atkbd);
+	if (err)
+		goto fail3;
 
 	atkbd_enable(atkbd);
 	if (serio->write)
-- 
2.47.2


