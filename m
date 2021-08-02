Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963053DD59B
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 14:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbhHBM0e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 08:26:34 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:19888 "EHLO
        cmccmta3.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbhHBM0d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Aug 2021 08:26:33 -0400
X-Greylist: delayed 549 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Aug 2021 08:26:33 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96107e23dbe9-e8925; Mon, 02 Aug 2021 20:17:03 +0800 (CST)
X-RM-TRANSID: 2ee96107e23dbe9-e8925
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
        by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96107e23c18d-e74d0;
        Mon, 02 Aug 2021 20:17:02 +0800 (CST)
X-RM-TRANSID: 2ee96107e23c18d-e74d0
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] input: cpcap-pwrbutton: Add an error handling
Date:   Mon,  2 Aug 2021 20:17:40 +0800
Message-Id: <20210802121740.8700-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The function cpcap_power_button_probe() does not perform
sufficient error checking after executing platform_get_irq(),
thus fix it.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/input/misc/cpcap-pwrbutton.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/misc/cpcap-pwrbutton.c b/drivers/input/misc/cpcap-pwrbutton.c
index 0abef6321..0a1f2e8b4 100644
--- a/drivers/input/misc/cpcap-pwrbutton.c
+++ b/drivers/input/misc/cpcap-pwrbutton.c
@@ -57,6 +57,9 @@ static int cpcap_power_button_probe(struct platform_device *pdev)
 	int irq = platform_get_irq(pdev, 0);
 	int err;
 
+	if (irq < 0)
+		return irq;
+
 	button = devm_kmalloc(&pdev->dev, sizeof(*button), GFP_KERNEL);
 	if (!button)
 		return -ENOMEM;
-- 
2.20.1.windows.1



