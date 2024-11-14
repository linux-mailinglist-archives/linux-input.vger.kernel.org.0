Return-Path: <linux-input+bounces-8101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F69C85F2
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 10:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDEB285311
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 09:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44491DE3B7;
	Thu, 14 Nov 2024 09:21:09 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7821DFD89
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576069; cv=none; b=m4np13mgTsInmsULtr4rlaSZdPH/3w5tgidfaTQUstFQy/XTlfPerZwdr2demff2WuvthlEdTiYDIgV6niUkMPWvrH5ZRG77HYY4mNOeS+Cc1Qurhvu2NHDQ/9yQOb3hsuwbEKQPtvF+UD5yxjtrY5SKbpbzuqGWrdYanLSH/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576069; c=relaxed/simple;
	bh=cXRgtszJhuQpfBbmyFVR7M4OlRDrbAuAcMcq7hMpmUI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sYt6XpKdLKlt313ueff+JhSgYWhdlDYZsu36K0vEApM7tQA7T6xYojCCHnMKAP3kKNqvfGH3xdOkqolCw5P9PLsyXRpdI036QYQW7lGLwOmz/09vl62OoOM7CTBMVTdoQ+wKxfEIlQdwDBMbTJ6buRu7mSPw7KeYTlMsdRDGjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id LMI00147;
        Thu, 14 Nov 2024 17:19:47 +0800
Received: from localhost.localdomain (10.94.17.107) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 14 Nov 2024 17:19:48 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>
CC: <linux-kernel@altimeter.info>, <linux-input@vger.kernel.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] HID:  Add NULL check in winwing_init_led
Date: Thu, 14 Nov 2024 17:19:47 +0800
Message-ID: <20241114091947.78925-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20241114171947fc67b08dfdd038ed955b286c23c1fd9d
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in winwing_init_led() is not checked.
Add NULL check in winwing_init_led(), to handle kernel NULL
pointer dereference error.

Fixes: 266c990debad ("HID: Add WinWing Orion2 throttle support")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/hid/hid-winwing.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index 831b760c66ea..d4afbbd27807 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -106,6 +106,8 @@ static int winwing_init_led(struct hid_device *hdev,
 						"%s::%s",
 						dev_name(&input->dev),
 						info->led_name);
+		if (!led->cdev.name)
+			return -ENOMEM;
 
 		ret = devm_led_classdev_register(&hdev->dev, &led->cdev);
 		if (ret)
-- 
2.31.1


