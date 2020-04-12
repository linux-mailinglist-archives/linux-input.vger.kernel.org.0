Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06541A5E81
	for <lists+linux-input@lfdr.de>; Sun, 12 Apr 2020 14:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgDLMG5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Apr 2020 08:06:57 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:31688 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbgDLMG5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Apr 2020 08:06:57 -0400
Received: from localhost.localdomain ([93.22.37.28])
        by mwinf5d20 with ME
        id Ro6u220020cS4cl03o6ulF; Sun, 12 Apr 2020 14:06:55 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Apr 2020 14:06:55 +0200
X-ME-IP: 93.22.37.28
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, neko@nya.ai
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HID: elan: Do not explicitly free managed resource
Date:   Sun, 12 Apr 2020 14:06:52 +0200
Message-Id: <20200412120652.9969-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

'input' is allocated with 'devm_input_allocate_device()'. There is no need
to free it explicitly. (add should it be 'devm_input_device_release()'
should be used for that)

Fixes: 9a6a4193d65b ("HID: Add driver for USB ELAN Touchpad")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-elan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 45c4f888b7c4..26c294a7c9ff 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -198,7 +198,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	if (ret) {
 		hid_err(hdev, "Failed to register elan input device: %d\n",
 			ret);
-		input_free_device(input);
 		return ret;
 	}
 
-- 
2.20.1

