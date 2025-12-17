Return-Path: <linux-input+bounces-16606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D84CC5D96
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 04:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A41253004874
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 03:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34A7274B39;
	Wed, 17 Dec 2025 03:01:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6989417A2F6;
	Wed, 17 Dec 2025 03:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940464; cv=none; b=qagcRPlteFKbvINRghnXXf+Q5WCK4zSHQZ09esAj3z96vI/qCxo4TupyEhk5opEBvJbSefeL7HCs2SQkWJNy4YjX26yG8ITHsHsDs8S5YhQYD8tl2xvYvsaVZfkt/ui2sQ9oh6YNd7crTP7FP9zXHuWSym4oxB50TFPx2SFDkzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940464; c=relaxed/simple;
	bh=EeJdnM3bTxZu0Q2RoWgDKti6XXYAdky2cJUK6WsnTS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PaQwnXGzLfsC5lfa415jwbF2EATtZ55cOO2r2xeOyi0ySzvBAhgQSV2kMww8tG/XhipGgEQ/nGM9BL2NkghqnCYGoqmWdew1lKXhF9wXk9VMz0cwM1yMA7UC+R+a8u7GYnK9hsrztAqGTRe0TgszxSe+BT0DBciCAnRgry6GGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.21.67])
	by mtasvr (Coremail) with SMTP id _____wAHe1fUHEJp1nQHAQ--.3604S3;
	Wed, 17 Dec 2025 11:00:36 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.21.67])
	by mail-app4 (Coremail) with SMTP id zi_KCgCHP4bGHEJpUXHrAw--.24750S3;
	Wed, 17 Dec 2025 11:00:35 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	pali@kernel.org,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	akpm@linux-foundation.org,
	johannes.berg@intel.com,
	pkshih@realtek.com,
	hverkuil+cisco@kernel.org,
	andriy.shevchenko@linux.intel.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>,
	stable@kernel.org
Subject: [PATCH v2 RESEND 1/2] Input: alps - fix use-after-free bugs caused by dev3_register_work
Date: Wed, 17 Dec 2025 11:00:17 +0800
Message-Id: <b57b0a9ccca51a3f06be141bfc02b9ffe69d1845.1765939397.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1765939397.git.duoming@zju.edu.cn>
References: <cover.1765939397.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgCHP4bGHEJpUXHrAw--.24750S3
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwYDAWlBtgMDGAAGsH
X-CM-DELIVERINFO: =?B?MUPN9AXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19liJKAbPaJfkC4v6aoY6E6xhF61gaKX10E0lUFjoacFu1cNKEpImyZzKSe8m7jZrCaS
	ajFlaRq8wltEG5NMzRf9MdJA4wCe9S0FGnNB4aKUzoxviZxBe2Qofx8X4o3vOw==
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww13JryrCFy3Gr47WF4Dtrc_yoW8KFW5pa
	y5WF98G3ykW34Fka1DJF4UZFyFkwnFv343Grn5WrZxtwn8JFyYqr48tFWFga4rKrZ5AF47
	A3yDZ39IvFWvyabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
Cc: stable@kernel.org
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v2:
  - Split the original patch into two separate patches (alps and psmouse-base).

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


