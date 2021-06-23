Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820383B1F17
	for <lists+linux-input@lfdr.de>; Wed, 23 Jun 2021 18:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhFWRAr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 13:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWRAr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 13:00:47 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA2EC061574
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 09:58:29 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso1747163pjb.4
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ravjujA362x+UMFdmcw0uSr+qq0hw0GjmsGOiGYM0c=;
        b=qh0GX/6UmGCZuL1N6+lZrz1FJ60Wys+fg2sl00J/UIP0ZTPabY9KiuY49IHgLkbLer
         tMxv0SBPC3uk2XqCInYux2UhKk5BnMB5hirvvNX38V75BThmtXxWxcKPjmyeh8+OdQa7
         I7rp61Ww3L3kdwFgz9KRc+TTRW482abkTNeOj+HrTDxd3gPOfp5SMjOcw/aG88BN1vIu
         VFptmvcWOLVV80D0oLl1MuyJNil3bACVMK41kDyHLcHrSh1Q4gePfipoK7WKOObmhDv9
         wegX32n5bIpZNdGdxsyKgSPXsTsSd9egf5puAx3EXFR0SUTN/DVzI0iY1tpPp+WeBf2t
         1yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ravjujA362x+UMFdmcw0uSr+qq0hw0GjmsGOiGYM0c=;
        b=qc0lp0z7f7nDYpScfZB1W4WjLbTeiZzHbxoxwixp12JUdortz234IO5U/kbdOLD1eq
         usVOkkqhZcbCt4AbdXwLzKFhbGh277mL0yJJ44hEiGmPok2eixtCSvCPOdtznlPRAMCG
         7n9sHqCUd09wzWRg/OSj6bh/bwYmpA4e0eM8QJkc15htRblYESaoCAWOEwePrePViJQz
         a31tQu3CiBp2SboFgKNK6jskUyzLJ9tiqmZHSqFKXvv+n8IpkmyJrGtIihOwstYcTC6H
         Bq3n+DDhxelInuhLNLwY65eKnHBeyA3HZzl39l654XJ0QyMYuRqgek5y1cVGxeJNsQLI
         a7Gw==
X-Gm-Message-State: AOAM530vhlTlLlOAYFkg/ENF50gk0QpxJVP7ZmENayZaGBm2Y3Wh7bRp
        dZejSe5Am69z+HCwt/1/KZka8Qc3MH8=
X-Google-Smtp-Source: ABdhPJzgeLHL7WqsqKjKI+Eq2cP568T0KU4ALvWvFMAMrzCMy8hl/Z5TL+W4BUJSnTj/Uue2kuPIIQ==
X-Received: by 2002:a17:90b:120d:: with SMTP id gl13mr642748pjb.209.1624467508796;
        Wed, 23 Jun 2021 09:58:28 -0700 (PDT)
Received: from horus.lan (71-34-89-86.ptld.qwest.net. [71.34.89.86])
        by smtp.gmail.com with ESMTPSA id a9sm5722504pjm.51.2021.06.23.09.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 09:58:28 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: wacom: Correct base usage for capacitive ExpressKey status bits
Date:   Wed, 23 Jun 2021 09:58:09 -0700
Message-Id: <20210623165809.101208-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The capacitive status of ExpressKeys is reported with usages beginning
at 0x940, not 0x950. Bring our driver into alignment with reality.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 71c886245dbf..8f16654eca09 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -122,7 +122,7 @@
 #define WACOM_HID_WD_TOUCHONOFF         (WACOM_HID_UP_WACOMDIGITIZER | 0x0454)
 #define WACOM_HID_WD_BATTERY_LEVEL      (WACOM_HID_UP_WACOMDIGITIZER | 0x043b)
 #define WACOM_HID_WD_EXPRESSKEY00       (WACOM_HID_UP_WACOMDIGITIZER | 0x0910)
-#define WACOM_HID_WD_EXPRESSKEYCAP00    (WACOM_HID_UP_WACOMDIGITIZER | 0x0950)
+#define WACOM_HID_WD_EXPRESSKEYCAP00    (WACOM_HID_UP_WACOMDIGITIZER | 0x0940)
 #define WACOM_HID_WD_MODE_CHANGE        (WACOM_HID_UP_WACOMDIGITIZER | 0x0980)
 #define WACOM_HID_WD_MUTE_DEVICE        (WACOM_HID_UP_WACOMDIGITIZER | 0x0981)
 #define WACOM_HID_WD_CONTROLPANEL       (WACOM_HID_UP_WACOMDIGITIZER | 0x0982)
-- 
2.32.0

