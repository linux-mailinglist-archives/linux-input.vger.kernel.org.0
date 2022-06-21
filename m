Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C074553243
	for <lists+linux-input@lfdr.de>; Tue, 21 Jun 2022 14:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350052AbiFUMjp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jun 2022 08:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349327AbiFUMjp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jun 2022 08:39:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558E8237C2
        for <linux-input@vger.kernel.org>; Tue, 21 Jun 2022 05:39:42 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id v1so27146807ejg.13
        for <linux-input@vger.kernel.org>; Tue, 21 Jun 2022 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjBt4PhnxyvpQZHwHALGbz1X5a0xwh6G7fjizoTyXiA=;
        b=eKK2Ss68RzMEMLLhInjk9Sk5Pa7z7rmuUWKu9+SZnuKWe4qM7gbP73qz0k+0u22niv
         eb+w5qkIBnVo1/QdYtfmHsGDDIrmRlW2DAgJ+7pL/j29za858EuqL++UQ8CBjFy1fGFi
         vBi+vixQAS2jVjNwmTUZnFV4Spgf1aqGJgKbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjBt4PhnxyvpQZHwHALGbz1X5a0xwh6G7fjizoTyXiA=;
        b=FXt/2jG41XHlfNNaE//eblbZw+vOhXYZcNJzB6jFfZZrDNwRszpj54qxb38x0lxd7m
         9WtdQYkP46qSkr9viYwhOzl6se/9+8ZML1+czrk/zcUdA6ruTRcqS3v3SSuWvzIKnhHx
         QnbMdDzVy52xOILNPAh0VJQDpUAKKRquaV0RaH05nz/uXkUq+IYZN9I52TEJadIAWmLj
         QNDyGSkmXzwBtBo8i9dLnZFX39It8BbT2XEywtarp0vtjGh5VgoatuJ+ibjBTKmYmBFo
         p9bK4PJSnQHtE+4bvA44oCrd2LU8yS9uynAZeXx7lm9tQXJNDcxzNV078/XQ2iXB+u+N
         TEHA==
X-Gm-Message-State: AJIora/+z7tFBECCXdKhW1YmPxUrqsisgr/cSPOLtONQ3poDYvMj0DXY
        pH0VSJrKMsPsYAUy9uYckou28w==
X-Google-Smtp-Source: AGRyM1sAWmqa3RsSBvYW/RttYeKcIBN4HDy9kjb49X/P/roUWJ68SolbmiDPG4tyPsDMkNhqnEn7kw==
X-Received: by 2002:a17:906:779a:b0:715:790f:715c with SMTP id s26-20020a170906779a00b00715790f715cmr24274064ejm.707.1655815180886;
        Tue, 21 Jun 2022 05:39:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-116-90-174.pool80116.interbusiness.it. [80.116.90.174])
        by smtp.gmail.com with ESMTPSA id c19-20020aa7c753000000b004357063bf60sm8003945eds.41.2022.06.21.05.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 05:39:40 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 0/6] Input: edt-ft5x06 - Improve configuration
Date:   Tue, 21 Jun 2022 14:39:31 +0200
Message-Id: <20220621123937.1330389-1-dario.binacchi@amarulasolutions.com>
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

