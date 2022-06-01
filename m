Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B6953AF4A
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 00:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiFAUwg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiFAUvQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:51:16 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA05927CCF2;
        Wed,  1 Jun 2022 13:49:38 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id l9-20020a056830268900b006054381dd35so2088661otu.4;
        Wed, 01 Jun 2022 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8J6j2cF/i+PEKDEDcUh1Dihhs3LcaIve5AgJYojfaiw=;
        b=gYe1a2zpE8JyQt/qVxQVOR0F5hqSICTdyBBLPE6Ni2egUc0yL4ozA6xPeVkRdlTaJ3
         bXe0dpaZxZ6NcXTyFv7kllZtQYQT6V/Dw0e6y3gl8nyQnbh/fWLitIZ7z1ItC2rAPTYT
         vBDezdahgHIDuzvMYoPsjfNjXe0F/Y+r7L0XTRZC3uNnTjDR2ti3f7r0zI8LDxb2Axzp
         0ZQGpg6FQhwgPFAJa1iimZ6MMwzxcd7dpkZyLXVWd9fVUvCZdlyksJP1F6FjERPLS+GN
         /P8KjZhc3pOqcwUVY6a1F1FqYXLps4y5WcflGrnrKm+vvIxtnBQUGvUInXTSj0dnhH7E
         z6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8J6j2cF/i+PEKDEDcUh1Dihhs3LcaIve5AgJYojfaiw=;
        b=XKydVsIawRnKLGuESRJmL6SO9pFU8F8cdkc/vTfwZscPGmMKeZ2XYQI3OCsWWt6/Td
         Z40SiNqJBqo7u+acXcKUQ1g2GRH9ln4tJrTLgP1Ky8/2+l53J6CEC3mPLUIEDNI7XDfJ
         oY0RFYrMHrvdgwVnNCr1DWUN1LOOKa/L81gkt8b7FsQmDTnYqNplsl3UMCFEePNKBkZ6
         Qf9gJv5M1KLKBxw/RxhwTSh/F2E97ZpUpmrW7LjdllY1zBEcBRifYDZtdIVvFBuizfoT
         hhn+WH7Z+jJOMZvk5WS00GhPzBw4SNjwI1AADkl0gSYXZD4xmV1sZjiOFavvxemhxLU3
         scTw==
X-Gm-Message-State: AOAM531tBhTCEgGXeU483XMFlYUJgj3jsuXiiDEeLOEAbQ7JeMkLK1mX
        70k3K1BocJ980Ot1pLhWckdRFxCucO9UCw==
X-Google-Smtp-Source: ABdhPJzlAG2n2WNn0rmTsp1iCus1PaEHBmg2qpKy2sgbXFZENQGr4Epz+D3/MB9ekHTpDlXO/GjIRA==
X-Received: by 2002:a05:6830:2693:b0:60b:871f:a6f6 with SMTP id l19-20020a056830269300b0060b871fa6f6mr683668otu.187.1654116574359;
        Wed, 01 Jun 2022 13:49:34 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id 3-20020a9d0b83000000b0060603221279sm1222157oth.73.2022.06.01.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:49:33 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Update joystick to polled for Odroid-Go2
Date:   Wed,  1 Jun 2022 15:49:27 -0500
Message-Id: <20220601204927.10256-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601204927.10256-1-macroalpha82@gmail.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
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

Update the Odroid Go Advance to use the polled method from the
adc-joystick driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index ea0695b51ecd..ae714ff71e84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -24,6 +24,7 @@ chosen {
 
 	adc-joystick {
 		compatible = "adc-joystick";
+		adc-joystick,polled;
 		io-channels = <&saradc 1>,
 			      <&saradc 2>;
 		#address-cells = <1>;
-- 
2.25.1

