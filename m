Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF454A496D
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 15:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237249AbiAaOgB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 09:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47333 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237191AbiAaOgA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 09:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643639760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qpbnLeOni8mc0CQjXRMLFHgwoEKYMoOGWGeI0XonaWo=;
        b=ZcDCoownrfi9+POHsTr5dWT7PaWehyRiz59xic1cBcca6yJnXg9fIxgCumjzvJXz+rMyAE
        d/t/HciF8RSmlJN1i7VGH/PmPLP97u7+DysJwK0kvvxosM1P+tmpUKhNgcOigVozpfYkaV
        FgqIWxVcvmhZabE/Q5kg/WcNWaepKws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-6Ww8T-euNwuP6BzrPHxJ3w-1; Mon, 31 Jan 2022 09:35:56 -0500
X-MC-Unique: 6Ww8T-euNwuP6BzrPHxJ3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C566C1091DAF;
        Mon, 31 Jan 2022 14:35:55 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 55D432376A;
        Mon, 31 Jan 2022 14:35:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 3/5] Input: goodix - Use input_copy_abs() helper
Date:   Mon, 31 Jan 2022 15:35:37 +0100
Message-Id: <20220131143539.109142-3-hdegoede@redhat.com>
In-Reply-To: <20220131143539.109142-1-hdegoede@redhat.com>
References: <20220131143539.109142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the new input_copy_abs() helper and move the 2 input_abs_set_res()
calls up to be directly after the 2 input_copy_abs() calls, so that
the calls initializing the X and Y axis are all together.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- No changes
---
 drivers/input/touchscreen/goodix.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index a3bfc7a41679..04baf5a770f5 100644
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

