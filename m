Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB2B170DAF
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 02:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgB0BN1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Feb 2020 20:13:27 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41196 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgB0BN1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Feb 2020 20:13:27 -0500
Received: by mail-pg1-f193.google.com with SMTP id b1so529065pgm.8;
        Wed, 26 Feb 2020 17:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=u2M++l49HgIMiqJVF8NUayCcC+Sf9SQePoMMems1GMY=;
        b=CxH5jm1il+eeCUkqjYwYIz2yiYisGSErXnIp2ysM1FUw/ejlghO+4dkknTPLEL9WkB
         BQmZ/uZok14YK08M+Z17Z8DEkACkreZQBWFXHjisINOXsbT9lU92vob2VeJy3491VBrR
         vzp4R+i5makwrC8tpgX9bj+Oj0NkT7q862W3jUumg4ZK5RIpQmZenN2u6IpV23BtbEYr
         Mx9G+b1l0OnrJdU/4v0eC+g6a8oe2mZiGTRIzQrEGzhZgIiBP3lU46D4RG2GkWia6Ahl
         XFVX1tLyfMHpNkZaPIa7KgXb5gk3di3ueQmzHFxfKG4bpU1fcbaPPBYjRKp0pufJngyA
         AhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=u2M++l49HgIMiqJVF8NUayCcC+Sf9SQePoMMems1GMY=;
        b=aMPJalcRxSjAXnh0pDX3cCYUWxtwNNZvFKXLC9HlK+v9NOufLeh8F2yceUlTKIW4aD
         Y4HKFb9klkFcQHi2BJDfNY3vyZp9/RLZuXzbOwDCNMlZXsVFLiIRfl2hoZarKOGJIopw
         IafLIZGYsxvR4Rmf64MwLenmc/vScssDDNDlGuNXWw6CF2lpGlJVY14kohjRjsOTetU/
         /w8eEkrgxNOctM7Z+KRQisx5b1arHcMxhltZsJqA/oFIW2JXdT7O2HqBItkQw13ms96B
         vvPFTbjdqykrJyPYHXy4PdD+CZDm752aun6Fc8JB4tyBZUMV5rFcGUiYQGku/lsR055u
         mQsA==
X-Gm-Message-State: APjAAAUMKVqH6p/EmDYqcntCbjJTKiI2M4W/HjTLx9xiDV59SoLei9AD
        BjptGMoGVDNdqkAdK9ptM+aih8XN
X-Google-Smtp-Source: APXvYqzVqtX+nrjsXxh4yeEc4O+gxGyKzO183tzA01QYe/NlK0K74jXt+xT9AAEQm0bzDT3inDeyFw==
X-Received: by 2002:a63:4e22:: with SMTP id c34mr1577315pgb.263.1582766006753;
        Wed, 26 Feb 2020 17:13:26 -0800 (PST)
Received: from localhost.localdomain (39-11-132-38.adsl.fetnet.net. [39.11.132.38])
        by smtp.gmail.com with ESMTPSA id w25sm4297136pfi.106.2020.02.26.17.13.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 17:13:26 -0800 (PST)
From:   Johnny Chuang <johnny.chuang.emc@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>
Cc:     James Chen <james.chen@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: [PATCH] Input: elants_i2c - Report resolution information for touch major
Date:   Thu, 27 Feb 2020 09:13:20 +0800
Message-Id: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Johnny Chuang <johnny.chuang@emc.com.tw>

This patch supports reporting resolution for ABS_MT_TOUCH_MAJOR event.
This information is needed in showing pressure/width radius.

Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
---
 drivers/input/touchscreen/elants_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 4911799..14c577c 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1309,6 +1309,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
+	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
 
 	error = input_register_device(ts->input);
 	if (error) {
-- 
2.7.4

