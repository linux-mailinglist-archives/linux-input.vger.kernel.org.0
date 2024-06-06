Return-Path: <linux-input+bounces-4168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B88FE2F6
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 11:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBF45B30184
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24799154BFA;
	Thu,  6 Jun 2024 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CzKPJEBf"
X-Original-To: linux-input@vger.kernel.org
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4A153BFF;
	Thu,  6 Jun 2024 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666210; cv=none; b=ihQhS2mtEEQf+73zMmZKLBirDm4vL1yIItIsBMGoKpaoBBHvurk78U4Glmt6EA+WrqqiviaLsaQggocxJwxrXSdFNPXDmaA8fMoprZ7IfqMmyhvxy1GZGvowHfiMQJ25qPz6TcJ/kEvGZvSShNi7Nwfxo+DyOjWS5IxMjtOHK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666210; c=relaxed/simple;
	bh=gFxIz+bfTLeezODRMo79nwmNuUNYu7H1GJQorPLATSA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R7e+Tz1uOhMXv1aAuriXMt6wBgKST5SxszHselmIUUOChZUYPJkHhTsQBZaO6BPcTY0FukynB7b0Ajh/FhFMT5lWzjCMMzCxf4elbikG7NqUf4Pt+A+LCnFZ28ExnZzDMHpQ24VE3SMfEzoO0RNEswXq/wVeMzSapk0tfziiOBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CzKPJEBf; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1717666205; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=iKmP3e3dtxf78IDAs/8rT++mEQGZ+Pkjv4VuEAnem08=;
	b=CzKPJEBfM9JDG/rMd7y49GioBNMN/79EZ0AFIVfaiNfEmXfGQYVXL3D9eiT4CBnHQxbgel/waRmuBBAC4vnQLma+Fx8+37Hcuc6Cky/UsiWSrjvFI/3p3Ot2LAGzBMm8WyTtC9rdWrozLep0VJKx8lVP36qJBDd0lhTlf1fjoUE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045075189;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0W7xsJ.3_1717666197;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0W7xsJ.3_1717666197)
          by smtp.aliyun-inc.com;
          Thu, 06 Jun 2024 17:30:04 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] HID: core: clean up some inconsistent indenting
Date: Thu,  6 Jun 2024 17:29:54 +0800
Message-Id: <20240606092954.91014-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional modification involved.

drivers/hid/hid-core.c:2780 hid_add_device() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9293
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index dc55f837d0c7..3cb0b7dd92a1 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2777,10 +2777,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.20.1.7.g153144c


