Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572E243D7C2
	for <lists+linux-input@lfdr.de>; Thu, 28 Oct 2021 01:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhJ0XzY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 19:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ0XzX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 19:55:23 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC42C061570;
        Wed, 27 Oct 2021 16:52:57 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso6454893pjm.4;
        Wed, 27 Oct 2021 16:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o30oFxSEheIowu8firbjQSpUW9PFh3svfA9csR9L5bc=;
        b=gZcCbf5A4Iz2RVaOiNqGV0rb3dNpVuSCmHUJhZzzbo0FDIQCDq/l/Uhb9oi5K9z+/j
         9of5h47nEojIs58MXBDdHgRVeHt1DhMkXB//a6T6Eku4yA5hrwTOxJ4gty4S4lT/0Zwy
         CxewsbEXIwTXANrQxD/iQKFJSj1tApSPjOlVhIsbRtdLU0iEDyDEudDn8GzMJuHfAzub
         sGVK9Wf6ykORyyusSH40JNuBgjn3sX3UwKaFlBMcWiz4tzmeRT+5D5mq6jUPVKx454PV
         L8yULehV6HhK7apBbYleFDN5PZc37XQGbKp+7R/piV3ALYX19zmoQlxVuZ0kkWPcpJZw
         mnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o30oFxSEheIowu8firbjQSpUW9PFh3svfA9csR9L5bc=;
        b=Sqsv5nXdOSk9l75ouuVKWsbiqAwG/nl0ow9UyFI/m9Nstb2k/Pf4zUxkTReGf4nukx
         2ATOaQ/igV3w4kCNR4PBdYxOECWxUnqoW0VuttXHyqPCfPLUb/3YpOt6MgMv0cAGFXJe
         /s94i+MFSicvgIiyAJodt2mf0EAgwaCKbESuv7F+4z5RNHm3BVPWQoebM743JJ2X6cVP
         DQTlxIYDAYiWGdkSlqtxa8hZnQQOoHUR6js8Ik1GxYYrR1dxcBbZGhNqDHJOPSQ1jWDz
         Y0J8Ku/O7JFkOvB+QiK45pLZAqzmLZ/l9321lPPudToPrXY6KOR6IxaLuO6LHgUryikR
         7GPw==
X-Gm-Message-State: AOAM530wMRanQUa6Fd2hYgLqd907fhMgxT8yX009C6gHFXtGCluYT+FB
        MYNgZJZ/nplimEZSJfD2NSk=
X-Google-Smtp-Source: ABdhPJx8Y8s/2EjI44ZPbnql4NQFfI+3BFQDDCPd6zNKNNMIsTVK9cEg+RjPs5Wkd9jQLUaBBvCbdg==
X-Received: by 2002:a17:90a:d194:: with SMTP id fu20mr813359pjb.177.1635378777343;
        Wed, 27 Oct 2021 16:52:57 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id s18sm695366pfc.87.2021.10.27.16.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 16:52:56 -0700 (PDT)
From:   Lv Ruyi <cgel.zte@gmail.com>
X-Google-Original-From: Lv Ruyi <lv.ruyi@zte.com.cn>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Yang Guang <yang.guang5@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: use swap() to make code cleaner
Date:   Wed, 27 Oct 2021 23:52:44 +0000
Message-Id: <20211027235244.6164-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Yang Guang <yang.guang5@zte.com.cn>

Using swap() make it more readable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/hid/hid-tmff.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
index 90acef304536..f5b902d1a174 100644
--- a/drivers/hid/hid-tmff.c
+++ b/drivers/hid/hid-tmff.c
@@ -78,7 +78,6 @@ static int tmff_play(struct input_dev *dev, void *data,
 	struct hid_field *ff_field = tmff->ff_field;
 	int x, y;
 	int left, right;	/* Rumbling */
-	int motor_swap;
 
 	switch (effect->type) {
 	case FF_CONSTANT:
@@ -105,9 +104,7 @@ static int tmff_play(struct input_dev *dev, void *data,
 
 		/* 2-in-1 strong motor is left */
 		if (hid->product == THRUSTMASTER_DEVICE_ID_2_IN_1_DT) {
-			motor_swap = left;
-			left = right;
-			right = motor_swap;
+			swap(left, right);
 		}
 
 		dbg_hid("(left,right)=(%08x, %08x)\n", left, right);
-- 
2.30.2

