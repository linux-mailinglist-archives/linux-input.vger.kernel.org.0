Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F691471A23
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 13:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhLLMmy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 07:42:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26387 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230388AbhLLMmx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 07:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639312973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rcb8IOiFEWUiKRnsoSMQ9Juo5MOVmAiCc19Tm5KgnrY=;
        b=ESQDjMrSGANkmR9VxX67qM3yuUOpV9cu+AW6AQP/o02zuXFdUCSJFu/nttUlSxcUiTnpVD
        ncs6cPDKw48gKMT7DEgAu2bcdel8qNdFwPAgWqvlYYr4EkeI5iMxD7/cOpbcjzHP7KRdOp
        2Z1RN+yPqZTWnRIhdviU+bvkbaBI2sM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-qsyfhW51OiCA9xIH0yVv1A-1; Sun, 12 Dec 2021 07:42:48 -0500
X-MC-Unique: qsyfhW51OiCA9xIH0yVv1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A12D1006AA0;
        Sun, 12 Dec 2021 12:42:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 15F135D6D7;
        Sun, 12 Dec 2021 12:42:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 2/5] Input: goodix - Use input_copy_abs() helper
Date:   Sun, 12 Dec 2021 13:42:39 +0100
Message-Id: <20211212124242.81019-3-hdegoede@redhat.com>
In-Reply-To: <20211212124242.81019-1-hdegoede@redhat.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the new input_copy_abs() helper and move the 2 input_abs_set_res()
calls up to be directly after the 2 input_copy_abs() calls, so that
the calls initializing the X and Y axis are all together.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 8aec8a8cef7e..3a16f78036d5 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -306,23 +306,8 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
 	if (!input)
 		return NULL;
 
-	input_alloc_absinfo(input);
-	if (!input->absinfo) {
-		input_free_device(input);
-		return NULL;
-	}
-
-	input->absinfo[ABS_X] = ts->input_dev->absinfo[ABS_MT_POSITION_X];
-	input->absinfo[ABS_Y] = ts->input_dev->absinfo[ABS_MT_POSITION_Y];
-	__set_bit(ABS_X, input->absbit);
-	__set_bit(ABS_Y, input->absbit);
-	input_set_abs_params(input, ABS_PRESSURE, 0, 255, 0, 0);
-
-	input_set_capability(input, EV_KEY, BTN_TOUCH);
-	input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
-	input_set_capability(input, EV_KEY, BTN_STYLUS);
-	input_set_capability(input, EV_KEY, BTN_STYLUS2);
-	__set_bit(INPUT_PROP_DIRECT, input->propbit);
+	input_copy_abs(input, ABS_X, ts->input_dev, ABS_MT_POSITION_X);
+	input_copy_abs(input, ABS_Y, ts->input_dev, ABS_MT_POSITION_Y);
 	/*
 	 * The resolution of these touchscreens is about 10 units/mm, the actual
 	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
@@ -330,6 +315,13 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
 	 */
 	input_abs_set_res(input, ABS_X, 10);
 	input_abs_set_res(input, ABS_Y, 10);
+	input_set_abs_params(input, ABS_PRESSURE, 0, 255, 0, 0);
+
+	input_set_capability(input, EV_KEY, BTN_TOUCH);
+	input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
+	input_set_capability(input, EV_KEY, BTN_STYLUS);
+	input_set_capability(input, EV_KEY, BTN_STYLUS2);
+	__set_bit(INPUT_PROP_DIRECT, input->propbit);
 
 	input->name = "Goodix Active Pen";
 	input->phys = "input/pen";
-- 
2.33.1

