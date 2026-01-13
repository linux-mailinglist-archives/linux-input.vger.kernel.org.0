Return-Path: <linux-input+bounces-17022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F72D174A6
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2417A301D325
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2437FF74;
	Tue, 13 Jan 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrhzBwTx"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC543803C1;
	Tue, 13 Jan 2026 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292954; cv=none; b=j59BHOWvdxQUwIMkgeZdqYRWXiOo13ab9WmkcivCynETR70i27xqM5gkgBbxAO2od5Lp+nRMk2QMxpOajxzonKudXKrM7HwANvG7Insbl8JWAcR7lGmbdQVcg0zPlR7jqnviij+idREgQzGgpwn0KI/G5jl2mJP6kT6uzINm+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292954; c=relaxed/simple;
	bh=gIQ+74Fc864bYsE6zQQmAHoznyHsey4vMzKaH+QV4VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Soa0h4BlKK3xxm2gs9q9L11R57cziVW6nUUiZ+YefcR52qxLgGSCvM6cGNKR+g2roSN2epHVgwUMbttyqADXXKZd+PpgrPekZN0UVoudMkpMDh1D1nCpGAUOHxCUefCvUCvh7QF0+CVnuK0FTCWWpBQwKXh477vnqoV4B2BQo+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrhzBwTx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292953; x=1799828953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gIQ+74Fc864bYsE6zQQmAHoznyHsey4vMzKaH+QV4VU=;
  b=TrhzBwTxOp7f9nLqzALsZSknIJC84ToOIk1jQupal0F8waU7X0/VA8nl
   YqgEKmxrR1h6qswwNkrtXk7HErl16qQdBQhBPlstBj+eVj0fC9Q6h+SU/
   TBzYfwSdMtgmyhUxEmU759VzUeEyb2tIL9THH2lAdyKFFRKKkSLhKNrBd
   RHLumCZBTnG8R/gLm7bzMVoo1ffQVKjCgC/2yliQUyuSoBSotghq5dW0w
   h6fTpEwY+oO5RUaD/+QJLzCqF5UfUPy4cekyjbyR5CqESY5gFihkWN9GB
   fhaeQULFkbwbkFq1rP0lIilymWgoTULf6d2Fd/9BW8oxN1G/1ypx9c5eG
   w==;
X-CSE-ConnectionGUID: 7++UksV7TjWA4I705Yrs5A==
X-CSE-MsgGUID: Q1/3fUviQXm807dN0it0Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86988358"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86988358"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:13 -0800
X-CSE-ConnectionGUID: dyKRvLkETNqfzzQXYG1YTw==
X-CSE-MsgGUID: oJB9R72xRj+Ms7PtDIOmaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235035173"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 00:29:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 923DE94; Tue, 13 Jan 2026 09:29:10 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: hampshire - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:05 +0100
Message-ID: <20260113082905.83718-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/hampshire.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/hampshire.c b/drivers/input/touchscreen/hampshire.c
index dc0a2482ddd6..2f9b078b652b 100644
--- a/drivers/input/touchscreen/hampshire.c
+++ b/drivers/input/touchscreen/hampshire.c
@@ -118,7 +118,7 @@ static int hampshire_connect(struct serio *serio, struct serio_driver *drv)
 
 	phampshire->serio = serio;
 	phampshire->dev = input_dev;
-	snprintf(phampshire->phys, sizeof(phampshire->phys),
+	scnprintf(phampshire->phys, sizeof(phampshire->phys),
 		 "%s/input0", serio->phys);
 
 	input_dev->name = "Hampshire Serial TouchScreen";
-- 
2.50.1


