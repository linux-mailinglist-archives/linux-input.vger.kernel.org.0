Return-Path: <linux-input+bounces-16608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31BCC5DA2
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 04:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C60E302BABD
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 03:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CD92690D1;
	Wed, 17 Dec 2025 03:01:18 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.142.27])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DE38003D;
	Wed, 17 Dec 2025 03:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.142.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940478; cv=none; b=owmhz6D1w7zZNO82c6Tz9yICdjNZF/OA7MlVaKPq4BticbrKmE44VXZ8drh652tKVbBp1b+4rh6Cb3w8WESevKTDF6D483VGGk6muQ7d+n8R+GvbBmZpk2OVRUmW2ztC6zyUcJV3C/+j9fySWuEV/NpsZD4oxqYeA6Im39rpENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940478; c=relaxed/simple;
	bh=gHPQSgPSZTV2Pj1zjXqaEpn6bWLVEZ1CYDXoJ7bmiIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XDwV3amgqKMqXTsQVzctfDSevIkcSXNhRUBKwkNkI6O8VQHqrbP5ErVeMBjwZltgPfJW/ZVf/kXLAqR46kIBazY0nKZu0Zi1XCcb/XwCq+nuWT+aCa7f+SiqbwwKHYGyPQohTJLpyth64e1f4DiSRT4TH/rS8uwvayPLQfEXMFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.76.142.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.21.67])
	by mtasvr (Coremail) with SMTP id _____wBXN1LXHEJp5nQHAQ--.3276S3;
	Wed, 17 Dec 2025 11:00:39 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.21.67])
	by mail-app4 (Coremail) with SMTP id zi_KCgCHP4bGHEJpUXHrAw--.24750S4;
	Wed, 17 Dec 2025 11:00:38 +0800 (CST)
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
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH v2 RESEND 2/2] Input: psmouse - Replace flush_workqueue() with disable_delayed_work_sync()
Date: Wed, 17 Dec 2025 11:00:18 +0800
Message-Id: <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>
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
X-CM-TRANSID:zi_KCgCHP4bGHEJpUXHrAw--.24750S4
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwYDAWlBtgMDGAAIsJ
X-CM-DELIVERINFO: =?B?pW9flQXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19liJKAbPaJfkC4v6aoY6E4SDtcZOf4dKKbvUUP/zEOl8kjq6ZiVnE6RwXkZ9o81bCaS
	ajFlaRq8wltEG5NMzRf9MdJA4wCe9S0FGnNB4aKUA7RKSdLnS6xlOxOZ9l5/3Q==
X-Coremail-Antispam: 1Uk129KBj93XoWruF45AF13uw1rKr1kCw17Arc_yoW8JF1fpF
	ZxuryUK3ykXa1Ut398tF4UZFyxC3ZFv34Ykr40gryftrnxJFWYvrZ7tFyfKF1YgrZ5Cw42
	va1DZ3y5uF18A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1iZ23UUUUU==

The original code uses flush_workqueue() in psmouse_disconnect() to
ensure the completion of both resync_work and dev3_register_work.
Given that alps_disconnect() already uses disable_delayed_work_sync()
to cancel dev3_register_work, replacing flush_workqueue() with
disable_delayed_work_sync(&psmouse->resync_work) is more robust
and efficient.

Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v2:
  - focus on the robustness and efficiency improvements of disable_delayed_work_sync(), not on the UAF aspect.

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


