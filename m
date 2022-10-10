Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3CD5FA12D
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 17:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiJJPfa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 11:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiJJPf2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 11:35:28 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA7665269;
        Mon, 10 Oct 2022 08:35:27 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1364357a691so6352151fac.7;
        Mon, 10 Oct 2022 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sb33QLCajMgvThzR/lhbrZRS/DcHa+jB8QfRlWLw/ps=;
        b=Dbe2qk4jubJbUGTIKOZEVRRw3kep+lmu189rWwvJUIXnm5Dda/lYdwR24Aad77qTQH
         /nA+UuzrUyAyFMcUJujBt4RfkRkBSQlVaLesrdqSFl8GqVOZ8v/6NrPxRMCDGixTx1i5
         RgoKb+fwQAuHPhXTLy3y8r2+6qTuJXEl0fQ6cMP/KnWAYOlFKzQmexoCGrPqKpbXtS00
         Qn3T4zh0SjyJkzk2zxWO8hjCO2UGg7ZKU+mNF/zuchLOyBlyOCj0mCwjaihFFXdSc3gL
         1P0Wx090vuCK42RTwheNTObpaAZTWy5tsxA4mBGDNaTihObzkjwe4mN0o+wWv+IwL3rU
         0/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sb33QLCajMgvThzR/lhbrZRS/DcHa+jB8QfRlWLw/ps=;
        b=bwbAqa0rLgx9WAWaUxe+InDRab1aVQDgthbgSuRzuv16cmEO0wMCy6/nXLDlvAR+BD
         HgCkJRXMzGBPvC+J+s2Cr51y7zoA6TPBXbN0J2oOEgJT9QUkz0H3vnMksSm42djq4nPn
         XggwFvMsWaZ3uGd+fdemrMN8m1zZkzE7ZsA3l7h/274bV6lT+BfdMm2xuXjL/QG6ehlg
         hh5Y3M4Dqw9zHCBK9DJTqmGNqZwKrkCI2BxyC+cdH+U8xnKRIopKCCuyq6adPakIxNKI
         clW9Uty+VSFtWMiydN3/lDp/A/8tSzFeUIOAvK31X/7yPHUO2BxVmQuacosRvXePVQb2
         VTvw==
X-Gm-Message-State: ACrzQf2p7h0ha6tq9FkyYH2PzCPaDYuNgn+2W67fmw7DYWKgFhf4UgyJ
        Q15fmS1wt366TXzdovqHK3erUs9XfC8=
X-Google-Smtp-Source: AMsMyM4h3SFBx3Alpye+js+I7a/BWdJY4V0KQZMXiJtUZXKSG9rYDKT5MRcuYlr0+h2NGTvY0XukFQ==
X-Received: by 2002:a05:6870:608e:b0:12b:c0de:bc9d with SMTP id t14-20020a056870608e00b0012bc0debc9dmr10337851oae.52.1665416125631;
        Mon, 10 Oct 2022 08:35:25 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id a2-20020a056870d18200b0013125e6a60fsm5264309oac.58.2022.10.10.08.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 08:35:24 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 0/3] Add Hynitron cstxxx Touchscreen
Date:   Mon, 10 Oct 2022 10:35:19 -0500
Message-Id: <20221010153522.17503-1-macroalpha82@gmail.com>
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
 drivers/input/touchscreen/hynitron_cstxxx.c   | 508 ++++++++++++++++++
 5 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
 create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c

-- 
2.25.1

