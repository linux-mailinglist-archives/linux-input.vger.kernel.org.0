Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B513F614A
	for <lists+linux-input@lfdr.de>; Tue, 24 Aug 2021 17:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238200AbhHXPIg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Aug 2021 11:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238198AbhHXPIf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Aug 2021 11:08:35 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9E8C061764
        for <linux-input@vger.kernel.org>; Tue, 24 Aug 2021 08:07:51 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so1982714pjb.3
        for <linux-input@vger.kernel.org>; Tue, 24 Aug 2021 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CrvJVyQNbZShLMemqxYoBqBYQ2Gzkms2NEqpFCTxgFg=;
        b=GG4p17qQULEkXmJuULN17D8CN5s5hbWcjAhzTs+yEw4sfqEOoxK69v/ddJeJFi9F8l
         nRr3VMWv1O0I/shDr6IAwuZRtAgcbJLsXH8qf7uzcFE8LHl5FJdyOh+SwWYNYvgaEG7j
         j+0UhS8FdDrf18ODv46GBM8Ar3oaL/LsDUZkl4i7XXAUt+kPpX+e5D5+Cs5zKaKUgrGU
         LZ243AZhx8QhYfqM1+gi3U1VdcQo6LDT9n1mEjFJsv16BtbKE/FOpqdexMj7RwT6gFN7
         WaGKuAtV33XawCfgRyynhAqjmRJOblIB+jhuxJsBJDuqie7+igJzw/leNshOIvgiJfZi
         HaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CrvJVyQNbZShLMemqxYoBqBYQ2Gzkms2NEqpFCTxgFg=;
        b=Sy06UP/TxNX3FQjyzuwp7YI5uRRzhr3r6pk299J1lCRksljrRIYOweAnUfh0D+E+Ew
         SmwgODEOra3K2erqNstlnu4oYfyXQJ74iSb9BjMF+UStdw0npRVahGcNjuVe+UadYWq3
         U9wR7oAQBzBSSdYrnFG+IMdBaHxjeKb65U/1QH3xGwjJNrO+9UYJmbiFWSB94mGMsp+n
         y9aogJh5QvkVmpX3rU4JU1rMIoULDw6fGrCL4ijZDRomA+USTmDO09SCzo+BrVYjaS28
         akM2o3btomcOARtjnzE6oMwLOkE3IOcGxaIjpxjNdPrCLpPN93/oqd5tNEEswEbCici5
         MVeg==
X-Gm-Message-State: AOAM530O8cDdWsxQ8fRs2mN8F57kNzjp/IVkoHrL1C8G1khSbjne3rSS
        a9m/hXbrLxqrAUC2an1ukRCK
X-Google-Smtp-Source: ABdhPJzlUc2kfz5lNrVZPHUeOBMRtjZxhr1snXZ66Z5Oy/f4K6sIuxQmhHNRYkNeqRJMPY/QF1SD5w==
X-Received: by 2002:a17:902:c40e:b029:12c:cbce:2d18 with SMTP id k14-20020a170902c40eb029012ccbce2d18mr33623315plk.60.1629817670545;
        Tue, 24 Aug 2021 08:07:50 -0700 (PDT)
Received: from localhost.localdomain ([175.157.61.62])
        by smtp.gmail.com with ESMTPSA id y12sm23800336pgk.7.2021.08.24.08.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:07:50 -0700 (PDT)
From:   "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        paskripkin@gmail.com
Subject: [PATCH v3] HID: betop: fix slab-out-of-bounds Write in betop_probe
Date:   Tue, 24 Aug 2021 20:37:30 +0530
Message-Id: <20210824150730.9118-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210816201544.26405-1-asha.16@itfac.mrt.ac.lk>
References: <20210816201544.26405-1-asha.16@itfac.mrt.ac.lk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Syzbot reported slab-out-of-bounds Write bug in hid-betopff driver.
The problem is the driver assumes the device must have an input report but
some malicious devices violate this assumption.

So this patch checks hid_device's input is non empty before it's been used.

Reported-by: syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com
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

