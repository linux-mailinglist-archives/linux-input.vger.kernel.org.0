Return-Path: <linux-input+bounces-11934-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B3A974FC
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 20:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 614881B6037B
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 18:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4EB2980D5;
	Tue, 22 Apr 2025 18:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwFWHv3a"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E22980C7;
	Tue, 22 Apr 2025 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348234; cv=none; b=aSFjMwzCzUvGn89PG1Ng3iAYUkZPNe0KdUkkIOKEJlXuq7q0uWlfumDCe6ZVn9VEwJzyP1JdeX6kOgjCU2AFxqHGdJjvp40UFxpRErQQy7IgXdT5MZzhXOJrU0S8SmNujXGB6/xfVHeHpdrx6l2n1YdV1zRHPhZwIvEKBcZK+w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348234; c=relaxed/simple;
	bh=UJ/2h7xGj3y2G/xEwcDKQ1TRapuCMB3VFy5L8fyEXA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pj2HRmzHbe443C3f6aPc7r3c3kagfLh+xJdMbmPhj2w93cfbaEQzDakQxyHnRGDGKT7BMVNR5e6LhIbo5Qyc1KML4zHiQByN2uJcQgo3IpoI45D1JQ2Hp2H7JmGHQF+pmP9J0zT0B4H9rxXrEZU/JGqHQa3jGoN7CFCsK1UEYSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwFWHv3a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745348232; x=1776884232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UJ/2h7xGj3y2G/xEwcDKQ1TRapuCMB3VFy5L8fyEXA4=;
  b=VwFWHv3a5IVvj09/TStKbdqLeZBNv7N5Tdx4kdcZzAvACxQREbjosDOg
   sGH4mA6GJM/TmrCkieA+hQQI1cFZqeJzCevuf504M06gD+ULb9qf1c2H3
   BGSONvGMSU7FZDVPvcBryQaWgrxD6l+eZD37HSDLldOOsAx9wiks45aCn
   g6GOuARyG/GaDMYbDGLrCHpNkcBYo/vxTIEFiA5jd6MsJUujSLKKbMHdg
   PPd9AkKUThlSuc4dhEMiRATjEHtYcPyqfpdvySMfHZwf4qG3ifzqvnF2V
   eUCrW16/pEJF6jwlP5KQ5H1VCIXj4OofuCv2d+Cw2NK2/7GRoupUOxy5p
   A==;
X-CSE-ConnectionGUID: mOw6o3nmT9mqfw7K5GdQKg==
X-CSE-MsgGUID: dkPgpQBmRQGCljIZdJF5Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57581603"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="57581603"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:57:11 -0700
X-CSE-ConnectionGUID: VULxbihmSDahUY3CqisGoA==
X-CSE-MsgGUID: qWQvVI9qTFGh4DdyNfKrIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="133043241"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2025 11:57:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 10C671E5; Tue, 22 Apr 2025 21:57:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] Input: psmouse - bail out when device path can't fit buffer
Date: Tue, 22 Apr 2025 21:57:07 +0300
Message-ID: <20250422185707.1949500-1-andriy.shevchenko@linux.intel.com>
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

drivers/input/mouse/psmouse-base.c:1603:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
 1603 |         snprintf(psmouse->phys, sizeof(psmouse->phys), "%s/input0", serio->phys);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix these by checking for the potential overflow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/mouse/psmouse-base.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index a2c9f7144864..bd7d908be7a5 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -1578,7 +1578,8 @@ static int psmouse_connect(struct serio *serio, struct serio_driver *drv)
 {
 	struct psmouse *psmouse, *parent = NULL;
 	struct input_dev *input_dev;
-	int retval = 0, error = -ENOMEM;
+	int error = -ENOMEM;
+	int n;
 
 	mutex_lock(&psmouse_mutex);
 
@@ -1600,7 +1601,12 @@ static int psmouse_connect(struct serio *serio, struct serio_driver *drv)
 		 psmouse_pre_receive_byte, psmouse_receive_byte);
 	INIT_DELAYED_WORK(&psmouse->resync_work, psmouse_resync);
 	psmouse->dev = input_dev;
-	snprintf(psmouse->phys, sizeof(psmouse->phys), "%s/input0", serio->phys);
+
+	n = snprintf(psmouse->phys, sizeof(psmouse->phys), "%s/input0", serio->phys);
+	if (n >= sizeof(psmouse->phys)) {
+		error = -E2BIG;
+		goto err_free;
+	}
 
 	psmouse_set_state(psmouse, PSMOUSE_INITIALIZING);
 
@@ -1654,7 +1660,7 @@ static int psmouse_connect(struct serio *serio, struct serio_driver *drv)
 		psmouse_activate(parent);
 
 	mutex_unlock(&psmouse_mutex);
-	return retval;
+	return error;
 
  err_protocol_disconnect:
 	if (psmouse->disconnect)
@@ -1668,7 +1674,6 @@ static int psmouse_connect(struct serio *serio, struct serio_driver *drv)
 	input_free_device(input_dev);
 	kfree(psmouse);
 
-	retval = error;
 	goto out;
 }
 
-- 
2.47.2


