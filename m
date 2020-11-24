Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029E32C344C
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 00:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbgKXXBR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Nov 2020 18:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730166AbgKXXBR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Nov 2020 18:01:17 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4BEC0613D6;
        Tue, 24 Nov 2020 15:01:17 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id t22so276296ljk.0;
        Tue, 24 Nov 2020 15:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BNJegkHBp3jAxE9NdlHPV8CkVpROAwTgoEJJRjbP6SQ=;
        b=VXBKkRlR+p5IG4teFpC6H539+qdjKhMqTBTy7id7eD2q0VYUQfFRW3Ku3dM69ECgCV
         h1uTPm5XjwhvJwt8T1NWC4/Y8EeQb8vDDIuoTasuaGcWmpeDgzmRihoiqLC6NZlvfCGp
         8Sf8KQKRyy4vh4Wn64eLESBOxf3mLAcMA7P88RTzwS6o+bLeeC6ntbXiZB39h7QZLr1c
         6RxRtvDfoKKaYbyky5UaF3EpjHuZqUE0XAxObqplhSZgUlnCqagELx7lqhsgYzvAjzuK
         dUqBplWVGkh6yYeMQBAhrYpgNbgXbqIeb4+O+jRUwPUtYDhWu1yU+12/dTQZu4j8uidj
         CxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BNJegkHBp3jAxE9NdlHPV8CkVpROAwTgoEJJRjbP6SQ=;
        b=dLVfnLUJ6kJPZh0SeFWG+WR87Kfv56Pl2ZL+i4AERJAwAoVc+eIRmDQv4bmuwgURrk
         M4xcyWUBxfilFnEVjJp9zhPw4KrOaSA7uMeE2TpcuL5IQDk1mDz6jkJuR6i4sizZy22k
         RDJKDoppFCEciogYZlWq1pwbmmgeOsgJ2aV24ZdcXmRkpsH+6wo7pMvsLeVdp/x1fSkF
         o4n4gCcfi70q6szZsCYFVxLMRMpcEpgoEpQOWPcGY0XooGS7Tc0qR1Tz5aZfM8mN4beA
         m/RfnKpujSW1MHUeXCz7dHgxrWSfbEcX8mkdi2UbIDLUwDRELvVz6YNAw2hpNs7708Lr
         EtCg==
X-Gm-Message-State: AOAM531nPB09x4zShuNrFAQyVjqH+UELnNxVM9Sr+3xgekT8YM+cIOzc
        JnAveRiF8jhanlGNzXvxiUXAR57ps6Q=
X-Google-Smtp-Source: ABdhPJzMKb+/mZ7SRndXPa4v80lDOfDqqeQdRLe/0lhv1tFyno8yKiCRItfikTnQTAY0nZ5l/GZnNg==
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr210436lji.418.1606258875638;
        Tue, 24 Nov 2020 15:01:15 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
        by smtp.gmail.com with ESMTPSA id q13sm41120lfn.15.2020.11.24.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 15:01:14 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] HID: wacom: Constify attribute_groups
Date:   Wed, 25 Nov 2020 00:01:09 +0100
Message-Id: <20201124230109.67543-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These are never modified, so make them const to allow the compiler to put
them in read-only memory. It also allows the compiler to shrink the
resulting module with ~900 bytes, test-built with gcc 10.2 on x86_64.

   text    data     bss     dec     hex filename
 204377   42832     576  247785   3c7e9 drivers/hid/wacom_old.ko
 204240   42064     576  246880   3c460 drivers/hid/wacom_new.ko

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/hid/wacom_sys.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index cd71e7133944..045c464228d9 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1173,7 +1173,7 @@ static struct attribute *cintiq_led_attrs[] = {
 	NULL
 };
 
-static struct attribute_group cintiq_led_attr_group = {
+static const struct attribute_group cintiq_led_attr_group = {
 	.name = "wacom_led",
 	.attrs = cintiq_led_attrs,
 };
@@ -1194,7 +1194,7 @@ static struct attribute *intuos4_led_attrs[] = {
 	NULL
 };
 
-static struct attribute_group intuos4_led_attr_group = {
+static const struct attribute_group intuos4_led_attr_group = {
 	.name = "wacom_led",
 	.attrs = intuos4_led_attrs,
 };
@@ -1205,7 +1205,7 @@ static struct attribute *intuos5_led_attrs[] = {
 	NULL
 };
 
-static struct attribute_group intuos5_led_attr_group = {
+static const struct attribute_group intuos5_led_attr_group = {
 	.name = "wacom_led",
 	.attrs = intuos5_led_attrs,
 };
@@ -1216,13 +1216,13 @@ static struct attribute *generic_led_attrs[] = {
 	NULL
 };
 
-static struct attribute_group generic_led_attr_group = {
+static const struct attribute_group generic_led_attr_group = {
 	.name = "wacom_led",
 	.attrs = generic_led_attrs,
 };
 
 struct wacom_sysfs_group_devres {
-	struct attribute_group *group;
+	const struct attribute_group *group;
 	struct kobject *root;
 };
 
@@ -1238,7 +1238,7 @@ static void wacom_devm_sysfs_group_release(struct device *dev, void *res)
 
 static int __wacom_devm_sysfs_create_group(struct wacom *wacom,
 					   struct kobject *root,
-					   struct attribute_group *group)
+					   const struct attribute_group *group)
 {
 	struct wacom_sysfs_group_devres *devres;
 	int error;
@@ -1264,7 +1264,7 @@ static int __wacom_devm_sysfs_create_group(struct wacom *wacom,
 }
 
 static int wacom_devm_sysfs_create_group(struct wacom *wacom,
-					 struct attribute_group *group)
+					 const struct attribute_group *group)
 {
 	return __wacom_devm_sysfs_create_group(wacom, &wacom->hdev->dev.kobj,
 					       group);
@@ -1847,7 +1847,7 @@ static struct attribute *remote##SET_ID##_serial_attrs[] = {		\
 	&remote##SET_ID##_mode_attr.attr,				\
 	NULL								\
 };									\
-static struct attribute_group remote##SET_ID##_serial_group = {		\
+static const struct attribute_group remote##SET_ID##_serial_group = {	\
 	.name = NULL,							\
 	.attrs = remote##SET_ID##_serial_attrs,				\
 }
-- 
2.29.2

