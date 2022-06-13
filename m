Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF0B549F6B
	for <lists+linux-input@lfdr.de>; Mon, 13 Jun 2022 22:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbiFMUfE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jun 2022 16:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235751AbiFMUdd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jun 2022 16:33:33 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2923E3A8;
        Mon, 13 Jun 2022 12:24:06 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id o13-20020a4a84cd000000b0041161ec8419so1362110oog.6;
        Mon, 13 Jun 2022 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wex1nAbWY/1XXCUDhOVW0d/2E/zHgf+Jqfen3iAGXg4=;
        b=cmcrkC5rQavzi5riDXVZ1cRgi8Kxu0OZk5UnZiCB5fLeqdkPSsfuPl7595nn/HGqlz
         6ophFUucb7XnDmFuXUwQ+hyN7GroGw5lwdcB/RMFzvHRJUDlvy4mIj8QvyT2tKdZxTfV
         3cKoufZ5AQA+04H4dr4UTdL+4v5f6WyW3bcl9GUb1XTaTCXON1TjELzSul1PEM7kdQcy
         bREQAi+eIRBydHuAEO4j3nBH1g7yU4dDJqo9Z+nbVQs8rcivz6ph+Dbj45jHg2sw1tC3
         CZ+X/R+GV6kuBmU/TMyMKrhcqnpzXHMAGitvuzieQi70W7/MtL6VX3yxW38F9fn5Dt7Y
         +emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wex1nAbWY/1XXCUDhOVW0d/2E/zHgf+Jqfen3iAGXg4=;
        b=6lsrsB3MdSlY2embN2lLd4TaPl9K5cGeOcT7RH7iMPyw8/NMfPyktQWzMTeEgUIyow
         KzJkC90UuBPd23y9jccu90kuHIB0dOj+UZ8qzSBrW1T5h9USqdRFmXiLcQnl+hxAWpp3
         FdmQZclDpf+TLeAidsAYSDCV7LnvcAk4fbH59JrleJ4W1r2qtgnY4/vZjJWFZtUaes2R
         LBKqpsIc/9B9E+k0CJEABhJT0tZaiuyqJPVkaLAs/XmyqKLUMu+Gc1B5A6tQmp9BpipT
         YdTYwylMaJd/4t0T0rQtJWyplPF7O2hqEf8BftHHGzxbE27qpzljdQ5qxd1p7+TL7snf
         CmfQ==
X-Gm-Message-State: AOAM530n5rowlfJfpMgfYb/CZ+nDR+yPYtPNjRRxIbRT0YVpzQ6X2i0H
        3QPAUk7MsLfuGihzToMZJsnlWidY3P8=
X-Google-Smtp-Source: ABdhPJwwHiJ+f+Yr73lbmOWjm+E07LLIvlLVjGzmQ1GRb72rS/Y6Ri6pbHshx0p+GJu6WuM7cpfOyA==
X-Received: by 2002:a4a:bc8f:0:b0:41b:a240:6fa5 with SMTP id m15-20020a4abc8f000000b0041ba2406fa5mr525153oop.81.1655148245136;
        Mon, 13 Jun 2022 12:24:05 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id bf34-20020a056808192200b0032ba1b363d2sm3637274oib.55.2022.06.13.12.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 12:24:04 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        maccraft123mc@gmail.com, heiko@sntech.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 3/3] arm64: dts: rockchip: Update joystick to polled for Odroid-Go2
Date:   Mon, 13 Jun 2022 14:23:53 -0500
Message-Id: <20220613192353.696-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613192353.696-1-macroalpha82@gmail.com>
References: <20220613192353.696-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Update the Odroid Go Advance to use "adc-joystick,no-hardware-trigger"
from the adc-joystick driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index ea0695b51ecd..ffa49b8dee15 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -24,6 +24,7 @@ chosen {
 
 	adc-joystick {
 		compatible = "adc-joystick";
+		adc-joystick,no-hardware-trigger;
 		io-channels = <&saradc 1>,
 			      <&saradc 2>;
 		#address-cells = <1>;
-- 
2.25.1

