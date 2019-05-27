Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B93F52B794
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 16:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfE0Oby (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 10:31:54 -0400
Received: from gateway22.websitewelcome.com ([192.185.47.109]:47759 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726812AbfE0Obx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 10:31:53 -0400
X-Greylist: delayed 1276 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 10:31:53 EDT
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 72105123CC
        for <linux-input@vger.kernel.org>; Mon, 27 May 2019 09:10:36 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id VGKihioMMYTGMVGKihif0q; Mon, 27 May 2019 09:10:36 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=56988 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hVGKh-000n52-ID; Mon, 27 May 2019 09:10:35 -0500
Date:   Mon, 27 May 2019 09:10:33 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: qt1050 - remove unnecessary comparison of unsigned
 integer with < 0
Message-ID: <20190527141033.GA19251@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hVGKh-000n52-ID
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:56988
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is no need to compare button.num with < 0 because such comparison
of an unsigned value is always false.

Fix this by removing such comparison.

Addresses-Coverity-ID: 1445492 ("Unsigned compared against 0")
Fixes: cbebf5addec1 ("Input: qt1050 - add Microchip AT42QT1050 support")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/keyboard/qt1050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index 403060d05c3b..a9ac99f62e39 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -368,7 +368,7 @@ static int qt1050_parse_fw(struct qt1050_priv *ts)
 			dev_err(dev, "Button without pad number\n");
 			goto err;
 		}
-		if (button.num < 0 || button.num > QT1050_MAX_KEYS - 1)
+		if (button.num > QT1050_MAX_KEYS - 1)
 			goto err;
 
 		ts->reg_keys |= BIT(button.num);
-- 
2.21.0

