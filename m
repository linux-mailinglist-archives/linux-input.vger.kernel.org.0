Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01ED73D23C
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjFYQ3O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjFYQ25 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:57 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AF9171A
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:41 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98934f000a5so290909066b.2
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710519; x=1690302519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO1VEj8PCt+SP2FLdSp8jHVPdvdkdeiUc+/c+qgri9c=;
        b=wTzGEi828CVHhBinoiCuumo6mbuHwRBUt3VOGODKfCCVqZB0A4RejQPQFvJ/ypE65T
         dqsBOXIt9ozbLcZKz07P/ptiWeAr0yJGJ6Ggpghs2ef7Ccx6Y7V6TJpBkO0KqblTi0Tz
         gz2Lw3N1pDR8HW+tfohVXT3mMvs378/2sqbD7CYcMPALwctsmXgwRqhBUuQxcFXRL7nO
         /AJeFDR9ifwca54oC3MtU+y82lq4v5S6o7vjDqL2RnZkB0/nb42InuxsD06gE4ltJoCH
         yqNkKgNWKhl0PBnFCupHRzwpqIohIOPtZW7dcN2Uk9GVxx/smiuqjm3cengh/2ilY9Sp
         a7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710519; x=1690302519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PO1VEj8PCt+SP2FLdSp8jHVPdvdkdeiUc+/c+qgri9c=;
        b=hvpJATdHSG9oFZtEXqChZhEyhA5ZfCxKy7n4+vEvGEQCr2PsGQoA69tn4/m0OYh5zC
         5RRgzTxQwL7YTytmPu2HarCzz6cqk1zlS2iz36+q668u2gyPkdf+UcdCTlVbzGzuQOh4
         LY5tmzkjruuonaskK4vHYbKs07lUOSjiidDeNe7h9toawQzfrYbYxhvJxouzz5KvQ2/F
         flUF1jf0M8aPNIk6t5Gwt1CbnHWL7yyG6kFjD3k3o3CqRk94WogtpEPDIshM/rDT74wf
         aksT4nA/FN8CC0ENtY9dfaXBuByItHbpLcx1B4ibgOTMbxJFIA6JlzBL7BsTfbeZsYIH
         XSuA==
X-Gm-Message-State: AC+VfDzB+Tryp+rlyhbhC6j96If7RgNoClMtIFz2UkXyBS1fGFtM67TV
        mIO+HrfrIRT5htu5WYAMsalZMw==
X-Google-Smtp-Source: ACHHUZ4iqqQUzVvzYmtu0qmmlNPXRiqg2V2F0qTiryu8/wdF9zfXuyHk/MPn9KA8iV6K20V3z/6PmA==
X-Received: by 2002:a17:907:5c2:b0:974:55a2:cb0b with SMTP id wg2-20020a17090705c200b0097455a2cb0bmr23869630ejb.55.1687710519450;
        Sun, 25 Jun 2023 09:28:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 09/24] Input: cy8ctma140 - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:02 +0200
Message-Id: <20230625162817.100397-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cy8ctma140.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
index 967ecde23e83..ea3895167b82 100644
--- a/drivers/input/touchscreen/cy8ctma140.c
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -258,12 +258,8 @@ static int cy8ctma140_probe(struct i2c_client *client)
 	ts->regulators[1].supply = "vdd";
 	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
 				      ts->regulators);
-	if (error) {
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get regulators %d\n",
-				error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "Failed to get regulators\n");
 
 	error = cy8ctma140_power_up(ts);
 	if (error)
-- 
2.34.1

