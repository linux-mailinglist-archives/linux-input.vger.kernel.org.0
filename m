Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 680ADEFEB3
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 14:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389060AbfKENgS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 08:36:18 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:36606 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389059AbfKENgS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 08:36:18 -0500
Received: by mail-yb1-f196.google.com with SMTP id v17so2404290ybs.3
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 05:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=R0BVtLy8tZk3M5PggFKMIRuxlAbFKWFRccRMKUm6LL4=;
        b=iCBzZE46bGzZ8RB7nJunnWlyf8bXM7OUFlMozPQTGqOVmAe0OC7eZUOyUAPUeQCRRR
         STTpcH0au3fqEii+cDJcwDPUD5ztln0JxlZ6MGDa3FIt7qRqiKMs75rG5a3cQ/omJoYV
         Ug+m6s5zeFQeSW97bqAOFiOx5ff5OWantd2G+VdEgSAV/8+nZPX3QFQg2JYAqS1gRZwg
         i0uNYlCAtTpjoXrhv5/6UB1wRB4C4JIm+tQK7r9DVBxFwmQSHU2L3AxwvlOJjL9sNOln
         5yguvMj2sPYSMpiJ2hx2nwTAoTnp7Nf9G8+xzswL8xsNMl2XW2zQMeonPSepVfATWEmB
         xuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=R0BVtLy8tZk3M5PggFKMIRuxlAbFKWFRccRMKUm6LL4=;
        b=M8GNSzEPIFpOP3jxGffDr0N/eyPBaFMvaRzUvlAs+oyOgufGDyryDiivqOJ0jh2/7L
         D1MxT3dk3L9b2Ed1eOIBUKd2tqiGPmJTKDkLGtGX5sfRV84ghU8sN53P45fDoLNfMPjK
         XfqMFpmeYj6cB8Qo+whERDuxHWjjljOy12nIGD1MCxlA+9FZhdDAFSiyjqAN2xSgRnmW
         lGFqyKDRFhDEHO/mp9D0fTjHqn9Qx0EOIPWECK7YWo8bE50mrXpe1FmRa5jGw7rXP1MR
         zfEx6+nlZB/al54fLLKX4cqIGc5KP9kdOJp+borwYCY4btrAIP2QPBNixXxvUBUG5HBn
         0NIQ==
X-Gm-Message-State: APjAAAVOUZZq88EUqS1tJjVDy1V0grYT5+a/4fQ1lKpFGMQPu4gFSe6U
        kRRH0Ag0aTIFIFQCYnTo1tk=
X-Google-Smtp-Source: APXvYqzp5r3vCTdS72C331MvKwdeEYlhBRxMED8/skRM8kTsTyfwNJyIYgKNW2ovCUCpjqGtgxJ1fg==
X-Received: by 2002:a25:808b:: with SMTP id n11mr28509321ybk.191.1572960976584;
        Tue, 05 Nov 2019 05:36:16 -0800 (PST)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j136sm9426654ywj.17.2019.11.05.05.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 05:36:15 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-imx@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        adam.ford@logicpd.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, marex@denx.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: imx6q-logicpd: Enable ili2117a Touchscreen
Date:   Tue,  5 Nov 2019 07:35:55 -0600
Message-Id: <20191105133555.21893-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The LCD used with the imx6q-logicpd board has an integrated
ili2117a touch controller connected to i2c1.

ili2117 support is scheduled to be introduced for Kernel v5.5.

This patch adds the node to enable this feature.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/imx6q-logicpd.dts b/arch/arm/boot/dts/imx6q-logicpd.dts
index d96ae54be338..a5025f3009a9 100644
--- a/arch/arm/boot/dts/imx6q-logicpd.dts
+++ b/arch/arm/boot/dts/imx6q-logicpd.dts
@@ -73,6 +73,16 @@
 	status = "okay";
 };
 
+&i2c1 {
+	ili_touch: ilitouch@26 {
+		compatible = "ilitek,ili2117";
+		reg = <0x26>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio1 6 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
 &ldb {
 	status = "okay";
 
-- 
2.17.1

