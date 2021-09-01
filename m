Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F1A3FE581
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 00:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhIAWbp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 18:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhIAWbp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 18:31:45 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D62C061757
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 15:30:48 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 8so982145pga.7
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QDMtbfOpT0+6YkOaTTHwkcuHgPn2OmfwGowoYSF3iN4=;
        b=MLHX34NKiTRkg9A7QRXI4GRcDtH4bZs/CzSNKS7RacDaWvVURjaGUnL7RDQ32IHXq/
         Dd2UL9A99ur5ymuxjCogBiMPny9QgFB6mN5+bRzxF5UBDSU3hHJdK+fiY0JHiXWHloX2
         eVog9NBPchOvdLmAxodV81qpZrnlzZouPNXUPuANYKo0xL30DdjLUGXPfgYXzJPR9vDX
         2cw0f+IoNVUfU/oW5fEY1XxMQnIiKGPQyBt63Togg7mhE1l1uSzXRRrympF53SXgkzPw
         JNmDnjLoBdunlxs9paSVeP3o+P9mxFT3hgl8R8w3HjiN3K4KhPHSxDoS+z7cn7VsWmnq
         5z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QDMtbfOpT0+6YkOaTTHwkcuHgPn2OmfwGowoYSF3iN4=;
        b=qBG8Lzy9R9lT0UrBVn3g66fby4paZUOjo24GS/1UkUQSs7oqjopRploR33UcKAn74j
         UYqBF00OLEMUINiW/ZsXAunb01i3dAFnmKbd2DSqNYgOXbinc1x2OZ2tzDBRFJzJem2x
         VAL8sI0O9LkrbmivqoOmB34GjqL0LzspEkuKCaeEEW/tL7cJSZ2uptdzNJ8cvy+dx/36
         NrCfqxTN7S5UjMVTy5/nU4j3Zk+rJNFkHdEfvB+6MtRR83uGMqKxMTJmskJLIfr6HZiA
         M6vxgLFBHr7WdyAEhFzzDwqOUwqmE93H2HdCgaBgFX8Snm3Hp/PxnNGvHA3V+19AOsHE
         4bLA==
X-Gm-Message-State: AOAM532cCnqlFXaoUlOCgN2PcL3+0NDjXUPYFNebtcxDll4ihJHaleZO
        5avGBe+WF53NRhivxODvGaSPXQ==
X-Google-Smtp-Source: ABdhPJzF3d9sC9YAlUC/WU9o3JS+1maojVVGg3ZloR/4kR6GQTya3wyLIHkRljrSmHKTuxz4CjB1Ng==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr1212606pgh.7.1630535447585;
        Wed, 01 Sep 2021 15:30:47 -0700 (PDT)
Received: from localhost.localdomain (rrcs-24-43-218-40.west.biz.rr.com. [24.43.218.40])
        by smtp.gmail.com with ESMTPSA id j2sm9623pfe.201.2021.09.01.15.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 15:30:47 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 0/3]  HID: playstation: add LED support
Date:   Wed,  1 Sep 2021 15:30:34 -0700
Message-Id: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is a resubmit of the previous patch series. The only change
is the inclusion of a description of player LEDs into the LED
documentation (Documentation/leds/well-know-leds.txt). This file
was just merged by Linus among other LED changes into git master (5.15)
and the patch series is thus relative to there as well.

Regards,

Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (3):
  HID: playstation: expose DualSense lightbar through a multi-color LED.
  leds: add new LED_FUNCTION_PLAYER for player LEDs for game
    controllers.
  HID: playstation: expose DualSense player LEDs through LED class.

 Documentation/leds/well-known-leds.txt |  14 +++
 drivers/hid/hid-playstation.c          | 157 ++++++++++++++++++++++++-
 include/dt-bindings/leds/common.h      |   3 +
 3 files changed, 173 insertions(+), 1 deletion(-)

-- 
2.31.1

