Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC936E29FD
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 20:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjDNSWR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 14:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjDNSWR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 14:22:17 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDEEEE
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 11:22:16 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-54fe82d8bf5so46816217b3.3
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 11:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681496535; x=1684088535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ5WVsoc3o7N3Ck1OmqgnTDrsh08RyelYna5eOEho4g=;
        b=hLAzsgd3+JKQf9jE/SBrgJikGZ9J8eoNTFg0WrgQ1O0354R8FysgFLdMmYZZtDz/Av
         esKIOSQIbbasczjuC8MHT6ykSLt2GzjvAAIxHmg7SjSXEnOsmD//DAG+xox0Y1htxysl
         Z/sYJ0wG1iE0ftFdXjdTN5uh4YXf35cAvKYGW/RV10mdnOryfY5U609sMWjEIBMy2Ido
         QeaUXXFiSFIehBzFTNkcbhNYFBWNifoUPW3UFJN74o4TUcqH+bbDtVf+1jEFSoe5EiQS
         cBm62v3T2StcawV2UD1pPX/OgoeJyL0857pXKMkqctGmKTPXFVuGSYPWXAwM2htRz/ID
         Byww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681496535; x=1684088535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQ5WVsoc3o7N3Ck1OmqgnTDrsh08RyelYna5eOEho4g=;
        b=gYrE88J7xc0CbJumKOpWqliHpu8Wdchc4wDODfN5xjlQv+iZi1Zdn06PS7Qhqli6Om
         8ZuhgdH0BFvJz9CcsdV8UijbjZdmfnGweAzaKyUEokxtGZwOVZm2SnMlxUE719K/RA16
         K+Fdfx0Jeulv7HNIqgLLgUA9GDJ+Mwn5pV0sj3IlTYvHWyh8qHoG0Xq1d4jEP7VlIrg7
         G3s71OMdzJQJAKP7HlQOReV3eWDnGLhTPjaoh2d37xidZsUzYwvB3UliNt+vuvd8tfMS
         25sqWgDME4CnLpRn0r4On72SczNYS7vb7ThPMdVT/dbCilduV2noDkKJSETOYsdEU7PS
         RPMg==
X-Gm-Message-State: AAQBX9eRtv14eMS0dpJFYw6cb6hpeAFKUj39IT5KvJfkklkWqAAS86Yx
        OoTBoZneE3AGGzHGg1BStxu15GjufvdF+w==
X-Google-Smtp-Source: AKy350bDvZ4uZi9kLh+2A5ontOLJyOt44JND5jmpd1mBVZWeBhVi+GfRaA64cyhNeldFiiCDKGA5Wg==
X-Received: by 2002:a0d:db45:0:b0:538:49a4:b166 with SMTP id d66-20020a0ddb45000000b0053849a4b166mr6847667ywe.11.1681496534748;
        Fri, 14 Apr 2023 11:22:14 -0700 (PDT)
Received: from horus.lan (71-34-68-4.ptld.qwest.net. [71.34.68.4])
        by smtp.gmail.com with ESMTPSA id u125-20020a817983000000b005463f6ae720sm1331582ywc.68.2023.04.14.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 11:22:14 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: Check for string overflow from strscpy calls
Date:   Fri, 14 Apr 2023 11:22:10 -0700
Message-Id: <20230414182210.383218-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.40.0
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

From: Jason Gerecke <killertofu@gmail.com>

The strscpy function is able to return an error code when a copy would
overflow the size of the destination. The copy is stopped and the buffer
terminated before overflow actually occurs so it is safe to continue
execution, but we should still produce a warning should this occur.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
---
 drivers/hid/wacom_sys.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 8214896adadad..7192970d199a0 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2224,7 +2224,9 @@ static void wacom_update_name(struct wacom *wacom, const char *suffix)
 		} else if (strstr(product_name, "Wacom") ||
 			   strstr(product_name, "wacom") ||
 			   strstr(product_name, "WACOM")) {
-			strscpy(name, product_name, sizeof(name));
+			if (strscpy(name, product_name, sizeof(name)) < 0) {
+				hid_warn(wacom->hdev, "String overflow while assembling device name");
+			}
 		} else {
 			snprintf(name, sizeof(name), "Wacom %s", product_name);
 		}
@@ -2242,7 +2244,9 @@ static void wacom_update_name(struct wacom *wacom, const char *suffix)
 		if (name[strlen(name)-1] == ' ')
 			name[strlen(name)-1] = '\0';
 	} else {
-		strscpy(name, features->name, sizeof(name));
+		if (strscpy(name, features->name, sizeof(name)) < 0) {
+			hid_warn(wacom->hdev, "String overflow while assembling device name");
+		}
 	}
 
 	snprintf(wacom_wac->name, sizeof(wacom_wac->name), "%s%s",
@@ -2500,8 +2504,10 @@ static void wacom_wireless_work(struct work_struct *work)
 				goto fail;
 		}
 
-		strscpy(wacom_wac->name, wacom_wac1->name,
-			sizeof(wacom_wac->name));
+		if (strscpy(wacom_wac->name, wacom_wac1->name,
+			sizeof(wacom_wac->name)) < 0) {
+			hid_warn(wacom->hdev, "String overflow while assembling device name");
+		}
 	}
 
 	return;
-- 
2.40.0

