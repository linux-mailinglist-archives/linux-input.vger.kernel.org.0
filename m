Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B8B3DBD5F
	for <lists+linux-input@lfdr.de>; Fri, 30 Jul 2021 18:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhG3Qxl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Jul 2021 12:53:41 -0400
Received: from mail.ispras.ru ([83.149.199.84]:41052 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhG3Qxk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Jul 2021 12:53:40 -0400
Received: from hellwig.intra.ispras.ru (unknown [83.149.199.249])
        by mail.ispras.ru (Postfix) with ESMTPS id 9A6A040755E7;
        Fri, 30 Jul 2021 16:53:34 +0000 (UTC)
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
Subject: [PATCH 3/3] HID: thrustmaster: Fix memory leak in thrustmaster_interrupts()
Date:   Fri, 30 Jul 2021 19:53:33 +0300
Message-Id: <20210730165333.25395-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

thrustmaster_interrupts() does not free memory for send_buf when
usb_interrupt_msg() fails. This is fixed by the given patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 9cb4248f95af..d44550aa8805 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -173,6 +173,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 
 		if (ret) {
 			hid_err(hdev, "setup data couldn't be sent\n");
+			kfree(send_buf);
 			return;
 		}
 	}
-- 
2.26.2

