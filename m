Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAED16DC0AF
	for <lists+linux-input@lfdr.de>; Sun,  9 Apr 2023 18:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjDIQpZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 12:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjDIQpY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 12:45:24 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C4010FF
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 09:45:24 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2465835cf6fso328982a91.1
        for <linux-input@vger.kernel.org>; Sun, 09 Apr 2023 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681058723; x=1683650723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ckKd8a0U1q1GcHzUV8msjehKvhe+3DrvoXzQ82WRs8=;
        b=gXUffbyuulcVKCLv8c84zouueHotpU00t7gCK2i/KxxhTUWGOZwaBJj9hwvUrFPqmn
         2DrnaWLLsvNWR4W2yma38RU4TngKdI8XlKwdOtPDE2Ujgz14BdyWw3PKuGRuFX67up65
         ozNrN4wZgr0Nrn7aygnZiQ739v9j8EZw3/I+SWsSUsrHCaKhKkLbOkdtX0RYtJMWnft6
         ZufiDkRI45DyDswnGsSOfgtLrhId1Ggp7cKltiPAbBth1lAJxK79sgY8WZdCFb7l+cEv
         DGiE8mcAY39CoAY7tcKmTAt8gzkQK4jzUqJeGc5Ge1Ka1MVeYouv2NfKK9fV11VaweRo
         vF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681058723; x=1683650723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ckKd8a0U1q1GcHzUV8msjehKvhe+3DrvoXzQ82WRs8=;
        b=LNA+RNy+gcwrRTRs3rrlRxH674x0iTGW8PXujNAXdu+rl39tcuInDHQI7VBrQ/fNHd
         05N5oVx2iPa0JyPX1cD0Ce7SJiNkoYcQW9bSsP9kF73TXggTTp3VgypWNT/QLt0iajJf
         Q8whZxtM2rjgBulDDz380KVeu5KyjA3pO7g2FXrFYWWxe88f/ec98Gzu1Gf8enPzgjSF
         jMnS6IDqUokUN/ndCyzwoOfLuj5SyOXWE8M1/m4rZgELqCy5mQPEVLiwgdG0Ay+eGLCK
         jkCMImIB8r3JvuAioctUNgfQC5ggv3/6k5bajbk7o+kgpb4aP2Tl84Q/BFocRbF3NncO
         ua0Q==
X-Gm-Message-State: AAQBX9cKfzpnfQd+lI4HYEqm8mkn1yqXS/bm+CWz6thJv2sUEer12A2b
        hUjwDrj/uS5pondyeZ73XCemobXkhpk=
X-Google-Smtp-Source: AKy350YlJM485svA29VmG+XmDK2VPAwSZjHj1na6iqiKzV53tFbYR58SzcRDeRpnHuLEbrSTAszg5A==
X-Received: by 2002:a17:90a:cb12:b0:246:868e:2d58 with SMTP id z18-20020a17090acb1200b00246868e2d58mr3468671pjt.3.1681058722920;
        Sun, 09 Apr 2023 09:45:22 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb91:8e8d:5c96:4571:a905:9b6b:37ab])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090ae68100b00234115a2221sm5067106pjy.39.2023.04.09.09.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 09:45:22 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     linux-input@vger.kernel.org
Cc:     jkosina@suse.cz, jason.gerecke@wacom.com, aaron.skomra@wacom.com,
        joshua.dickens@wacom.com, Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: Set a default resolution for older tablets
Date:   Sun,  9 Apr 2023 09:42:29 -0700
Message-Id: <20230409164229.29777-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some older tablets may not report physical maximum for X/Y
coordinates. Set a default to prevent undefined resolution.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
---
 drivers/hid/wacom_wac.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 9312d611db8e..e499b447d48c 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1895,6 +1895,7 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 	int fmax = field->logical_maximum;
 	unsigned int equivalent_usage = wacom_equivalent_usage(usage->hid);
 	int resolution_code = code;
+	int resolution = hidinput_calc_abs_res(field, resolution_code);
 
 	if (equivalent_usage == HID_DG_TWIST) {
 		resolution_code = ABS_RZ;
@@ -1915,8 +1916,15 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 	switch (type) {
 	case EV_ABS:
 		input_set_abs_params(input, code, fmin, fmax, fuzz, 0);
-		input_abs_set_res(input, code,
-				  hidinput_calc_abs_res(field, resolution_code));
+
+		/* older tablet may miss physical usage */
+		if ((code == ABS_X || code == ABS_Y) && !resolution) {
+			resolution = WACOM_INTUOS_RES;
+			hid_warn(input,
+				 "Wacom usage (%d) missing resolution \n",
+				 code);
+		}
+		input_abs_set_res(input, code, resolution);
 		break;
 	case EV_KEY:
 	case EV_MSC:
-- 
2.39.2

