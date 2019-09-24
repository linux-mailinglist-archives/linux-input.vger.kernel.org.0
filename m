Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF82BD4A6
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2019 23:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439148AbfIXVwq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Sep 2019 17:52:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42791 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbfIXVwp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Sep 2019 17:52:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id q12so2106229pff.9
        for <linux-input@vger.kernel.org>; Tue, 24 Sep 2019 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fhJ9T/vZjSSX05VHp18SVR0XFnj5tZksc8z2VAuz54=;
        b=OFC1szf5PoQuT5vyg4Il+WGjsj/nKDC3/5I83EXRYroN4p+0LcCQNVXZ1Dczng+l/9
         mX0OgMcBO2ic+gGiP5KR3IqB8DXh9UeF13m6c15qdDEuA7foGI5jv2h6XOlk7iSwSAww
         9xyXErYkzTDlxbmY4plb2PXQnB5uWqu/47bX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fhJ9T/vZjSSX05VHp18SVR0XFnj5tZksc8z2VAuz54=;
        b=LHV2EE+lTvol26evboEIQ9u2+HKJqSbIJUpCYCm+bjodiHw4Y0m4qiGNHmfWBQB4Yg
         8AEDkO1By7ZijzbXlDT3A19lj17dqDMEL6BteX3xes8Jw74VZNqe2G2Olyzu8Sg3bQWK
         Yt4LreHLyUiwBnnqijkiGfp5+US2JcgmILQBoagTr7y+P8pHSdgMg0VXW9ErSiwHqrMh
         cLzjrhvxx5+1bW7ojDWIxaep8N0wRcfEEqGeyV+nI/y33hdDIKhideyeKqvnqxopUnSO
         ywkvA4YbaeK8GVwUu+ysyYnPgSsiRK8quwjwb3SwNUKOytBWHyRNPcxNp7Y65c4OA59+
         stxg==
X-Gm-Message-State: APjAAAUce4c2b++Md+OKK2ObjKICEFOyJUK3H4kr3JLpK5tdQjgXFosU
        t41FrK2JWlFixWf2dXB94DltZg==
X-Google-Smtp-Source: APXvYqwWBdF0lQs3EbGKhbUaeNBDEuDBk7pm4dNkAF2JHWwebTmEQlp77C87FjqJ6npYTny70kzyBA==
X-Received: by 2002:a63:a548:: with SMTP id r8mr4828285pgu.401.1569361963764;
        Tue, 24 Sep 2019 14:52:43 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com ([2620:15c:202:201:ffda:7716:9afc:1301])
        by smtp.gmail.com with ESMTPSA id q204sm2494493pfc.11.2019.09.24.14.52.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 24 Sep 2019 14:52:43 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jongpil Jung <jongpil19.jung@samsung.com>,
        Furquan Shaikh <furquan@chromium.org>,
        Rajat Jain <rajatja@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2] Input: atmel_mxt_ts - Disable IRQ across suspend
Date:   Tue, 24 Sep 2019 14:52:38 -0700
Message-Id: <20190924215238.184750-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Across suspend and resume, we are seeing error messages like the following:

atmel_mxt_ts i2c-PRP0001:00: __mxt_read_reg: i2c transfer failed (-121)
atmel_mxt_ts i2c-PRP0001:00: Failed to read T44 and T5 (-121)

This occurs because the driver leaves its IRQ enabled. Upon resume, there
is an IRQ pending, but the interrupt is serviced before both the driver and
the underlying I2C bus have been resumed. This causes EREMOTEIO errors.

Disable the IRQ in suspend, and re-enable it on resume. If there are cases
where the driver enters suspend with interrupts disabled, that's a bug we
should fix separately.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v2:
 - Enable and disable unconditionally (Dmitry)

 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 24c4b691b1c9..a58092488679 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3155,6 +3155,7 @@ static int __maybe_unused mxt_suspend(struct device *dev)
 		mxt_stop(data);
 
 	mutex_unlock(&input_dev->mutex);
+	disable_irq(data->irq);
 
 	return 0;
 }
@@ -3174,6 +3175,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 		mxt_start(data);
 
 	mutex_unlock(&input_dev->mutex);
+	enable_irq(data->irq);
 
 	return 0;
 }
-- 
2.21.0

