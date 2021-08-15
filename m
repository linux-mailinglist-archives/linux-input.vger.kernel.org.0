Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCFC3EC978
	for <lists+linux-input@lfdr.de>; Sun, 15 Aug 2021 16:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhHOOIW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Aug 2021 10:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbhHOOIW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Aug 2021 10:08:22 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CD6C0613CF
        for <linux-input@vger.kernel.org>; Sun, 15 Aug 2021 07:07:52 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id n5so2030185pjt.4
        for <linux-input@vger.kernel.org>; Sun, 15 Aug 2021 07:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=ClDhBxxnU3zgt+GP/nL78ZXud/YSzYtwZxMTdgC2iPQ=;
        b=YvmxKMqfsv/y+xBEUjsEAM4Ph+u1fXXXpTTgJmFtCxeVJkEA5KCqD+VOJ29FBMkuhA
         ybKrHpMCM3te2cBavyAlnJOuRYH5+y9bT4RGWPuPmjadoKLvtzNi3rDB/8Efjor+pFxf
         PkHs5zgmL4Mx1D6X4pCOt7MtAozAzJSJFY7KW9xgU3c6faayh2NlFDXwxJ3q8iUAyoVG
         zwOE7CCay+oq2x58KmpDTV76pNXemZITkLX7H7WhPZucMuKfZ1mVnm1Mqp32BzYDaVfw
         bXd77Me4CahWItiB35sVLWmRIIAcqhgLGitCROKwjRM2bRXHgkq+oAq6ISNAK2HrC8FZ
         XBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ClDhBxxnU3zgt+GP/nL78ZXud/YSzYtwZxMTdgC2iPQ=;
        b=WlEgZOQNaJ5N5C6ooHJMNirJwYBwEkqTgm7qRuOJuxUJmpqhZ6IrIhSALbdV2yW8f/
         4na6IV+FF22f8Yoc6Og2E/+a5XcjBnqkWUkV+fjzQCeHUhmgIOROZXY3JB+jTm2j9eMP
         70o1PhWG2Qbk15VKd7PmFQnzYEwjIblajnDiAzInVUCdCtiqGzF4x7OcOZk0sfNUnGUd
         /GnBnDkwU1jr7RUkInIeOJrfEtsDX5W8PFRJkXZekpWj8IQPpxxj3KkNu7nPWxVvMK78
         I7NLZWUuh7CciM0xyIi98pFE9n9mhEqw/ax48GSKNHCDXo09qhnPlOSrGVSTIrLw5t9R
         BnRA==
X-Gm-Message-State: AOAM530ziEIntcONkGWpbRPHUOcGjoRcIlNq2xOxnrLDFhKqqkZHe42F
        vJJjeuXWIAh9YT5BOqdrh+ss
X-Google-Smtp-Source: ABdhPJzbsW+3WEhruOjQB4aHuqzI8YERsMMN4GjHAxZ+HxJaxSYKkBWQnAfO8WxDeuoMLS7Z1jVE5Q==
X-Received: by 2002:a65:6398:: with SMTP id h24mr11556556pgv.367.1629036471456;
        Sun, 15 Aug 2021 07:07:51 -0700 (PDT)
Received: from localhost.localdomain ([123.231.122.209])
        by smtp.gmail.com with ESMTPSA id b1sm6640561pfv.151.2021.08.15.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:07:51 -0700 (PDT)
From:   "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fix slab-out-of-bounds in betopff_init function
Date:   Sun, 15 Aug 2021 19:37:25 +0530
Message-Id: <20210815140725.19973-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch resolves the bug 'KASAN: slab-out-of-bounds Write in betop_probe' reported by Syzbot.

Patch resolve the bug by checking hid_device's hid_input is non empty before it's been used.

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
---
 drivers/hid/hid-betopff.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
index 0790fbd3fc9a..467d789f9bc2 100644
--- a/drivers/hid/hid-betopff.c
+++ b/drivers/hid/hid-betopff.c
@@ -56,15 +56,22 @@ static int betopff_init(struct hid_device *hid)
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
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+
+	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
+	dev = hidinput->input;
+
 	if (list_empty(report_list)) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
-- 
2.17.1

