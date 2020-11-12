Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CFB2B036F
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgKLLFP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgKLLCR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:17 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E176C0613D1
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:17 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a3so5083468wmb.5
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOfJDj7y+29ZeViL6kV6ywYnxqJxhhS/scmeQ+AwyUU=;
        b=xnYi8HWPfJhINUl5GughYizx5EulzqcrsMAEAjGJ+xbjtyqE85Yq3lTb/b9WroJOez
         fIe6z4/au00Bj0AM1zlZXZI9NgPYdk5/+asccsKCvKWT5OnQoKN7HZIwWI2qhXHEYK0M
         +jvneVxEeh6ociRKLCYbBp7vUDYwpJzFG+pYYR8wOd90y8LAO9eCorbLocrL8HraXRzE
         pIUHRJGpWvTaD2Leq3GUEX9Az/o3beW+/sVSk46BU8z2D+zKRGZSMZURCUZRvlTfy20n
         VyJeGGyDzB0kl92q0YiLuMLJ64+4dnAtMd0DdmXP+OU53Ls2YYcRUIjy8GQNmKSJIp2a
         aJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOfJDj7y+29ZeViL6kV6ywYnxqJxhhS/scmeQ+AwyUU=;
        b=bs4z8XSCwBQ1bozBL8zVvwrQZLspTZMkJrgWp7+tHbbNOL+2WCqS18TWKipID8L05j
         WknAK0se7pyEbovyXueX21+33YkJEcYB4/SRg9YDbDGCDNDQEVNwvnw+7BnL0lYESGnN
         EY+ZsQl8FGjK763xN5NVi7BnAUCfGs5fr3rB58e5kvHKaXN0gW1Q/c8tAbhkusqPCehe
         sXVodUK0ZzFqPaZscaquCGrejWuF0FOENfHFjk1JcYkC5Kyo+aDG7Qyf7wzrxfYaz8Bv
         iYIAAr6QssV5bwvEcQGiUzoidDJGu00zedOIR6GgpZgvK2mux0Cfp9yvPekPX0CDrOo4
         OOyQ==
X-Gm-Message-State: AOAM532Hsy9gvjHSvFDffq70EQ4Ilne8DfH7LpdlABWRoW4y3YG+FjdY
        9TUoNCjhh77S1QoBtdp6AZq/GQ==
X-Google-Smtp-Source: ABdhPJxzQzMyykieVm/6jAmybrxw45zJcIIEK+Qk4odsvnT5XcN6YERSI2FNYga4SW+sJ01ZR86vYQ==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr9229111wmb.16.1605178935753;
        Thu, 12 Nov 2020 03:02:15 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:15 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: [PATCH 06/15] input: touchscreen: melfas_mip4: Remove a bunch of unused variables
Date:   Thu, 12 Nov 2020 11:01:55 +0000
Message-Id: <20201112110204.2083435-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
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

