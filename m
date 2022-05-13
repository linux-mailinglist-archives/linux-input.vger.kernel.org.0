Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F085265DA
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 17:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381479AbiEMPS4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 11:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379172AbiEMPSy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 11:18:54 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269DC65D1E
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 08:18:51 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h16so11189752wrb.2
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
        b=HQi8r+ZoZeMt4xZoWTa3lRBsVXxOn9iEpiGjsop/qcVb8GtAWT7q4ejCTLXnoYStp+
         t2MLJ4dQ3KYgeA9XJjgbJZ6szcX/KAygjsrTG6rO2zuz24jEesb7vWndS0NDrUOIRX7y
         9lYwfTflLqPnC1vPRLYuSB16+3cZCG8xVSj8mRtZOpTtHVTnRutvuuVwvvOe0k9v33ou
         /zQuGgtcZE8eSGSAFwbrY/m+2xZ6+0UAAF9fflSDvh6BXrguAQ/ZCeb67WFjzyrJ19cp
         4VsF+OsNbQmSWskXl/8o98wPcjlc0Qv5YQMhvVMsrMFpxDGf16yquD1ruPHIoCkt6PsZ
         ouCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
        b=GpqNu82ZNjNdRJgRaZ2eFysjo9bOxmYoonG/cejknd//AoR9rj4eNb/qZkdG2K0GBU
         xJu4LBuZGpxsIKNzMj/jH+HyrIh0/He8bUB05H9TFMU46p0ItEYNtaQxu4dfT63zk6xB
         Yj3nn0hNGm+mQWdrx3IiLJPeuqhiYB+5MYjRDzkTZN7dvNFLDG0FOzk3K/oTq9pT/oco
         zJSD0TaCrxJoMD/+330egtWxni1Nqgj4hNJP23PpIOx/qPD6M1/0r3fquScscsuU3hzi
         S13VxpeiyboEeXvwjse9ur77h+KQIu4JJtnyk2lCIF+1N0SSe1DnBx3tHJ6RjEK4X7YV
         p+8g==
X-Gm-Message-State: AOAM531kMLwM8dgFkYlBsxp3lYed1072s1k5XiZetOLpxp84W6M+xdiS
        EbX4tZyufS6X3W0iqr4CYX9fpg==
X-Google-Smtp-Source: ABdhPJzA5hibYWer3Lwq832/9i84TeS4ajByZLSB7T1HAQ11tmgx+UjsG7iBBisRg7iuu3/eHnmloQ==
X-Received: by 2002:a5d:5960:0:b0:20c:5a12:20ed with SMTP id e32-20020a5d5960000000b0020c5a1220edmr4425513wri.303.1652455130320;
        Fri, 13 May 2022 08:18:50 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:9353:61cb:4e25:b9cd])
        by smtp.gmail.com with ESMTPSA id b9-20020adfc749000000b0020c6a524fd5sm2800825wrh.99.2022.05.13.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 08:18:49 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH 0/2] Input: mt6779-keypad - fix hw code logic and row/col selection
Date:   Fri, 13 May 2022 17:18:43 +0200
Message-Id: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes a logic bug based on the (non-public) datasheet
I have.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

Mattijs Korpershoek (2):
  Input: mt6779-keypad - fix hardware code mapping
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)


base-commit: b243018eafeb69bf074ef013c54504632fd161ec
-- 
2.32.0

