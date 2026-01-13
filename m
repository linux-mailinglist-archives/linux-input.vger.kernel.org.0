Return-Path: <linux-input+bounces-17020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE36CD1749A
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 135103020B2C
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA363806DC;
	Tue, 13 Jan 2026 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xi1jfRGi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A62A3806A3;
	Tue, 13 Jan 2026 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292942; cv=none; b=ezTmheEnpLNu0bW4B9RMpbA68ByGtJ05TkKl+LA8pY5rpgeZd8s4bPiFWQw9H2mjOwjDeZGx7M8HzrkaDElh0BZVURIQDlJ5jNonouW6WBZa/UQaGXJ5W4RC5KYe1k/WKbXM7On0lvxALyz+8jHTo1m8VW9zIXpl+piRoFeTNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292942; c=relaxed/simple;
	bh=7np12jX/iRKXLsjLS4ox3AnvBuAByNbOpjIbPWf+PyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qeUqiSYEDwJtF89DYJQxqqAgdAn+/lPkovMf5KKz6pVyAGA6yKFz/8Bu4DkvCF08NKXS6qqASMVdjO2OdYpemgv39wLz65fhz8Vzod6FcrqsAMzmu/fpMdCiDzoEsgqAx5aUSKiuso5CFQjaCIONsnuCfgooJmJvIrOxDg8cgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xi1jfRGi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292942; x=1799828942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7np12jX/iRKXLsjLS4ox3AnvBuAByNbOpjIbPWf+PyE=;
  b=Xi1jfRGiUTiMbYCOTIWPY0rUEgTfwcQ2hkDuCPRGwVTVYB7rI3YY2h9r
   TekHxZZZJja8cmwo45AIvasNHpXft2M98Ywpx8Q8cvL6sZzZ96Tj3jdlv
   Y9WTBOynB4mSq9+StkTmbeNxAY0KCsPqJV0fAjdl4w1KI4Q/wH+rSo7KE
   dwnwG9ekbCkjyr5lrpTxEFw6IW9w0DDvmqvojZEJJNOWvsehjIEnmLqeV
   hU2VaiF++yLInt/GlQv7Uo+Qm9Gf1aOxLq3KzkPt0Jr0U3tVV/DhQRhGf
   THmhHi63syvM9Fk8nOP5V6zGP/VsoH4VtNhDEiWDnO46oMiRu+S20pMNC
   g==;
X-CSE-ConnectionGUID: aDZAtqUuQQilEgdFcnAx7g==
X-CSE-MsgGUID: QaWoTw60RamIaIuQgTH66Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86988339"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86988339"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:01 -0800
X-CSE-ConnectionGUID: WCoPaqIWQViywGQDdeUOyA==
X-CSE-MsgGUID: oQyEBS6AQW+YbfAFmwqHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235035139"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 00:29:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0A7E294; Tue, 13 Jan 2026 09:28:59 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: elo - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:28:56 +0100
Message-ID: <20260113082856.83617-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the driver to use scnprintf() to avoid warnings about potential
truncation of "phys" field which we can tolerate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/elo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
index ad209e6e82a6..137a5f69b83e 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -320,7 +320,7 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)
 	elo->expected_packet = ELO10_TOUCH_PACKET;
 	mutex_init(&elo->cmd_mutex);
 	init_completion(&elo->cmd_done);
-	snprintf(elo->phys, sizeof(elo->phys), "%s/input0", serio->phys);
+	scnprintf(elo->phys, sizeof(elo->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "Elo Serial TouchScreen";
 	input_dev->phys = elo->phys;
-- 
2.50.1


