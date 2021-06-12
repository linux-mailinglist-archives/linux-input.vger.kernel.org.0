Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C543A4D13
	for <lists+linux-input@lfdr.de>; Sat, 12 Jun 2021 08:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhFLGLX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Jun 2021 02:11:23 -0400
Received: from mail-qt1-f173.google.com ([209.85.160.173]:38570 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhFLGLX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Jun 2021 02:11:23 -0400
Received: by mail-qt1-f173.google.com with SMTP id o19so4368054qtp.5
        for <linux-input@vger.kernel.org>; Fri, 11 Jun 2021 23:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyson.me; s=g;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c0BSBF+pXHD5qNA80GelDN1/w3V366d1SDVNCgdWdyk=;
        b=drs1u41uSH+grKst84KHt404qQUtDHpm1svHN8xAsZk8Oj7uZR1a+hccvfE3DpifLI
         bTfhFEPmTybirPKfiN7XIat6yf/N3nh+pp72rZSeCNv/JdyR07iac0dpYWJ/+NbC6MSI
         r2wSLLfykler663G3lu204xREfj52cXnkl7Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c0BSBF+pXHD5qNA80GelDN1/w3V366d1SDVNCgdWdyk=;
        b=M3ubPcq+iywRAsxyixLfDeZE9Tx1WL9OyK4xS2K7aQQ3twTwZAUeFIa80DF+T9An1L
         3CFIsY2T6hIzuYdQGYNPhGun8d+9nYdj+JA9Z0E56NdjHGvISqrPPbCLCTSLRNupWl79
         yfog+L5oTILZVgma3pAA21EYgEDz9hCcpCGWEqfvMzckGOlgUmdwI1gFeQ7GrfeprxXy
         IpO6I887KPSFyqcKUtWnNE+JVupqFz1yOUEjn4r9e7yG03Hc0U4tUB4+PKjfqEEp7Tdu
         lbUCGBCK78pIsgDX/hpe8MpAgAygsEmnrBwRNn8MlE4P4BeQokwq8WX4v0/JFSM0sL7I
         DHbQ==
X-Gm-Message-State: AOAM533NGz3Qit5m5ErZsiVRE/QwMjShw8qUa771k1MH7LzXM4gqn39R
        TKxTa3lOhOQXLDeXioYLA+cdUw==
X-Google-Smtp-Source: ABdhPJzuhCQhr2R5BlV8krtHrZcbQ0e5q0+vb09PapOOhSJsu3JiR+01RRo2GUKecHPvPI9CbxJsfA==
X-Received: by 2002:a05:622a:1708:: with SMTP id h8mr7099362qtk.183.1623478089063;
        Fri, 11 Jun 2021 23:08:09 -0700 (PDT)
Received: from norquay.oak.tppnw.com ([2607:f2c0:f00f:7f03:81a5:9107:3996:6476])
        by smtp.gmail.com with ESMTPSA id h6sm5621145qtr.73.2021.06.11.23.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 23:08:08 -0700 (PDT)
From:   Tyson Moore <tyson@tyson.me>
To:     dmitry.torokhov@gmail.com
Cc:     trivial@kernel.org, linux-input@vger.kernel.org,
        Tyson Moore <tyson@tyson.me>
Subject: [PATCH trivial] Input: i8042: fix typos in comments
Date:   Sat, 12 Jun 2021 02:07:53 -0400
Message-Id: <20210612060753.28968-1-tyson@tyson.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This trivial patch fixes two spelling typos in i8042.c:

- 'i8042_unlock_ship()' to 'i8042_unlock_chip()'
- 'i8042_controller init' to 'i8042_controller_init'

Signed-off-by: Tyson Moore <tyson@tyson.me>
---
 drivers/input/serio/i8042.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index abae23af0..0b9f1d0a8 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -139,7 +139,7 @@ static DEFINE_SPINLOCK(i8042_lock);
 /*
  * Writers to AUX and KBD ports as well as users issuing i8042_command
  * directly should acquire i8042_mutex (by means of calling
- * i8042_lock_chip() and i8042_unlock_ship() helpers) to ensure that
+ * i8042_lock_chip() and i8042_unlock_chip() helpers) to ensure that
  * they do not disturb each other (unfortunately in many i8042
  * implementations write to one of the ports will immediately abort
  * command that is being processed by another port).
@@ -979,7 +979,7 @@ static int i8042_controller_selftest(void)
 }
 
 /*
- * i8042_controller init initializes the i8042 controller, and,
+ * i8042_controller_init initializes the i8042 controller, and,
  * most importantly, sets it into non-xlated mode if that's
  * desired.
  */
-- 
2.31.1

