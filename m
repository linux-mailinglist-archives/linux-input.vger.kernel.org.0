Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D4063F77
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2019 04:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfGJC7s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jul 2019 22:59:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36038 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfGJC7r (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jul 2019 22:59:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so457537pgm.3;
        Tue, 09 Jul 2019 19:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9aWx4kuchot+3w/B95lO17R7It++2WgqTNN0KUoZbTk=;
        b=Og3nRcaoxlXrzHUR+nKen6jt2J0VadMoKJcjDJyHqLUbx84c2q7bjJAfSq3zsyKMGx
         NOV5WtkIYHdhH0cv4d2xrkGsqseoZkrrQYRiptoHg+wf0OmtGOo1xHpDf6iUpxTQilCS
         5CKi6GchznmphAoiESsjVctrb3SS5BrlCqmKFB/jVr3xHGY292o9mZO8UpgKhxBgYtGb
         xbrnowqo6ZqP2cNeguFZ6TJbgQXoA6N/w900tuoqzbgJhdKrk6I2Id5nSOu27+S9NCGu
         vJjZcFNDhcUmp6YyYseHKKF6T6/10d666f7WQMJ3Dxfz0NyUd83M8GBhyF8yHV3kERl3
         pBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9aWx4kuchot+3w/B95lO17R7It++2WgqTNN0KUoZbTk=;
        b=rzypsklEqGzliCXTUBzzWvqLf28CMptHXxlcfRh064ZwSQBUT3vSpm4iQ3TfT/jfHl
         rIajJSiq46q7FMMw0YzE51+ICBc8VA8rUlHWQVOr7fkOgzRDlfzGcnKDGrnPP/An0Oqb
         njeiTQPKDZMc39sQVKZovk1wV8iYWOs5yzbMSCklTpz+0/GgByYZQaPEkibKpk4Y9Gb/
         L76zze4kqUHSVS+LEpuuohuQbGE4rsbAjLp8FohfWQD+NS4Gr/2BavgMntzMSrEPznKN
         lHqIyotDwexeHsYbEDamCXnuRtqDxV9p3b2Bi4SqVSrFHel6urztntyVv7kUu1atZqkX
         5xdw==
X-Gm-Message-State: APjAAAWSGsFzM5qJBZVK85LHPdmhgH0w2D9tqLXNl1j4CG6WQ9w2tl3X
        5N6u3ig3OCSZgQePCQcHRArfbyrzG1xvy42V
X-Google-Smtp-Source: APXvYqzrlcOhGNMHHigY2fZTO7a2Y/eCFiEWQ2UKy209ytBQsVjhkt9nMq3rZfBflmsFzAaUqh4p7w==
X-Received: by 2002:a63:7e1d:: with SMTP id z29mr34260364pgc.346.1562727586886;
        Tue, 09 Jul 2019 19:59:46 -0700 (PDT)
Received: from crabx-p7730.tpe.apac.dell.com ([132.237.175.246])
        by smtp.gmail.com with ESMTPSA id 23sm411567pfn.176.2019.07.09.19.59.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 19:59:46 -0700 (PDT)
From:   crag0715@gmail.com
Cc:     mario_limonciello@dell.com, chrome.os.engineering@dell.com,
        "Crag.Wang" <crag.wang@dell.com>, Sangwon Jee <jeesw@melfas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: touchscreen: add delay time to device power on
Date:   Wed, 10 Jul 2019 10:58:59 +0800
Message-Id: <20190710025859.6025-1-crag0715@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "Crag.Wang" <crag.wang@dell.com>

Delay time for MELFAS MIP4 controller is required at power on stage
regardless the existence of GPIO consumer lookup from devicetree or
ACPI device table.

There is an issue if GPIO ce is undefined in the ACPI results no delay
time for deive power on, the controller ended up in an abnormal state.

TEST=echo i2c-MLFS0000:00 > /sys/bus/i2c/drivers/mip4_ts/unbind
     verify the touch function is off

     echo i2c-MLFS0000:00 > /sys/bus/i2c/drivers/mip4_ts/bind
     verify the touch function is on

Signed-off-by: Crag.Wang <crag.wang@dell.com>
---
 drivers/input/touchscreen/melfas_mip4.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 430a2bc5f7ca..8e803658fb43 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -374,12 +374,11 @@ static int mip4_query_device(struct mip4_ts *ts)
 
 static int mip4_power_on(struct mip4_ts *ts)
 {
-	if (ts->gpio_ce) {
+	if (ts->gpio_ce)
 		gpiod_set_value_cansleep(ts->gpio_ce, 1);
 
-		/* Booting delay : 200~300ms */
-		usleep_range(200 * 1000, 300 * 1000);
-	}
+	/* Booting delay : 200~300ms */
+	usleep_range(200 * 1000, 300 * 1000);
 
 	return 0;
 }
-- 
2.20.1

