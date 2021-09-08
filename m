Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046DA403DFD
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 18:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349771AbhIHQ47 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 12:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349523AbhIHQ46 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Sep 2021 12:56:58 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C653C061575
        for <linux-input@vger.kernel.org>; Wed,  8 Sep 2021 09:55:50 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso1958976pjb.3
        for <linux-input@vger.kernel.org>; Wed, 08 Sep 2021 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7L4qaf81qlLbokA5nTTFRbaNkJ51z8ui225bWfpyX8c=;
        b=Msp/tPXD2287pH9IGdOQ3MeSrv4KhjHH5Vc59TqQp2750AfEyDyFNnAdHHh15iPwEs
         f6Tz3D1yWgeZ5VPzWVM9kJUpPip/nWR46lajXMV9C/zgBbZ3+j44rUckhtJkTZgkHZNR
         1hK+atQtY7dZl8H2R741CP8sYRy5A5fDQcSzb3oUYw/AKnxp9QZXYrOeuQuFuX8LzyD5
         e4225TvglZDCJfFbCkjClwt+Qg9BgAzGCB2fM6k5sU1IbAireWSt9AVnVenM5slFWikl
         VX1VX1MI2xzi+f4hIUkQ1BgcpYn7E1Y8z7javlQDSPNsiajqnpFrDEa1XlxiBAzanefL
         UybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7L4qaf81qlLbokA5nTTFRbaNkJ51z8ui225bWfpyX8c=;
        b=p7Gt90Ft9uM03WMl6mj3/iloTNx7pB27ZXdwAY6I2Vdg2XEwuj4EOCTiDK4cH23wNq
         64i5trsK0JbgTxxoNcoBr/fWIzAsuVZWLv3C+IqndEEFgJU9ATtxpDqHrFs0JlW2zBhS
         dDgy4Zuqs0zlSkFSu62fOR73ASmH2NEDRve40wAGsDduwxEJWx7XucjRT8FRwHvzxmY0
         2BSpj04oLufpE4U10FAceP115LOSpPeVpBxM3MbxrZ6jMwcfpoEJEXDnwZ8jLkzcOjQ+
         5cNKXVHPSiLbWFwamhRLnmlXInWsoW6xF148pea579lfg2ZUibWErcK+UULvjsGhSz6p
         HzqA==
X-Gm-Message-State: AOAM532gSGfnM4OIKMkot470J8bND4dUI2EHOdCEbzIuQrg2VqLZF3+u
        ebUXUX/EmiJtAzYCzT2G3JhTgQ==
X-Google-Smtp-Source: ABdhPJy9wDYdVnDnLvj1MoMy03OXpN51YvFB3LgjKunk28JXE3Dd3hKEiTAbYye5iuU1aX7lRIfoLA==
X-Received: by 2002:a17:90a:3e84:: with SMTP id k4mr5249623pjc.68.1631120150112;
        Wed, 08 Sep 2021 09:55:50 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id x19sm3133678pfa.104.2021.09.08.09.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 09:55:49 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 0/3] HID: playstation: add LED support
Date:   Wed,  8 Sep 2021 09:55:36 -0700
Message-Id: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is a resubmit of the previous patch series with a few changes:
- Added LED_FUNCTION_PLAYER1 to LED_FUNCTION_PLAYER5 defines.
- Removed LED_FUNCTION_PLAYER define.
- Changed ps_led_register use led_classdev->brightness_set_blocking.

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
 include/dt-bindings/leds/common.h      |   7 ++
 3 files changed, 177 insertions(+), 1 deletion(-)

-- 
2.31.1

