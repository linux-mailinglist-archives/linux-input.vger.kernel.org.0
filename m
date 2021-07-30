Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0713DBD58
	for <lists+linux-input@lfdr.de>; Fri, 30 Jul 2021 18:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhG3QvV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Jul 2021 12:51:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:40714 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230055AbhG3QvV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Jul 2021 12:51:21 -0400
Received: from hellwig.intra.ispras.ru (unknown [83.149.199.249])
        by mail.ispras.ru (Postfix) with ESMTPS id 7AC1440755CD;
        Fri, 30 Jul 2021 16:51:14 +0000 (UTC)
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
Subject: [PATCH 2/3] HID: thrustmaster: Fix memory leak in remove
Date:   Fri, 30 Jul 2021 19:51:09 +0300
Message-Id: <20210730165110.24667-2-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210730165110.24667-1-novikov@ispras.ru>
References: <20210730165110.24667-1-novikov@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

thrustmaster_remove() does not release memory for
tm_wheel->change_request. This is fixed by the patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index e94d3409fd10..9cb4248f95af 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -253,6 +253,7 @@ static void thrustmaster_remove(struct hid_device *hdev)
 
 	usb_kill_urb(tm_wheel->urb);
 
+	kfree(tm_wheel->change_request);
 	kfree(tm_wheel->response);
 	kfree(tm_wheel->model_request);
 	usb_free_urb(tm_wheel->urb);
-- 
2.26.2

