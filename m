Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 213EF4FA84
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 08:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbfFWGcA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 02:32:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45794 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfFWGb6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 02:31:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so5672882pfq.12;
        Sat, 22 Jun 2019 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g67QRpobtyj7t+gsjQpl42X5lgDmhE+QGppdKoo8L64=;
        b=XiZXR5WYsJZYzREpoJ10jd6FWIXE+mVaElDrDm/R76BCXkuGtv3VUZUB1p4227KgdK
         +lEYx1u+oGcr6GqxtGxiBdzJZGXM7kNouzJiJkUIo1PIQKrFmwMULRwRA6OnXr8OI71y
         FdjCk7sGz7fMfHdOPsT4XKLtNgyuF8YvDMSERtZzy0V3DjQs9q0MvwV7Dqbf0oSz+g6E
         c8XrptLngwP6XXUL64QxP1+YIwRwiH/6IwU3WyuHTBBFpogwGw2nHbXEHSJxdVC6cCLV
         0DdwikooRRmYDzNBaOO+x3MUSuwBVPs0rE9/p4GDU0Lgpzt1U9Ao2TYiK/hNBMf4nLmg
         +v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g67QRpobtyj7t+gsjQpl42X5lgDmhE+QGppdKoo8L64=;
        b=XUDCdZIGGHMVLP6vIFn96H1MfSMRmQeNLDImXbSyHyINqvB7MhqaHwYj57REC+9zja
         e6IqcAc2R5RbLQ0rGP38f96+Hw4wjP40EmUQGAc0T8AhG0x00YtBH6FOHTspw4qdtgXu
         LT+T3ObnblhITmbNuvsTDG2jBv+cxdQ1Sik0vTFLuIshkvog565xW9kNQFtM72ZP7/qF
         ZUkmk6/Ft5Ajl/evgb2K99FblvZQ78v/6RIi+YVcWuqsVD/I0sUiBN+egFjOaAeT0otw
         rbcPYSrQLIHR1DFIm1VS4WgkLuuR9iPzcey3bdjjIn6cuQrWXDVD7ttz0tn2zCUyVYLW
         7yIA==
X-Gm-Message-State: APjAAAVlWph60IuR1oPHsdUicBes4eAOuJE0mKE2/bGzU6k7K30jOp9c
        4eHnVIVupZGpqw4fjAD3edVtwsLZ
X-Google-Smtp-Source: APXvYqxZmIDk18EuG0XPfWV+SPRRs9Nl8bob/rMRYxxEr/4EF8En2O6v71Y0EJglMIH9rv3H1UwPIQ==
X-Received: by 2002:a17:90a:37c8:: with SMTP id v66mr17418896pjb.33.1561271517227;
        Sat, 22 Jun 2019 23:31:57 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i14sm10421411pfk.0.2019.06.22.23.31.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 22 Jun 2019 23:31:56 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: edt-ft5x06 - simplify event reporting code
Date:   Sat, 22 Jun 2019 23:31:53 -0700
Message-Id: <20190623063153.261546-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that input_mt_report_slot_state() returns true if slot is active we no
longer need a temporary for the slot state.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index ec770226e119..3cc4341bbdff 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -229,7 +229,6 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 
 	for (i = 0; i < tsdata->max_support_points; i++) {
 		u8 *buf = &rdbuf[i * tplen + offset];
-		bool down;
 
 		type = buf[0] >> 6;
 		/* ignore Reserved events */
@@ -247,16 +246,12 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 			swap(x, y);
 
 		id = (buf[2] >> 4) & 0x0f;
-		down = type != TOUCH_EVENT_UP;
 
 		input_mt_slot(tsdata->input, id);
-		input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER, down);
-
-		if (!down)
-			continue;
-
-		touchscreen_report_pos(tsdata->input, &tsdata->prop, x, y,
-				       true);
+		if (input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER,
+					       type != TOUCH_EVENT_UP))
+			touchscreen_report_pos(tsdata->input, &tsdata->prop,
+					       x, y, true);
 	}
 
 	input_mt_report_pointer_emulation(tsdata->input, true);
-- 
2.22.0.410.gd8fdbe21b5-goog

