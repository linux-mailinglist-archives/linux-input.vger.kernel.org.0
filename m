Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6637724BE
	for <lists+linux-input@lfdr.de>; Mon,  7 Aug 2023 14:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbjHGMya (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Aug 2023 08:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjHGMya (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Aug 2023 08:54:30 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3AC1BC
        for <linux-input@vger.kernel.org>; Mon,  7 Aug 2023 05:54:28 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe655796faso2192592e87.2
        for <linux-input@vger.kernel.org>; Mon, 07 Aug 2023 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eidu.com; s=google; t=1691412867; x=1692017667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DfdvCxJfYM4Q/0857W5zzq1ylp3XZu5ufiHO0W7npE=;
        b=NfKlzMirniZlL4MK+W0oWS+PMjewSnQUH7dv/mYhOCMkkCCSbkmIbjHqVyq9gY0jOE
         CDQTYhjlEqxs68SNlXERbj++vtZKG7VQDlYFEUyHcRoW1MV/psHuKC7qTJ2Yb43b7b7c
         M68ulnBpStBpM3LngpFr/yoxOeTYQcJZOE+YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691412867; x=1692017667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DfdvCxJfYM4Q/0857W5zzq1ylp3XZu5ufiHO0W7npE=;
        b=XabSA1iXRWo41aY3vKUPW9bZUhi94KkQEO+Hl49/p3xS8cv1YvzsRiopy6OlaN/n2T
         k4GXUmuBtq2Z//3a5eKvQw9qw400iBGE1IVU3a87zhvUJkV7UVrRuzLdNrNm6DYNhP+A
         kK3D9ipVu5qmJBFkOrxAr4oFCkG52nVEE/G511d+EaO65Wl4iTd1PAkXwgpaBbexIxtH
         43zMIr8EcbGSBt0H3enxfLwMSe15Tu/kXxvamC7l7sc8mdk0ZdCy1VWcaV1LXOyubfcy
         0IgdQRrEbdrInkW3eD3Q3vLUjPCYRpETVlUkxQbzUrZWgV+K+I/RQKUatEyJwEPI2WgJ
         wObg==
X-Gm-Message-State: AOJu0YzbWTO6XQMWk726JyuZ2XMmrO6tiKKJMkiBVB7Y85rj78oRfZuv
        FF7a+KXgtQOn2lN/TVqedEHDrQ==
X-Google-Smtp-Source: AGHT+IGc65e+QiIXdQqkXYK9WSXJtZnOWJJu+WEt8uVCjMUPob4MxUGNsEhI5KC+wBKXBJTQ0iXiRg==
X-Received: by 2002:a05:6512:472:b0:4fd:fadc:f1e with SMTP id x18-20020a056512047200b004fdfadc0f1emr5574797lfd.44.1691412867057;
        Mon, 07 Aug 2023 05:54:27 -0700 (PDT)
Received: from felix.. (ip5f5aeb7e.dynamic.kabel-deutschland.de. [95.90.235.126])
        by smtp.googlemail.com with ESMTPSA id b3-20020aa7cd03000000b0052229d203a4sm5180707edw.36.2023.08.07.05.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 05:54:26 -0700 (PDT)
From:   Felix Engelhardt <felix.engelhardt@eidu.com>
Cc:     Felix Engelhardt <felix.engelhardt@eidu.com>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/input/touchscreen/goodix.c: Add support for ACPI ID GDX9110
Date:   Mon,  7 Aug 2023 14:47:23 +0200
Message-Id: <20230807124723.382899-1-felix.engelhardt@eidu.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Goodix touchscreen controller with ACPI ID GDX9110 was not recognized
by the goodix driver. This patch adds this ID to the list of supported IDs,
allowing the driver to be used with this device. The change will allow
Linux to be used on ~1 million tablet devices used in Kenyan primary
schools.

Signed-off-by: Felix Engelhardt <felix.engelhardt@eidu.com>
---
 drivers/input/touchscreen/goodix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 4f53d3c57e69..9cdc01eb00c9 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1379,6 +1379,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
 static const struct acpi_device_id goodix_acpi_match[] = {
 	{ "GDIX1001", 0 },
 	{ "GDIX1002", 0 },
+	{ "GDX9110", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, goodix_acpi_match);
-- 
2.39.2

