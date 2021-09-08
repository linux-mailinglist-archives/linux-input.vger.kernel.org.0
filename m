Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FFC403E02
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 18:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349523AbhIHQ5B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 12:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350123AbhIHQ5A (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Sep 2021 12:57:00 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD615C061757
        for <linux-input@vger.kernel.org>; Wed,  8 Sep 2021 09:55:52 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ot2-20020a17090b3b4200b0019127f8ed87so1597980pjb.1
        for <linux-input@vger.kernel.org>; Wed, 08 Sep 2021 09:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VUjzeORGj0OKV9Dt2Gc1YFdycBGEr+A2vUfe8abya7Y=;
        b=xZCFi2knKBTadyaa8tMfbcDYZha+Wwc2gDzja2520mUGb4AZ8tVCPQ8+96eNZofFRO
         LpmplWR04kC++VHnDCdtJer1KEQ4QeIos33FDGOj3KdygxkP9pHHJ+HrTMNIZswi63S8
         w8iKS7uZB82ROaub1/sXp2APHDWH+kA5E7rfh1j+d1AFv5NJrWrH997KOK+3s5yrnuo4
         y4BJ59DodstZCUuTb4qilwya66En/wRaSIRs/FJE/4CEmyympTZHHHuhWxgkserz9Evz
         AxWXn3mJCIFfdq7kD6xY9ZmpZNLiw1eDTvkepW+LSk169LGfP6kuh+3Pb44M+xv2Cq0t
         Tdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VUjzeORGj0OKV9Dt2Gc1YFdycBGEr+A2vUfe8abya7Y=;
        b=NdPkwl/0zD3OBXGQB1O2VG1JQyfRrlVH8iFLxr09ppiac235iOFiyJf/+FGx9zM+S+
         pG25rhwzwy2U4guworcLHMzXxliqUMYTReqZWZfzai4U4SRcaTgMt4p1UQDCkTa0UuV0
         U8VTK/dWEhv8xwH0M3GQlZ77xpa68iOv2bWbOUs1w78PWpcP4nlEv2UJtFyULU7BblHF
         tTDeoLUdWGqoaY8UTcwuK/OfSvzQi6COXjJKwUzxuCPkUJlnP9gYMfUhWAU5Udm+bjUv
         EKXDci/kyDrwQcZ+8hK6oR42RJAjW+pt/lhdg2WEOzGpSUQDHC6tJOUlgE6NEjHwqZp2
         GNTg==
X-Gm-Message-State: AOAM531+ptF1wwg2po1E9ccCqoEfDugzBJr8ir2ds7E6DB2rUjcLkBdd
        /hCLzyPTvqsPNuYYXYhAaq3Cwg==
X-Google-Smtp-Source: ABdhPJyGqrsTfhVycjoIolsWcIdtFTUuQiMFHfvvS79ofgou8fRbhR5ZwSyj80rsWPAUeORrzBnDwA==
X-Received: by 2002:a17:90a:e41:: with SMTP id p1mr5265620pja.137.1631120152264;
        Wed, 08 Sep 2021 09:55:52 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id x19sm3133678pfa.104.2021.09.08.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 09:55:51 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs for game controllers.
Date:   Wed,  8 Sep 2021 09:55:38 -0700
Message-Id: <20210908165539.3102929-3-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Player LEDs are commonly found on game controllers from Nintendo and Sony
to indicate a player ID across a number of LEDs. For example, "Player 2"
might be indicated as "-x--" on a device with 4 LEDs where "x" means on.

This patch introduces LED_FUNCTION_PLAYER1-5 defines to properly indicate
player LEDs from the kernel. Until now there was no good standard, which
resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYERx.

Note: management of Player IDs is left to user space, though a kernel
driver may pick a default value.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
 include/dt-bindings/leds/common.h      |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
index 4a8b9dc4bf52..2160382c86be 100644
--- a/Documentation/leds/well-known-leds.txt
+++ b/Documentation/leds/well-known-leds.txt
@@ -16,6 +16,20 @@ but then try the legacy ones, too.
 
 Notice there's a list of functions in include/dt-bindings/leds/common.h .
 
+* Gamepads and joysticks
+
+Game controllers may feature LEDs to indicate a player number. This is commonly
+used on game consoles in which multiple controllers can be connected to a system.
+The "player LEDs" are then programmed with a pattern to indicate a particular
+player. For example, a game controller with 4 LEDs, may be programmed with "x---"
+to indicate player 1, "-x--" to indicate player 2 etcetera where "x" means on.
+Input drivers can utilize the LED class to expose the individual player LEDs
+of a game controller using the function "player".
+Note: tracking and management of Player IDs is the responsibility of user space,
+though drivers may pick a default value.
+
+Good: "input*:*:player-{1,2,3,4,5}
+
 * Keyboards
   
 Good: "input*:*:capslock"
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d44ba2..3be89a7c20a9 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -60,6 +60,13 @@
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"
 
+/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
+#define LED_FUNCTION_PLAYER1 "player-1"
+#define LED_FUNCTION_PLAYER2 "player-2"
+#define LED_FUNCTION_PLAYER3 "player-3"
+#define LED_FUNCTION_PLAYER4 "player-4"
+#define LED_FUNCTION_PLAYER5 "player-5"
+
 /* Miscelleaus functions. Use functions above if you can. */
 #define LED_FUNCTION_ACTIVITY "activity"
 #define LED_FUNCTION_ALARM "alarm"
-- 
2.31.1

