Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72E75331C3
	for <lists+linux-input@lfdr.de>; Tue, 24 May 2022 21:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234401AbiEXT3c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 May 2022 15:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240921AbiEXT33 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 May 2022 15:29:29 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301BC6D39E
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 12:29:28 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e28so26505857wra.10
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4aWOllEU2hrm3nQp+p1i7T5mkegGyfcYGHd8G2sUYU=;
        b=Hob5rt8KtoXjKQ1XspinTW1NJfRVkfeIrpX4Obw+hMDjZ91c3uQAGduY3KOYJrvzmH
         7WjMxTMZw+sTIz2hCbRrX6JEbs4RS+NhzBxv2UpL1rHyo5le3h4oWXF6XJooi+iOLHM5
         xCDYm/08bEO5GbtX5xMGlMNkzo/7zj1/NNRoIiFlfd604VDK4ZNHN0ebLIA+JwVTplmc
         LoHUqepuvIfyiqbzuSinouFt8GdQdgwluO90mB+/Uzj90bXvm13qG4/SL7oLnzPGTGgs
         jXZeGaQfGzgpFObKRpfih90coMGWD9jwwOfo41+YGgvAu7Esc4omQ7K00ug+UzB2P/AI
         TTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4aWOllEU2hrm3nQp+p1i7T5mkegGyfcYGHd8G2sUYU=;
        b=iM0yNhrhihQ5YxsVVIXE1PtMQPuUhk0xgC8qU9XsVTVT4Cxhqny6hd2SA+b0k30NpL
         FVUC/E8b9x481moly9HcCWW0tPQw/Du1Q/zvl5/CiSga8ld3kJStkHKWxo6fzEhuALkl
         A56rIwAMUGxoHx0Y1n7acIBWDQKWT77YuGysrwpRRU3EQPKDSTgqX2r3PKFIxcAEtGd2
         G44OmQ6JnwK2cAPWcQkRG/3rWERL+BSPCtrcIkDvUPlNnBci14GSwmWitn4fs3mZSn/G
         /L96cA9ieNamN6t3ec7Driu9mt33ETG7Wsu0n/Hs70UrIpaLE9ZJ3VY/5BcnbxgkZZJj
         RUpQ==
X-Gm-Message-State: AOAM531mn3ZLqO6htgdl6Ks5dDP4DyHs/OiDWcl8IrulKPCGrwjxukaH
        xV8zY7syPp/E4PHnCkaUZTRWQ0zFNFY=
X-Google-Smtp-Source: ABdhPJzG/sQo6khN4OwabuxlbNhghdSwK/IXZzrdPyIVS7lh3Oyq308sogTSmMWNGP45p6DmUtI9cg==
X-Received: by 2002:a5d:584c:0:b0:20f:de2e:bd1a with SMTP id i12-20020a5d584c000000b0020fde2ebd1amr9831716wrf.670.1653420566595;
        Tue, 24 May 2022 12:29:26 -0700 (PDT)
Received: from localhost.localdomain (62-11-172-155.dialup.tiscali.it. [62.11.172.155])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0039732f1b4a3sm155950wms.14.2022.05.24.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 12:29:26 -0700 (PDT)
From:   Dario Pagani <dario.pagani.146@gmail.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, kimi.h.kuparinen@gmail.com,
        dario.pagani.146@gmail.com
Subject: [PATCH] differentiate between model and attachment of Thrustmaster's joysticks
Date:   Tue, 24 May 2022 21:25:30 +0200
Message-Id: <20220524192529.43838-1-dario.pagani.146@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make the driver differentiate between model and attachment of a
Thrustmaster's steering wheel. What it was thought to be the model code
is, in reality, a tuple <model, attachment>.
if a specific match is found then use the proper init code otherwise
try anyway with the init code of a steering wheel of the same model
but different attachment code; finally if no match is found keep old
behavior and stop the init process.

