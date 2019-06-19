Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 050DB4BC06
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 16:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFSOta (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 10:49:30 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.172]:12684 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725899AbfFSOta (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 10:49:30 -0400
X-Greylist: delayed 1351 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jun 2019 10:49:29 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id D7DB921B5
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 09:26:57 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id dbY9hxbAQdnCedbY9hYZMS; Wed, 19 Jun 2019 09:26:57 -0500
X-Authority-Reason: nr=8
Received: from cablelink-187-160-61-213.pcs.intercable.net ([187.160.61.213]:37806 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hdbY8-0025CT-Tf; Wed, 19 Jun 2019 09:26:56 -0500
Date:   Wed, 19 Jun 2019 09:26:55 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: gpio_keys_polled - use struct_size() in devm_kzalloc()
Message-ID: <20190619142655.GA20218@embeddedor>
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
X-Source-IP: 187.160.61.213
X-Source-L: No
X-Exim-ID: 1hdbY8-0025CT-Tf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-213.pcs.intercable.net (embeddedor) [187.160.61.213]:37806
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct gpio_keys_polled_dev {
	...
        struct gpio_keys_button_data data[0];
};

size = sizeof(struct gpio_keys_polled_dev) + count * sizeof(struct gpio_keys_button_data);
instance = devm_kzalloc(dev, size, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = devm_kzalloc(dev, struct_size(instance, data, count), GFP_KERNEL);

Notice that, in this case, variable size is not necessary, hence it
is removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/keyboard/gpio_keys_polled.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index edc7262103b9..c4087be0c2e0 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -235,7 +235,6 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 	struct gpio_keys_polled_dev *bdev;
 	struct input_polled_dev *poll_dev;
 	struct input_dev *input;
-	size_t size;
 	int error;
 	int i;
 
@@ -250,9 +249,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	size = sizeof(struct gpio_keys_polled_dev) +
-			pdata->nbuttons * sizeof(struct gpio_keys_button_data);
-	bdev = devm_kzalloc(dev, size, GFP_KERNEL);
+	bdev = devm_kzalloc(dev, struct_size(bdev, data, pdata->nbuttons),
+			    GFP_KERNEL);
 	if (!bdev) {
 		dev_err(dev, "no memory for private data\n");
 		return -ENOMEM;
-- 
2.21.0

