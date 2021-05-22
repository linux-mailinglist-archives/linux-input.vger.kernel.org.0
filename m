Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C9E38D6CB
	for <lists+linux-input@lfdr.de>; Sat, 22 May 2021 20:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbhEVSHu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 14:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbhEVSHq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 14:07:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FD0C061574;
        Sat, 22 May 2021 11:06:20 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id c14so22365447wrx.3;
        Sat, 22 May 2021 11:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DXAhBfbLQ+Z6qa68rOJY6vHkUQpdl/o/mBrv046HmPE=;
        b=BLxfvyEUa9gSXWp4fZAIG0gTEEmd51FDW5MbBQoN0XwZtp0cRoAr8ixIdvPP2HrYJ8
         Ly+N+JCOiHN3QytZbLTE9+eopYDiAK7QwpPGAymDJDvBuVl2OgPfCLsp8sCvmkYuneH6
         1rWRcKvDi6KkrUjJb1uUeMgxw+0ZCevDGO17hQSiDd8DSTRfQBUuTRjM9FIAchpAdqID
         3mJ2w4mMboEH9pgrmfEMwu9yvvwplYwdSQDP+nEF0EtFGgH/BfHdERkXWOERD974vDzB
         hiUyX6Pin1VYi1W+PGgUC3FUNNnbJfiQ0jxUB7rbU6nca0U5AkSOQjt9YpGVlmz3ia/5
         lKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DXAhBfbLQ+Z6qa68rOJY6vHkUQpdl/o/mBrv046HmPE=;
        b=aV98OYfxCmguFtSpslddpuE5sO9gJxnCq4rQJ3sRSVJlrrRLWYBZlx7rggcSGWPCak
         ZWU7bgFn28O8ynMw/HUKf7Bpn3Hc2YfidRVXyLSVP002K+qaBQdpqCAqFpa9Vcz2Ioxu
         ANqJAEWl3EMqQlUktFcEgN+xXwULJRXZ7IFphNyD8tDAevBXZHlF6deSKLMUF8kOp1Al
         0EoBRdhPEU4vLUjjbFve+5vVHy7VLmKxfKSp3o6FeIu5TIgApl9VhXHcs7N/EbHqK50Q
         8H0+cZCXMEYbvhuYr+9Hq0QK9ORG1wj2t8Hzc3KLzY6Pyf8OobzUyXQlx4USeebZCCXZ
         qSUA==
X-Gm-Message-State: AOAM532uOjPe9b85ur+ezfc7hcg8l9FSA1qoV6CVDFeczfvgNMG12rKB
        Aft2FAE2A4qYZygxWOB0zvA=
X-Google-Smtp-Source: ABdhPJxPbGRlXNSjFslrW+hBeVFVFncyVs//DCdQBT2rh/+Y58Eowdni0mcGMgkmiPt3pshM9wPlnA==
X-Received: by 2002:a5d:5409:: with SMTP id g9mr14358025wrv.321.1621706779212;
        Sat, 22 May 2021 11:06:19 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id v12sm5913217wrv.76.2021.05.22.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 11:06:18 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 5/5] HID: magicmouse: report battery status
Date:   Sat, 22 May 2021 20:06:11 +0200
Message-Id: <20210522180611.314300-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210522180611.314300-1-jose.exposito89@gmail.com>
References: <20210522180611.314300-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Report the battery charging status for the Apple Magic Mouse 2
and the Apple Magic Trackpad 2.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 53e8a10f0551..4085b6698f2c 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -155,6 +155,7 @@ static enum power_supply_property magicmouse_ps_props[] = {
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_SCOPE,
 	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_STATUS,
 };
 
 static bool magicmouse_can_report_battery(struct magicmouse_sc *msc)
@@ -229,6 +230,15 @@ static int magicmouse_battery_get_property(struct power_supply *psy,
 
 		val->intval = msc->battery.capacity;
 		break;
+	case POWER_SUPPLY_PROP_STATUS:
+		if (msc->input->id.vendor == BT_VENDOR_ID_APPLE) {
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+		} else { /* USB_VENDOR_ID_APPLE */
+			val->intval = (msc->battery.capacity == 100) ?
+				      POWER_SUPPLY_STATUS_FULL :
+				      POWER_SUPPLY_STATUS_CHARGING;
+		}
+		break;
 	default:
 		ret = -EINVAL;
 		break;
-- 
2.25.1

