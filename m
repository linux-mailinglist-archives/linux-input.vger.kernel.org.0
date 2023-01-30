Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77600681CBF
	for <lists+linux-input@lfdr.de>; Mon, 30 Jan 2023 22:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjA3VaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Jan 2023 16:30:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjA3VaG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Jan 2023 16:30:06 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3DC265B3
        for <linux-input@vger.kernel.org>; Mon, 30 Jan 2023 13:30:05 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id n34-20020a056a000d6200b005912ead88aeso6030465pfv.3
        for <linux-input@vger.kernel.org>; Mon, 30 Jan 2023 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ks4GVEUR6PT1089FpiWUNbhf7r3jxSIVo2HXW9yiGc=;
        b=AyWfK8ZP3f9NXvlS/ej80Q75u28ntZwmpIbPlH89Bvi6y+rP+oiMGsRqFXQvS+4iQM
         JGDXtIm4n8abYWDQqx9LF8V6mXy4R+PWOeXpe3FeV4IWic3G+yhS7lMROIAP9HD4qDbL
         aozIzrRQ9sZEydcP+0a+RzQZNSq764XOKNgszkL37OKAt3Nl1er2pLnvav1Ya4hxhhO5
         NlsvSIShuTaZhETkxziHndZjY6fc344Lm8V/y0lEINWSrRDfyWJr92nLMULuExALOP9o
         K9HQri43U/bfjeVZ9rQifHlHX17igWqWgAmQrDvjwWWNpbv3rorbwO1Oy5R/rBoRlnmx
         EdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ks4GVEUR6PT1089FpiWUNbhf7r3jxSIVo2HXW9yiGc=;
        b=0rQMmW5H8XUTGBcHXBU3T0SpD6mbB/Y5vLTeQGZ5lGoIYn86orha4xARaPuar7/5+V
         CDcoEQzPR2ImtvzrXtP6hvphCWqQikGBixAK6xTuj1KLLOy8DQI6UdbaVu4l+hFpLwaW
         k2rnx9eGYHmSKYXirWPewOcjI4ThY5x9txvUd5kGxHJpDW96rB2W0KRGRcEFwl0HgLvc
         2ue3aTQmJHWLIxa31Wht4y7zGFy6heU3uDidbXunHwbxTfu8ZXLJ0AZzFWWcg0HQnTLu
         I/57H8U0SfM3lHrhfd9+9Ydul+SQEAm/ImAyNIdh1kfAzpGcmT8cViFR5d34ovHR8sM1
         BzsA==
X-Gm-Message-State: AFqh2kqHd9ggBc+xdvg3eUem0PcGoYadBBaQIeL8gj6pGAY2cQbhYnSn
        TFQKKWwMknlHobUBiGNOxvqtlwHlboM=
X-Google-Smtp-Source: AMrXdXsCr+HOyKPh/c0urHNsticErkuB3IaiKNAB3BkKly7Dg8NhUF3Rieqh2fjB3WGczQmgwQsnlQJ5cm0=
X-Received: from xz2.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:d01])
 (user=xnzhao job=sendgmr) by 2002:a17:902:b20c:b0:194:7cb3:2527 with SMTP id
 t12-20020a170902b20c00b001947cb32527mr6452658plr.4.1675114205168; Mon, 30 Jan
 2023 13:30:05 -0800 (PST)
Date:   Mon, 30 Jan 2023 21:29:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230130212947.1315941-1-xnzhao@google.com>
Subject: [PATCH] HID: core: Fix deadloop in hid_apply_multiplier.
From:   Xin Zhao <xnzhao@google.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Xin Zhao <xnzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The initial value of hid->collection[].parent_idx if 0. When
Report descriptor doesn't contain "HID Collection", the value
remains as 0.

In the meanwhile, when the Report descriptor fullfill
all following conditions, it will trigger hid_apply_multiplier
function call.
1. Usage page is Generic Desktop Ctrls (0x01)
2. Usage is RESOLUTION_MULTIPLIER (0x48)
3. Contain any FEATURE items

The while loop in hid_apply_multiplier will search the top-most
collection by searching parent_idx == -1. Because all parent_idx
is 0. The loop will run forever.

There is a Report Descriptor triggerring the deadloop
0x05, 0x01,        // Usage Page (Generic Desktop Ctrls)
0x09, 0x48,        // Usage (0x48)
0x95, 0x01,        // Report Count (1)
0x75, 0x08,        // Report Size (8)
0xB1, 0x01,        // Feature

Signed-off-by: Xin Zhao <xnzhao@google.com>
---
 drivers/hid/hid-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 3e1803592bd4..5c72aef3d3dd 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1202,6 +1202,7 @@ int hid_open_report(struct hid_device *device)
 	__u8 *end;
 	__u8 *next;
 	int ret;
+	int i;
 	static int (*dispatch_type[])(struct hid_parser *parser,
 				      struct hid_item *item) = {
 		hid_parser_main,
@@ -1252,6 +1253,8 @@ int hid_open_report(struct hid_device *device)
 		goto err;
 	}
 	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
+	for (i = 0; i < HID_DEFAULT_NUM_COLLECTIONS; i++)
+		device->collection[i].parent_idx = -1;
 
 	ret = -EINVAL;
 	while ((next = fetch_item(start, end, &item)) != NULL) {
-- 
2.39.1.456.gfc5497dd1b-goog

