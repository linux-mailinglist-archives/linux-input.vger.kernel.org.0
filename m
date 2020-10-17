Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E9F2913E1
	for <lists+linux-input@lfdr.de>; Sat, 17 Oct 2020 21:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439280AbgJQTB7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Oct 2020 15:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439107AbgJQTB6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Oct 2020 15:01:58 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B62C061755;
        Sat, 17 Oct 2020 12:01:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so7057275wrv.7;
        Sat, 17 Oct 2020 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lY0Wfs38gEkgLKJzwUz52SVqLerStrn00vSXYT6J3B4=;
        b=ImdFVJYOwLhS29dOUWdNWY4ylN1Si0H/w+z0Z7a6VKytMje/ABpmIF0L+8tsVKzpO7
         UPdIbxbEMYczxixZON+0e1wOiiR1utKotsbqzNPRlbj7TiQJo7c/j9EDc7oojB92eU4D
         eE+KLbbTH30EJ6v2j8sWkY7uftxJBdlmlYEsuLzDHC72TrfmkNMzLBIXL94P4K2oxqRB
         akmnFmSmWLOWdCEyemo4TrenIIuk1KDIZ2x2nkkJA4QhTUb87zim5E/jtMEkXqAaAMR6
         sNu4o08YEzC6XF11lbLNchmKqRIs43gYWFrrXnkFvlm/jCduOGvMkGVn26aMNFG1rq1E
         xliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lY0Wfs38gEkgLKJzwUz52SVqLerStrn00vSXYT6J3B4=;
        b=GnIKvLPtItHxUJKdHRzDwL+kSUWQFxijsmHvWU0HgXWeOof1CCRLal924hW92boCEf
         qz9Zqa/Vq/m6+O3moIZsHIBpXJeofmBzN8bApRB0gIySzrmdiSrZJuYi1LZJWbSdrD4I
         TqNj3BlmOgOr6DNvahDw8cUYR+5G5XXYtVCPjYFVaPcHGAlEKPYWfK5rfzNGFRPoqoZV
         BnUtGoBAsYFcqtn77nR4VRjm2XWt23hNWg8aP+KCbF4vEZ2nyCZGXoPMCSnifPpzLFVN
         rl7OAaAJ1kBXHBDWXgr/ZVarZ9pxSwLQcTp4qtSNLuYKbIcFPsm6iXebm/3rPfVw3S5u
         kFVw==
X-Gm-Message-State: AOAM530wYCjPrYi1DGs74L4dVuovAbjFTq1u66BJI9A3cZ3Pt+jETtKg
        m/7R6TWx7laokLDVYSroQhw=
X-Google-Smtp-Source: ABdhPJyxZJ4XPaF/RqIDKwNoghACi18nzMCr/aEnYXrVV+ZFeBnrhUKLfCYY13tvjuQ/ytZRwD9UHw==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr11204367wrv.36.1602961316487;
        Sat, 17 Oct 2020 12:01:56 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a5sm9583793wrt.80.2020.10.17.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 12:01:55 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
Subject: [PATCH v5 0/3] Add Novatek NT36xxx touchscreen driver
Date:   Sat, 17 Oct 2020 21:01:49 +0200
Message-Id: <20201017190152.12780-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series adds support for the Novatek NT36xxx Series' In-Cell
touchscreen (integrated into the DriverIC).

This patch series has been tested against the following devices:
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

Changes in v2:
- Fixed sparse warnings from lkp kernel test robot

Changes in v3 (as requested by Dmitry Torokhov):
- Using shorthand u16/u32 (sorry for the overlook!)
- Now using more input and touchscreen APIs
- Fixed useless workqueue involvements
- Removed useless locking
- Switched reads and writes to use regmap
- Moved header contents to nt36xxx.c
- Fixed reset gpio handling
- Other cleanups
- P.S.: Thanks, Dmitry!

Changes in v4:
- Fixed regmap read length for CRC_ERR_FLAG final check
- Fixed YAML binding, as requested by Krzysztof Kozlowski

Changes in v5:
- Replaced subsystem maintainer's name with .. mine,
  usage of additionalProperties to unevaluatedProperties
  and a typo fix for reset-gpios as per Rob Herring's review
- Changed compatible string as per Krzysztof K. request
- Renamed the novatek,nt36xxx.yaml file to just nt36xxx.yaml
  in order to now reflect the driver name instead of the DT
  compatible
- Fixed blank line at EOF

AngeloGioacchino Del Regno (3):
  dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
  Input: Add Novatek NT36xxx touchscreen driver
  dt-bindings: touchscreen: Add binding for Novatek NT36xxx series
    driver

 .../bindings/input/touchscreen/nt36xxx.yaml   |  59 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/nt36xxx.c           | 815 ++++++++++++++++++
 5 files changed, 889 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
 create mode 100644 drivers/input/touchscreen/nt36xxx.c

-- 
2.28.0

