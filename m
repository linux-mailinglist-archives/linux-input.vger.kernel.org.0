Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FCD2A5BED
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 02:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730293AbgKDB36 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 20:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730234AbgKDB35 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Nov 2020 20:29:57 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F14C0401C1
        for <linux-input@vger.kernel.org>; Tue,  3 Nov 2020 17:29:57 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id 1so9493597ple.2
        for <linux-input@vger.kernel.org>; Tue, 03 Nov 2020 17:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgDlplmO0Msbik3z5vTVjN1E4quCfRMMBpL+KTr25PE=;
        b=Zt9MbPmsEHVHV6S7xiURQ05j6H6oZb9t4va0Hl18IRw48r2ZXQyhm2myXnG+NiUjin
         GftKKcw8CCNex98Rle/3l2S+URN7TLWgz9fw4gOiueL8lcCGuykF2uhNBrJ8on74v8JX
         75gLRCnaGa9JzLc0ANtBd936iSCM8DRrsPEsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgDlplmO0Msbik3z5vTVjN1E4quCfRMMBpL+KTr25PE=;
        b=k49QJlz8HHj2xztjv+y38B5ltgd7lPixBsbQndmE++ScdOcqX2Yi+BBu8/deg5P/vX
         Cf9neAfj5fpLysUyGvNkixaUofnjPhLXo8pOfUeA4qZBuRIr5H1dyVsa6DVTChSlYjqz
         V1Tcl4wOsyIk5JU5JSRH1bqGjv05vPnVojc0L622bf+wsWML7EZB1bbykK7RSGgGZO0+
         ZoOHAU130tLiOwUyzMYr0eqye9XtDvS1HW362sfVfcY9E/qW38YVViC0Tb1QLFahlngk
         KXLxXFidJS852MVnfprcAD8beuVrvQ9NGcycc1vYX2kcx0efzrKkOMwTBCBIh/yEU8y/
         SBow==
X-Gm-Message-State: AOAM530nvWMuL8vNMFu4ygBTfC3ge0jicFx03/nCkt3ugV9AuYab12sW
        zZVQvH29NlXOFqLv3uNbmNUsCA==
X-Google-Smtp-Source: ABdhPJw0uW6TH0eF/XsK/zaRgUECd0eDpdpxV/5ZKgCN6JZE4Ho0SvtQIibzu/oSTtDUMnCFmTdZtw==
X-Received: by 2002:a17:902:fe18:b029:d6:991c:6379 with SMTP id g24-20020a170902fe18b02900d6991c6379mr23556067plj.20.1604453397380;
        Tue, 03 Nov 2020 17:29:57 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id m3sm347424pjv.52.2020.11.03.17.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 17:29:56 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        hdegoede@redhat.com, robh+dt@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>,
        Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] arm64: defconfig: Update config names for i2c-hid rejigger
Date:   Tue,  3 Nov 2020 17:29:27 -0800
Message-Id: <20201103172824.v4.2.Ic9788bdfc4cce7569f8d25e7fb52a208fb643eac@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104012929.3850691-1-dianders@chromium.org>
References: <20201104012929.3850691-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i2c-hid driver has been split in two.  Let's enable both halves.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.

 arch/arm64/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5cfe3cf6f2ac..9258d623331e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -725,7 +725,8 @@ CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
-CONFIG_I2C_HID=m
+CONFIG_I2C_HID_ACPI=m
+CONFIG_I2C_HID_OF=m
 CONFIG_USB_CONN_GPIO=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
-- 
2.29.1.341.ge80a0c044ae-goog

