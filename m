Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541EA50008
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 05:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfFXDIe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 23:08:34 -0400
Received: from puleglot.ru ([195.201.32.202]:57094 "EHLO puleglot.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726858AbfFXDIe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 23:08:34 -0400
X-Greylist: delayed 4500 seconds by postgrey-1.27 at vger.kernel.org; Sun, 23 Jun 2019 23:08:33 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
        s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=7gzZRVZMPxrYEi8p0WnYNZ3kUBTmNCNosDX5es9YDxw=; b=DlU/4SISOPzAAz1iUF9i0lhtfR
        23IYUA5n6xmWF8nUlXgDm7QrC55EbppjloG7jdzu9qPFpG6Wdh+eBGkDAqszt+lTv8GKb1+ML8RPw
        gmt1kON+kZ0vqoYxgdRRTXesPxFBgLq27Xv3CkDXcLhJmrYlKZYDuvT1Fm7EYoKOVtq8=;
Received: from [2a00:1370:8125:470f:6c77:37a5:dd3b:d396] (helo=home.puleglot.ru)
        by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <puleglot@puleglot.ru>)
        id 1hfCAN-0002YE-RM; Mon, 24 Jun 2019 02:44:59 +0300
From:   Alexander Tsoy <alexander@tsoy.me>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: joydev - extend absolute mouse detection
Date:   Mon, 24 Jun 2019 02:44:56 +0300
Message-Id: <20190623234456.4074-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Extend event signature matching to catch more input devices emulated by
BMC firmwares, QEMU and VMware.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 drivers/input/joydev.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
index ac21c050fdb0..a2b5fbba2d3b 100644
--- a/drivers/input/joydev.c
+++ b/drivers/input/joydev.c
@@ -808,6 +808,7 @@ static bool joydev_dev_is_blacklisted(struct input_dev *dev)
 static bool joydev_dev_is_absolute_mouse(struct input_dev *dev)
 {
 	DECLARE_BITMAP(jd_scratch, KEY_CNT);
+	bool ev_match = false;
 
 	BUILD_BUG_ON(ABS_CNT > KEY_CNT || EV_CNT > KEY_CNT);
 
@@ -826,17 +827,36 @@ static bool joydev_dev_is_absolute_mouse(struct input_dev *dev)
 	 * considered to be an absolute mouse if the following is
 	 * true:
 	 *
-	 * 1) Event types are exactly EV_ABS, EV_KEY and EV_SYN.
+	 * 1) Event types are exactly
+	 *      EV_ABS, EV_KEY and EV_SYN
+	 *    or
+	 *      EV_ABS, EV_KEY, EV_SYN and EV_MSC
+	 *    or
+	 *      EV_ABS, EV_KEY, EV_SYN, EV_MSC and EV_REL.
 	 * 2) Absolute events are exactly ABS_X and ABS_Y.
 	 * 3) Keys are exactly BTN_LEFT, BTN_RIGHT and BTN_MIDDLE.
 	 * 4) Device is not on "Amiga" bus.
 	 */
 
 	bitmap_zero(jd_scratch, EV_CNT);
+	/* VMware VMMouse, HP ILO2 */
 	__set_bit(EV_ABS, jd_scratch);
 	__set_bit(EV_KEY, jd_scratch);
 	__set_bit(EV_SYN, jd_scratch);
-	if (!bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
+	if (bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
+		ev_match = true;
+
+	/* HP ILO2, AMI BMC firmware */
+	__set_bit(EV_MSC, jd_scratch);
+	if (bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
+		ev_match = true;
+
+	/* VMware Virtual USB Mouse, QEMU USB Tablet, ATEN BMC firmware */
+	__set_bit(EV_REL, jd_scratch);
+	if (bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
+		ev_match = true;
+
+	if (!ev_match)
 		return false;
 
 	bitmap_zero(jd_scratch, ABS_CNT);
-- 
2.21.0

