Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15BA970CD08
	for <lists+linux-input@lfdr.de>; Mon, 22 May 2023 23:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbjEVV4f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 May 2023 17:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbjEVV4d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 May 2023 17:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2857109
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684792548;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tvrlT0VjUFrPv1Xm9LKtVtKvLmBUG1wojOlELCABfTE=;
        b=QJDAM6cQF0EnWpVhpL2kJ/S0uq0I4G+jyIUp1u/QnNJoZUnIPG2Eqfo7TBz+5+39YBQc7j
        tGEfHnBjitvu6kOc0iQsB9QxN0yrJsfzlDf8bd8B9pH+m13ERmpzU+THie0sM8qZ44IK49
        5K5fnumVMj7pW3YxDsXzrM7JNA0/OCg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-0E1ITiB1NpG_u441P9Q32g-1; Mon, 22 May 2023 17:55:46 -0400
X-MC-Unique: 0E1ITiB1NpG_u441P9Q32g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30793c16c78so4237048f8f.3
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 14:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684792545; x=1687384545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvrlT0VjUFrPv1Xm9LKtVtKvLmBUG1wojOlELCABfTE=;
        b=jduywR5fNrT9p3/7oAgx9DLzFmje2HEmTlEBZV3qbfjvMQCeHUmZP36WTSWTlv/qIS
         g9if+P9wn9npo4AFKp7tAAsCiIUA9m+jOUrdIJoMJ93VBj6+QMPRg+mqk0dUXmBEdETN
         gkcwgbiFYPxf9EooLTTqz8ig6Pv4MNBEO5yfHjbwAEUvlSOm7TmEeZNRFLuZlLMV1V+L
         pf/WXFLhBT3vtxXkl8Hldwulc1AvbCD+eYkYczHsudYkwbQL0PHQdVxb1rJh10cgsH00
         Y6Z7wrLB7HUl54cKJTMi1JhgRAJ04fWAHzxqh3pJBknlBzhY4mun8fzAYTLp/ZAYhnVJ
         0Hcg==
X-Gm-Message-State: AC+VfDzyQkNYKv4MPUo/PNNvdLKuyo4sOlB3El74iuxxvz9GW1reeWa9
        yY54YG+yMN6u3ZVod0pXUoUZyY5J8LEPwG0jTbAFwm8FjO857ZPxNkRW8XGscAUyyLJm/VDp05i
        FbgN+lL3cG+8TBiYqiNlJfLc=
X-Received: by 2002:adf:f64b:0:b0:309:418f:d52c with SMTP id x11-20020adff64b000000b00309418fd52cmr8278516wrp.63.1684792545486;
        Mon, 22 May 2023 14:55:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4mxg3gAClrquPLy7LNXgWImXsZ/paIw2KFuMApQ6t/fuCKWzN9LE1/F8rfSAnX2JQbGX03Nw==
X-Received: by 2002:adf:f64b:0:b0:309:418f:d52c with SMTP id x11-20020adff64b000000b00309418fd52cmr8278503wrp.63.1684792545041;
        Mon, 22 May 2023 14:55:45 -0700 (PDT)
Received: from fedora.. (143.red-212-170-103.staticip.rima-tde.net. [212.170.103.143])
        by smtp.gmail.com with ESMTPSA id n1-20020adfe781000000b002c54c9bd71fsm8954662wrm.93.2023.05.22.14.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 14:55:44 -0700 (PDT)
From:   Dana Elfassy <delfassy@redhat.com>
X-Google-Original-From: Dana Elfassy <dangel101@gmail.com>
To:     eballetb@redhat.com, dmitry.torokhov@gmail.com, javierm@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dana Elfassy <dangel101@gmail.com>
Subject: [PATCH v3] Input: tests: add test to cover all input_grab_device() function
Date:   Tue, 23 May 2023 00:55:14 +0300
Message-Id: <20230522215514.722564-1-dangel101@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v3:
1. Retrieve test_handle variable to try and grab the device that's
currently grabbed by another handle
2. Add verification that test_handle can indeed grab the device after
it's released by the handle that grabbed it
3. Remove duplicated call for input_grab_device() in KUNIT_ASSERT_TRUE()
functions
Changes in v2:
- Use input_put_device() to decrement the refcount increased by get().
- Remove unnecessary struct input_handle test_handle variable.

 drivers/input/tests/input_test.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/input/tests/input_test.c b/drivers/input/tests/input_test.c
index 25bbf51b5c87..1939cc12bae0 100644
--- a/drivers/input/tests/input_test.c
+++ b/drivers/input/tests/input_test.c
@@ -124,10 +124,42 @@ static void input_test_match_device_id(struct kunit *test)
 	KUNIT_ASSERT_FALSE(test, input_match_device_id(input_dev, &id));
 }
 
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
+	KUNIT_ASSERT_TRUE(test, res == 0);
+
+	test_handle.dev = input_get_device(input_dev);
+	test_handle.name = dev_name(&input_dev->dev);
+	test_handle.handler = &handler;
+	res = input_grab_device(&test_handle);
+	KUNIT_ASSERT_EQ(test, res, -EBUSY);
+
+	input_release_device(&handle);
+	input_put_device(input_dev);
+	res = input_grab_device(&test_handle);
+	KUNIT_ASSERT_TRUE(test, res == 0);
+	input_put_device(input_dev);
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

