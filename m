Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E6C2993CC
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 18:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1776176AbgJZRav (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 13:30:51 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:54806 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1774034AbgJZRav (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 13:30:51 -0400
Received: by mail-wm1-f47.google.com with SMTP id w23so11397214wmi.4;
        Mon, 26 Oct 2020 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G4qqXRgm4LeNt9OId7TxB7hpNixh8yG80r+na0xzUmA=;
        b=uoKXPEMkxYQNlOD01+ydycobz0fsk091jFO6eP5tKCfx4FNeWS32Y1950WZ2lyzLMT
         7wundIsZKZDTmhaHOOS6d9WGBJKay1iFFIPutFAV3ndzMN/gG2exfgfXPSrZ9dD2sgyT
         F6C7m1JOj4fak6m97VOp3BbfhPI1ljEVxdo4dM5fxe8XqaxeLcc9H4N75ZUGippHXglk
         Nom/R5Sf3v4kvjE77FYL9QFIsLxNztNw4DYynkuBs0/01UUllmp9aCZhbwJSWBlMMDUb
         HIqBpQVrUZ3iiBbb9djUaBwMoRZl+Y/6OXjCwea5V/fvujGHm0p5d4Qq6zRYdL/vtsHx
         o+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G4qqXRgm4LeNt9OId7TxB7hpNixh8yG80r+na0xzUmA=;
        b=kdHUDv9azimVU2+/DgTDQhNBUUaSSmlicYeMD33cWmsxotQ7P1KheRqa79Q9bM2woB
         6jaxD4tj2ywk/PkTEg8JsqO16wvLxUxJgXjV/e/Mg2Ea92VNuozgEhOlLgmQLr3YhRDo
         9yT9jgtRkAJZXBGGz0RfT7gB1NwQk0HpacPTsGfGWYtbgq/+MN2EhtA4SDshzlCQ1feg
         ej3TneNJjggl/ETqg/paap/TlFoGJ/ouD8ZMfWxY31IbRUZySjczenS4Gds3FClBqqxC
         2noUOod8UBFsg+a10iANHvWueB/4ieJY/zjubcgPFgDCkUs6WxB4KaNalIEqdN7cYaqe
         HObQ==
X-Gm-Message-State: AOAM530dvDwco5BJCEVtXkthTO+J3OinOnMiF4rRMo5quqVFCXrggW7f
        OtbOwVplOVVf83qL0vj338U=
X-Google-Smtp-Source: ABdhPJyBbKaiW8XKAYNkwotvpJMm28FEhpDE5GtfRf5SsEel4z1rKHYo5QktDg8CHkgMxnkw2TzRaQ==
X-Received: by 2002:a7b:cd0c:: with SMTP id f12mr16618677wmj.62.1603733448687;
        Mon, 26 Oct 2020 10:30:48 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b18sm1996808wmj.41.2020.10.26.10.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:30:48 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v8 0/3] Add Novatek NT36xxx touchscreen driver
Date:   Mon, 26 Oct 2020 18:30:42 +0100
Message-Id: <20201026173045.165236-1-kholk11@gmail.com>
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

