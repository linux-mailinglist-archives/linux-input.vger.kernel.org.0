Return-Path: <linux-input+bounces-15947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5188C42D0A
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 13:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1A83B21E4
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 12:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD7028469F;
	Sat,  8 Nov 2025 12:40:45 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E67626CE05;
	Sat,  8 Nov 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.227.155.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762605645; cv=none; b=myok4uVmLT8NKgSXRNX8lEiBfktrueSPUxnlPlBry5dwhAcj8yeDRzw+b4mCwNecxSunlsZtV00uZxWqSRi/XsRjNbtEB/FLQPOYG0Gk2Ol2kjkKX66Xqk0t87WzAqKKsm5NuxgF79BJO/5F3ftDnBmeC1I7Lm6SQaNkcS3du84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762605645; c=relaxed/simple;
	bh=41ObkAY8Y193C4TtK7tbe23kb/tT6X2Abl26RUSazQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JGjCQqzdKQYMiyrquvyQjNRo/qZJ+t6Qu63f96ZuYiEYuB+fFVuc7sfR9dQ38ucSLGM67GIo293DKpTukOce9DXZabZrHHWEXHqotjNBfpRfAC8OiuIAnU8nglHP2xRX1brjH6DwQAvB6lvRV2fJb/8JzoAVsX1VSFbJfv5z3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=165.227.155.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.19.144])
	by mtasvr (Coremail) with SMTP id _____wDHjWE7Og9p5192Aw--.17311S3;
	Sat, 08 Nov 2025 20:40:27 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.19.144])
	by mail-app3 (Coremail) with SMTP id zS_KCgCXmm0oOg9pT2gFBA--.8637S4;
	Sat, 08 Nov 2025 20:40:26 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	pali@kernel.org,
	hverkuil+cisco@kernel.org,
	akpm@linux-foundation.org,
	andriy.shevchenko@linux.intel.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Jonathan.Cameron@huawei.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH 2/2] Input: psmouse - Replace flush_workqueue() with disable_delayed_work_sync()
Date: Sat,  8 Nov 2025 20:40:05 +0800
Message-Id: <308338a0e501cbe76eea20a143faad752e3aa111.1762604516.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1762604516.git.duoming@zju.edu.cn>
References: <cover.1762604516.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zS_KCgCXmm0oOg9pT2gFBA--.8637S4
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwEEAWkOS38IiQAgs1
X-CM-DELIVERINFO: =?B?vlV/YQXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19gUWg51OTK/19Jr+UF/FUyHQXcCmDCyIVYwuvISJcAyZ/USjg9e5GNcpjqFQ+b+4/sr
	LzoIPSHD6BgCJK/90564eUQdYk7E7xu/5wSiWafEojwSwUO147ZeBgnk2VOPtw==
X-Coremail-Antispam: 1Uk129KBj9xXoWruF45AF13uw1rKr1kCw17Arc_yoWkArc_ua
	4rXr1kWr4jkw1qg34DCr13ZF4Iy3ZIqr97Gw4rXF4DJa4Uur9xGa1DZFWkArWkX3y7GF1a
	kw1agryfAr42gosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbTAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzMa0DUUUU

The original code uses flush_workqueue() in psmouse_disconnect() to
ensure the completion of both resync_work and dev3_register_work.
Given that alps_disconnect() already uses disable_delayed_work_sync()
to cancel dev3_register_work, replacing flush_workqueue() with
disable_delayed_work_sync(&psmouse->resync_work) is more robust
and efficient.

Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/input/mouse/psmouse-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index 77ea7da3b1c..eb41c553e80 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -1484,7 +1484,7 @@ static void psmouse_disconnect(struct serio *serio)
 
 	/* make sure we don't have a resync in progress */
 	mutex_unlock(&psmouse_mutex);
-	flush_workqueue(kpsmoused_wq);
+	disable_delayed_work_sync(&psmouse->resync_work);
 	mutex_lock(&psmouse_mutex);
 
 	if (serio->parent && serio->id.type == SERIO_PS_PSTHRU) {
-- 
2.34.1


