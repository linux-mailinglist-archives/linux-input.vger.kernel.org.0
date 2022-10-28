Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C157F611B81
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 22:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJ1U1E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 16:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJ1U1C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 16:27:02 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7C11DC0B8;
        Fri, 28 Oct 2022 13:26:58 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-13be3ef361dso7514855fac.12;
        Fri, 28 Oct 2022 13:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYeicBb6Ktx/qXuyY0v8J9BOCMD+rBtMFSIuHFZrlWM=;
        b=AJfI1orcrXdVjwjgLOdhlvliU3t7+pKRMmQd3wH7E+kD/7F7jubSHGHysCBYc+QAzx
         GSwaJ5RpabQuV901sSxez+s57B2ixFkJapiqii6BKOR4vnZ2sa/4tgvBBJZ/pV3GwBpP
         l0bUXnrvTWImoc+VGNK+wJxCI9ljeshma4V4IuqIii4U42K2al6IucI+QoFU7znDWUAu
         wj+ahE3U0WrVC3cTaWGkJJ6wolg4S2Rex4o+crNeLsW3rAn4omjcMNXYZnC8kMqS8fhc
         AiEAOhKe2qPGmfyU6T/HTiZx7OdBW3n1N3sN2O6/Q3n4XcPiBTaHH1I+NLARXc6ZDctq
         RRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYeicBb6Ktx/qXuyY0v8J9BOCMD+rBtMFSIuHFZrlWM=;
        b=X97FMxiRWQM1x1n+PmLtZ36eIm8JV6gH+9sf+piJc2dQ5/KSO9uwmJlnANVR2Jl3LZ
         vgubhHk6MO7W1UqKso/RFbmvJBF0cP8u2v9W44fOYSUjp41s6a91/4o69VQbGvplEfe9
         ++xjaDDXsE9YlhuXN30zyNzfgKwu2FHP5jp4vSzNS/HC2FGZ5xjvZZVT0C/xy5nOfhVV
         oAj8taCRBm2qyUHdNdIQwuJBAG4Wvcp+N/R33Uxutl5LGo4mhlG5OAsXmozDMnAmY+y8
         V8q0R+Gx/6wqlfFX5eLnshM/FgNL9CrFTGwBnyJ253Nc1eKM7leme244jXSczJszj6eu
         HobQ==
X-Gm-Message-State: ACrzQf0vMzbTdM610I4OeN0qmnUeDhAF2OcHRo6z9NNwl65gATzA5qON
        BZ9pnfBXfVkUd2I+moLWp1znE0236JQ=
X-Google-Smtp-Source: AMsMyM7MzVsmuuaszKF1v7tGOktSQmFmbaRnoxG22BBwGQZWqnnh4fxccPbLwrVpIQfpFZZWdXIGrA==
X-Received: by 2002:a05:6870:b491:b0:133:b1f:b948 with SMTP id y17-20020a056870b49100b001330b1fb948mr564044oap.290.1666988816950;
        Fri, 28 Oct 2022 13:26:56 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id u43-20020a4a972e000000b004728e64dc0fsm1914744ooi.38.2022.10.28.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 13:26:56 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, mkorpershoek@baylibre.com,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 0/3] Add Hynitron cstxxx Touchscreen
Date:   Fri, 28 Oct 2022 15:26:33 -0500
Message-Id: <20221028202636.14341-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

This series adds support for the Hynitron cstxxx (specifically
the cst3xx series). The cst3xx supports 5 point multitouch with
hardware tracking of touch points.

Note that a datasheet was unavailable for this device, so it was
built based on vendor provided source code that was tagged as GPLv2.
Some of the register functions were discovered via trial and error
and labelled as such.

Changes from V3:
 - Removed of includes and changed from of_device_get_match_data() to
   device_get_match_data().
 - Print checkcode read from the device in the event of an error.
 - Removed extra dev_err() print functions.

Changes from V2:
 - Fix issue identified by Intel Kernel Test Robot. Changed functions
   in driver to static. Reported-by: kernel test robot <lkp@intel.com>

Changes from V1:
 - Updated binding to specify cst340 instead of generic cst3xx.
 - Defined various registers and commands to enhance code readability.
 - Changed name of chip specific struct to hynitron_ts_chip_data.
 - Removed unused and redundant values from driver data.
 - Switch to gpiod cansleep functions in reset.
 - Refactored read/write i2c functions.
 - Changed variable names of ret to err in certain functions and added
   additional error handling in input registration function.

Chris Morgan (3):
  dt-bindings: vendor-prefixes: add Hynitron vendor prefix
  dt-bindings: input: touchscreen: Add Hynitron cstxxx
  input/touchscreen: Add Hynitron cstxxx touchscreen

 .../input/touchscreen/hynitron,cstxxx.yaml    |  65 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/hynitron_cstxxx.c   | 505 ++++++++++++++++++
 5 files changed, 585 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
 create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c

-- 
2.25.1

