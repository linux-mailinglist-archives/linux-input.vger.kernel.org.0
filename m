Return-Path: <linux-input+bounces-10436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31BA498D0
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 13:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012B01897C1B
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 12:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DCD26AA9A;
	Fri, 28 Feb 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bat3hfc4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD426A1CD;
	Fri, 28 Feb 2025 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740744714; cv=none; b=RTbJ+5dOB+X/SZjnjr2WMLgzWqWFvXvXcyOQxfk/HNfCWvKiRauxyYo0dH7r0d62PQOwla07C/VLXjcjOrpu1W8WtGcZ/7KiNBhrunkdNSDQHTcjG3/iOnf98cuoc1cf8tas/Q/EWzXZ+ylbe8KCh0E+CvrHI2HwhKVAIZEqY+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740744714; c=relaxed/simple;
	bh=Y8RqZ3t9ywshjp5E7qOrtYjFw/yYF3Z9guCEKfl0Jos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCQf8m/ESXKBLQuJISLdfevoe4+S0gQWDzNSigxeyyvZdPqOWy4XvcdXwgz/AIqFo38qwSKJpLKEwfyrU10Afp14uwGKUIEziFZBFmwcBflk67Lb+SkMNmoEadgS1yDkiGcZl4cNyvmfP0d9XfNpjhXmgTRZVhc6HiMQc5Ixl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bat3hfc4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740744712; x=1772280712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y8RqZ3t9ywshjp5E7qOrtYjFw/yYF3Z9guCEKfl0Jos=;
  b=bat3hfc4wGuGzJ6aIf+R5Hs2sE9nD0xk0TL3+Og28naq2GPiLzzP8uQl
   pFb5e59EoLNRKiGSWO2D6rR3ahfLy4p7Rrg15Wm1vxbEL0tPhTJQw+Gb9
   zNYf4kz+BJOLfDwLBXI36oLMz2gkKb6W+gXNMpekJ19Itdh2JA2ioUItW
   m2u0zuD1at2iBnSS1cg0SV8luNBFWAM0y3BUonaAVjzUrHyvtLvKmH6Z3
   JY0feRe9eGw0JsnW9FOMnIzJhpPs4jQPUGXAy9PsSiGEeMZQzNCxwnlrk
   XqZ3pYiZM9V9RY/HwD0Fzcx4071yH1PuPz5BFN10FhAGB6qvMC3dLh9k2
   g==;
X-CSE-ConnectionGUID: Z5smC3a6QWO14uUQhy+OWQ==
X-CSE-MsgGUID: HZSinxloSAWsbryGRHTGKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53081089"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53081089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:11:51 -0800
X-CSE-ConnectionGUID: IQm4dq1lRwmxCDs4uCTKqQ==
X-CSE-MsgGUID: vxQVbooORLWMbeYV1YwavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="122269269"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 28 Feb 2025 04:11:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 10C14772; Fri, 28 Feb 2025 14:11:49 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v1 4/4] Input: psmouse - increase size of phys
Date: Fri, 28 Feb 2025 14:07:47 +0200
Message-ID: <20250228121147.242115-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
References: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
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

Increase the size to cover all possible cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/mouse/psmouse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/psmouse.h b/drivers/input/mouse/psmouse.h
index 4d8acfe0d82a..8422ee8243bb 100644
--- a/drivers/input/mouse/psmouse.h
+++ b/drivers/input/mouse/psmouse.h
@@ -107,7 +107,7 @@ struct psmouse {
 	unsigned long num_resyncs;
 	enum psmouse_state state;
 	char devname[64];
-	char phys[32];
+	char phys[40];
 
 	unsigned int rate;
 	unsigned int resolution;
-- 
2.47.2


