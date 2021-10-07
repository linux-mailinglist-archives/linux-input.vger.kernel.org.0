Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCDF4251C3
	for <lists+linux-input@lfdr.de>; Thu,  7 Oct 2021 13:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhJGLOW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Oct 2021 07:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhJGLOV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Oct 2021 07:14:21 -0400
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17FCC061746;
        Thu,  7 Oct 2021 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=5IpN7IfrzRhmhVgy9bZoBoDtYZ9yheLeeNt1arFGBas=; b=yl
        DX/LOsLypu5ktwBawKB7+BerNbhpi0ag56AiHqkQlECmbtBr9BoT3qLUjSMjMEgTDfEAxe6JdfG9Q
        XgXry/MBKyv/eFGiiSE84UMM0zjCSa7ZwB9nLS2cFOfls9Cjw46B3KRaoFRChO0h9Ss3AYjWN//Zt
        n6m6ZPPtdTbkFcOQX+0gmsBk6ykp6qYnsNKbqI0xfGr/H3uHnq/HdFlea06zlekXV58YF2lpDIDoP
        1jJ8jSiF6fGh7twPdWlHj9g9O0lSOEN87R20yKCYMNvJ0i1j7tqTYFXCOKGi73pEme2dTa7G+t2RF
        dPkMYpYtLQ78cZznoANskBc/FmsChntA==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mYRK2-0000Ri-P1; Thu, 07 Oct 2021 12:12:22 +0100
From:   John Keeping <john@metanate.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     John Keeping <john@metanate.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Andrej Valek <andrej.valek@siemens.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: st1232 - prefer asynchronous probing
Date:   Thu,  7 Oct 2021 12:12:16 +0100
Message-Id: <20211007111217.1935858-1-john@metanate.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device may take up to 100ms to become responsive during probe, so
prefer asynchronous probing to avoid delaying the rest of the system.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: John Keeping <john@metanate.com>
---
As suggested in [1]

[1] https://lore.kernel.org/all/YV3mNMnWmUsasZ2h@google.com/

 drivers/input/touchscreen/st1232.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 6abae665ca71..45017ed94833 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -389,6 +389,7 @@ static struct i2c_driver st1232_ts_driver = {
 	.driver = {
 		.name	= ST1232_TS_NAME,
 		.of_match_table = st1232_ts_dt_ids,
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &st1232_ts_pm_ops,
 	},
 };
-- 
2.33.0

