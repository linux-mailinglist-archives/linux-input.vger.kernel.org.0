Return-Path: <linux-input+bounces-6081-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B267969186
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 04:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B80A1C22960
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 02:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1AD3F9EC;
	Tue,  3 Sep 2024 02:45:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EA1E49F;
	Tue,  3 Sep 2024 02:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725331546; cv=none; b=JMmLIxSkMcqnHvEZWPaerC+EBLyWqZModpOEAE/KC2xmEvWnWlZrt1OiiSCVqflp+qAQcZ7uK4Ir8EiR2bSFySh6HCh+XS+kDRz3pIWYO6Ka8j3rFVQad1HPVUnFmnGwlNmW/wzW7SztOkQY62EzIyl2sXly0aQmpBPLnZtJhMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725331546; c=relaxed/simple;
	bh=FGJ0d0obpajy1PTpOpA9+PFK616Xikj4vA0xkrH8vAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QdNgfUh/d6AL56Qu48SXsdkje9JdhEGYKaV8EUswAwIXfxEG7InqkM7Lst9uQjyxlN66otKWkcM3xGfFNQMqxKzdF93h6csIKoMw/5qjoGtMNHAx4OvXfxEY81JddJiJxN5Gtg0W5mA66QHTaW6mluXPNQtLxB1XOJMnPNw88Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADHzx9UeNZmEue0AA--.19578S2;
	Tue, 03 Sep 2024 10:45:40 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	Shyam-sundar.S-k@amd.com,
	mario.limonciello@amd.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] HID: amd_sfh: Convert comma to semicolon
Date: Tue,  3 Sep 2024 10:44:02 +0800
Message-Id: <20240903024402.493709-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHzx9UeNZmEue0AA--.19578S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF15Zr47Gryktw13urg_yoWDGrb_u3
	W7Jws3Jrn3Gw1S9w1jvr1Utryjvws7Wr1agFy2v34rJF9xJ3WrWr1DXFy3J340kw4kAFWx
	Grs8urZ5ArZ7ujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUy89_UUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 621793d92464..db36d87d5634 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -299,8 +299,8 @@ static void amd_sfh_set_ops(struct amd_mp2_dev *mp2)
 
 	sfh_interface_init(mp2);
 	mp2_ops = mp2->mp2_ops;
-	mp2_ops->clear_intr = amd_sfh_clear_intr_v2,
-	mp2_ops->init_intr = amd_sfh_irq_init_v2,
+	mp2_ops->clear_intr = amd_sfh_clear_intr_v2;
+	mp2_ops->init_intr = amd_sfh_irq_init_v2;
 	mp2_ops->suspend = amd_sfh_suspend;
 	mp2_ops->resume = amd_sfh_resume;
 	mp2_ops->remove = amd_mp2_pci_remove;
-- 
2.25.1


