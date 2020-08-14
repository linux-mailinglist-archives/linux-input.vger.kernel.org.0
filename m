Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E07724427F
	for <lists+linux-input@lfdr.de>; Fri, 14 Aug 2020 02:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgHNAWK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Aug 2020 20:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgHNAWI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Aug 2020 20:22:08 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE9FC061757;
        Thu, 13 Aug 2020 17:22:08 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v9so8141363ljk.6;
        Thu, 13 Aug 2020 17:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pcpd+KNb5xtd9pjvQD7elKImQhfYhC75p/jJAbTUb9g=;
        b=ZumkdZ3KzaRt6gHFPo7YXpGrlROBenP5kH35gcrX8xlz5Rq4HUBCRj/NuYwyy7h2xu
         F1bdS6SRures1YCar5nn5DkoyvJEywiiaOBd94KrvojWSIaSx4T8AFlschdtCQyrsCMz
         JbHg9vKPk+HNEzwICyKMKT4ERbzhUBS801CuidvjTecIo4tbNznYHBISWOf7rXr0/MVQ
         g09b/vv/StTyUhnEsmuGsy3wOQ4PitTp0dQhiMQd/kozDZ6lqhP++mC0CFW994e4n8Au
         7ALkhWWE0DmskR7gXa61ltLab7dUAf/a81+ge3x0SMV5nl3BUVFOudjTzB3WAFpVaD8L
         zMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pcpd+KNb5xtd9pjvQD7elKImQhfYhC75p/jJAbTUb9g=;
        b=Stjg5NX9dAkF/nkdgVOKeCqWzoBmuQeKUBapklg9qpENk/l1sipArI5v2Rwc0rozrO
         ipHk7FifrxNz601UzfgEv3OZyo0V4KgS8OubbVgYS0B4RYBtPmYp4U4j4lPmsi8zk54F
         C65Be2bBTxm1hRMVVfCUkHO9U92Ng4yZL0lGTKTqU0ipPq3jVRUBKSuihlc5krRiDcrM
         toYI4ldVJOmxliGHXfd9Hppz1KzWdFAHCeIIMJigpOWsI6JXqmlrE9VjP36KkcAF6SKZ
         nHuEhtafENIfzmbvgEJDQe2s7pHb+2Q+dsS0PmUo0XVJGpfRA1B2NM3+alKJKGJQI9NS
         wniw==
X-Gm-Message-State: AOAM533RRgMjnzuTp0IGTuxaCYTQkSPsCN9+UKUzHMpan05CQoR8iAK9
        i2GIUSDKWCfRAPd1HuAz/S4=
X-Google-Smtp-Source: ABdhPJwDnhMQjz6l2L8o4oL0k8QLS9wzK83gQxizL3BVMAvVpDkAZo7SCojxRzHQD3Y1T3stVW9Y/Q==
X-Received: by 2002:a2e:581c:: with SMTP id m28mr104036ljb.413.1597364526486;
        Thu, 13 Aug 2020 17:22:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id b18sm1549506lfp.36.2020.08.13.17.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 17:22:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-input@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] ARM: tegra: nexus7: Add touchscreen
Date:   Fri, 14 Aug 2020 03:21:38 +0300
Message-Id: <20200814002138.12312-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Nexus 7 2012 has Elantech EKTF3624 touchscreen, this patch adds TS node to
the device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Please note that EKTF3624 is already supported by the elan,elants_i2c.yaml
binding, but elants_i2c driver doesn't support it yet becasue some of the
patches [1] are still under review.

[1] https://patchwork.kernel.org/project/linux-input/list/?series=316905

 .../tegra30-asus-nexus7-grouper-common.dtsi    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 3922517145e7..e2d5fbacf9b4 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -836,6 +836,24 @@ pwm: pwm@7000a000 {
 	i2c@7000c400 {
 		clock-frequency = <400000>;
 		status = "okay";
+
+		touchscreen@10 {
+			compatible ="elan,ektf3624";
+			reg = <0x10>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_LEVEL_LOW>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+
+			vcc33-supply = <&vcc_3v3_ts>;
+			vccio-supply = <&vcc_3v3_ts>;
+
+			touchscreen-size-x = <2112>;
+			touchscreen-size-y = <1280>;
+			touchscreen-swapped-x-y;
+			touchscreen-inverted-x;
+		};
 	};
 
 	i2c@7000c500 {
-- 
2.27.0

