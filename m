Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 226A79F865
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 04:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfH1Cnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 22:43:45 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:55788 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfH1Cno (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 22:43:44 -0400
X-Greylist: delayed 592 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Aug 2019 22:43:44 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="31937799"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 28 Aug 2019 10:33:50 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(128607:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Wed, 28 Aug 2019 10:33:49 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(122352:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Wed, 28 Aug 2019 10:33:48 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?big5?B?U1RSRDItsviozsBN?= <johnny.chuang@emc.com.tw>,
        =?big5?B?U1RSRDItvbK0Zrxg?= <jennifer.tsai@emc.com.tw>
Cc:     =?big5?B?U1RSRDIts6+xUqn6uGeyeg==?= <james.chen@emc.com.tw>,
        =?big5?B?J7Hns9W1vic=?= <paul.liang@emc.com.tw>,
        "'jeff'" <jeff.chuang@emc.com.tw>
References: <1566958886-25756-1-git-send-email-johnny.chuang@emc.com.tw>
In-Reply-To: <1566958886-25756-1-git-send-email-johnny.chuang@emc.com.tw>
Subject: [PATCH] Input: elants_i2c - return real value of elants_i2c_initialize()
Date:   Wed, 28 Aug 2019 10:33:46 +0800
Message-ID: <000601d55d49$05878160$10968420$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="big5"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFmeLP5IfQOHpOgOs9iM2bs2d5OHaftn74w
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy00MWI0NWQwMC1jOTNjLTExZTktODgyNC03YzVjZjg3NDk0NzhcYW1lLXRlc3RcNDFiNDVkMDItYzkzYy0xMWU5LTg4MjQtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSI3ODIiIHQ9IjEzMjExNDMzMjI2MjQ0MTE4NSIgaD0iVWdENXQwZFMyRnZIOWlVa3hDcWJ2YlIzOTRFPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The return value of elants_i2c_initialize() was always 0.
It maybe register input device when initialize fail.

Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
---
 drivers/input/touchscreen/elants_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c
b/drivers/input/touchscreen/elants_i2c.c
index d4ad24e..9c9816f 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -571,7 +571,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
 	if (error)
 		ts->iap_mode = ELAN_IAP_RECOVERY;
 
-	return 0;
+	return error;
 }
 
 /*
-- 
2.7.4

