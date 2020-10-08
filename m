Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FB6287B6C
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 20:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgJHSPU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 14:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgJHSPU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Oct 2020 14:15:20 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5928AC061755;
        Thu,  8 Oct 2020 11:15:20 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n6so7342423wrm.13;
        Thu, 08 Oct 2020 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YLvCUXrjTOYrDRqLi+QFImHhWm8A6K5Fu1cSArDLzE=;
        b=B6Z38E9aod5VJnr/QNztjoxZ9InxeEyVa/kHdYYVUhgMDxSaBVA2vtmK82uTZPNJoO
         BxC/cmY0GoBOoJxuBMznYOuo9wtXnyr3dpJEBhpQNENPZQt8gXvW1y+JOjoeDnyOjuYQ
         ha++7sPlZucAe+ose7gsJkTo+eO7hKMmdHdFArQV8blpdLxeq+Agk1RDNoIsKjHmf9jH
         PgVwWwwzddfFLCwYBQpBJSuGSRLsVxM3ow26gzYW62nA7dKB2WlDDBfbM2pwUIR1fvpO
         Of0QCDTwClNgXb/tfMbOU2gtmwCJRNXhtL7PdbaM5BHG2pk6M8ut9O+vt/q6Ats8gCNa
         lfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YLvCUXrjTOYrDRqLi+QFImHhWm8A6K5Fu1cSArDLzE=;
        b=bPoGuM5aZNs+kS0h7YxAD6thfVZwEn3Qdungs/oKK8w4eE+7JW3KVtYQbGOdvhcnr9
         GwnUkyII6VdY63CxoVFWsjaMKFNDJ8SjceejlD63Awtgw8RByzH5UxaD/WUDGqDdY2oS
         HZf/kBoSEO7qGOwpEj6HnQEu7NF0QXg5eRF1uiQqDxzaljwBglcoZXGMHbJ9QEZFfAr2
         BxY8ekx+VOy5lQhiBrJAY9pTVqW0gaVNbTFR8M3DwYNmnRw/WUWLlGr3Jsv8UmOwhFi6
         IH7KON3/zj8rb67i5if3hPIsq7xANzfdMZwdfiV0WoeF92IrZavAPFXOA0l98DEFcTzk
         UKJA==
X-Gm-Message-State: AOAM530nplwz2YayvYtrJ12FPpvEptmt8TaD8QASkjD5bDH5muZkugGF
        6K6fwAmrPIfrbj8bNp6Frvo=
X-Google-Smtp-Source: ABdhPJwYvXjwC+cGjl56lVK4C0zZKgmreBD+2mRJfMdykOxZo+HZVX2Tmi0Zz3UbQEmBOmz/VGaLZg==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr10924969wrn.109.1602180918751;
        Thu, 08 Oct 2020 11:15:18 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id e7sm8897285wrm.6.2020.10.08.11.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 11:15:17 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
Subject: [PATCH v4 0/3] Add Novatek NT36xxx touchscreen driver
Date:   Thu,  8 Oct 2020 20:15:11 +0200
Message-Id: <20201008181514.668548-1-kholk11@gmail.com>
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

AngeloGioacchino Del Regno (3):
  dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
  Input: Add Novatek NT36xxx touchscreen driver
  dt-bindings: touchscreen: Add binding for Novatek NT36xxx series
    driver

 .../input/touchscreen/novatek,nt36xxx.yaml    |  59 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/nt36xxx.c           | 816 ++++++++++++++++++
 5 files changed, 890 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
 create mode 100644 drivers/input/touchscreen/nt36xxx.c

-- 
2.28.0

