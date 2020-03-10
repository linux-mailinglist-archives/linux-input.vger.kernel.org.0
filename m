Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DCD17FFFB
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 15:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgCJORQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 10:17:16 -0400
Received: from mail.astralinux.ru ([217.74.38.120]:50968 "EHLO astralinux.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727280AbgCJORQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 10:17:16 -0400
X-Greylist: delayed 3603 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 10:17:13 EDT
Received: from [46.148.196.138] (HELO mastykin.cct.rbt)
  by astralinux.ru (CommuniGate Pro SMTP 6.2.7)
  with ESMTPS id 1749906; Tue, 10 Mar 2020 16:15:02 +0300
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Dmitry Mastykin <dmastykin@astralinux.ru>
Subject: [PATCH 2/2] Input: goodix - Ignore spurious interrupts
Date:   Tue, 10 Mar 2020 16:17:05 +0300
Message-Id: <20200310131705.13516-2-dmastykin@astralinux.ru>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200310131705.13516-1-dmastykin@astralinux.ru>
References: <20200310131705.13516-1-dmastykin@astralinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
---
 drivers/input/touchscreen/goodix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 6a7ecc6..7f8ad6d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -329,7 +329,7 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	 * The Goodix panel will send spurious interrupts after a
 	 * 'finger up' event, which will always cause a timeout.
 	 */
-	return 0;
+	return -ENOMSG;
 }
 
 static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8 *coor_data)
-- 
2.23.0

