Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1D7297BFC
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 12:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761090AbgJXKv0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Oct 2020 06:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761063AbgJXKvV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Oct 2020 06:51:21 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF92FC0613CE;
        Sat, 24 Oct 2020 03:51:20 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j7so5395470wrt.9;
        Sat, 24 Oct 2020 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYBEu+XIpVxT/d1O5SyVF+M4kAJUK3zMkGugTuKmw1o=;
        b=UYaXezr5z227ihUATXSvl8+1RAJvZiPfJGCOjOZNvRRMrqpgsaqUdJjW31Rt4yHhYo
         +xcxL0RYVEqGSvHOgDv0P72++tDe5ccxRXwBOvbg1accUq3iKxHcJTk2o/wUyGPHcTj8
         +aOp5AQGi5LUN8NJnThDBmD/MDjuPyFX1vepy4rD3D6fHuZzkSnYhP2dzcB7gpapfzZ6
         IhitTZeXlPigogVpCvmsFbD/JQ9Jxtzm3hVcJIx1iW4qpelmehecgcVoWm3nftyzSe9u
         ESx1wUWognz8vr7sqxRZU21nU421LKhxWKmVZb8xU0fdjtd8fl9PR4NosUqVIFvGxd2Q
         9eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYBEu+XIpVxT/d1O5SyVF+M4kAJUK3zMkGugTuKmw1o=;
        b=PI8aPQjUne5L1HGIFAnwP8Id13a3uzO9aw9klDiP6OHHvgPeUL30Q00KUeVzxaGVhA
         0Laj/yGLrzOkqKYgmRn08Fp/mlSDSeqWBQsaqGBh7ZPuBhL3SAviacbZpUPYAAFx13gA
         pwJd8K7olNxMONM1L5HFv5myUUDgDp2jWRXT8wksl4DnFfGTS+h8xJcYxcmHBd+GC/Wk
         Lb0k/+ZwfcIgfg+wykbS2pYzloNYn8e/RHpXyrbiL1r7HEy/hvutCtdb042mq9fFEZhW
         dTCrQxcO/t7YSJbOcEaUO00NBsAAtopRgoTzgAdXCzespKUsB2p29xaC+20QR+8PxcBK
         ZSug==
X-Gm-Message-State: AOAM533Z/jXn4ROB8sATql7jLmPMQvfmy5REXe0zMdAmTRJBwvy3RqTP
        3mlJdDlJm1lgan4U+6qOwn3varHKCqZ1iv7w
X-Google-Smtp-Source: ABdhPJwQ5WFZLo0rc8qs5q3wBq4W1w18TkHyG+0ZjJyd3C5MJETRw4mXUqBtzXlGqMCZxDF4XGR1pA==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr7516633wrm.53.1603536676477;
        Sat, 24 Oct 2020 03:51:16 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 3sm8792632wmd.19.2020.10.24.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 03:51:16 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v7 0/3] Add Novatek NT36xxx touchscreen driver
Date:   Sat, 24 Oct 2020 12:51:08 +0200
Message-Id: <20201024105111.15829-1-kholk11@gmail.com>
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

AngeloGioacchino Del Regno (3):
  dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
  Input: Add Novatek NT36xxx touchscreen driver
  dt-bindings: touchscreen: Add binding for Novatek NT36xxx series
    driver

 .../bindings/input/touchscreen/nt36xxx.yaml   |  59 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/nt36xxx.c           | 895 ++++++++++++++++++
 5 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
 create mode 100644 drivers/input/touchscreen/nt36xxx.c

-- 
2.28.0

