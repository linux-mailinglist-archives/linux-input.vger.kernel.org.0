Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235907A1F5C
	for <lists+linux-input@lfdr.de>; Fri, 15 Sep 2023 14:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235196AbjIOM7Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Sep 2023 08:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbjIOM7P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Sep 2023 08:59:15 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96BB10E
        for <linux-input@vger.kernel.org>; Fri, 15 Sep 2023 05:59:08 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-402d0eda361so23386135e9.0
        for <linux-input@vger.kernel.org>; Fri, 15 Sep 2023 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782747; x=1695387547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wkICMbZeb9K27rKShEhdEgIC1HVJdUeuWJvlVg6+FQ=;
        b=a7Yl8Wp3K2I1TU6MJxq7M9h/CYslsoo/i1ln6kxAPmdN44s3E0RFPooH20Fj878XR6
         LUTWlklP+bLgkSPzODHtvx0NktL8sTBsshVNtSmYTt+KeJzoiJakNpHkf7n3bQ3TZJDw
         e9cpugChqnh4EsgmgtqJHIJiXF9/uKvBnx3K3YKZTbxyKiWeg3fmdCPsV6Q8LiS+EqtI
         xdP2XJYBIjcaHIYySqKtTqPt65O/OJ9heO0Q1RdQMSwvQgLnSW3vF4yTQ6S51nXTed3P
         vZl8TD3TlnAl1+Euz3cjkIKjt9BuIVE+KbYGchBZpFxNiOhAt5rK4O8jfz0rccJ7UCDb
         DqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782747; x=1695387547;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wkICMbZeb9K27rKShEhdEgIC1HVJdUeuWJvlVg6+FQ=;
        b=SA2b3YaUX1c7yDjm2zqKPF9n4ShPSQU2qCqHU1+/pmW7EOk9j2v22PnsgKe8nAcwE3
         /ej60QWncCdZFCh1fb/rv+7pc1UJdHCmejjAEkjrBMUridzk5vGZN+5iLxjdARJsRsjs
         I2A+MSG2ohuw54AEEepLTTeHV5AdF/s03G2hJjO4YIrpsWEoMnqDl8mC3D4MC4l0Y59J
         9IE9bY7g4s8mS8nFQert/7v8oIJiBNXIYo6oGPaLuLy42txNLp6Gla1s3mT06TgMVurg
         CqvdPnY07Q4top6KlWYJvc/uoii2IYyl+IrQbMJW7QWIYpJR4OkuS9cr5RPxNiEw5RVn
         rvLQ==
X-Gm-Message-State: AOJu0Yxuzl4g92dWuIDShJNJFAjbo/pVWjrBLmcuyev42hgjaR3a31aU
        elEYUp9ElGnmfEiLkxLFv4Hwes3QzvbQKUmLnsU=
X-Google-Smtp-Source: AGHT+IFyoQcN09Isr3VMkGu17Z7fRcD4qsm/VxDnd5QaHo6qEbSKPticjZW+NfnyQeZD9MkcGdYgkw==
X-Received: by 2002:a1c:7c0e:0:b0:403:cab3:b763 with SMTP id x14-20020a1c7c0e000000b00403cab3b763mr1508908wmc.33.1694782747356;
        Fri, 15 Sep 2023 05:59:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hn40-20020a05600ca3a800b003fef19bb55csm4576653wmb.34.2023.09.15.05.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:59:07 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:59:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
Message-ID: <6e0a33e3-1564-419a-9946-b2d0afa0f98d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The hid_hw_raw_request() function returns negative error codes or the
number bytes transferred.  The problem is that when it returns negative
error codes and we check if "ret < sizeof(arctis_1_battery_request)",
then the negative values are type promoted from int to high unsigned long
values and treated as success.

This was detected using Smatch:

    drivers/hid/hid-steelseries.c:393 steelseries_headset_arctis_1_fetch_battery()
    warn: error code type promoted to positive: 'ret'

Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Re-word the commit message.  Add the Smatch warning.  Use a cast
instead of an explicit check for negatives.

 drivers/hid/hid-steelseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 43d2cf7153d7..b3edadf42d6d 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -390,7 +390,7 @@ static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
 	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
 				 write_buf, sizeof(arctis_1_battery_request),
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret < sizeof(arctis_1_battery_request)) {
+	if (ret < (int)sizeof(arctis_1_battery_request)) {
 		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
 		ret = -ENODATA;
 	}
-- 
2.39.2

