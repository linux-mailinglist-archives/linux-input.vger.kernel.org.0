Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA817C9BBD
	for <lists+linux-input@lfdr.de>; Sun, 15 Oct 2023 23:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbjJOVMG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Oct 2023 17:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjJOVMF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:05 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA60BD6
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so3546973f8f.2
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404322; x=1698009122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtAKqaERolIHCTmRDg6aGz6W93ZG9oOqGRlldMnpGHM=;
        b=S06nbPkHKWbq8lMMpSQqliQ6fTwNMaZSNfSkkm3EpX2wjdDaK9BJFVoTbIbVN0p5QA
         SUKjV4fA3wr3w3PLMBblVBfD4gnVuACSThkuqjounaBgqygKswaeSDeeSo7sGgstsyJ2
         jBeZbWPCI/kw04n1aegKD5sN1FJS0C/6tq7MSRy4/zVw707Cw7oD9bmribwyFce7gWWv
         NVFuDmyo7+cWi6Ts9qvqHdppZMJC+N00mt5VxMdWzevjwnrFpYpXrWU9tNF7DSj8KMC3
         Ab23JiqANogCLBmQ3N4Afr7kZRypaGjAHy1YMFVAkrlpabP6ncMDH027IUvkujK9T5cA
         lUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404322; x=1698009122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtAKqaERolIHCTmRDg6aGz6W93ZG9oOqGRlldMnpGHM=;
        b=FvESZQAPo2jwzfJ2AK0fNDliMGZlSv9D5Xg/2kF7X1F/vRW9uyd7E7W5N/G1rDAKnX
         qb7TN1MCOlN7UoTEWrF0OKw9202T8Ihgv1fLFRkBgEjoPq8ftrswDIWeY62bqnV8hWh+
         sZcck0s23ILzMqnhXhVipbiE49+M1mC0lMfo7MVwGunRZBbS8FaBUeUfqS3SnPhmky4u
         JzYWuQOi/HdzpuQcyxRU55BsLlb2d6whOOQ9uD3BbRNi6sroP4vrvu4kLsbqyx2s7J/W
         gvh78M4zETE2tewSShohfA4nHFejP0TKTATr80BugcwYoNnpvZonL6sVK+h2gPVewnMF
         1N7w==
X-Gm-Message-State: AOJu0YwTcB7fKfMK/AKA9wA5RVDUrmEn/gaZTDww0Mf8JASOf+X3ZDD7
        cqr47ha5dymPAQDg0ZRm0f35Ww==
X-Google-Smtp-Source: AGHT+IFgQdfSVH6YmUAINQJ2B5pMcPmsn3hKh1y9h+A3RjF+VDAzauaNUq4tqJu8camKnrex2Y1Opw==
X-Received: by 2002:adf:f103:0:b0:32d:9cd3:6a9d with SMTP id r3-20020adff103000000b0032d9cd36a9dmr6017864wro.25.1697404322388;
        Sun, 15 Oct 2023 14:12:02 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:12:02 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 15 Oct 2023 22:11:52 +0100
Subject: [PATCH v2 4/7] Input: synaptics-rmi4 - f55: handle zero electrode
 count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v2-4-b227ac498d88@linaro.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=+4DaGg6VDRBPUbN6NHpCk9CFy1rQXCDvptUHWZJ41N4=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0Llzrc/3fbiXJq5U8K9m8cPm6UWFBhuNWuo337/2k
 lNHZpNLRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIBW2Gv8KiTStc2WtcmpSY
 Wfi2aURt9NuxMyOVQ2/rlMwrH/oCJRgZZgrNZbrEotG15Nx8E9tdnO/ZHLVWcPyVDSyzzxVgM0l
 0AAA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: methanal <baclofen@tuta.io>

Some third party ICs claim to support f55 but report an electrode count
of 0. Catch this and bail out early so that we don't confuse the i2c bus
with 0 sized reads.

Signed-off-by: methanal <baclofen@tuta.io>
[simplify code, adjust wording]
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_f55.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f55.c b/drivers/input/rmi4/rmi_f55.c
index 488adaca4dd0..ad2ef14ae9f4 100644
--- a/drivers/input/rmi4/rmi_f55.c
+++ b/drivers/input/rmi4/rmi_f55.c
@@ -52,6 +52,11 @@ static int rmi_f55_detect(struct rmi_function *fn)
 
 	f55->num_rx_electrodes = f55->qry[F55_NUM_RX_OFFSET];
 	f55->num_tx_electrodes = f55->qry[F55_NUM_TX_OFFSET];
+	if (!f55->num_rx_electrodes || !f55->num_tx_electrodes) {
+		rmi_dbg(RMI_DEBUG_FN, &fn->dev,
+			"F55 query returned no electrodes, giving up\n");
+		return 0;
+	}
 
 	f55->cfg_num_rx_electrodes = f55->num_rx_electrodes;
 	f55->cfg_num_tx_electrodes = f55->num_rx_electrodes;

-- 
2.42.0

