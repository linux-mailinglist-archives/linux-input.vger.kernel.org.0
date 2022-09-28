Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC315EE894
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 23:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233134AbiI1VsR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 17:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbiI1VsP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 17:48:15 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9D590C47;
        Wed, 28 Sep 2022 14:48:14 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-131886d366cso7387857fac.10;
        Wed, 28 Sep 2022 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=aFNSQQkHdIv3eNYnOMb7IChM7MT7DX0ilP6nUO10rBs=;
        b=imBuE0cdGBJC3sjLmsTrSlLycr1wooEhXrt/z4Xy+SnN+bpXyFCRHZZP79JyiVjyzV
         11AWJloBV+BL8YgB8Z/Nh3UyNGLtnq+wdBIealRrk9stZsvZAV9T6JlMdRHLA48LphJY
         lPrFmxDSOtu4NRTs4ZsjF0L4QkTjcmQ3B/xDWI9z8+5VcFQS8H0nJmrAFM9da/1ENph8
         u/nST4z6clh7GAJT7U/zuprmaMvtrpMcfC6GaMXE1ivfCKhN22tO/uyxzc47SSNuJjjO
         Q0FfIQr8+UTZuvoFItrOk9CScACFp+XDlTSfXDih6a3120OxruerK4CY+QLfaOp7CxZU
         QtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=aFNSQQkHdIv3eNYnOMb7IChM7MT7DX0ilP6nUO10rBs=;
        b=YMya5gTW1xKBtLFMhA5ofXIiwdh7kcSbpJcrLzhs1Fad6nsRrojgMgkIZUyHO5XQSZ
         h9b59aXNgoVDTegyYDAq5Iy62+Bi2rQLS6m2AFgzZt6cyZofadLDV1VcuaU9uybor/ok
         JIASCJdBhhMMcUyjeA9RGm8bEgMDnS5IMyI6+S37Sa5JrHXC8zDns6WW2vrf2cvD2y6T
         AJ4REP/ltrbFiWoC/GxOweSL6D0A3jGYARa3FN8QijL0G85YOIwtWlV9JnWq7diki9bX
         wuxDRzNWtlc7pdtbXCMDIYyUl4TXbIqRoV1Em/nWQyQrVxhjuO82+9X5FsjbvUmjrM5x
         Y22Q==
X-Gm-Message-State: ACrzQf24eV/GgTCT0B8O9Wdy02dhuJu5CLj/aWzNw+GmuCxxtxEqDYnO
        c+7irte4y55AVaSnzYtcXTlds5wTRgw=
X-Google-Smtp-Source: AMsMyM7bRb6y+nY3P0ZugUe6N/OBWdL1ZuJ3NMGuIqOoIgiIR2p0i3hRlKYGJD+gxxpu5X2CDg0MtA==
X-Received: by 2002:a05:6870:460e:b0:12b:14cc:aa0 with SMTP id z14-20020a056870460e00b0012b14cc0aa0mr6489619oao.279.1664401693731;
        Wed, 28 Sep 2022 14:48:13 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id m18-20020a9d6452000000b00657a221eb71sm2623211otl.65.2022.09.28.14.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:48:12 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/3] Add Hynitron cstxxx Touchscreen
Date:   Wed, 28 Sep 2022 16:48:03 -0500
Message-Id: <20220928214806.13572-1-macroalpha82@gmail.com>
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

Chris Morgan (3):
  dt-bindings: vendor-prefixes: add Hynitron vendor prefix
  dt-bindings: input: touchscreen: Add Hynitron cstxxx bindings
  input/touchscreen: Add Hynitron cstxxx touchscreen

 .../input/touchscreen/hynitron,cstxxx.yaml    |  65 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/hynitron_cstxxx.c   | 483 ++++++++++++++++++
 5 files changed, 563 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
 create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c

-- 
2.25.1

