Return-Path: <linux-input+bounces-13537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 433FFB04EA2
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 05:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4A41AA0BCE
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 03:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111B32D0C77;
	Tue, 15 Jul 2025 03:21:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C522D80B;
	Tue, 15 Jul 2025 03:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752549665; cv=none; b=WLRRdCzzErUL0es78+hUzPabeeY6gxMtU0RnLkBDGWgX6DYfQrqtWTYwxbCjqwmKTMPs9pvnsep7K4DxT9tuharqsQtSU70hJtwaaA0OYFSri/K9ZSMy5AvwU+x+bXKgpIrSIDwcs7kpDdT6PeGrcL4MLXmV1l8fKcZAZKklC4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752549665; c=relaxed/simple;
	bh=fmod0BN4slJPrdP6KM3+uivPrMhYeM9MezPdMplt3F0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l5Q6cLqDwZrVkUmikgQZkUmjL6FPRCgDlkk59SRjrZgQtiLKSKrbw9xBeCFYIt4VZuWuOlRTM/aedQX9mfTep3icKhKuRiPhUifemp298w4ZaJfhd7iCktaS8Izwef/YJmvCM98vyDQLSo+Vh10IPjYFQbbN4SJ3kWBuzJIZJPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bh4Cj1XcHz2FbN5;
	Tue, 15 Jul 2025 11:18:57 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D837140156;
	Tue, 15 Jul 2025 11:20:59 +0800 (CST)
Received: from kwepemn100006.china.huawei.com (7.202.194.109) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Jul 2025 11:20:59 +0800
Received: from huawei.com (10.175.113.133) by kwepemn100006.china.huawei.com
 (7.202.194.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 15 Jul
 2025 11:20:58 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <hdegoede@redhat.com>, <stable@vger.kernel.org>, <sashal@kernel.org>,
	<gregkh@linuxfoundation.org>
CC: <yesh25@mail2.sysu.edu.cn>, <mail@gurevit.ch>, <egori@altlinux.org>,
	<anton@cpp.in>, <dmitry.torokhov@gmail.com>, <rrangel@chromium.org>,
	<linux-input@vger.kernel.org>, <wanghai38@huawei.com>,
	<zhangxiaoxu5@huawei.com>
Subject: [PATCH 5.4/5.10/5.15/6.1/6.6] Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID
Date: Tue, 15 Jul 2025 11:14:42 +0800
Message-ID: <20250715031442.16528-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100006.china.huawei.com (7.202.194.109)

From: Hans de Goede <hdegoede@redhat.com>

commit 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 upstream.

After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
translated mode") not only the getid command is skipped, but also
the de-activating of the keyboard at the end of atkbd_probe(), potentially
re-introducing the problem fixed by commit be2d7e4233a4 ("Input: atkbd -
fix multi-byte scancode handling on reconnect").

Make sure multi-byte scancode handling on reconnect is still handled
correctly by not skipping the atkbd_deactivate() call.

Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20240126160724.13278-3-hdegoede@redhat.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/input/keyboard/atkbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index b3a856333d4e..de59fc1a24bc 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -805,11 +805,11 @@ static int atkbd_probe(struct atkbd *atkbd)
 				 "keyboard reset failed on %s\n",
 				 ps2dev->serio->phys);
 
 	if (atkbd_skip_getid(atkbd)) {
 		atkbd->id = 0xab83;
-		return 0;
+		goto deactivate_kbd;
 	}
 
 /*
  * Then we check the keyboard ID. We should get 0xab83 under normal conditions.
  * Some keyboards report different values, but the first byte is always 0xab or
@@ -842,10 +842,11 @@ static int atkbd_probe(struct atkbd *atkbd)
 			"NCD terminal keyboards are only supported on non-translating controllers. "
 			"Use i8042.direct=1 to disable translation.\n");
 		return -1;
 	}
 
+deactivate_kbd:
 /*
  * Make sure nothing is coming from the keyboard and disturbs our
  * internal state.
  */
 	if (!atkbd_skip_deactivate)
-- 
2.17.1


