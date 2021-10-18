Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0419F4310D2
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 08:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhJRGuU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 02:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhJRGuU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 02:50:20 -0400
Received: from cambridge.shadura.me (cambridge.shadura.me [IPv6:2a00:1098:0:86:1000:13:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7BEC06161C;
        Sun, 17 Oct 2021 23:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shadura.me;
         s=a; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID; bh=q2aXzRV18it8Fgh6PAecwxuaIn3SG16/UEsnXceVths=; b=KKpJdr
        OBEIekvbjWzm3VCaYcJC1doztrHrvc0EYbn2T3KnTvc08U4CSaxvJJjgU6Fo1PWN1vsemKM0Lh6Hd
        ladRre8O0iYMSIDh1wk9Bgt96HQNd2Q+9xnoMn4bInvx6Q5gkcknGEkiW2XnKn4P3n6J2tDPeHRAw
        9wM4+kX8wpI=;
Received: from 178-143-43-60.dynamic.orange.sk ([178.143.43.60] helo=localhost)
        by cambridge.shadura.me with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <andrew@shadura.me>)
        id 1mcMRM-0001cH-G1; Mon, 18 Oct 2021 08:48:08 +0200
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
To:     =?UTF-8?q?Ji=C5=99=C3=AD=20Kosina?= <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: [PATCH 2/2] HID: u2fzero: properly handle timeouts in usb_submit_urb
Date:   Mon, 18 Oct 2021 08:48:00 +0200
Message-Id: <20211018064800.15173-2-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018064800.15173-1-andrew.shadura@collabora.co.uk>
References: <20211018064800.15173-1-andrew.shadura@collabora.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The wait_for_completion_timeout function returns 0 if timed out or a
positive value if completed. Hence, "less than zero" comparison always
misses timeouts and doesn't kill the URB as it should, leading to
re-sending it while it is active.

Fixes: 42337b9d4d958("HID: add driver for U2F Zero built-in LED and RNG")
Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>
---
 drivers/hid/hid-u2fzero.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
index 5145d758bea0..562da98cfb82 100644
--- a/drivers/hid/hid-u2fzero.c
+++ b/drivers/hid/hid-u2fzero.c
@@ -132,7 +132,7 @@ static int u2fzero_recv(struct u2fzero_device *dev,
 
 	ret = (wait_for_completion_timeout(
 		&ctx.done, msecs_to_jiffies(USB_CTRL_SET_TIMEOUT)));
-	if (ret < 0) {
+	if (ret == 0) {
 		usb_kill_urb(dev->urb);
 		hid_err(hdev, "urb submission timed out");
 	} else {
-- 
2.33.0

