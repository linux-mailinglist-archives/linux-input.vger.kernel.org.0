Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097C44B3C65
	for <lists+linux-input@lfdr.de>; Sun, 13 Feb 2022 18:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiBMRPy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Feb 2022 12:15:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbiBMRPy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Feb 2022 12:15:54 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A878858E6D
        for <linux-input@vger.kernel.org>; Sun, 13 Feb 2022 09:15:47 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id jg20so8033049ejc.3
        for <linux-input@vger.kernel.org>; Sun, 13 Feb 2022 09:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9MPHlFrwB1AIaRrVksm22KgsTglVC3BMVPKSN6mOUY=;
        b=ofyDYtpNgouEVX7gOtAFSj8cSZCLEz3TXD/HACNOFQcx8n+b91koIqr/LG0Ql3hmbJ
         mJDqwzf8EjqIzQ70RdtYAk9Em5zmqln6NL4J9qHB4+a9O07QV+iirtWG2JRqPkpezi75
         ZK8sAWcRuJ+5JaelIw0b5NfEPyjz8Mn+bDF0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9MPHlFrwB1AIaRrVksm22KgsTglVC3BMVPKSN6mOUY=;
        b=q3FhQGjhJ7wnoQPfiUqBRqZjXnsryTKl92YgV4Ye/ZhWi1/wtO0Luj7AO0fqAK7ryO
         mbsJOCnqJN4jiSxCdkmKK1TAdOL2dx3oxcFlopOKWig5gAmQNIhIZ/6ZF/Ta4Z2V++Op
         Cx4DCdWH4bbmsW7ILXscJDl/g82mgSfXy0bj6FF1Nf3yM5Wn32/HwUMofYi3vFfaAFH8
         +ISafi/Igv9Zsi0btIwrbkzoz/Cmh0gnPdEhHLfMTqwAQVr86gMc2GVZ9TaYJvI9b7oi
         B9+1EeCDvJJYgwGve2f02fCD1hPdaxoK2HQ7IUk9tA7SfgXtpuvWzfLMkwR6YTTQml6Z
         Szxg==
X-Gm-Message-State: AOAM531p/ZpOVKtatHDnaLdZF8aoBGUVShu1akKCoIuqPmNVuq+0RQEm
        SKxGx0Cw1Sxx6/Bc/U2czHNl1Q==
X-Google-Smtp-Source: ABdhPJxzrYnp0KzwWb+SoSyHHC1bsVKGey8t110wlfenAXc4cu3PVtFf+zECOtq9bIZ7nETEOWUSwg==
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr8574709ejc.637.1644772546240;
        Sun, 13 Feb 2022 09:15:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
        by smtp.gmail.com with ESMTPSA id o10sm6598878ejj.6.2022.02.13.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 09:15:45 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 0/6] Input: edt-ft5x06 - Improve configuration
Date:   Sun, 13 Feb 2022 18:15:26 +0100
Message-Id: <20220213171532.346270-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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


Dario Binacchi (6):
  dt-bindings: input: touchscreen: edt-ft5x06: add report-rate
  Input: edt-ft5x06 - get/set M12 report rate by sysfs
  Input: edt-ft5x06 - set report rate by dts property
  Input: edt-ft5x06 - show model name by sysfs
  Input: edt-ft5x06 - show firmware version by sysfs
  Input: edt-ft5x06 - show crc and header errors by sysfs

 .../input/touchscreen/edt-ft5x06.yaml         |  8 ++
 drivers/input/touchscreen/edt-ft5x06.c        | 81 +++++++++++++++++--
 2 files changed, 81 insertions(+), 8 deletions(-)

-- 
2.32.0

