Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9277F7E6753
	for <lists+linux-input@lfdr.de>; Thu,  9 Nov 2023 11:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjKIKGt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Nov 2023 05:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjKIKGr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Nov 2023 05:06:47 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C782D6D
        for <linux-input@vger.kernel.org>; Thu,  9 Nov 2023 02:06:45 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc30bf9e22so6354625ad.1
        for <linux-input@vger.kernel.org>; Thu, 09 Nov 2023 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524405; x=1700129205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGm2vHynu/hBFToljMIoyOJ5nVIf243JSwQjqrxxy/0=;
        b=RxQLjM2bpQKhpTuVZYebaJEIhWTLLYFe2dDFIchDI28Yf0eDype1TS7wThG0GTEenH
         qlbre4oclTVVYs6pRFJZ2NZVUOLMadbJhxKxUTln0w8sak6nNsXVQZ1gKipnx0fun9E7
         3+T8Fnpl1WI07B0G3Cylkf8Qs3GBiwsmN7Wz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524405; x=1700129205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGm2vHynu/hBFToljMIoyOJ5nVIf243JSwQjqrxxy/0=;
        b=sXJSX9aZ1wJxD3JApCU1pi+6ZB1IsURITwRsxOTXUzC65kfOag21hE2meU5tzqLw2u
         8SW7zzWP+XkoleW8ve2glO03ej+3JsPx5TUqGCFCPrPET6f2ITerPrEMHZFea/lQMt00
         gXDMTeyVXjFBNAP3J5TeyMj8ZgWXJCkorMo2wgoWpKFBmSwJMl3savbl5VLxzLIVU8lm
         g2WIjZhDgjqGuzpOtMbfJMQeAjXPmxFnonmyym5hrKtCu4pzCyK+K+0gaMXSlaKCpXYE
         wLLQTuAP5glPHQPE5nCtY1hJh1VhNYVE8OPUfB8Mi6oRwPC9lgEvgOR4pCV/7SW0a1rj
         goUg==
X-Gm-Message-State: AOJu0YwuOzvueHn5wgQxKXIMCrGJQyg95Q6IZ3Tw4DUuc10nhWQhGCbK
        HHqgq6OsbHTguXr4Q42RLEYIYQ==
X-Google-Smtp-Source: AGHT+IFiKBNutMsj7ANOubArOU/tBBm0unUxGA8equMZgzL/JO0wpYcbiQ5Wq/R+556TKcVcpFKnlQ==
X-Received: by 2002:a17:902:ec89:b0:1cc:436f:70c2 with SMTP id x9-20020a170902ec8900b001cc436f70c2mr7534166plg.9.1699524404876;
        Thu, 09 Nov 2023 02:06:44 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:06:44 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>,
        linus.walleij@linaro.org, broonie@kernel.org,
        gregkh@linuxfoundation.org, hdegoede@redhat.com,
        james.clark@arm.com, james@equiv.tech, keescook@chromium.org,
        petr.tesarik.ext@huawei.com, rafael@kernel.org, tglx@linutronix.de,
        Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 1/7] of: base: Add of_device_is_fail
Date:   Thu,  9 Nov 2023 18:05:58 +0800
Message-ID: <20231109100606.1245545-2-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In some cases we want to check that a device is not only unavailable,
but specifically marked as "fail".

This will be used in a following change in the hardware prober driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/of/base.c  | 20 ++++++++++++++++++++
 include/linux/of.h |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 8d93cb6ea9cd..2726e5dce1bf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -486,6 +486,26 @@ static bool __of_device_is_fail(const struct device_node *device)
 	return !strcmp(status, "fail") || !strncmp(status, "fail-", 5);
 }
 
+/**
+ *  of_device_is_fail - check if a device has status "fail" or "fail-..."
+ *
+ *  @device: Node to check status for
+ *
+ *  Return: True if the status property is set to "fail" or "fail-..." (for any
+ *  error code suffix), false otherwise
+ */
+bool of_device_is_fail(const struct device_node *device)
+{
+	unsigned long flags;
+	bool res;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	res = __of_device_is_fail(device);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return res;
+}
+EXPORT_SYMBOL(of_device_is_fail);
+
 /**
  *  of_device_is_big_endian - check if a device has BE registers
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..463fbf0072bd 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -350,6 +350,7 @@ extern int of_device_is_compatible(const struct device_node *device,
 extern int of_device_compatible_match(const struct device_node *device,
 				      const char *const *compat);
 extern bool of_device_is_available(const struct device_node *device);
+extern bool of_device_is_fail(const struct device_node *device);
 extern bool of_device_is_big_endian(const struct device_node *device);
 extern const void *of_get_property(const struct device_node *node,
 				const char *name,
@@ -584,6 +585,11 @@ static inline bool of_device_is_available(const struct device_node *device)
 	return false;
 }
 
+static inline bool of_device_is_fail(const struct device_node *device)
+{
+	return false;
+}
+
 static inline bool of_device_is_big_endian(const struct device_node *device)
 {
 	return false;
-- 
2.42.0.869.gea05f2083d-goog

