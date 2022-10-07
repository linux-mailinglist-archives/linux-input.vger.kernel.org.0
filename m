Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6735F7D80
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiJGSrV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiJGSrT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:47:19 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABE43B970;
        Fri,  7 Oct 2022 11:47:18 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-132b8f6f1b2so6472653fac.11;
        Fri, 07 Oct 2022 11:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F2IwNz99cS0Bf17GuhudhgDoss3z5lR0+B8Svcy1aUs=;
        b=SB3pTWkU0tmtmLlqjhc9eHcQPhw/al+HGcqNW4rVIiz5vXBOXSFF8UnP4aikX3s3AY
         R34VOchjdclNxvme0tQj3NjZEl2DZzeNBCvp2PBY8aN25XpxQR7XYfRRr+FOJzEb01er
         dcuIPjJp4ADmWlCKvMckdUWx4XTypYYv4g6JkE/TUpPzTCw18WDrCmVuJFzRmo8xFKjT
         6ifcXz2Cy82WuOFlalauvf/E5KiQoy82S4OaBFDm09zY7DHcUrQa/aDjQXUSocKEnyXV
         exmm+BpzIY384Ixnuup99E5HETm7P+xjoiQwHnSXj0PcoiHhlfWh6zbgvLbZaeHLgwNC
         HTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2IwNz99cS0Bf17GuhudhgDoss3z5lR0+B8Svcy1aUs=;
        b=klnED10RRz/UYrKuOSnLiXRsyD3nSvZauXgYW69eSHcDQhi+cyztiq19ygrQo3GCBt
         pXy93BcxQ27AoJ1ZjYGD9Am+9UKZswABh5+CoaW8HZulUvymroEqRFEUUM9MVkIzaSK5
         kIE68cbFCSOg+6JkbPE9d5ZTUghTeni9s85KkXgONzkoTHQiDe3ta/uT2x4FrGlFBzIu
         EH527VjPb0kdwZPgkn1oy1UwKGwWa0poS00S558DKrCUSaGB073JRrZzsSZhVVpQGV/m
         CL44qi8jivwKIREDM98J95VhfoE2G7cowYHfKrsqdtkYnKS2gwaDDmQX/xvAJqFmVfuF
         UfUg==
X-Gm-Message-State: ACrzQf01PWOnjE9GuF8PtadjwY4jbp+Enw3c8M/5eh7JwX+mwWiCuCZx
        RQwhY+p6CE45rml1K/iAzJs3fz8D1+s=
X-Google-Smtp-Source: AMsMyM4VmVB9SvCtxm3p0thjSVyiZd2d7wgvRuZx5VFvriLyu+YUzJKfksuMK+0em6QKsrzXwFUiGQ==
X-Received: by 2002:a05:6870:9a13:b0:132:7f13:e3d0 with SMTP id fo19-20020a0568709a1300b001327f13e3d0mr8569439oab.145.1665168437235;
        Fri, 07 Oct 2022 11:47:17 -0700 (PDT)
Received: from wintermute.localdomain ([76.244.6.13])
        by smtp.gmail.com with ESMTPSA id n6-20020a4ad626000000b00425806a20f5sm1267861oon.3.2022.10.07.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:47:16 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 0/3] Add Hynitron cstxxx Touchscreen
Date:   Fri,  7 Oct 2022 13:47:07 -0500
Message-Id: <20221007184710.6395-1-macroalpha82@gmail.com>
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
 drivers/input/touchscreen/hynitron_cstxxx.c   | 508 ++++++++++++++++++
 5 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
 create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c

-- 
2.25.1

