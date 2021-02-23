Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D46322767
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 10:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhBWJDv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 04:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhBWJDJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 04:03:09 -0500
Received: from baptiste.telenet-ops.be (unknown [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891F7C061574
        for <linux-input@vger.kernel.org>; Tue, 23 Feb 2021 01:02:23 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:254f:253d:debc:790b])
        by baptiste.telenet-ops.be with bizsmtp
        id YZ262401Z1v7dkx01Z266N; Tue, 23 Feb 2021 10:02:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lETa2-000zVr-AV; Tue, 23 Feb 2021 10:02:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lETa1-0060Pd-F7; Tue, 23 Feb 2021 10:02:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     Andrej Valek <andrej.valek@siemens.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Input: st1232 - Fix NORMAL vs. IDLE state handling
Date:   Tue, 23 Feb 2021 10:02:01 +0100
Message-Id: <20210223090201.1430542-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

NORMAL (0x0) and IDLE (0x4) are really two different states.  Hence you
cannot check for both using a bitmask, as that checks for IDLE only,
breaking operation for devices that are in NORMAL state.

Fix the wait function to report either state as ready.

Fixes: 6524d8eac258452e ("Input: st1232 - add IDLE state as ready condition")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/touchscreen/st1232.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 885f0572488dd061..6abae665ca71d8ec 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -94,8 +94,13 @@ static int st1232_ts_wait_ready(struct st1232_ts_data *ts)
 
 	for (retries = 10; retries; retries--) {
 		error = st1232_ts_read_data(ts, REG_STATUS, 1);
-		if (!error && ts->read_buf[0] == (STATUS_NORMAL | STATUS_IDLE | ERROR_NONE))
-			return 0;
+		if (!error) {
+			switch (ts->read_buf[0]) {
+			case STATUS_NORMAL | ERROR_NONE:
+			case STATUS_IDLE | ERROR_NONE:
+				return 0;
+			}
+		}
 
 		usleep_range(1000, 2000);
 	}
-- 
2.25.1

