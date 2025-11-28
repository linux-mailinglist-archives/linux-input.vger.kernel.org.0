Return-Path: <linux-input+bounces-16387-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBFFC91159
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 09:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4979A3A7904
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 08:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0141426B971;
	Fri, 28 Nov 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux4.de header.i=@linux4.de header.b="DxSDXYrA"
X-Original-To: linux-input@vger.kernel.org
Received: from linux4.de (atlas.linux4.de [116.202.33.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE81D1CEAA3;
	Fri, 28 Nov 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.33.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764317069; cv=none; b=C+I3vZhj2lZkZQ4gd53GQWPa3cMzBZ2W9Gn/5G/rOgtd97A9e8Jbfffep9j5WjNi9WF9IPQpieZQ0b1tviz3OfqlpSDRucHRIjxvMkBwDadKmmJfqbe4l5Y3ruNhRbjeUWiJv92ELvYHUBwOm7M7UVH529debcezg+B+bVghOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764317069; c=relaxed/simple;
	bh=ep8WzlgUnyBeQUkhD0fZCPL2I5gFU/wlBdflsAWaTi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gzsGsFhxO75+mGrFkkp/HNG8Lh+homKOMWkEhX0tAf6figqRDDBa4q0BavVJYdE223s9sRMfyzCCpvxkOGUGl8bNLdMsv3W8n+jUuW73320IkwFICyuzHxuTOUiDaHCIi+f0tYVsRD11wAPJ6m1uxoo+py2oSzIyjLPRhpuKwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux4.de; spf=pass smtp.mailfrom=linux4.de; dkim=pass (1024-bit key) header.d=linux4.de header.i=@linux4.de header.b=DxSDXYrA; arc=none smtp.client-ip=116.202.33.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux4.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux4.de
Received: from artemis.lan (unknown [IPv6:2a02:8071:3185:f920::3])
	by linux4.de (Postfix) with ESMTPSA id 398C41A6059E;
	Fri, 28 Nov 2025 08:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux4.de; s=linux4;
	t=1764316554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QJhJlpBxc8zaKkg/Bm4Q/RftLAYFdwpBa84qVhMHvIw=;
	b=DxSDXYrA0r/8QqWpYhmdw6x4rUujr5HcUzpu5o00+R6TfogkpZkIYE47XytOWWf7YsmKol
	FJsCr9ICgaiWgX5/ezpFwNvRnFAZQkzJAp0/UtRCE4nLBFl4vhMVrQ1UTiIEyq/oRwbENt
	MVq2TyEGlIKXpiHdOv5J/ryhoYVu2Hk=
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=tim@linux4.de smtp.mailfrom=tim@linux4.de
From: Tim Zimmermann <tim@linux4.de>
To: 
Cc: tim@linux4.de,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hid: intel-thc-hid: Select SGL_ALLOC
Date: Fri, 28 Nov 2025 08:54:22 +0100
Message-ID: <20251128075426.628500-1-tim@linux4.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel-thc-dma.c uses sgl_alloc() resulting in a build failure if CONFIG_SGL_ALLOC is not enabled

Signed-off-by: Tim Zimmermann <tim@linux4.de>
---
 drivers/hid/intel-thc-hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
index 0351d1137607..9d74e53b8c62 100644
--- a/drivers/hid/intel-thc-hid/Kconfig
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -7,6 +7,7 @@ menu "Intel THC HID Support"
 config INTEL_THC_HID
 	tristate "Intel Touch Host Controller"
 	depends on ACPI
+	select SGL_ALLOC
 	help
 	  THC (Touch Host Controller) is the name of the IP block in PCH that
 	  interfaces with Touch Devices (ex: touchscreen, touchpad etc.). It
-- 
2.51.0


