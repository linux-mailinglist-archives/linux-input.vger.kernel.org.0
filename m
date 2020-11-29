Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B519E2C786E
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 09:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgK2IYG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 03:24:06 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:44311 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgK2IYG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 03:24:06 -0500
Received: from localhost.localdomain ([81.185.163.10])
        by mwinf5d13 with ME
        id y8NE2300J0DmPsp038NFWJ; Sun, 29 Nov 2020 09:22:22 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Nov 2020 09:22:22 +0100
X-ME-IP: 81.185.163.10
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        dinghao.liu@zju.edu.cn, neko@nya.ai
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HID: elan: Fix some error handling path
Date:   Sun, 29 Nov 2020 09:22:15 +0100
Message-Id: <20201129082215.1453257-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

'input' is a managed resource allocated earlier in the function by:
   input = devm_input_allocate_device(&hdev->dev);

There is no need to explicitly free it. This would lead to a double
reference decrement.

Fixes: b7429ea53d6c ("HID: elan: Fix memleak in elan_input_configured")
Fixes: 9a6a4193d65b ("HID: Add driver for USB ELAN Touchpad")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-elan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index dae193749d44..8587f9d2fffb 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -188,7 +188,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	ret = input_mt_init_slots(input, ELAN_MAX_FINGERS, INPUT_MT_POINTER);
 	if (ret) {
 		hid_err(hdev, "Failed to init elan MT slots: %d\n", ret);
-		input_free_device(input);
 		return ret;
 	}
 
@@ -200,7 +199,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
 		hid_err(hdev, "Failed to register elan input device: %d\n",
 			ret);
 		input_mt_destroy_slots(input);
-		input_free_device(input);
 		return ret;
 	}
 
-- 
2.27.0

