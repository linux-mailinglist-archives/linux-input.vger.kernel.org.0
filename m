Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A5443FD61
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 15:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhJ2NeA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 09:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhJ2NeA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 09:34:00 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6121FC061570
        for <linux-input@vger.kernel.org>; Fri, 29 Oct 2021 06:31:31 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i5so8526111wrb.2
        for <linux-input@vger.kernel.org>; Fri, 29 Oct 2021 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ENMI8y2Ui1JiS29/UiCo8CIbYJntgFqvhb00hxo9Puw=;
        b=KEl4Awq61U/PpzbR5PmY3tZ+g0j5ZtCixfbV/7gxLqq5hQmDB80CZBlJNLmMJyj+XC
         6yDV7ZY9NBAlGy8QnWRq5vlhQhxtQ3g+QwwtHIrSGJyUcPepJXYTOwAj8hA1iD0gfUid
         sBj4jUpQdsWFLsLGc98ENQ9cFe5LdtzCm8rq3vKONenMABwd5bn8GlUyUdz9rl6cUXHK
         nh0N+Ak1G9Xp/SZ1DlHXjZACy1a4ZVKZBXyZHjhtrw6l/hkCSByl1pwAueIcragxMF/r
         2jnOxfJdQzgLKod5PqpNHRb29WzSDgxOwZgn8nzd8mnbTmHFwaf78R6SSb4BSpP2noc1
         qrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ENMI8y2Ui1JiS29/UiCo8CIbYJntgFqvhb00hxo9Puw=;
        b=mF1gyXA8/CwfKVSjuJvk0yHlornONf8lBJVovBYBxcqtzA/deuJX1QtznlAOZ6CxXR
         c7TW+otBFdnqG2qWhnzJ7o746Gcc+d8sSLCtqGa1o2BoE9gA1XzKKchMFTls9bRUonJP
         s9CgvEHd5slBYNxUAZ4MtYzEpT1Nyl5dhw5VPUyZCIMpjh4LfH+zv9RPvlIy5Ay84T1f
         pDBAGhzfM2EvmpXW9v6wCB1rVuO2xMZHiIskosvEqLtGExdRQY/6cEMjML6y9cTDXMiY
         oLDJr5MY4LOpPiSheGppoMqDuCBCbK8zxtwZfu9mzOiD2k+m1uV6FckV4XH73qQ4XmX3
         S/Hg==
X-Gm-Message-State: AOAM5337Gr9B8vyofrkssSH1UpMPszlw90ph3rt19CxmPuUVqIZFnorK
        u/JEZ17ir+2a04VQ2DfGyYPTYzH9P7F7hlPw
X-Google-Smtp-Source: ABdhPJxwGM4ovKylqeqQNaFae2ylWOapmKvS/PiWbfmoe06A/JtvGsSbtVsSomv+c8/JuekdZs1+PA==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr6254531wru.239.1635514289803;
        Fri, 29 Oct 2021 06:31:29 -0700 (PDT)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id k22sm5923511wrd.59.2021.10.29.06.31.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Oct 2021 06:31:29 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, aduggan@synaptics.com,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] Input: synaptics-rmi4 - Fix device hierarchy
Date:   Fri, 29 Oct 2021 15:42:51 +0200
Message-Id: <1635514971-18415-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The created rmi device is orphan, which breaks the real device
hierarchy, and can cause some trouble, especially during suspend
and resume sequences. E.g. in case of I2C, rmi dev should be child
of the I2C client device.

Fix this, assigning the transport device as parent of the rmi device.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/input/rmi4/rmi_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index af706a58..a16c1dd 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -90,6 +90,7 @@ int rmi_register_transport_device(struct rmi_transport_dev *xport)
 
 	rmi_dev->dev.bus = &rmi_bus_type;
 	rmi_dev->dev.type = &rmi_device_type;
+	rmi_dev->dev.parent = xport->dev;
 
 	xport->rmi_dev = rmi_dev;
 
-- 
2.7.4

