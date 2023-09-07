Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAE6797817
	for <lists+linux-input@lfdr.de>; Thu,  7 Sep 2023 18:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238078AbjIGQls (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Sep 2023 12:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbjIGQl3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Sep 2023 12:41:29 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B004352A9
        for <linux-input@vger.kernel.org>; Thu,  7 Sep 2023 08:56:36 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401b0d97850so12710595e9.2
        for <linux-input@vger.kernel.org>; Thu, 07 Sep 2023 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694102112; x=1694706912; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cR64pP5v8VMQvK6J+liUDnoig8gBbgzJepG2Ih8CIRg=;
        b=cY1QEjn8Q0YH1W8wCQ5EqXm1wO9ZlIJRagJvfeF9zr3Obo1f0upXSg07p+5rDYPhf/
         8tKErr96Gsy+2mHhgpBR+WxX6mwNEcKd1Fc1rluNhh3AEgLG2ZVS25vqamP6B6s9kSm0
         CeY3i7Xjv/of3xYczow/KSI+Zu40x9GI3JXtB/39TTFqYMQgqFCMS+8/WFsDQSSgH6m4
         njXgCt1aeJihTk50iIiUjIt+ZM3SCoWzNvxdJErzJNUMfXFhZ/LRu2Mmzi4KyYGVBxhi
         y7J8Um5CiXKff9V86t9JaEoFy8ybjdWyPrIGAWNxjWXEx7cpFWqoGfXmHS7XPrZVmwvm
         u/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102112; x=1694706912;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cR64pP5v8VMQvK6J+liUDnoig8gBbgzJepG2Ih8CIRg=;
        b=CKHB8SQIOK6xxn2+Rl5U32sAsYv95cNQZ8KQMCsJAGqj4Mqd06ClmtEsbBqOnDuaCg
         iJGsQZk//+3PTQhNIR+1YPadV7nshYyM2zmmlPfPMmqhkYRq91nYa9XvyfSia8fwOYDE
         AFOTacRPe7e3+UnRhW/qu1POtfX1cYTy1bKYk2wa1pCjmIEa3O1HLDWejpgnheQfV3SH
         LDH+TY0fwnZmupFZ3sCuOe0DyjQUoOQM976X8tdZvTDJmnRxb+6Y1vRzoZXRt/CTOGwz
         BGTx58+64j3pPjHUeE5MSC9/1KAXQiJEVRCr4Nwlkp/daaGGUr7SOkjuwMbuO66eKZfy
         8gCQ==
X-Gm-Message-State: AOJu0YzWtbNvCj/Sg5EbHNBj/xtkniSj9dOx23h8pK06eEhB39CJGIZD
        rBxVeQgFVg/wLVAFb0uH3xXumHqvWtgGfhbLXOU=
X-Google-Smtp-Source: AGHT+IGbhcc700Z65Vg5dhYXY19DZRwb8OPMvUCZt/Zg3IUmCAF6Hg9VeHZzoUmppxCvqiGE3+yE2A==
X-Received: by 2002:a5d:6a89:0:b0:316:f3cf:6f12 with SMTP id s9-20020a5d6a89000000b00316f3cf6f12mr4103507wru.48.1694080538416;
        Thu, 07 Sep 2023 02:55:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t2-20020a05600001c200b003196e992567sm22908207wrx.115.2023.09.07.02.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:55:38 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:55:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
Message-ID: <5c1cc882-b2b8-45cb-b8f7-4b35d1800e5d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The hid_hw_raw_request() function returns negative error codes or the
number bytes transferred.  If it returns negative error codes, then the
problem is that when we check if "ret < sizeof(arctis_1_battery_request)",
negative values are type promoted to high unsigned values and treated as
success.  Add an explicit check for negatives to address this issue.

Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-steelseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 43d2cf7153d7..485d2287d58a 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -390,7 +390,7 @@ static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
 	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
 				 write_buf, sizeof(arctis_1_battery_request),
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret < sizeof(arctis_1_battery_request)) {
+	if (ret < 0 || ret < sizeof(arctis_1_battery_request)) {
 		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
 		ret = -ENODATA;
 	}
-- 
2.39.2

