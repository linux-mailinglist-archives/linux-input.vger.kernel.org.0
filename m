Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB5C23CC4E
	for <lists+linux-input@lfdr.de>; Wed,  5 Aug 2020 18:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgHEQgv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Aug 2020 12:36:51 -0400
Received: from mail.ispras.ru ([83.149.199.84]:43470 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727066AbgHEQe6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Aug 2020 12:34:58 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 11CDD40A204E;
        Wed,  5 Aug 2020 12:48:41 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] HID: u2fzero: handle errors of u2fzero_fill_in_urb() in probe
Date:   Wed,  5 Aug 2020 15:48:40 +0300
Message-Id: <20200805124840.6893-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

u2fzero_probe() does not handle errors of u2fzero_fill_in_urb(). The
patch fixes that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/hid/hid-u2fzero.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
index 95e0807878c7..0632f6c3aa66 100644
--- a/drivers/hid/hid-u2fzero.c
+++ b/drivers/hid/hid-u2fzero.c
@@ -315,7 +315,11 @@ static int u2fzero_probe(struct hid_device *hdev,
 	if (ret)
 		return ret;
 
-	u2fzero_fill_in_urb(dev);
+	ret = u2fzero_fill_in_urb(dev);
+	if (ret) {
+		hid_hw_stop(hdev);
+		return ret;
+	}
 
 	dev->present = true;
 
-- 
2.26.2

