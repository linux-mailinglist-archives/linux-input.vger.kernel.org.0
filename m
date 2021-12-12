Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5CB471A24
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 13:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhLLMmy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 07:42:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31543 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230447AbhLLMmy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 07:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639312973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kZ1rhVU4VZqePzsgchimcKTqZtbpymNoPlHieqwi0as=;
        b=BUq2Q8VTUCvFqzGIwEbB85U3yxkjoOxxW5Ih8U1lb6Z2Z+QWHonLG44MWZZxAF58ukm8Vd
        /WwRvXJi03RypcCTI3/SCGA1NTh+BE1DoEjZcV+pIqxv/Cj/GBuwU7szkuEZnMLmjXoRIO
        rxGDWQCHNB5MbraBTIY/FRYg3ZHqCYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-_3ULS0_-MQiy35gjGUSK7g-1; Sun, 12 Dec 2021 07:42:50 -0500
X-MC-Unique: _3ULS0_-MQiy35gjGUSK7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 802071006AA2;
        Sun, 12 Dec 2021 12:42:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8DDEB5D6D7;
        Sun, 12 Dec 2021 12:42:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 4/5] Input: goodix - 2 small fixes for pen support
Date:   Sun, 12 Dec 2021 13:42:41 +0100
Message-Id: <20211212124242.81019-5-hdegoede@redhat.com>
In-Reply-To: <20211212124242.81019-1-hdegoede@redhat.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

2 small fixes for pen support

1. Set the id.vendor field for the pen input_dev
2. Fix a typo in a comment

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 84406789da2d..04baf5a770f5 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -326,6 +326,7 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
 	input->name = "Goodix Active Pen";
 	input->phys = "input/pen";
 	input->id.bustype = BUS_I2C;
+	input->id.vendor = 0x0416;
 	if (kstrtou16(ts->id, 10, &input->id.product))
 		input->id.product = 0x1001;
 	input->id.version = ts->version;
@@ -468,7 +469,7 @@ static void goodix_process_events(struct goodix_ts_data *ts)
 	if (touch_num == 1 && (point_data[1] & 0x80)) {
 		goodix_ts_report_pen_down(ts, point_data);
 		goodix_ts_release_keys(ts);
-		goto sync; /* Release any previousle registered touches */
+		goto sync; /* Release any previously registered touches */
 	} else {
 		goodix_ts_report_pen_up(ts);
 	}
-- 
2.33.1

