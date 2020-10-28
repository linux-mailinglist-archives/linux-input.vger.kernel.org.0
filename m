Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2B229DF84
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 02:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgJ2BCE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 21:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730946AbgJ1WNI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 18:13:08 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3625C0613CF;
        Wed, 28 Oct 2020 15:13:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so669762wrp.10;
        Wed, 28 Oct 2020 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DT6U3Rrpw03NL9wb6+e07l8WiQkrdkKgWOSxMXogg6U=;
        b=VSb7dfpw4irGstLagBSk6VtAJq3e8StKJ/EKo44Q0eHd+TYB/LWh2yU2pqTlCBmf3A
         9iGN+2Be/Snri6YY9ZRj+/4xosGc6ESHVDf56SnrAPg+fEna/A01URaYdIY471NOKDO8
         bTxfi4jRdF6iFIDvlPmi0dgN9JlutgOxM90nQ9oaATWal1ucddnI+R3q78QDATBjEF61
         wj3NSovgfL4vrSl01Z8TE4SG8ro+6tUteKl6xqDKZNhW2qH+/ldEpeHePm74RXEldwSZ
         1CsxzzxMle5WHlz29QZMfb3ShjSppnXrCFrAYMebdZJhur0ASoJ5FYg4VO0gDl085K3z
         sA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DT6U3Rrpw03NL9wb6+e07l8WiQkrdkKgWOSxMXogg6U=;
        b=dFqVSFA8B9GEjbvyzewO4QlJQXGa4W5Z/wKJPN+R22tZzvBhHyD+zi7ko9Qu2NsOqM
         MQrVhJ7eRvWPTdafcSLc0W6UUVSiwbgnmtbVON2oLFFFpYHqrDBc+7DSMgWptYMWkuo8
         7lsBlGmtebktdvASq9pckOwMJ2OVHZ+067xDzKTbVKWfMYy8MfjvqNoD1B9cD0hgsfMK
         /SKPHU+xr0dKkgAiGyposEavyGGaOrTiki2T9A/I/KyFsbMN2yATFPchw3fQ62Li2H/f
         U/sXtf7t+nspz7X0YDznPQxO3jRTylyCBKxYq5LvW4kZKl6wMj0Ztyk44nMzzSGmIa0q
         orJw==
X-Gm-Message-State: AOAM531QgxUI9Fbr6MSY84ZsV1aXfgOEeylgp0QKQ4u4CtT8E0qY/vm6
        GDijsAPR90xC++TMNv5ynCw=
X-Google-Smtp-Source: ABdhPJw2ck6qSNW3Dpk0b4qFpYtA9DOZDGAtqNDpTEFwJbNrpXE8Hb/+Cv07B6lJk8KqL6F4H7IByw==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr592183wrw.186.1603923186483;
        Wed, 28 Oct 2020 15:13:06 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id x1sm1318928wrl.41.2020.10.28.15.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 15:13:05 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v9 0/3] Add Novatek NT36xxx touchscreen driver
Date:   Wed, 28 Oct 2020 23:12:59 +0100
Message-Id: <20201028221302.66583-1-kholk11@gmail.com>
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

Changes in v6:
- Removed include of_gpio.h, added mod_devicetable.h and
  gpio/consumer.h
- Added kerneldoc to relevant functions/enum
- Used traditional patterns for error checking where possible
- Documented calls to usleep/msleep
- Using be16_to_cpu / get_unaligned_be16 where possible
- Added helper for CRC error check on retrieved buffer
- Decreased indentation in the CRC reboot recovery function
- Removed instances of error code sum
- Dropped all likely/unlikely optimization as per request
- Removed redundant reset_gpio checks
- Dropped of_match_ptr and ifdefs for CONFIG_OF

Changes in v7:
- Fixed typo in nt36xxx.c

Changes in v8:
- Fixed typo reset-gpio -> reset-gpios in dt-bindings

Changes in v9:
- Includes are now sorted
- Used proposed sizeof variable instead of sizeof type
- Fixed a return value check for common pattern
- Added NULL check to devm_kasprintf call
- Returning ret on probe function to be consistent

AngeloGioacchino Del Regno (3):
  dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
  Input: Add Novatek NT36xxx touchscreen driver
  dt-bindings: touchscreen: Add binding for Novatek NT36xxx series
    driver

 .../bindings/input/touchscreen/nt36xxx.yaml   |  59 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/nt36xxx.c           | 894 ++++++++++++++++++
 drivers/input/touchscreen/nt36xxx.h           | 122 +++
 6 files changed, 1090 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
 create mode 100644 drivers/input/touchscreen/nt36xxx.c
 create mode 100644 drivers/input/touchscreen/nt36xxx.h

-- 
2.28.0

