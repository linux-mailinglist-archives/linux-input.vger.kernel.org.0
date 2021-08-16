Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0889B3ED182
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 12:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhHPKAu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 06:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbhHPKAt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 06:00:49 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA68C0613CF
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q11so22706529wrr.9
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WXtfrlhTvK5I4Q1AcToRyUZbAQ+Zw4tC00SfbVVvbW0=;
        b=s3ToyYAoY23WCoCF6c7fFnVwgRmAsa5SAo30JW235Lg6QeLK2Z63c1kjPVsIGjCZiU
         gJ+keeK0niCAkyDDssO7o9zgEj+CeU9011sowPpALmwzMfjylFCiQvwubhDOX/noeweA
         OZitkIVb8Pr8U50KzUrfqAjcUCaeylgShbm+ySjWFsDKqyZatCtpYqrwm52rWm4yqaT7
         sS326TZlVB+RIJNXACPI1h1Vhkay8IvlwI9YXh7WfxcZN707rHnmoMu8UzcTc6XjL3PV
         6c+rk8HFqer/jR0gAv82tCNBoOxBU9G5WRqBCzkBcOxSjk2hQiJVOZsNjxBW2+9zUt3a
         dFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WXtfrlhTvK5I4Q1AcToRyUZbAQ+Zw4tC00SfbVVvbW0=;
        b=b2yH22t7CrFF8Dejxz1QNryW1w7XNfU8smqkmEe5nKef1ITI3ur7Uccnfx7MS+pxjC
         Mw1XnVIF6cOVDMnq0GNIa8QfJNyxOzOJYrvmhcygiYIQ3pu7DbW49N06G0VtDr4KV4o9
         BBz0wR+SvzdSnDMn3LQo4hZZXV0jAIi5fi9A7o1tvR4jF0IJT5pnDPAo+drA6f4aBYMN
         0MsAQhgfVGR8+mZn6L6laBINRVVKwak2zAVgIaOExIqyii0McH3LloxBu3jXGRi23+tx
         r1keP4SeZWhdinXuxKSdAvok21BVdDp3MHME3VfO2GSD79iFWYBTgIl5r8FOt6WDOq3C
         U1mg==
X-Gm-Message-State: AOAM531qD7zIZHUpXIbsLmY5YkjmrE73tInT5FCsjOy/QUhs/2GSjgsN
        FoM4Y3SsjIyQIQj2/cGTr6uOGA==
X-Google-Smtp-Source: ABdhPJwDGgULKk6muzbBo58qOdzC2JgP8l7B8Uqpu2dQfFY7AAre2f5xvKhTZVqiO41kMGHvn1DEJg==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr17685059wrq.148.1629108016922;
        Mon, 16 Aug 2021 03:00:16 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
        by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:00:16 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH RESEND v3 0/4] input: MT6358 PMIC button support
Date:   Mon, 16 Aug 2021 12:00:09 +0200
Message-Id: <20210816100013.100412-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Changes since original v2 at [1]:
* added 4th patch with device tree enable
* cover letter title prefixed with 'input'

This has been tested with evtest on mt8183-pumpkin on 5.14-rc6

Mattijs Korpershoek (4):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358
  arm64: dts: mt6358: add mt6358-keys node

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
 3 files changed, 68 insertions(+), 5 deletions(-)

-- 
2.30.2

