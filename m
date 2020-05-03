Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3E51C2E14
	for <lists+linux-input@lfdr.de>; Sun,  3 May 2020 19:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgECRF6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 May 2020 13:05:58 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:33921 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbgECRF5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 May 2020 13:05:57 -0400
X-Originating-IP: 195.189.32.242
Received: from pc.localdomain (unknown [195.189.32.242])
        (Authenticated sender: contact@artur-rojek.eu)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 15CBC40002;
        Sun,  3 May 2020 17:05:52 +0000 (UTC)
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Artur Rojek <contact@artur-rojek.eu>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 4/7] dt-bindings: iio/adc: Add touchscreen idx for JZ47xx SoC ADC
Date:   Sun,  3 May 2020 19:14:48 +0200
Message-Id: <20200503171451.44034-4-contact@artur-rojek.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200503171451.44034-1-contact@artur-rojek.eu>
References: <20200503171451.44034-1-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Introduce support for touchscreen channels found in JZ47xx SoCs.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Rob Herring <robh@kernel.org>
---

 Changes:

 v2-v6: no change

 include/dt-bindings/iio/adc/ingenic,adc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/iio/adc/ingenic,adc.h b/include/dt-bindings/iio/adc/ingenic,adc.h
index 42f871ab3272..95e20a8d6dc8 100644
--- a/include/dt-bindings/iio/adc/ingenic,adc.h
+++ b/include/dt-bindings/iio/adc/ingenic,adc.h
@@ -7,5 +7,7 @@
 #define INGENIC_ADC_AUX		0
 #define INGENIC_ADC_BATTERY	1
 #define INGENIC_ADC_AUX2	2
+#define INGENIC_ADC_TOUCH_XP	3
+#define INGENIC_ADC_TOUCH_YP	4
 
 #endif
-- 
2.26.2

