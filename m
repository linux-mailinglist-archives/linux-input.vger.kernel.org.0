Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8659A37AE4F
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 20:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhEKSV6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 14:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbhEKSVz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 14:21:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1AAC061574;
        Tue, 11 May 2021 11:20:48 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so1758099wmq.0;
        Tue, 11 May 2021 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DXAhBfbLQ+Z6qa68rOJY6vHkUQpdl/o/mBrv046HmPE=;
        b=aN9uGxsVCwSGaaMATi9By/8HDdoqPOl0q3lr3cIzdtbfu/G/eNywekhLkna127VCEt
         tZE3NE6TAu9KsM/jlbwp3k1l/Tme4wHoarmv/dBahLYoiZ4Z3UHRSmlNrfJq1Be+F7mC
         Crr01OCpUEiz2VLgF3B7HVTViQXg3r0iBnHVsBsvQKMB6n3W4pGIX7NE0STtN7flNZO0
         OL4jN4QzJ3SYcRtQcy15+SLA61tzqOf4IziNuXew0YgLKH82KFCEAu9WytWtAqgrnQ7q
         CBeL309KqrkyZh16Vomg8ESDCKwEHHxpLujOcfZxjnV8ukFV/EkHkorJ07kzxGlVkwol
         8E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DXAhBfbLQ+Z6qa68rOJY6vHkUQpdl/o/mBrv046HmPE=;
        b=d1rndeaMIlnhuyPBa0yczMhYr89DczuAEArd2zBsbYttsu4ibFwqfy95UHFY8cpfHD
         GPrFFxsnanYShQuHPznoHAaA6zSA+UJNeT4t/zeRqMMiUlPZ/i4TSH+i3RPUnpg+tVGy
         Gb5oYD3/4eS3C9ex3OdMkp4+icDs1ko12eDjd+UP+8pW2e+bz5atKtA6uHyKEurMLiAc
         56Gb1f/QeWVT3H6puBipGt1/OoH4K6lNrR+1TOneiDNK1tQEHoxPjh/doAidT0XXx6Qw
         JYVX45ERB9nFs+v52+Pq/OAhWr3yoyA9sN8tag2Mz8Lhr3gxRgc0GnHZtK0ve8ebC2Bl
         xQoQ==
X-Gm-Message-State: AOAM532i1cAGNzLAR3/fuvX0BYeEof4lLiFEDUO4JqXpLsbygO4RwX9Q
        z09UprtmmGspR7pigaH2WOE=
X-Google-Smtp-Source: ABdhPJxV18DCIwXmjWUt0yrboA4C4tGwbySkgdDTrM7UyarjQvbbUVLI4Dd1XWDU8CIePuUZeXs8pA==
X-Received: by 2002:a05:600c:4f04:: with SMTP id l4mr33852177wmq.18.1620757247138;
        Tue, 11 May 2021 11:20:47 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id d15sm28012133wrw.71.2021.05.11.11.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:20:46 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 5/5] HID: magicmouse: report battery status
Date:   Tue, 11 May 2021 20:20:23 +0200
Message-Id: <20210511182023.730524-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511182023.730524-1-jose.exposito89@gmail.com>
References: <20210511182023.730524-1-jose.exposito89@gmail.com>
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

