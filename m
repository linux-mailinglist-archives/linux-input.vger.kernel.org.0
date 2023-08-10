Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907BA77753E
	for <lists+linux-input@lfdr.de>; Thu, 10 Aug 2023 12:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbjHJKBE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Aug 2023 06:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbjHJKAZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Aug 2023 06:00:25 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1719C3582
        for <linux-input@vger.kernel.org>; Thu, 10 Aug 2023 02:59:42 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe4ad22e36so6375625e9.2
        for <linux-input@vger.kernel.org>; Thu, 10 Aug 2023 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691661580; x=1692266380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA6g1+NA1MHwgD0J5/0iacU9T/Zj+WYPU0o6GQh2M60=;
        b=O1zGd4xmWe411WBeHnJ8AnZONvqE7Z9u3MFhkDtUZCO307na8i8N5vr+98ztCj50oI
         0nb9hFMmwsuYc3rCJdKobyxauVd6dyWfkigXmeHz29uTSAtFkGxphfnCEl11yEHgKRu0
         AbiDxcqsma9jYw1oIHWwQ76uNZN/cdYNxI3JYj4u0YDMwhVnzHEFrdP7Cmdqoc6R9AYx
         9Z9cGlrTILoqs7IE/361Y3mpszZ7qgJnMisepKC1a98bGVT97jNwSwGqEJpFtHGVuut+
         DGwGz9UbXZZfJqeZjUmWWRTwaVt89t0o4NnN//b8QCToFu3aEeHskABnmhFGCuUpNcX9
         4TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691661580; x=1692266380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA6g1+NA1MHwgD0J5/0iacU9T/Zj+WYPU0o6GQh2M60=;
        b=TpwZOYd9Hn3aJy+tbPSs2FOD6z34Hr6uYtLyN/zZ3FxvG9uFnoOCfXI0JQI5u6OAsW
         fgK2csehxk9Yje/N0HWUfpIMI3OBVGtyWXOLB2NfWVo7LvJLYFHUEjH5cJ2llcY2oS0w
         TS148yf6NYDzhYcjuf+Xavb1LFjqNZfGQva2bDHAtyE5erQF2JhtNqTSKSR+OGjjz8OV
         HVzMNTbLt/YTJKLQwhgw8p7JKGgwSoIcqru4hl2Z8aGC/T/qX54xabKODbZf1Qovgfqi
         j/kfdMjXToFmc1jgAIIsT4T/mZqiuwnCzD4Uk008OJGFRAlRndaAvUjb69ipx/0tw1Ov
         Xb7A==
X-Gm-Message-State: AOJu0Yx+m2vQ/6+a7ENHXYi/BNNhKbHOIhERP1YxqdFgyDkZtCAak3bx
        TH9kwYjg47RuSbPoQZ79a7tqIA==
X-Google-Smtp-Source: AGHT+IEOo9PSJhciOwaN1TWXgpDhd54pTrrYRzGVnPGGiXjSds0yhXAKmUVfpiMdr2xl8lBRf7vCwA==
X-Received: by 2002:a05:6000:1090:b0:317:58eb:1e33 with SMTP id y16-20020a056000109000b0031758eb1e33mr1507037wrw.8.1691661580528;
        Thu, 10 Aug 2023 02:59:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d4d42000000b00317ca89f6c5sm1623182wru.107.2023.08.10.02.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:59:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] Input: stmpe-ts - mark OF related data as maybe unused
Date:   Thu, 10 Aug 2023 11:59:36 +0200
Message-Id: <20230810095936.123432-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095936.123432-1-krzysztof.kozlowski@linaro.org>
References: <20230810095936.123432-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When compile tested with W=1 on x86_64 with driver as built-in:

  stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/touchscreen/stmpe-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 25c45c3a3561..a2032189fc25 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -368,7 +368,7 @@ static struct platform_driver stmpe_ts_driver = {
 };
 module_platform_driver(stmpe_ts_driver);
 
-static const struct of_device_id stmpe_ts_ids[] = {
+static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {
 	{ .compatible = "st,stmpe-ts", },
 	{ },
 };
-- 
2.34.1

