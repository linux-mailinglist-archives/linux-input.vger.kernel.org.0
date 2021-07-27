Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602A93D6D85
	for <lists+linux-input@lfdr.de>; Tue, 27 Jul 2021 06:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbhG0EjL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Jul 2021 00:39:11 -0400
Received: from bosmailout01.eigbox.net ([66.96.185.1]:44543 "EHLO
        bosmailout01.eigbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhG0EjK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Jul 2021 00:39:10 -0400
X-Greylist: delayed 1831 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Jul 2021 00:39:09 EDT
Received: from bosmailscan04.eigbox.net ([10.20.15.4])
        by bosmailout01.eigbox.net with esmtp (Exim)
        id 1m8EOU-0004Xf-6a; Tue, 27 Jul 2021 00:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ewhac.org;
         s=dkim; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=PJSKPBSraWr/NVzzrCcq8jkAC5YWox2dT4g0xVHiDAE=; b=rCdfhdbGk/7UL1Y+p1o0kXduHA
        nzZwgHgYn9tBaH1mIU7DlQHjjvH9Ywc+7h2HPIkR8HEJkPQxTmRsqo6imTFam7T8y+iMXDCVnWoCm
        WmFoMB5v9QnSwvwb9FfJ3EBXalvWQA+NHYjjAtwj0EmbwCj/eWNxJDr/sJvmPUPuaEW0jvI2Jiq4S
        kqfOj3CZNjBMU7N6IaqQfsOlk3il2bbdtJ8EMnltblO49bC3tcoQctvIXFfWdGk9a1UtUfwT57xsG
        XXmn8/dEIzKpTylTXgtNaowGp/WY2w4DSWxCxQBWl0iDBGe2STfET29AVf37noG2zHa5CnTf38Axs
        Z2PcUIdA==;
Received: from [10.115.3.34] (helo=bosimpout04)
        by bosmailscan04.eigbox.net with esmtp (Exim)
        id 1m8EOT-0006za-Uz; Tue, 27 Jul 2021 00:08:37 -0400
Received: from bosauthsmtp05.yourhostingaccount.com ([10.20.18.5])
        by bosimpout04 with 
        id a48a2500306Zqne0148da1; Tue, 27 Jul 2021 00:08:37 -0400
X-Authority-Analysis: v=2.1 cv=CLqkXHbD c=1 sm=1 tr=0
 a=eBvjjtMVdWwtQGedh7GyLg==:117 a=lOZ7gjDonWBvovu+dU3iMA==:17
 a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=e_q4qTt1xDgA:10
 a=ltsmEuTAGloA:10 a=z5_pBHiqAAAA:8 a=qn0TFzAFAAAA:8 a=bRKdTnMcwZd_2SmZgSkA:9
 a=1ZDzRB_x0Jt2thgvHzGi:22 a=bwAZncKOXFtojdMDTreG:22
Received: from [135.180.175.56] (port=5918 helo=exiguous.ewhac.net)
        by bosauthsmtp05.eigbox.net with esmtpsa (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim)
        id 1m8EOQ-0000Ma-Gj; Tue, 27 Jul 2021 00:08:34 -0400
From:   "Leo L. Schwab" <ewhac@ewhac.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     ewhac@ewhac.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: spaceball - fix parsing of movement data packets
Date:   Mon, 26 Jul 2021 21:06:24 -0700
Message-Id: <20210727040625.2159196-1-ewhac@ewhac.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EN-UserInfo: a76222b247b80e113a63936ffdc903eb:931c98230c6409dcc37fa7e93b490c27
X-EN-AuthUser: ewhac@ewhac.org
Sender:  "Leo L. Schwab" <ewhac@ewhac.org>
X-EN-OrigIP: 135.180.175.56
X-EN-OrigHost: unknown
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The spaceball.c module was not properly parsing the movement reports
coming from the device.  The code read axis data as signed 16-bit
little-endian values starting at offset 2.

In fact, axis data in Spaceball movement reports are signed 16-bit
big-endian values starting at offset 3.  This was determined first by
visually inspecting the data packets, and later verified by consulting:
http://spacemice.org/pdf/SpaceBall_2003-3003_Protocol.pdf

If this ever worked properly, it was in the time before Git...

Signed-off-by: Leo L. Schwab <ewhac@ewhac.org>
---
 drivers/input/joystick/spaceball.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/spaceball.c b/drivers/input/joystick/spaceball.c
index 429411c6c0a8..43bfb3d2fa8a 100644
--- a/drivers/input/joystick/spaceball.c
+++ b/drivers/input/joystick/spaceball.c
@@ -74,10 +74,20 @@ static void spaceball_process_packet(struct spaceball* spaceball)
 	switch (spaceball->data[0]) {
 
 		case 'D':					/* Ball data */
+			/*
+			 * Skip first three bytes; read six axes worth of data.
+			 * Axis values are signed 16-bit big-endian.
+			 */
 			if (spaceball->idx != 15) return;
-			for (i = 0; i < 6; i++)
-				input_report_abs(dev, spaceball_axes[i],
-					(__s16)((data[2 * i + 3] << 8) | data[2 * i + 2]));
+			data += 3;
+			for (i = 0;
+			     i < ARRAY_SIZE(spaceball_axes);
+			     ++i, data += sizeof(__s16)) {
+				input_report_abs(
+					dev,
+					spaceball_axes[i],
+					(__s16)((data[0] << 8) | data[1]));
+			}
 			break;
 
 		case 'K':					/* Button data */
-- 
2.32.0

