Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBC77053B4
	for <lists+linux-input@lfdr.de>; Tue, 16 May 2023 18:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjEPQ01 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 May 2023 12:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjEPQ00 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 May 2023 12:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A96A30C4
        for <linux-input@vger.kernel.org>; Tue, 16 May 2023 09:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684254285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=a3FIsBwvLJd8bGvVv7dnr0FhAmLIXHj6zTtEadqChU4=;
        b=ESy4CMLQ4vc9r3t4fhjdjc4GqngI/20bXEBcVN2mIK/xG+SezrqQvhRKTl01PzHy+GV4VE
        xnnMGMX2I/i+5+fpVVb9BZzEZfeZ8/le1Yt+tGJu4OUTNjjR+U0TTbKYmW1E+aegkGDy62
        Lp3zvp9biavgNeKQ79E87oV+gzImVEo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-W3vYL-KmPbikLaaa9sxEaA-1; Tue, 16 May 2023 12:24:44 -0400
X-MC-Unique: W3vYL-KmPbikLaaa9sxEaA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9663552473fso1450888966b.1
        for <linux-input@vger.kernel.org>; Tue, 16 May 2023 09:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254283; x=1686846283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3FIsBwvLJd8bGvVv7dnr0FhAmLIXHj6zTtEadqChU4=;
        b=IPGdMZZWXyZgb5g21nWhNAsa16sscSZN34f5tUSMVItadE2G4Xt011AhcnGE6HgO+y
         lPmki5TWTBfAxCl5Sbe9D12DqarMigbXHCgtX4OtK4fjpKtw6TTktk4tK27R4tOk63of
         dTfKTPAwgxn5hfDnPsUTVUaTWT/l0AVosAKq16d1aQrrmOVY3uTDdWYrNYH+/xW+zwKY
         UrJSz5+QJiKbLQHHtznjBKrHmaDLCv3ic7IEkH3jkEGL7AKU9Be1LsLTsEWv8IlTk3aU
         s/QvHYHIDUacyJQeQRivWzkQYUC695mTsqi67q1AlrpaPjDFk+LKGYjVOBn1BaRxCD+A
         N1Og==
X-Gm-Message-State: AC+VfDxGxjt9y2L08SwztofaoHcz/56EyII90L0oHfGXbxULPEQW6tAB
        d4VAGuCEFtQ4Xi8ejXmrhNcuhVemgVtWlbngNnirdmCPcdg1lLIuvVWh4lP3IttdInvydQeuOe6
        94IVbPvflXYRqX1d2LTKrLLY=
X-Received: by 2002:a17:907:ea1:b0:96a:7cc9:d038 with SMTP id ho33-20020a1709070ea100b0096a7cc9d038mr20985627ejc.37.1684254283177;
        Tue, 16 May 2023 09:24:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VJEFkuiXqs1L2y9Byop/2x0Fk2/VbMoPdJeW2FbwCObi+PgEHAQ+KfKHQZOE6KJh5Qxl6Ww==
X-Received: by 2002:a17:907:ea1:b0:96a:7cc9:d038 with SMTP id ho33-20020a1709070ea100b0096a7cc9d038mr20985598ejc.37.1684254282819;
        Tue, 16 May 2023 09:24:42 -0700 (PDT)
Received: from fedora.redhat.com ([2a06:c701:476e:4300:fe29:2a5c:9188:df81])
        by smtp.gmail.com with ESMTPSA id ks16-20020a170906f85000b00947740a4373sm10953098ejb.81.2023.05.16.09.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 09:24:41 -0700 (PDT)
From:   Dana Elfassy <delfassy@redhat.com>
X-Google-Original-From: Dana Elfassy <dangel101@gmail.com>
To:     eballetb@redhat.com, dmitry.torokhov@gmail.com, javierm@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dana Elfassy <dangel101@gmail.com>
Subject: [PATCH] Input: tests: add test to cover all input_grab_device() function
Date:   Tue, 16 May 2023 19:24:12 +0300
Message-Id: <20230516162412.461066-1-dangel101@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently input_grab_device() isn't covered by any tests
Thus, adding a test to cover the cases:
1. The device is grabbed successfully
2. Trying to grab a device that is already grabbed by another input
   handle

Signed-off-by: Dana Elfassy <dangel101@gmail.com>
---
 drivers/input/tests/input_test.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/input/tests/input_test.c b/drivers/input/tests/input_test.c
index 25bbf51b5c87..cd4db365e9fa 100644
--- a/drivers/input/tests/input_test.c
+++ b/drivers/input/tests/input_test.c
@@ -124,10 +124,38 @@ static void input_test_match_device_id(struct kunit *test)
 	KUNIT_ASSERT_FALSE(test, input_match_device_id(input_dev, &id));
 }
 
+
+static void input_test_grab(struct kunit *test)
+{
+	struct input_dev *input_dev = test->priv;
+	struct input_handle test_handle;
+	struct input_handler handler;
+	struct input_handle handle;
+	struct input_device_id id;
+	int res;
+
+	handler.name = "handler";
+	handler.id_table = &id;
+
+	handle.dev = input_get_device(input_dev);
+	handle.name = dev_name(&input_dev->dev);
+	handle.handler = &handler;
+	res = input_grab_device(&handle);
+	KUNIT_ASSERT_TRUE(test, input_grab_device(&handle));
+
+	test_handle.dev = input_get_device(input_dev);
+	test_handle.name = dev_name(&input_dev->dev);
+	test_handle.handler = &handler;
+
+	res = input_grab_device(&test_handle);
+	KUNIT_ASSERT_EQ(test, res, -EBUSY);
+}
+
 static struct kunit_case input_tests[] = {
 	KUNIT_CASE(input_test_polling),
 	KUNIT_CASE(input_test_timestamp),
 	KUNIT_CASE(input_test_match_device_id),
+	KUNIT_CASE(input_test_grab),
 	{ /* sentinel */ }
 };
 
-- 
2.40.1

