Return-Path: <linux-input+bounces-15942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB7DC4274F
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 05:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CD3D3AC308
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 04:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E212727EFE9;
	Sat,  8 Nov 2025 04:56:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C52513D891;
	Sat,  8 Nov 2025 04:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762577802; cv=none; b=fIDDitCZBCMyotq4HiIkyFnLonEIobIXNHxtF7nnYqKjNS3xQn6wBAgLYNAJ2elH5730RO8UMHErQ8euqSKDXe1IorBuWwCH526UM4ziFKvi3UVcApDv5FjM78y5diHNX27xYN3848H75c8mTuuE9mI+gS/U9EwzLpGsZrHdgU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762577802; c=relaxed/simple;
	bh=OVHuxDXTwefmHYv/OAP1V/VIP0pS9usVVc7y98xkcDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iRA8mFibzS/nlGUWNYQxuzK8U4X5RalUS5VPTGGHE7unQBULgMsrc/E5WkHLQmW0CCSquC8Wef3SxGghU6zHKRaugmgwoEIyjMYI7CzvLgE0QKeQZ4YJSGh2Dek0JKiLeZqbL6eaT5Zaao+jNB+1AVWDxJhocxz5dUTE42WwcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.19.144])
	by mtasvr (Coremail) with SMTP id _____wBnt7BzzQ5pTFx0Aw--.5560S3;
	Sat, 08 Nov 2025 12:56:20 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.19.144])
	by mail-app4 (Coremail) with SMTP id zi_KCgD3239rzQ5ptYoeAw--.34379S2;
	Sat, 08 Nov 2025 12:56:18 +0800 (CST)
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
Subject: [PATCH] Input: psmouse - fix use-after-free bugs due to rescheduled delayed works
Date: Sat,  8 Nov 2025 12:56:09 +0800
Message-Id: <20251108045609.26338-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgD3239rzQ5ptYoeAw--.34379S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwcDAWkOS38CbQA9sH
X-CM-DELIVERINFO: =?B?v4doPgXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR17dXL8s6MdNu/Tde0MMWLRQUvNHVNTd05oiz5MCe7bzlkSqSPrKjWjRpM3YLcvFi01GR
	SGOvXSiWQ3/bg34b5fNXujbJihEPcjzCPZg/PhJIUq60caeTQNCcZNzcQkALWg==
X-Coremail-Antispam: 1Uk129KBj93XoWxAFyftrWDWw15Aw45WF1UXFc_yoW5urWrpF
	W5Xry5KrWkJw4Ut3yDJF4UZFySkwnFvry3Gr1kW343trn8GryYvr1ktFyFgFy8KryrAF47
	Zw4DZwsxZF4kCagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Kb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7xwIDUUUU

The flush_workqueue() in psmouse_disconnect() only blocks and waits for
work items that were already queued to the workqueue prior to its
invocation. Any work items submitted after flush_workqueue() is called
are not included in the set of tasks that the flush operation awaits.
This means that after flush_workqueue() has finished executing, the
resync_work and dev3_register_work could be rescheduled again, resulting
in the following two use-after-free scenarios:

1. The psmouse structure is deallocated in psmouse_disconnect(), while
resync_work remains active and attempts to dereference the already
freed psmouse in psmouse_resync().

CPU 0                   | CPU 1
psmouse_disconnect()    | psmouse_receive_byte()
                        |   if(psmouse->state == ...)
  psmouse_set_state()   |
  flush_workqueue()     |
                        |   psmouse_queue_work() //reschedule
  kfree(psmouse); //FREE|
                        | psmouse_resync()
                        |   psmouse = container_of(); //USE
                        |   psmouse-> //USE

2. The alps_data structure is deallocated in alps_disconnect(), while
dev3_register_work remains active and attempts to dereference the
already freed alps_data inside alps_register_bare_ps2_mouse().

CPU 0                   | CPU 1
psmouse_disconnect()    | alps_process_byte()
  flush_workqueue()     |   alps_report_bare_ps2_packet()
                        |   psmouse_queue_work() //reschedule
  alps_disconnect()     |
                        | alps_register_bare_ps2_mouse()
    kfree(priv); //FREE |
                        |   priv = container_of(); //USE
                        |   priv-> //USE

Replace flush_workqueue() with disable_delayed_work_sync(), and also
add disable_delayed_work_sync() in alps_disconnect(). This ensures
that both resync_work and dev3_register_work are properly canceled
and prevented from being rescheduled before the psmouse and alps_data
structures are deallocated.

These bugs are identified by static analysis.

Fixes: f0d5c6f419d3 ("Input: psmouse - attempt to re-synchronize mouse every 5 seconds")
Fixes: 04aae283ba6a ("Input: ALPS - do not mix trackstick and external PS/2 mouse data")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/input/mouse/alps.c         | 1 +
 drivers/input/mouse/psmouse-base.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index d0cb9fb9482..df8953a5196 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -2975,6 +2975,7 @@ static void alps_disconnect(struct psmouse *psmouse)
 
 	psmouse_reset(psmouse);
 	timer_shutdown_sync(&priv->timer);
+	disable_delayed_work_sync(&priv->dev3_register_work);
 	if (priv->dev2)
 		input_unregister_device(priv->dev2);
 	if (!IS_ERR_OR_NULL(priv->dev3))
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


