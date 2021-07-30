Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D3C3DBD59
	for <lists+linux-input@lfdr.de>; Fri, 30 Jul 2021 18:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhG3QvV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Jul 2021 12:51:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:40700 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230056AbhG3QvV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Jul 2021 12:51:21 -0400
Received: from hellwig.intra.ispras.ru (unknown [83.149.199.249])
        by mail.ispras.ru (Postfix) with ESMTPS id 2287B40755CB;
        Fri, 30 Jul 2021 16:51:13 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH 1/3] HID: thrustmaster: Fix memory leaks in probe
Date:   Fri, 30 Jul 2021 19:51:08 +0300
Message-Id: <20210730165110.24667-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When thrustmaster_probe() handles errors of usb_submit_urb() it does not
free allocated resources and fails. The patch fixes that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/hid/hid-thrustmaster.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index cdc7d82ae9ed..e94d3409fd10 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -336,11 +336,14 @@ static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_i
 	);
 
 	ret = usb_submit_urb(tm_wheel->urb, GFP_ATOMIC);
-	if (ret)
+	if (ret) {
 		hid_err(hdev, "Error %d while submitting the URB. I am unable to initialize this wheel...\n", ret);
+		goto error6;
+	}
 
 	return ret;
 
+error6: kfree(tm_wheel->change_request);
 error5: kfree(tm_wheel->response);
 error4: kfree(tm_wheel->model_request);
 error3: usb_free_urb(tm_wheel->urb);
-- 
2.26.2

