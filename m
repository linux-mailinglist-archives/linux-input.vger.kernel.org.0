Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43312E7244
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 17:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgL2Q0r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 11:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgL2Q0q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 11:26:46 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7116BC061796
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 08:26:06 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id AGS4240034C55Sk01GS4Cm; Tue, 29 Dec 2020 17:26:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHox-0014bF-8C; Tue, 29 Dec 2020 17:26:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHow-0092Vv-Lr; Tue, 29 Dec 2020 17:26:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrej Valek <andrej.valek@siemens.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] Input: st1232 - fix off-by-one error in resolution handling
Date:   Tue, 29 Dec 2020 17:25:59 +0100
Message-Id: <20201229162601.2154566-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201229162601.2154566-1-geert+renesas@glider.be>
References: <20201229162601.2154566-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before, the maximum coordinates were fixed to (799, 479) or (319, 479),
depending on touchscreen controller type.  The driver was changed to
read the actual values from the touchscreen controller, but did not take
into account the returned values are not the maximum coordinates, but
the touchscreen resolution (e.g. 800 and 480).

Fix this by subtracting 1.

Fixes: 3a54a215410b1650 ("Input: st1232 - add support resolution reading")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/touchscreen/st1232.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index bda96762744e6da3..f18d4c7e03da17c6 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -85,8 +85,8 @@ static int st1232_ts_read_resolution(struct st1232_ts_data *ts, u16 *max_x,
 
 	buf = ts->read_buf;
 
-	*max_x = ((buf[0] & 0x0070) << 4) | buf[1];
-	*max_y = ((buf[0] & 0x0007) << 8) | buf[2];
+	*max_x = (((buf[0] & 0x0070) << 4) | buf[1]) - 1;
+	*max_y = (((buf[0] & 0x0007) << 8) | buf[2]) - 1;
 
 	return 0;
 }
-- 
2.25.1

