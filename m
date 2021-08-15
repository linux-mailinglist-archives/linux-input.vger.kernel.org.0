Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11DAD3EC827
	for <lists+linux-input@lfdr.de>; Sun, 15 Aug 2021 10:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236557AbhHOIcz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Aug 2021 04:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbhHOIcz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Aug 2021 04:32:55 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034A4C061764
        for <linux-input@vger.kernel.org>; Sun, 15 Aug 2021 01:32:24 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso22574107pjb.1
        for <linux-input@vger.kernel.org>; Sun, 15 Aug 2021 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=UHcKuv5O/mzdpWQ8UofB89FE5dbzLYR4/iV02jGFcSE=;
        b=tjwJykmV95oRLTxd/WxhXOqC5QfUo6q9jxsPpnqXoPMyiENyY7O0n4Xh9tOLIpK2xS
         8GlGXE675dAykuZVHBjoUkvuQXOjrS3fsLTdff+tewr903pRtA/qSzcpoqXVR0+wQDm/
         wbJTvj0OuLiRYBGIwQlZUOc010miqSxsqkBQSPaPoUBoGq60zwou3PlQPiM1m9VORyYT
         Bxq/1pC3hUcnWC7z61w3HZKo6v0ZSuMvZPN6YKk78lIgKuraKrIV7yY0Bylt0u9ClC92
         +xxoTXXlQxVoXRMRtecrKVXiYzxyQCmvn8W621djcA6Teq6QQY7nCwgPZILuT0ANwKWm
         cHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UHcKuv5O/mzdpWQ8UofB89FE5dbzLYR4/iV02jGFcSE=;
        b=mR8te4+HQe3f7ZLN/k7l41zjrIuNsmwhDIkxEJRPCybe/liZvT3rXaQ6TXRsEJyEes
         j8QbUyCBj2WcE2MFDA+Kcq3IYV7YgmlQn2JWnhS2VObvIysI6vh3fTQy6PUNUm5FdAl+
         UBY9wut7EKHfQLHgZgkunyR/qaHl06UuThxUO78w/cdPMMF36xrsyirxijHz/3HkYPtn
         JCBL/+9BhlctM+JB4d6Fi95+DQLYGeEGjoEYmOX0qVUdfNS6xJfKwr0yCYoFn6e+7Fn8
         SmPPu94EXL+2mE4NF+3TDVgh2tEYfW1yYpXd2pj5rl4ltUQpfuo2H7ZF1FOgHEVa+POj
         1ZTQ==
X-Gm-Message-State: AOAM532ikJuUeYDYZy6X/zVpVcJuDYpv6JbXhdqfy10FGp+imxTjkdAE
        ogFsqfZNSmwOL5RpqojpbtQuk9zj0CeTQrE=
X-Google-Smtp-Source: ABdhPJzxXrxHbClgwJUtfcwgOQ6Fy/Rzy6VmQ0cxKiiw/99piS75VSnpeNRYDvdz+xN4qrF+urV30w==
X-Received: by 2002:a17:90a:4093:: with SMTP id l19mr11065068pjg.118.1629016344371;
        Sun, 15 Aug 2021 01:32:24 -0700 (PDT)
Received: from localhost.localdomain ([123.231.122.209])
        by smtp.gmail.com with ESMTPSA id q140sm7587812pfc.191.2021.08.15.01.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 01:32:24 -0700 (PDT)
From:   "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fix slab-out-of-bounds in betopff_init function
Date:   Sun, 15 Aug 2021 14:01:55 +0530
Message-Id: <20210815083155.10559-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch resolves the bug 'KASAN: slab-out-of-bounds Write in betop_probe' reported by Syzbot.

Patch resolve the bug by checking hid_device's hid_input is non empty before it's been used.

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
---
 drivers/hid/hid-betopff.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
index 0790fbd3fc9a..6a1f894b0e97 100644
--- a/drivers/hid/hid-betopff.c
+++ b/drivers/hid/hid-betopff.c
@@ -56,19 +56,20 @@ static int betopff_init(struct hid_device *hid)
 {
 	struct betopff_device *betopff;
 	struct hid_report *report;
-	struct hid_input *hidinput =
-			list_first_entry(&hid->inputs, struct hid_input, list);
+	struct hid_input *hidinput;
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev = hidinput->input;
+	struct input_dev *dev;
 	int field_count = 0;
 	int error;
 	int i, j;
 
-	if (list_empty(report_list)) {
+	if (list_empty(&hid->inputs)) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
 	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
 
 	report = list_first_entry(report_list, struct hid_report, list);
 	/*
-- 
2.17.1

