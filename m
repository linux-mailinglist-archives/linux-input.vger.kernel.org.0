Return-Path: <linux-input+bounces-8112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61379CD70C
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 07:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B79628338B
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 06:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EAC180A80;
	Fri, 15 Nov 2024 06:26:34 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADD1862B8
	for <linux-input@vger.kernel.org>; Fri, 15 Nov 2024 06:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731651994; cv=none; b=BySJgbBq9reqf4rKoBYm572EURnaPAEeSHd9Ikji8qtM9CzCrq5IrJzxaUCB3y1r5EtKR1OHpW+CgzJZI1aQV1gmL1OPTs+sOkHD2PMsjTbWDR+VeYGvfsksQ/D4gY0mR40GSIk9ucr4PTdiUhUVrYOE3bE4GkD3wPfImE7brHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731651994; c=relaxed/simple;
	bh=6j5E23sad9yPCKXb8EPncSH5yB58YuFbq55gjinDfvE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KkyNJUu5tav9fHHnFrJgTdHgPEfwCrIqJ/HDfnioW2H87kJdzrwfE1KFBCCVc5oZZZy7jSiOytOZ5z1Tyhu09mw79U/eiU18YAKPx5yK8cfvPlB1ui+p/KGwT/P9fMWErQYOs3hvnFx1NX6OZcgl+ms0MTMvdFISEeXw7O9AhZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id LHP00021;
        Fri, 15 Nov 2024 14:26:21 +0800
Received: from localhost.localdomain (10.94.16.210) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.39; Fri, 15 Nov 2024 14:26:22 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <mripard@kernel.org>,
	<sergeantsagara@protonmail.com>
CC: <linux-input@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] HID: multitouch: Add NULL check in mt_input_configured
Date: Fri, 15 Nov 2024 14:26:21 +0800
Message-ID: <20241115062621.18679-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20241115142621980afeb7f4176fa3654c8727240c7840
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in mt_input_configured() is not checked.
Add NULL check in mt_input_configured(), to handle kernel NULL
pointer dereference error.

Fixes: 479439463529 ("HID: multitouch: Correct devm device reference for hidinput input_dev name")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/hid/hid-multitouch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 785743036647..b7a0023e6c44 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1680,9 +1680,12 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 		break;
 	}
 
-	if (suffix)
+	if (suffix) {
 		hi->input->name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 						 "%s %s", hdev->name, suffix);
+		if (!hi->input->name)
+			return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.31.1


