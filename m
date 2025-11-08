Return-Path: <linux-input+bounces-15948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB44C42D10
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 13:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 576FD188DEBB
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 12:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002A8261B99;
	Sat,  8 Nov 2025 12:40:54 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F1023183A;
	Sat,  8 Nov 2025 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762605653; cv=none; b=mL+e0vwKbLq66wBEH53ehsz1QOmaGE3fVWZKIjGTI75Nfo1N7sEmKDTqvA7lXIkrhkxwxjYeQv6pnQeTsUilEITRfO8r9VPDJV065YucJx1FCEinmTFS1zOa2uKL1F2CJVLAG0BBhB2N68DgmdB4fZ7XbE5W0+boOelouEpPeuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762605653; c=relaxed/simple;
	bh=2rw+rkdj3yN6rzvCs3IaZNjqc7yQs7hTgHGNs4Cd4Jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WsjaMvWH+q0RvvR0WOIgIUd7l2Gph4+/2IPYj4RVC4yGYW5wRp5NtGKbBMwoAFwLhw9An5fvZgIN9umAAEaho49WcUJmmIcteVWfn2QSDNVluQDL6hRttwiLgjL+JBptJoFtk7i22ujPBNRsu8Wb8a/FtNIf2Cd10L4NUMPUwxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.19.144])
	by mtasvr (Coremail) with SMTP id _____wBnt7A0Og9pzl92Aw--.10193S3;
	Sat, 08 Nov 2025 20:40:20 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.19.144])
	by mail-app3 (Coremail) with SMTP id zS_KCgCXmm0oOg9pT2gFBA--.8637S3;
	Sat, 08 Nov 2025 20:40:19 +0800 (CST)
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
Subject: [PATCH 1/2] Input: alps - fix use-after-free bugs caused by dev3_register_work
Date: Sat,  8 Nov 2025 20:40:04 +0800
Message-Id: <09288a7a69cac4eff8165c59007c3d91ad08cb44.1762604516.git.duoming@zju.edu.cn>
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
X-CM-TRANSID:zS_KCgCXmm0oOg9pT2gFBA--.8637S3
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwEEAWkOS38IiQAesL
X-CM-DELIVERINFO: =?B?vqiUcwXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19gUWg51OTK/19Jr+UF/FUwRSaRD0WGHGtwP4B0xtPK5MJGYnQQSPXJzzHb08SP3Ifsr
	LzoIPSHD6BgCJK/90564eUQdYk7E7xu/5wSiWafEmaZ5GpA+trGDNppg471Gng==
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww13JryrCFy3Gr47WF4Dtrc_yoW8tFW7pF
	W5WF98G3ykW34Fka1DXF4UZFWFkwnFv343Gr1kW39xtwn8JFyYqr48tF9Yga4rKrZ5Ar47
	ArZrZ39xZFWvywcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1yrW5UUUUU==

The dev3_register_work delayed work item is initialized within
alps_reconnect() and scheduled upon receipt of the first bare
PS/2 packet from an external PS/2 device connected to the ALPS
touchpad. During device detachment, the original implementation
calls flush_workqueue() in psmouse_disconnect() to ensure
completion of dev3_register_work. However, the flush_workqueue()
in psmouse_disconnect() only blocks and waits for work items that
were already queued to the workqueue prior to its invocation. Any
work items submitted after flush_workqueue() is called are not
included in the set of tasks that the flush operation awaits.
This means that after flush_workqueue() has finished executing,
the dev3_register_work could still be scheduled. Although the
psmouse state is set to PSMOUSE_CMD_MODE in psmouse_disconnect(),
the scheduling of dev3_register_work remains unaffected.

The race condition can occur as follows:

CPU 0 (cleanup path)     | CPU 1 (delayed work)
psmouse_disconnect()     |
  psmouse_set_state()    |
  flush_workqueue()      | alps_report_bare_ps2_packet()
  alps_disconnect()      |   psmouse_queue_work()
    kfree(priv); // FREE | alps_register_bare_ps2_mouse()
                         |   priv = container_of(work...); // USE
                         |   priv->dev3 // USE

Add disable_delayed_work_sync() in alps_disconnect() to ensure
that dev3_register_work is properly canceled and prevented from
executing after the alps_data structure has been deallocated.

This bug is identified by static analysis.

Fixes: 04aae283ba6a ("Input: ALPS - do not mix trackstick and external PS/2 mouse data")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/input/mouse/alps.c | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.34.1


