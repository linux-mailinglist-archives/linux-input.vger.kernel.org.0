Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC80B37C8A1
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 18:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbhELQLU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 12:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbhELPvI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 11:51:08 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F1DC061760
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 08:26:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so3266835wmq.0
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qo9U0GYt6DMr0n2/j17Wlk3nBr9MEvK6tP9ZxY2RR0c=;
        b=Eby89UI0IAG4vUd4hCA4VLnkKIT10UJ9/FY4KM9dxGiMIRkb4azADDaexbelr6k5sx
         XaoSmEef3ysKxVIHnzOPRMNZThU27cJ1GKGBtGyEnQgOi6a8607JtxknevpszcKNRFhD
         uh2JvmBFdIhylyI33YepaRx/D71R4ORs1oIGMx5pmmB+hsVh8C7V0Oc2V5xofLGv8qjZ
         s9GMae2bTFsdZSx/9JlBQON45QdycONzsC7ZWHtdrgSO5qVrUwNupo2xBe9D01gHvGoj
         x/djK7Vu3wNSbhop6bSEW02MjHafRJq97BhcTFUO4I1ZRn+3moKhxnVMZFibQpkmW/zC
         uEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qo9U0GYt6DMr0n2/j17Wlk3nBr9MEvK6tP9ZxY2RR0c=;
        b=HBBn7vv0U3kc0SGxrlOg+yrnOafzH4ZQNb/NZLuwh6+cMikNsioXfYeZdfirU2EIRG
         2nh61U/6/a5MlR0PtJ6bk75UkUe7lEZLaEy33VDYersEwW1qKapzO3O0jgihlVue15xl
         mT7HPjow3vIvcA+UsR73/vl3NC0nRkRcYOkkPGUtrTL87lE8Js+0Cvp2j1T17k8bfcyw
         88Xo3cct1idvLQ8VQpFzUODReW/N2T+0VerQ6xNRru76URqJ+4b0fQCGZw7gTwqfbsy3
         pF7Xmtl03AfOS8CZvKoyNVIt/N3wti0aKlsBMyx5dGimXqc6C0eRYR570ibWzvQJbSOQ
         C2oA==
X-Gm-Message-State: AOAM530CVmK+Jc/mnEowiXxTBxZExwh5SCLNYSxGGGHEZWBp4y2egkB3
        XbRgXK5a1iQffByljzvnK2Q3ag==
X-Google-Smtp-Source: ABdhPJxK4OXOZyM8UmJPCc+lhHTTxoneOlyV6LIU6uC/nUXyW+Iz1VKA97tGwMOkipkrPdSRylyeZQ==
X-Received: by 2002:a1c:e408:: with SMTP id b8mr8749252wmh.85.1620833211941;
        Wed, 12 May 2021 08:26:51 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
        by smtp.gmail.com with ESMTPSA id b7sm30931256wri.83.2021.05.12.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 08:26:51 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 0/3] input: MT6358 PMIC button support
Date:   Wed, 12 May 2021 17:26:45 +0200
Message-Id: <20210512152648.39961-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
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

Initially, this series contained both mfd and input patches.
To simplify maintenance and review the original series [1] has
been split.

Changes since v1 at [2]:
- cover letter title prefixed with 'input'

This series depends on [3]

[1] https://lore.kernel.org/r/87tunpw339.fsf@baylibre.com
[2] https://lore.kernel.org/r/20210506153718.256903-1-mkorpershoek@baylibre.com
[3] https://lore.kernel.org/r/20210506094116.638527-1-mkorpershoek@baylibre.com

Mattijs Korpershoek (3):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
 2 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.27.0

