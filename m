Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFF93757AF
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 17:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235572AbhEFPlU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 11:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235184AbhEFPlC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 11:41:02 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B810BC06124B
        for <linux-input@vger.kernel.org>; Thu,  6 May 2021 08:37:27 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id l13so6084497wru.11
        for <linux-input@vger.kernel.org>; Thu, 06 May 2021 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dSJyU8aFK9mEONqG/nUNis6Uka+vOYd9hMvtVOFuDIc=;
        b=z57l6UWUoyml5qPK/3dbAyigL3/mFw4SWpA4jlORRMa04ADgJXr2kse+DOKvcgBMj6
         q6Rod2Pu8U/Z7HFXhUbZwV+N9F7S2ghT8tkGE15T28OFlM6bLNs+xhSzPExWm5bmmqqn
         i5GwKj+sqRYa9MOwMihoVFYbFl+18PK0T7HMhQrgzvSMT9U3v2rqocrefBcP37C110ty
         HVYJ/zH7DB1ez+PWo+LQflFW1BTren1pfZeIvSaSQgbVhH6BxvtLCpmk1g98ZAHbwv7A
         wpN5pK8V0WAbbcRUC/Hc4lddTVKyG54TJl5j7+cXQRJo5lUBA6JA5T2wq8832ohc0kQJ
         cVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dSJyU8aFK9mEONqG/nUNis6Uka+vOYd9hMvtVOFuDIc=;
        b=C0Hcn2cGHt/I8R/TAOPVqJUNVxEr04dwTx7nJ7DlFfZKQqcbnGVd0krpPoqa9HjmrO
         UXKsV9uTpPI+Hc5C5Bd9ssGRZK+EqFCX44FwqlkgLyn6g2gu2aqakSsjCjls9jsGkfAg
         tdMWQBfQUlhKUmBk3TTG3YHTwSVrP1/pVPth/hdhCoBxEZtg08ikU5mcaG6XbjJeth8P
         rApM6zObn2krfT3hThT2ZDHXzX8snrSFSt2NMqiJmSq0ZGFSc26fwxfXWwLku/8fIjMV
         SWGw+0dm7ZECG3YxxBoYCN+1Dubh1Ut5Adx42LfIi/RdSAIa+DsKGuemLVuc+5weBP11
         0BQg==
X-Gm-Message-State: AOAM532HaWL6DQ4r/gvuTxptVOdDhixPdrYxrtpjxBKKy5kulyIYXtlc
        fqrO/FZqYQrusbgDPkrL4Pmy1g==
X-Google-Smtp-Source: ABdhPJyaW15qMZEmXE3SxBInodABKnX5TaulmK6kQs2Ns1gEa0yWwUQeyDIYIIeCr4O4aaMcdPmAOw==
X-Received: by 2002:a05:6000:50:: with SMTP id k16mr5991194wrx.418.1620315446400;
        Thu, 06 May 2021 08:37:26 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5fe0:3a70:ad4a:a29b])
        by smtp.gmail.com with ESMTPSA id o13sm3788673wmh.34.2021.05.06.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:37:26 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] MT6358 PMIC button support
Date:   Thu,  6 May 2021 17:37:15 +0200
Message-Id: <20210506153718.256903-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
* for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Initially, this series contained both mfd and input patches.
To simplify maintainance and review the original series [1] has
been splitted

This series depends on [2]

[1] https://lore.kernel.org/linux-mediatek/87tunpw339.fsf@baylibre.com/
[2] https://lore.kernel.org/linux-mediatek/20210506094116.638527-1-mkorpershoek@baylibre.com/T/#m5c76f061c2158587b7190a13abbf2094b0c050bf

Mattijs Korpershoek (3):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
 2 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.27.0

