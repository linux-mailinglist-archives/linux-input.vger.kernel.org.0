Return-Path: <linux-input+bounces-13676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBED6B0FEDA
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 04:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B93261CC7CEB
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 02:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC141A83F9;
	Thu, 24 Jul 2025 02:36:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48E18CC13;
	Thu, 24 Jul 2025 02:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753324608; cv=none; b=NSr3Nq8nXGAr965n3mmidnGX8yucL1LRbPxYYQtIuyjfEuRAOO8X0uOmb7OsIFPWRUu/2Idb53WC11PGVtOsEy2Z8rQPuQ8m8j7ae91UJotuAE+OWQUnZFlGOcNe7v6DzQjyQLH8S9+LKBYK3Xjhh9GVIWLehUsTkDY9noEWuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753324608; c=relaxed/simple;
	bh=0ajeBMP+M1lCwRN2QeUWo1e7B8hG/pk+zbA3HgHveek=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=rfIdPcj5/Qgl260gcQ/tOEVQpvAwbAfXl2gAHhYrzMnSysDnMScBBw7JxXgnBRJ3m9qv5jFj5N9NJvoAHaUdgQz9IiNjKjcJ4kzaFGZPOJb3V7f9xMVMXn0AkwoXLb5Rk18ygrSxCXJxc36rfNbZxZhHBD2hFgBALEUH23iJ/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bnZrf4FxDz5B0wV;
	Thu, 24 Jul 2025 10:36:34 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 56O2aPcf031902;
	Thu, 24 Jul 2025 10:36:25 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 24 Jul 2025 10:36:26 +0800 (CST)
Date: Thu, 24 Jul 2025 10:36:26 +0800 (CST)
X-Zmail-TransId: 2afa68819c2a438-76fe3
X-Mailer: Zmail v1.0
Message-ID: <20250724103626535JRNAc8OZvk4dXKn-b0CVZ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <jikos@kernel.org>, <bentiss@kernel.org>
Cc: <even.xu@intel.com>, <xinpeng.sun@intel.com>,
        <srinivas.pandruvada@linux.intel.com>, <liu.song13@zte.com.cn>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBISUQ6IEludGVsLXRoYy1oaWQ6IEludGVsLXRoYzogVXNlIHN0cl90cnVlX2ZhbHNlKCkgaGVscGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 56O2aPcf031902
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Thu, 24 Jul 2025 10:36:34 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68819C32.000/4bnZrf4FxDz5B0wV

From: Liu Song <liu.song13@zte.com.cn>

Remove hard-coded strings by using the str_true_false() helper function.

Signed-off-by: Liu Song <liu.song13@zte.com.cn>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 6f2263869b20..2b794bb481a0 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -4,6 +4,7 @@
 #include <linux/bitfield.h>
 #include <linux/math.h>
 #include <linux/regmap.h>
+#include <linux/string_choices.h>

 #include "intel-thc-dev.h"
 #include "intel-thc-hw.h"
@@ -664,7 +665,7 @@ int thc_interrupt_quiesce(const struct thc_device *dev, bool int_quiesce)
 	if (ret) {
 		dev_err_once(dev->dev,
 			     "Timeout while waiting THC idle, target quiesce state = %s\n",
-			     int_quiesce ? "true" : "false");
+			     str_true_false(int_quiesce));
 		return ret;
 	}

-- 
2.27.0

