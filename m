Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3BD46B86F
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 11:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbhLGKLc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 05:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44664 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234741AbhLGKLc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Dec 2021 05:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638871682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=uNw+E70U7CPHqgNJO1pg5TLkn6tiOPWWIxncZATgc7E=;
        b=eBiKFPPemD6MRbPcw26np7VxSMuPBRFpHyEWdAqK31OlQOhkAQQ7Pp5Ai/0k//wg7KGtBC
        DwryWSIIWBs5h31mwOWBso1uyloBvpedxnc7l6gl4fXvkcLKacYQBAUSljCQsImQ0k2QLY
        4qXj+8fY1HLWByz/sy0R9n/sK1vpvIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-285-cOico9EyMn2xuCCFHQUYng-1; Tue, 07 Dec 2021 05:07:59 -0500
X-MC-Unique: cOico9EyMn2xuCCFHQUYng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1510110168C6;
        Tue,  7 Dec 2021 10:07:58 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.249])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4F61A10023AA;
        Tue,  7 Dec 2021 10:07:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 1/3] Input: goodix - Improve gpiod_get() error logging
Date:   Tue,  7 Dec 2021 11:07:52 +0100
Message-Id: <20211207100754.31155-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index aaa3c455e01e..828487d9ded5 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -857,7 +857,7 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	if (IS_ERR(gpiod)) {
 		error = PTR_ERR(gpiod);
 		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
+			dev_err(dev, "Failed to get %s GPIO: %d\n",
 				GOODIX_GPIO_INT_NAME, error);
 		return error;
 	}
@@ -874,7 +874,7 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
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

