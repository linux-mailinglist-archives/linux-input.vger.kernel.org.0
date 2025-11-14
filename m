Return-Path: <linux-input+bounces-16115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB74C5B8F4
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 07:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5743BF0F8
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 06:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9942F28F1;
	Fri, 14 Nov 2025 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fa0x8Och"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204742F25FA;
	Fri, 14 Nov 2025 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763101726; cv=none; b=o5tEBGd73qhOpownEQdMm5aV6KSGR5L4SfRLpV6lsQ3aau4r+yk9w8G026uHBcBvUXGl2kVXxsEHdxF5ucF6+aKqJPygpz1wynvsYwd1raEpc2tC72YNonEYS5Zl9Aj3YJXqpp5lXpd6DWriofUwITtGSIQ3n7+3dCE8Xct1Im0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763101726; c=relaxed/simple;
	bh=BjbkvwmsnP2Nkrba3Ya2MEDcNqTlJTK4kBRNBf5j5yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sd9Cq/AXU597RfhdiT6QOkg47EFbtMl3RlH5cuZFRTMx87ymCnIjAH4W6tTzbH/Fqi9rQxkZiBbGUkuWR8KftdCCpPDyBzfkL795gIwdzaNmH7D84QgzWGlui/tLgSUbTdXHX3z83mm11hkyGt/kSZh6oHzK0HMRT95jaSSLyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fa0x8Och; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763101725; x=1794637725;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BjbkvwmsnP2Nkrba3Ya2MEDcNqTlJTK4kBRNBf5j5yQ=;
  b=fa0x8OchLB2aGl3n/+MzhihVGIHAolAGg9N0t2Pk88m918Mtlk9V++ho
   Q25g7aDVNu+sboJ/krWOUK51LGqJCtm8aUqs8syRgXAciWd1URO2cj7iA
   SIObze8YDZFbOXJ5Fh94tKaqsLLTdliSWMm/oiWInPpha115yE4Xa6zlp
   Tp48Wv95biYdMbfyKHgX2uWBdMcGIOHPW4Yfs0eMeeGyn5CYwQdeMmQiy
   0uddJ3jIehAZRvVzm+s5OgJeaFAdWMeJOYVwp86WLTDuiYiHa0IB7fZdo
   6e9p1xRWb1oj02OctoToUBCKAOwWEqDWpY0ZzQsXyNWv8vczu0TZpBKfO
   Q==;
X-CSE-ConnectionGUID: Pivr+UyMS5ya3nblmg/ymw==
X-CSE-MsgGUID: 8/bAQrQ2Qkef+MhA31TncA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65351632"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65351632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:28:44 -0800
X-CSE-ConnectionGUID: BkEDP6YCQgCg+bxPLcMfMw==
X-CSE-MsgGUID: JShK6muuRAGwsLKzESD1LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="188989276"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:28:42 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	junjie.cao@intel.com
Subject: [PATCH] Input: ti_am335x_tsc: fix off-by-one error in wire_order validation
Date: Fri, 14 Nov 2025 14:28:17 +0800
Message-ID: <20251114062817.852698-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current validation 'wire_order[i] > ARRAY_SIZE(config_pins)' allows
wire_order[i] to equal ARRAY_SIZE(config_pins), which causes out-of-bounds
access when used as index in 'config_pins[wire_order[i]]'.

Since config_pins has 4 elements (indices 0-3), the valid range for
wire_order should be 0-3. Fix the off-by-one error by using >= instead
of > in the validation check.

Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 drivers/input/touchscreen/ti_am335x_tsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 93d659ff90aa..73980142f492 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -85,7 +85,7 @@ static int titsc_config_wires(struct titsc *ts_dev)
 		wire_order[i] = ts_dev->config_inp[i] & 0x0F;
 		if (WARN_ON(analog_line[i] > 7))
 			return -EINVAL;
-		if (WARN_ON(wire_order[i] > ARRAY_SIZE(config_pins)))
+		if (WARN_ON(wire_order[i] >= ARRAY_SIZE(config_pins)))
 			return -EINVAL;
 	}
 
-- 
2.43.0