Link: https://github.com/scarburato/hid-tminit
Signed-off-by: Dario Pagani <dario.pagani.146@gmail.com>
Co-developed-by: Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Signed-off-by: Kim Kuparinen <kimi.h.kuparinen@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 57 +++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index c3e6d69fdfbd..6ca0e11f80d7 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -47,7 +47,8 @@ static const unsigned int setup_arr_sizes[] = {
  * and vice-versa
  */
 struct tm_wheel_info {
-	uint16_t wheel_type;
+	uint8_t model;
+	uint8_t attachment;
 
 	/*
 	 * See when the USB control out packet is prepared...
@@ -63,16 +64,17 @@ struct tm_wheel_info {
  * Note: TMX does not work as it requires 2 control packets
  */
 static const struct tm_wheel_info tm_wheels_infos[] = {
-	{0x0306, 0x0006, "Thrustmaster T150RS"},
-	{0x0200, 0x0005, "Thrustmaster T300RS (Missing Attachment)"},
-	{0x0206, 0x0005, "Thrustmaster T300RS"},
-	{0x0209, 0x0005, "Thrustmaster T300RS (Open Wheel Attachment)"},
-	{0x0204, 0x0005, "Thrustmaster T300 Ferrari Alcantara Edition"},
-	{0x0002, 0x0002, "Thrustmaster T500RS"}
-	//{0x0407, 0x0001, "Thrustmaster TMX"}
+	{0x00, 0x02, 0x0002, "Thrustmaster T500RS"},
+	{0x02, 0x00, 0x0005, "Thrustmaster T300RS (Missing Attachment)"},
+	{0x02, 0x03, 0x0005, "Thrustmaster T300RS (F1 attachment)"},
+	{0x02, 0x04, 0x0005, "Thrustmaster T300 Ferrari Alcantara Edition"},
+	{0x02, 0x06, 0x0005, "Thrustmaster T300RS"},
+	{0x02, 0x09, 0x0005, "Thrustmaster T300RS (Open Wheel Attachment)"},
+	{0x03, 0x06, 0x0006, "Thrustmaster T150RS"}
+	//{0x04, 0x07, 0x0001, "Thrustmaster TMX"}
 };
 
-static const uint8_t tm_wheels_infos_length = 4;
+static const uint8_t tm_wheels_infos_length = 7;
 
 /*
  * This structs contains (in little endian) the response data
@@ -99,7 +101,8 @@ struct __packed tm_wheel_response
 			 * Seems to be the model code of the wheel
 			 * Read table thrustmaster_wheels to values
 			 */
-			uint16_t model;
+			uint8_t attachment;
+			uint8_t model;
 
 			uint16_t field2;
 			uint16_t field3;
@@ -109,7 +112,8 @@ struct __packed tm_wheel_response
 		struct __packed {
 			uint16_t field0;
 			uint16_t field1;
-			uint16_t model;
+			uint8_t attachment;
+			uint8_t model;
 		} b;
 	} data;
 };
@@ -211,7 +215,9 @@ static void thrustmaster_model_handler(struct urb *urb)
 {
 	struct hid_device *hdev = urb->context;
 	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
-	uint16_t model = 0;
+	uint8_t model = 0;
+	uint8_t attachment = 0;
+	uint8_t attachment_found;
 	int i, ret;
 	const struct tm_wheel_info *twi = NULL;
 
@@ -220,22 +226,31 @@ static void thrustmaster_model_handler(struct urb *urb)
 		return;
 	}
 
-	if (tm_wheel->response->type == cpu_to_le16(0x49))
-		model = le16_to_cpu(tm_wheel->response->data.a.model);
-	else if (tm_wheel->response->type == cpu_to_le16(0x47))
-		model = le16_to_cpu(tm_wheel->response->data.b.model);
-	else {
+	if (tm_wheel->response->type == cpu_to_le16(0x49)) {
+		model = tm_wheel->response->data.a.model;
+		attachment = tm_wheel->response->data.a.attachment;
+	} else if (tm_wheel->response->type == cpu_to_le16(0x47)) {
+		model = tm_wheel->response->data.b.model;
+		attachment = tm_wheel->response->data.b.attachment;
+	} else {
 		hid_err(hdev, "Unknown packet type 0x%x, unable to proceed further with wheel init\n", tm_wheel->response->type);
 		return;
 	}
 
 	for (i = 0; i < tm_wheels_infos_length && !twi; i++)
-		if (tm_wheels_infos[i].wheel_type == model)
+		if (tm_wheels_infos[i].model == model)
 			twi = tm_wheels_infos + i;
 
-	if (twi)
-		hid_info(hdev, "Wheel with model id 0x%x is a %s\n", model, twi->wheel_name);
-	else {
+	if (twi) {
+		// Trying to find the best attachment
+		for (attachment_found = twi->attachment == attachment; !attachment_found && i < tm_wheels_infos_length && tm_wheels_infos[i].model == model; i++)
+			if (tm_wheels_infos[i].attachment == attachment) {
+				twi = tm_wheels_infos + i;
+				attachment_found = 1;
+			}
+
+		hid_info(hdev, "Wheel with (model, attachment) = (0x%x, 0x%x) is a %s. attachment_found=%u\n", model, attachment, twi->wheel_name, attachment_found);
+	} else {
 		hid_err(hdev, "Unknown wheel's model id 0x%x, unable to proceed further with wheel init\n", model);
 		return;
 	}
-- 
2.25.1

