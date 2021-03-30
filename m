Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F7634E38E
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhC3Iyt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhC3Iy2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB11C061762
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:27 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id d12so1550809lfv.11
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ediEZqhc08LiM/9G/dhub7ocP49OxL0ETvlQPtliU4M=;
        b=C4+tD3Hp7xXJfg4BKRGHA/mPA2advPXe2hvR5yoPAcHd0e18hy3Qx2GKMn4Hrvx3fi
         WAtRqLQdymQ+EQy5zaezrAz93uHXCjBaAqL7Y5y0RgFg/xm8Pmv0py0u8Dc679o9JcUz
         jLH5aKw3IuruZoTHbTEjr5YvpdcIyGgH0jgsv//3YM5moorgEXzBt9BnmfXTBsPlFxne
         wLdtX6kbM2KMFW3rE4aIYBZNA8YrFcMxG5vkb+SaHPmTZx9ADtrAuNA4+81DkX/eM3wV
         y0A694JiQM3mnpmfMjd9yFgxCd4eYBnvbRqu5KvvBfPwHyhz1X3Kk79x748cIGhcbUMW
         /ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ediEZqhc08LiM/9G/dhub7ocP49OxL0ETvlQPtliU4M=;
        b=tk0iweFgaibvtJSYd02T6VpsEPOAHKWSPQfMieT+c8Tc9HFRYJq324RLyJTVqTtNxG
         zgvZmNr4IX1KcwWyyyddX54d+ooF0e2kzR+dwQen2nPlAv0JT7wsdNJF9WPmWPrL8QBx
         M37oM7iEyOEYumsAQEWj6uQ3tjBa8C0vsryRyvHnrgmMrhkM3gmv/T3OpG6jG9buxW2q
         TJAhbqFCQ7Q338uvubD0AMYBqExkdQQWzC+BUBciNdNs7+guawoh1i8agvcyTfh/EH5V
         BTeJY6oSI0en3IvW3H3Lb8kuDcqGGd+GIZhLePdWW7HuPntsghI+0F1fKRWNI/ledHT3
         yKcQ==
X-Gm-Message-State: AOAM530H7Ok0TJlUqlrTe6m4425pBPphPjPNohGf6fC7vo/UKugRzhcB
        cgTXKKl688KzApCY8S9SkXzqeA==
X-Google-Smtp-Source: ABdhPJxwEcX2QV3c5SGDqZcqvgoMxzDXu25b7uKpgyNpGYSQ6/feq4qkXmelRPDiG1Zo6y5bwaHuig==
X-Received: by 2002:ac2:5a1d:: with SMTP id q29mr18547047lfn.624.1617094466269;
        Tue, 30 Mar 2021 01:54:26 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:25 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] Input: cyttsp - First round of modernizations
Date:   Tue, 30 Mar 2021 10:54:17 +0200
Message-Id: <20210330085424.2244653-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes some issues I had when getting the CYTTSP
(also known as CY8CTMA340) to work with a modern device
tree and userspace.

The device stands out as there are no in-kernel users of
either platform data nor device tree.

I am going to submit a device tree client, if you have
other concerns, then step forward now.

With these patches the touchscreen works fine with
PostmarketOS on the Ux500 HREF using Wayland and Phosh
as UI.

This work is really being done to get a baseline for
refurbishing the PL022 SPI driver but sometimes you
have to fix a bunch of stuff.

Linus Walleij (7):
  Input: cyttsp - Probe from compatibles
  Input: cyttsp - Obtain regulators
  Input: cyttsp - Error message on boot mode exit error
  Input: cyttsp - Reduce reset pulse timings
  Input: cyttsp - Drop the phys path
  Input: cyttsp - Set abs params for ABS_MT_TOUCH_MAJOR
  Input: cyttsp - Flag the device properly

 drivers/input/touchscreen/cyttsp_core.c | 52 +++++++++++++++++++++----
 drivers/input/touchscreen/cyttsp_core.h |  3 +-
 drivers/input/touchscreen/cyttsp_i2c.c  |  7 ++++
 drivers/input/touchscreen/cyttsp_spi.c  |  7 ++++
 4 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.29.2

