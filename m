Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F432A3656
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 23:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgKBWPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 17:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgKBWPV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 17:15:21 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60025C0617A6;
        Mon,  2 Nov 2020 14:15:21 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id dg9so15900768edb.12;
        Mon, 02 Nov 2020 14:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kk3ItFStobR6qYn/+Fed0grJYKNgkJNk/LGwH647MWU=;
        b=ekI3oJj8TlDuQrpXVPsXWO/7Nek1ScwVQ6a56vYaZXCkLQVl654jOAt74H83wdqzxp
         JIx7JkUJ1CmrRFNRlb93Sj5S9OKtYZoXFL+imfAZFIBj2oDNjGkQ79rBMSpNNTrwc7A9
         itjAyBp79ZdTHqAwOegjHCnlZK61+L/OnTxO1PcyNqXn0ocazNKo3+NMN/fPpuYjpDCC
         TYalrlxmyeAptBq0VZkVLDgNZVYbQIRbP0V9Hzv5wQixr4f4KzUs2Dy9hAIicOuOSM9Z
         MxCwS7JzOMZsg+t80JMRgYplJoA2n1U8AzZDceSGF5+XdkatlDrraSZ0EEoWkS2N/srE
         oJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kk3ItFStobR6qYn/+Fed0grJYKNgkJNk/LGwH647MWU=;
        b=npqpLPyakq+czGVA93jssaQhaR/tnWXIOYPvnZaGTk1LVgMgcHOnokSIbujEHG3bki
         bNxnukewlwswd7I2WEVa0o2eGdKY+qlsqq3ppWG6514svrxOLT+ZALGH/DpfrVuqFyp4
         6FDaVwA1NudXR1Ymc6q5EpxxXjuJqHdn0kc3U04Fvr/okb07CBwWJTXLLaT3KPugHHIE
         ZS6S6Pnwibse5siEFe3kmfFlzHf9Eh4uJYo4IWWA10rU5ZLX7K/FNi0elBxOUvMik97u
         W/dIZkyK1iV5k8ucATs0sCV9m6ymWzif/oaYkMBWhndbu2q/vJDxtoptqCvWoMHBSWJC
         ckFw==
X-Gm-Message-State: AOAM531E/pM0PTx1Daey5BCIkCDhNA0/C29YFMf3OQa9p12UzcMmSgwm
        kwd6Ce6RkXOfk5cUz7VkRW8mvTR4tdpKrw==
X-Google-Smtp-Source: ABdhPJzNqSqiP6aq3fEwKeONwiVw6PKCWld2I9xNpKM2ICyJzpWT8UbEPHZdns7l+8n/hjxTpdbc6w==
X-Received: by 2002:a05:6402:759:: with SMTP id p25mr6263293edy.22.1604355319937;
        Mon, 02 Nov 2020 14:15:19 -0800 (PST)
Received: from necip-pc.vpn.ucf.edu ([85.153.224.24])
        by smtp.gmail.com with ESMTPSA id j1sm9886812ejd.47.2020.11.02.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 14:15:19 -0800 (PST)
From:   Necip Fazil Yildiran <fazilyildiran@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     Jonathan.Cameron@huawei.com, eugen.hristev@microchip.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: [PATCH] Input: touchscreen: fix kconfig dependency bug for TOUCHSCREEN_ADC
Date:   Tue,  3 Nov 2020 01:15:05 +0300
Message-Id: <20201102221504.541279-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When TOUCHSCREEN_ADC is enabled and IIO_BUFFER is disabled, it results
in the following Kbuild warning:

WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
  Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
  Selected by [y]:
  - TOUCHSCREEN_ADC [=y] && !UML && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && IIO [=y]

The reason is that TOUCHSCREEN_ADC selects IIO_BUFFER_CB without depending
on or selecting IIO_BUFFER while IIO_BUFFER_CB depends on IIO_BUFFER. This
can also fail building the kernel.

Honor the kconfig dependency to remove unmet direct dependency warnings
and avoid any potential build failures.

Fixes: aa132ffb6b0a ("input: touchscreen: resistive-adc-touch: add generic resistive ADC touchscreen")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=209881
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 drivers/input/touchscreen/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index f012fe746df0..cc18f54ea887 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -96,6 +96,7 @@ config TOUCHSCREEN_AD7879_SPI
 config TOUCHSCREEN_ADC
 	tristate "Generic ADC based resistive touchscreen"
 	depends on IIO
+	select IIO_BUFFER
 	select IIO_BUFFER_CB
 	help
 	  Say Y here if you want to use the generic ADC
-- 
2.25.1

