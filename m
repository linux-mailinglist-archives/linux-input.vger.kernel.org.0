Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46F249604D
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 15:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350731AbiAUOEK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 09:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380933AbiAUOD3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 09:03:29 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247C4C06174E
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 06:03:29 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j5-20020a05600c1c0500b0034d2e956aadso22555785wms.4
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4l1jtRGL+pYHVAZJF8KgIUHpCfnZhhgBRKh+OiDvorY=;
        b=fhwTlzKWGaMzqfsup3wVctsfoZXTOQaOFb5R5Juixld0ttqy1JeVP0UBAnOO4SFypl
         Df1prkauSmcDUosFSq4FqwsGSKYVOkw/bqBDtx72ou6iRRmwyUXBMV/RtyPni7/T2Db8
         wsjOpwr9rNKpmvWP9ckaqB/Sf/UZl+6/jpWbyHCWRAm91Ee79b8icLN1nQTbu4Lb/aht
         jBZCoO75QW8Jm5JEjSctOPETtHCTvm8cM5kB4K2d/gItxQd+q1lB4g+qprWSUABunWlE
         /kJbwx6fRw7U+uCgbcEu959QoZL6efdJOqgrjmamXjX8Ycdi+of9m5uF9YbOdqAzLMcC
         ZRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4l1jtRGL+pYHVAZJF8KgIUHpCfnZhhgBRKh+OiDvorY=;
        b=wB7Zzg9hrbAnX6FtuAiWgrw8GSUygeTeTlsmv00mY+9stqO6QchyNLWCwGxPA3Ys6Z
         9/TomC+dFhFH5eLnfJeDRCZ0DXAdoRbmXEgPE0+4/dlFTi0Qy7PbpXr4/1EL5NfJU0S3
         Iiihk2iwjFy7JkmgknlOm2vb8CB0E/oUlfiEAIJdcODwkJrMXMjbnjnmeAfpPIb5QZuE
         uZjTDADSHhZ/GhgJS3jMlVM/dbGDZMbfGYahe2TfGsuqEFGSCvzu1wXALf9748SEuMY+
         6Oq96AV9nAMkNPpQNIf9Fnf9CfTCLQJXSsYYxY0IWkwJRzGYAx32V2C14OaBvdNdoTIx
         uq1A==
X-Gm-Message-State: AOAM5332Jh3LKCP4r0kKBrw/AlfHP0GvkHoXRdUGHFZYP+0pkhPGAl0z
        QAPlBRIHpwuhTIGdFNoKBbKbwg==
X-Google-Smtp-Source: ABdhPJwSn5xqcnOw4GAEgDzNJvgvtqvE75JH7mto0ajETAzgXi5MCr9UUfks/or68aOUSSE9IMIGYQ==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr3913609wrs.83.1642773807588;
        Fri, 21 Jan 2022 06:03:27 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr. [86.201.52.205])
        by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 06:03:27 -0800 (PST)
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
Subject: [PATCH v4 0/4] input: MT6358 PMIC button support
Date:   Fri, 21 Jan 2022 15:03:19 +0100
Message-Id: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
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

Changes since v3 [1]:
* checkpatch.pl --strict fixes

Changes since v2 [2]:
* added 4th patch with device tree enable
* cover letter title prefixed with 'input'

This has been tested with evtest on mt8183-pumpkin on input/next

[1] https://lore.kernel.org/r/20210702134310.3451560-1-mkorpershoek@baylibre.com
[2] https://lore.kernel.org/r/id:20210512152648.39961-1-mkorpershoek@baylibre.com

Mattijs Korpershoek (4):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358
  arm64: dts: mt6358: add mt6358-keys node

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 55 +++++++++++++++++--
 3 files changed, 67 insertions(+), 5 deletions(-)


base-commit: 87a0b2fafc09766d8c55461a18345a1cfb10a7fe
-- 
2.32.0

