Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC172C55D4
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 14:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390033AbgKZNgY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 08:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390480AbgKZNgX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 08:36:23 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12FAC0617A7
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 05:36:21 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 10so2176162wml.2
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 05:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOfJDj7y+29ZeViL6kV6ywYnxqJxhhS/scmeQ+AwyUU=;
        b=Qba3Y44UBdpC8FW+jUziVINWIgRedMTLk1YdievSzjOk4FV2QY6K+mZoOGTp3AalIO
         yZJs0ZcGqkoTIxL3v4lUDuxliEjAGgEr6PV3a59wCDc3NNhjiqR6aOgGMqEodtf6N/93
         LNtSNs7fK87N5IfB5Oz9oy9mWnQw/TduJM95YPiSfb+/mXlDAxx5czfYL9rKr0UKZquE
         tYxIco6SbhOf5EpKT/emq0KuHOZBrb1R7P8tBSiJh7n09ykqUkbVq/rJDmFd/1Hv8FT3
         X3D8MsISYr3hWyKYbEfXOI/yr9gIpX/xOh1LQqTZitONUdozBmTExTm8eZrcomVaFPlw
         adBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOfJDj7y+29ZeViL6kV6ywYnxqJxhhS/scmeQ+AwyUU=;
        b=eNuwJbaZhGW928JoZ3rcgPHUVHQU7CMgiKzLZ7P3Ywjgc6QS28LfLiYyPgAfQ21H60
         /0Xa3kPeoJN0Sjk3Hyn6OBO3AsP12Zk6JOREVsb7rQTyxGeIW0DLeenr0Fo+bB80AaoX
         9jrYs2LTfwEivGIgYB+CQ3l4Thp53jRel3JH8WyJT6amV5OlakvFWK4ekLzQlHmEPB/M
         UZY2zwdKd7aprQCEHjEvErHfj+QnUXO8Oy8YW++LSyrgW8mi560X/NaSxel79QwUyQS0
         i/YYfjLTzc8mmmb/4F+Dz1LFuMywWo4AtelXaEsqD/443BD7nzau8vjU+jcGUe9ZN1GW
         H60Q==
X-Gm-Message-State: AOAM532ePe9PXEYS1iKrWVj64/WIR3jG4GsBJUQgK87yvNdvjtp8ge1J
        HZiX0s8GUl+fvn0ILQEGv2wsbQ==
X-Google-Smtp-Source: ABdhPJxwE9siZ4vhGtQgx5DvuECLtki3M1efXqBKTmVa3SLokn14BDGvexxUi8KQBLfqf4CQsC5FUQ==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr3590217wmg.68.1606397774983;
        Thu, 26 Nov 2020 05:36:14 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id l3sm9056280wrr.89.2020.11.26.05.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:36:14 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 2/4] input: touchscreen: melfas_mip4: Remove a bunch of unused variables
Date:   Thu, 26 Nov 2020 13:36:05 +0000
Message-Id: <20201126133607.3212484-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126133607.3212484-1-lee.jones@linaro.org>
References: <20201126133607.3212484-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/melfas_mip4.c: In function ‘mip4_report_touch’:
 drivers/input/touchscreen/melfas_mip4.c:474:5: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
 drivers/input/touchscreen/melfas_mip4.c:472:5: warning: variable ‘pressure_stage’ set but not used [-Wunused-but-set-variable]
 drivers/input/touchscreen/melfas_mip4.c:469:7: warning: variable ‘palm’ set but not used [-Wunused-but-set-variable]
 drivers/input/touchscreen/melfas_mip4.c:468:7: warning: variable ‘hover’ set but not used [-Wunused-but-set-variable]

Cc: Sangwon Jee <jeesw@melfas.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/melfas_mip4.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index f67efdd040b24..9c98759098c7a 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -465,13 +465,9 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
 static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
 {
 	int id;
-	bool hover;
-	bool palm;
 	bool state;
 	u16 x, y;
-	u8 pressure_stage = 0;
 	u8 pressure;
-	u8 size;
 	u8 touch_major;
 	u8 touch_minor;
 
@@ -480,14 +476,11 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
 	case 1:
 		/* Touch only */
 		state = packet[0] & BIT(7);
-		hover = packet[0] & BIT(5);
-		palm = packet[0] & BIT(4);
 		id = (packet[0] & 0x0F) - 1;
 		x = ((packet[1] & 0x0F) << 8) | packet[2];
 		y = (((packet[1] >> 4) & 0x0F) << 8) |
 			packet[3];
 		pressure = packet[4];
-		size = packet[5];
 		if (ts->event_format == 0) {
 			touch_major = packet[5];
 			touch_minor = packet[5];
@@ -501,14 +494,10 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
 	default:
 		/* Touch + Force(Pressure) */
 		id = (packet[0] & 0x0F) - 1;
-		hover = packet[1] & BIT(2);
-		palm = packet[1] & BIT(1);
 		state = packet[1] & BIT(0);
 		x = ((packet[2] & 0x0F) << 8) | packet[3];
 		y = (((packet[2] >> 4) & 0x0F) << 8) |
 			packet[4];
-		size = packet[6];
-		pressure_stage = (packet[7] & 0xF0) >> 4;
 		pressure = ((packet[7] & 0x0F) << 8) |
 			packet[8];
 		touch_major = packet[9];
-- 
2.25.1

