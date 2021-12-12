Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C13A471A22
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 13:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhLLMmx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 07:42:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37958 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230388AbhLLMmw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 07:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639312972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rsc7u1zzdr07bdNGBUTAlxk5qerQZVG7PA51R0G8RYs=;
        b=adtOG7xZO8z+vWO6gGN5v8GewJke1Z5fqYD49Smt0+cLxum37Qf4SjAr4Xhwiro5J1t9Nl
        0AexnoqkksMPBWM65qmoo6ZAwctBNHWV5K7TI8AqcUFqdI7qYQ40O3cJVxSWdsWtCCnZuz
        j21Jqdg/QbxNlMaiI0r7hvl0afq3BTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-_dZNo7CfN9uXSZsQRpEPiQ-1; Sun, 12 Dec 2021 07:42:49 -0500
X-MC-Unique: _dZNo7CfN9uXSZsQRpEPiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 457B21006AA1;
        Sun, 12 Dec 2021 12:42:48 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 524645D6D7;
        Sun, 12 Dec 2021 12:42:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 3/5] Input: goodix - Improve gpiod_get() error logging
Date:   Sun, 12 Dec 2021 13:42:40 +0100
Message-Id: <20211212124242.81019-4-hdegoede@redhat.com>
In-Reply-To: <20211212124242.81019-1-hdegoede@redhat.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

goodix_get_gpio_config() errors are fatal (abort probe()) so log them
at KERN_ERR level rather then as debug messages.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Just do s/dev_dbg/dev_err/, rather then switching to dev_err_probe()
---
 drivers/input/touchscreen/goodix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 3a16f78036d5..84406789da2d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -967,7 +967,7 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	if (IS_ERR(gpiod)) {
 		error = PTR_ERR(gpiod);
 		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
+			dev_err(dev, "Failed to get %s GPIO: %d\n",
 				GOODIX_GPIO_INT_NAME, error);
 		return error;
 	}
@@ -984,7 +984,7 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	if (IS_ERR(gpiod)) {
 		error = PTR_ERR(gpiod);
 		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
+			dev_err(dev, "Failed to get %s GPIO: %d\n",
 				GOODIX_GPIO_RST_NAME, error);
 		return error;
 	}
-- 
2.33.1

