Return-Path: <linux-input+bounces-11747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748EA87933
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 09:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E368C171F1C
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 07:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A2725A350;
	Mon, 14 Apr 2025 07:40:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A631265622;
	Mon, 14 Apr 2025 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616410; cv=none; b=G/oSI4dpygY+E+is/WQgqkE+D+W+yDsTya4fBbySdD5IaExPlIAcDtvOVqZ4g0OIe3yGEy9HVmPsNRVB2KKkKJ+BZydPit4sUWeFqQSIedoWu3QOg1Te7edM7SVV926CYNpNYgxkTdoj4AzVrKWacD3IFY92s0DAqwatUepsT+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616410; c=relaxed/simple;
	bh=9E2qxErytjSnrPNbfHAsWh4YIUhM/c8A1tRX+fTXxdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TKekE61KKH0iNgiyXv/JMVCnF6kvPhglRkr8bWUy42zZ196us5TgkMqtnpYrNIi608i/t9bpRBL/avp6i5H1eXrtZUJffjpQWhCQa/HkPVySDSWIpGxHVQd5574arIYxIIswoSHGj5Z45kdvKEEJWo5FhQBVwq7neJKkzhiotA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAnYgrUu_xnvr_nCA--.15082S2;
	Mon, 14 Apr 2025 15:40:05 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] HID: corsair-void: Use to_delayed_work()
Date: Mon, 14 Apr 2025 15:39:55 +0800
Message-Id: <20250414073955.3954020-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnYgrUu_xnvr_nCA--.15082S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1xJF43KFy7AF4xXF4xJFb_yoWkZFb_u3
	4xZr4jgF1jkw1fGF98ArsxZr95Jws7Zrn2grZYg398JayUAry5J3yUArsrCryfWr4IyFy3
	Cr9xZa15Cws7tjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU1T5dDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use to_delayed_work() instead of open-coding it.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/hid/hid-corsair-void.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index afbd67aa9719..fee134a7eba3 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -507,7 +507,7 @@ static void corsair_void_status_work_handler(struct work_struct *work)
 	struct delayed_work *delayed_work;
 	int battery_ret;
 
-	delayed_work = container_of(work, struct delayed_work, work);
+	delayed_work = to_delayed_work(work);
 	drvdata = container_of(delayed_work, struct corsair_void_drvdata,
 			       delayed_status_work);
 
@@ -525,7 +525,7 @@ static void corsair_void_firmware_work_handler(struct work_struct *work)
 	struct delayed_work *delayed_work;
 	int firmware_ret;
 
-	delayed_work = container_of(work, struct delayed_work, work);
+	delayed_work = to_delayed_work(work);
 	drvdata = container_of(delayed_work, struct corsair_void_drvdata,
 			       delayed_firmware_work);
 
-- 
2.25.1


