Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE1351C455
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 17:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242926AbiEEQAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 12:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381466AbiEEQAW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 12:00:22 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B375A2D0
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 08:56:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dk23so9571845ejb.8
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjBt4PhnxyvpQZHwHALGbz1X5a0xwh6G7fjizoTyXiA=;
        b=ZTU0SNmZWifpArOZCxILL1SHYnm+fwkV4zfQa0dehmOC6D+EdD2T94tUhkGrq5RDwu
         VIty5jNMoq6e/2XPmutsofxDGkSMxM62aTiasN4leHOn3IBGOjHDd6iFA1z7l/LAwRQy
         SaqCUOCtU7A1IOCnxJr63fR+eNnmf0X55eYxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjBt4PhnxyvpQZHwHALGbz1X5a0xwh6G7fjizoTyXiA=;
        b=reee7MRNE3lDD+WY5dv/Qd3A7HbjQS9Nl0oskgapBV0Pw/qF+zvQJ0dOtuczAu1yWh
         TPN7Ji44lyXMSWRA5NU6WFmMFW+gXhhANpysjKbh4Ud9jOairqjV/xrIDTL/zxHG3EPa
         zNpH4LLvbSSdyNaQZsKht+GS/4ND13MfkltH9J9h//HiE/tLZUvZiYXXlDIlS4ytotlP
         wfaogUxH5WZ8AwAp9R3MCiHcNLilqP2kdaHj9F+3jfL1k9nrD2hky6X/nL2wFLglDEAY
         zSNwW4L0aB7Dc1FcopPVZ8lwXOGrbQevAJGXCD1iAwQksoy6rdmUQyT4vNRU0zl72MVT
         eMIg==
X-Gm-Message-State: AOAM531OVBaFXXYJEpSk8QYvDe9+zZ5vYiRrqRi/jC0Q8oFcqoz7AIFi
        lX+Iion7MFc2ompLsT91nE89cw==
X-Google-Smtp-Source: ABdhPJwB/ZFjB6/h1JrEs8E12lO3+RH5QW17ibva6faESPfAZjkoAf0YstZGBgfG8dNGDjhQzNuQLA==
X-Received: by 2002:a17:907:72cc:b0:6f4:cc8a:2bcd with SMTP id du12-20020a17090772cc00b006f4cc8a2bcdmr8661986ejc.532.1651766199997;
        Thu, 05 May 2022 08:56:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d904000000b0042617ba6385sm1009328edr.15.2022.05.05.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:56:39 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 0/6] Input: edt-ft5x06 - Improve configuration
Date:   Thu,  5 May 2022 17:56:29 +0200
Message-Id: <20220505155635.419653-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The series was born from the analysis and mitigation of a crc problem
raised by an M06 type device. The added sysfs attributes were helpful
in debugging the problem. Patches that change the report rate on driver
probing, mitigated crc errors on kernel bootup. The patch to get/set
report rate by sysfs for an M12 device, has been tested.

Changes in v4:
- Add Rob Herring 'Acked-by' tag.

Changes in v3:
- Add hz unit suffix.
- Add '|' to description.
- Check the lower and upper limits of the report-rate-hz value
- Convert the M06 report-rate-hz value

Changes in v2:
- Add Oliver Graute's 'Acked-by' tag to:
  * Input: edt-ft5x06 - show model name by sysfs
  * Input: edt-ft5x06 - show firmware version by sysfs
- Fix yaml file. Tested with `make DT_CHECKER_FLAGS=-m dt_binding_check'.

Dario Binacchi (6):
  dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz
  Input: edt-ft5x06 - get/set M12 report rate by sysfs
  Input: edt-ft5x06 - set report rate by dts property
  Input: edt-ft5x06 - show model name by sysfs
  Input: edt-ft5x06 - show firmware version by sysfs
  Input: edt-ft5x06 - show crc and header errors by sysfs

 .../input/touchscreen/edt-ft5x06.yaml         |   8 ++
 drivers/input/touchscreen/edt-ft5x06.c        | 103 ++++++++++++++++--
 2 files changed, 103 insertions(+), 8 deletions(-)

-- 
2.32.0

