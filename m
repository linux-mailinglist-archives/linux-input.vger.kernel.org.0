Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46CD4A5BB
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2019 17:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbfFRPqs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 11:46:48 -0400
Received: from gateway36.websitewelcome.com ([192.185.197.22]:43037 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729209AbfFRPqr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 11:46:47 -0400
X-Greylist: delayed 1399 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Jun 2019 11:46:47 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 70295400C9765
        for <linux-input@vger.kernel.org>; Tue, 18 Jun 2019 09:45:06 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id dFxHheBFsdnCedFxHhFKUW; Tue, 18 Jun 2019 10:23:27 -0500
X-Authority-Reason: nr=8
Received: from cablelink149-185.telefonia.intercable.net ([201.172.149.185]:43462 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hdFxG-001trq-D2; Tue, 18 Jun 2019 10:23:26 -0500
Date:   Tue, 18 Jun 2019 10:23:25 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: gpio_keys - use struct_size() in devm_kzalloc()
Message-ID: <20190618152325.GA21504@embeddedor>
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
X-Source-IP: 201.172.149.185
X-Source-L: No
X-Exim-ID: 1hdFxG-001trq-D2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink149-185.telefonia.intercable.net (embeddedor) [201.172.149.185]:43462
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct gpio_keys_drvdata {
	...
        struct gpio_button_data data[0];
};


size = sizeof(struct gpio_keys_drvdata) + count * sizeof(struct gpio_button_data);
instance = devm_kzalloc(dev, size, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = devm_kzalloc(dev, struct_size(instance, data, count), GFP_KERNEL);

Notice that, in this case, variable size is not necessary, hence it
is removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/keyboard/gpio_keys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 6cd199e8a370..c186c2552b04 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -774,7 +774,6 @@ static int gpio_keys_probe(struct platform_device *pdev)
 	struct fwnode_handle *child = NULL;
 	struct gpio_keys_drvdata *ddata;
 	struct input_dev *input;
-	size_t size;
 	int i, error;
 	int wakeup = 0;
 
@@ -784,9 +783,8 @@ static int gpio_keys_probe(struct platform_device *pdev)
 			return PTR_ERR(pdata);
 	}
 
-	size = sizeof(struct gpio_keys_drvdata) +
-			pdata->nbuttons * sizeof(struct gpio_button_data);
-	ddata = devm_kzalloc(dev, size, GFP_KERNEL);
+	ddata = devm_kzalloc(dev, struct_size(ddata, data, pdata->nbuttons),
+			     GFP_KERNEL);
 	if (!ddata) {
 		dev_err(dev, "failed to allocate state\n");
 		return -ENOMEM;
-- 
2.21.0

