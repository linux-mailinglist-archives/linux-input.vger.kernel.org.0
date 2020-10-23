Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5A22973EF
	for <lists+linux-input@lfdr.de>; Fri, 23 Oct 2020 18:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750725AbgJWQdL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 12:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465280AbgJWQdL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:11 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E89DC0613CE;
        Fri, 23 Oct 2020 09:33:11 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id b8so2704949wrn.0;
        Fri, 23 Oct 2020 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1SwKwiPmjdYblqHqMnH6u+6pLbnCEWeJVYVaX2NJgK0=;
        b=srQUsGDqfe66/423C2+u9gGLJT1XlWjdyzJfCqj8lAkudXLu254cXyzpFt953fyAMo
         i2i83ugxTAgfo6UpqiqBbSzaZTc5ZBE7RvKGktXaJiC5J9bO9c2Pf7zqoxjwJHZexBHb
         28NoB1l7WOFncscd6U54goS6YsLdVEeXjijSEop7QrtwU/nUNgJ6CnVY+hwWxAizc3J4
         KYMtN8IdTZ2P9hYjzOsl8ZKwgjZTBFvH+8Z0VXoHyHRUKkO9UCC31JSEBhieUexlWZ/3
         sQaZ6HYvy3e84EpFLTWCvvvvEcIzssJOeSksh+77BzZScClHCT/6rNZgG5mOTrx9vgxX
         SOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1SwKwiPmjdYblqHqMnH6u+6pLbnCEWeJVYVaX2NJgK0=;
        b=nO2gOkC/9O8XJlGxm7GQ4Jc8P7BvWp52QD/fM9tel/wLptZ26/0+c7XcoBTZ/b8v4Y
         h8UTKaNtNXxAw6+iEj0TarDl65dGEcy0hNwYvlArFVlkQGfGcmEzDbdDWRp5oAygpafq
         Juew/NA0PefITPIA8w+C9eEZW/1RJP7BtpTLsp2+ZVIcZe3GKNnmv9rOkZw5ce+/s2wb
         Zo4bPiL1xVj77aP5dzx8wfU9FgMgyfC8MrkJqCmFNydDfRqM609VvI+Gi1F9uZI1Qvjj
         ltdCT6UEsV3ciBTH7HMjkxgQBn1NR71UeB7aZ3yP4+VniBuRZ/nMpqrWVTjz09rzvF6J
         jSbw==
X-Gm-Message-State: AOAM533bmxcVZa6EQeuj8ztt2+2JmN79bHERVEy8jyME0Nook71/rVCJ
        OMYAc359IRmnTqcA1QNtzOQ=
X-Google-Smtp-Source: ABdhPJwdDHwlv1Io27fEfZSMdembBC2XKgtMA5+s5LDxo/jkPRAXRxAoiVs3AzE31+CfVeL6oejS1A==
X-Received: by 2002:adf:a50e:: with SMTP id i14mr3549929wrb.121.1603470789653;
        Fri, 23 Oct 2020 09:33:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u15sm4334808wrm.77.2020.10.23.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:33:08 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v6 0/3] Add Novatek NT36xxx touchscreen driver
Date:   Fri, 23 Oct 2020 18:32:53 +0200
Message-Id: <20201023163256.96000-1-kholk11@gmail.com>
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

