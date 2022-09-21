Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 633EE5BF656
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 08:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiIUGbB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 02:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiIUGat (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 02:30:49 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C5225E94
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:47 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id i3so3352382qkl.3
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ynq2EL20CO6hM5n78mikzYmKYVR0vy9jxqLHwfMIlh8=;
        b=cWIUc3dJWuEwYUSz2ou4UAE89B4CrXEk8zbIYIpbQ4edujT50r2OrlBK+Sx49PUV8U
         DisR5DjmeqxnNcZBowjXUQsPKK8QNvljsiHXMqkv3srkoO8rcKUMjCL+sCQG6bmkxEtS
         LZDBCGnSPQndbho1fB5Q5A2CBcg1NWsx4HF8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ynq2EL20CO6hM5n78mikzYmKYVR0vy9jxqLHwfMIlh8=;
        b=gbeugDfqSuaqfpmmbswnJDZ1hU6X64ZSTKHRryd7BNnm1rig47lhwcQeYb0eTwTNof
         7ai9JxUpJcLeqsIXFt07tnZUika5i2llNgx1mR/GbJnpXPRV7dOqNj43rsgPQEUdk+BX
         6BEzLA+Mce16p6XcYjkx4h24Fq/oB4/C8/u5UVYvF9gGpzM9Yw6j5+9Z2yY4G3w8mGVh
         +7WkMbqHbcWQ6GScTFydSdm89Fgjs6u2jvIuZBcYOFoXy2fTff7I503SU4yW0iIJfm1Y
         FSVOpvFXCplaWHIOQ2vj623KGZQtOgsn0KZvfi0s6iImOSnBIbk/9xW/jd4m5DJRh71n
         Yzeg==
X-Gm-Message-State: ACrzQf2qlWoDicAytCbfmlglJdYCo35V00cIbUNNHhiyKYiXLJDsBpMa
        uIcp6/8tl10gnQrbsZA8A0Cd0A==
X-Google-Smtp-Source: AMsMyM6G36yO/HaPzW90E2W3HOgt/jMLVKw0pYL7mA241IBW6HiYe+3BObWfuMLcGfd/As4UQwTmwg==
X-Received: by 2002:a05:620a:d96:b0:6ce:bca6:9dd0 with SMTP id q22-20020a05620a0d9600b006cebca69dd0mr19477102qkl.152.1663741846903;
        Tue, 20 Sep 2022 23:30:46 -0700 (PDT)
Received: from localhost.localdomain ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id m10-20020ac807ca000000b00342f05defd1sm1060855qth.66.2022.09.20.23.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:30:46 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v4 0/5] HID: mcp2221: iio support and device resource management
Date:   Tue, 20 Sep 2022 23:30:21 -0700
Message-Id: <20220921063026.89619-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset is primarily to enable iio support for the MCP2221 HID driver,
but requires several Kconfig changes and device resource management.

First attempt of this patchset is referenced here:

Link: https://lore.kernel.org/all/20220729154723.99947-1-matt.ranostay@xxxxxxxxxxxx/

Changes from v1:
* Fixing various Kconfig recursive dependencies that appear with 'imply IIO'
* Switch hid-mcp2221 driver to device managed resources for i2c support
* Reworking patchset per advice on lore.kernel.org link above

Changes from v2:
* add linux-iio list to CC

Changes from v3:
* replace .remove() tasks with devm_add_action_or_reset() in .probe()
* reschedule SRAM configuration read on failures
* add IIO_CHAN_INFO_SCALE values for ADC + DAC based on reference voltage

Matt Ranostay (5):
  i2c: muxes: ltc4306: fix future recursive dependencies
  iio: addac: stx104: fix future recursive dependencies
  iio: dac: fix future recursive dependencies
  HID: mcp2221: switch i2c registration to devm functions
  HID: mcp2221: add ADC/DAC support via iio subsystem

 drivers/hid/Kconfig       |   1 +
 drivers/hid/hid-mcp2221.c | 297 ++++++++++++++++++++++++++++++++++----
 drivers/i2c/muxes/Kconfig |   2 +-
 drivers/iio/addac/Kconfig |   3 +-
 drivers/iio/dac/Kconfig   |   6 +-
 5 files changed, 275 insertions(+), 34 deletions(-)

-- 
2.37.2

