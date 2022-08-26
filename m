Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3300C5A310A
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 23:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344926AbiHZVfS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Aug 2022 17:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiHZVfR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Aug 2022 17:35:17 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C85B2ED5F
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 14:35:15 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id z3-20020a17090abd8300b001fd803e34f1so648978pjr.1
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 14:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=76iqNdjgigHf4w9YIMbZStXVIiObfViF/sK6H+coclw=;
        b=O27F+9fhxHRohHh1aqCbRCzyBw69EcPX/wMza9Fxvx8Z1859VAR8I4rC+WFusttDT5
         f7EESmDLqi06COJAUWVBaWvUl/IUYIPmBMWUuKj98d7dTfCuWDFnUsKfEjf2h/2UkfTX
         gD24zQ9wxHgWAsgQDM0W1z9YtKBFkH2+BTFyd5Bx0luTKcCThka36P1Oftr3LmbZ8DQR
         yyUZiYlRqUWthGmjHDAkskkmM5zGoXF7h7+adsmT3vUXU549Ks+ADQZlMjzEcA0+26Hn
         JJ3GVvkH8UmNnHtliIqHN3ZrNaJQPp74IPsMtoUAe44nEEg58ltfUjqvo9yFkdO7NmAg
         3yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=76iqNdjgigHf4w9YIMbZStXVIiObfViF/sK6H+coclw=;
        b=27n9Vf+wCAdWN/NC5SrzWuMMy/uEPEnRYXu4rKbpzq3e998VVuAij33EoFvjUfnyOL
         1TMIGZmX+CofjhRcKJKt4wmETGwXqtH+Eg/DmWd8oPV65tLL3aDYzE7YTvIM01bHTcNJ
         o1VXRHI3cBykQQ+vr6SoJDZqcFRbINHDD8qrytE0GHxotLEUvt/CzIHF3atjE66S8n0Y
         2mZ9Az30wXry17GCxIZ//XQyRUoFqtZ3wAncrOusL7LbsDxa6sUlDDuytsTRZ5BpKMlT
         rsLP1VzEA39sfVRfBEi7pqf7CSpgEavYlOD22jynmM6aG0S8DFlhtL9GivEFVS+8zb1U
         O0lA==
X-Gm-Message-State: ACgBeo0ZFyXdZXyDLgNXuwyLxTBRsN4R8fY9KL8w6vxAv276dJHYVqZw
        pDegBRchqr5n3BZvhsuy1vZi28+W1cQ=
X-Google-Smtp-Source: AA6agR5wmiYwOXouJXExBBbkffRVL6Fq0wgawYbOl3RPumwjWzISblfAf94zzdfN9N9AdjsJvjg8xg==
X-Received: by 2002:a17:902:768c:b0:173:19a3:27c4 with SMTP id m12-20020a170902768c00b0017319a327c4mr5475549pll.107.1661549715024;
        Fri, 26 Aug 2022 14:35:15 -0700 (PDT)
Received: from fedora.. ([2601:1c2:4f01:65f0:3613:e8ff:feb3:9ff2])
        by smtp.gmail.com with ESMTPSA id i63-20020a17090a3dc500b001faee47021dsm2115416pjc.45.2022.08.26.14.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 14:35:14 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     linux-input@vger.kernel.org
Cc:     jkosina@suse.cz, Ping Cheng <ping.cheng@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 1/2] HID: wacom: Add new Intuos Pro Small (PTH-460) device IDs
Date:   Fri, 26 Aug 2022 14:34:02 -0700
Message-Id: <20220826213402.9950-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the new PIDs to wacom_wac.c to support the new model in the Intuos Pro series.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Tested-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
---
 drivers/hid/wacom_wac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 4fc64bd..b36a957 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4890,6 +4890,10 @@ static const struct wacom_features wacom_features_0x3c6 =
 static const struct wacom_features wacom_features_0x3c8 =
 	{ "Wacom Intuos BT M", 21600, 13500, 4095, 63,
 	  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
+static const struct wacom_features wacom_features_0x3dd =
+	{ "Wacom Intuos Pro S", 31920, 19950, 8191, 63,
+	  INTUOSP2S_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7,
+	  .touch_max = 10 };
 
 static const struct wacom_features wacom_features_HID_ANY_ID =
 	{ "Wacom HID", .type = HID_GENERIC, .oVid = HID_ANY_ID, .oPid = HID_ANY_ID };
@@ -5065,6 +5069,7 @@ const struct hid_device_id wacom_ids[] = {
 	{ BT_DEVICE_WACOM(0x393) },
 	{ BT_DEVICE_WACOM(0x3c6) },
 	{ BT_DEVICE_WACOM(0x3c8) },
+	{ BT_DEVICE_WACOM(0x3dd) },
 	{ USB_DEVICE_WACOM(0x4001) },
 	{ USB_DEVICE_WACOM(0x4004) },
 	{ USB_DEVICE_WACOM(0x5000) },
-- 
2.37.2

