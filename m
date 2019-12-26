Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 263FA12AD1D
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2019 15:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfLZO4p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Dec 2019 09:56:45 -0500
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:35987 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfLZO4p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Dec 2019 09:56:45 -0500
Received: from localhost.localdomain ([90.40.29.152])
        by mwinf5d81 with ME
        id iewg2100M3Gv28S03ewhKe; Thu, 26 Dec 2019 15:56:42 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Dec 2019 15:56:42 +0100
X-ME-IP: 90.40.29.152
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HID: logitech-hidpp: avoid duplicate error handling code in 'hidpp_probe()'
Date:   Thu, 26 Dec 2019 15:54:35 +0100
Message-Id: <20191226145435.8262-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

'hid_hw_stop()' is already in the error handling path when branching to
the 'hid_hw_open_fail' label.
There is no point in calling it twice, so remove one.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-logitech-hidpp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index bb063e7d48df..70e1cb928bf0 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3817,7 +3817,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret < 0) {
 		dev_err(&hdev->dev, "%s:hid_hw_open returned error:%d\n",
 			__func__, ret);
-		hid_hw_stop(hdev);
 		goto hid_hw_open_fail;
 	}
 
-- 
2.20.1

