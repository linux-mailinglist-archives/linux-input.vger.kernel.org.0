Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774E61B3942
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 09:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgDVHqC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 03:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725786AbgDVHqB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 03:46:01 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CD8C03C1A6;
        Wed, 22 Apr 2020 00:46:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z26so1181617ljz.11;
        Wed, 22 Apr 2020 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysk4WMk8NsMihs1evCSOYe7LHkphmnmScYSQbOC8Llc=;
        b=o1SzwFR2bkjbNNOJOE+ecvk9bOWfpyLmOCyf88lxbsunX1mPfn4RXpmFWpKI/wKJ4+
         3GrBxCgb8eBCPNdmnGEAsXvcBhzy5CNWepgs2qeUcBULvHwjqL/R7VIbidYmhk/oSRkd
         RrQCn9Ther16dMsGytaq97Rrpz4iVojN2Z8IoP3JT7VNBETLZQls7yE7W/U1TwZs2BZb
         wEN46kjfuRnh4sgQZJOUPWu1WHj6+cXeiAueKH5CUQmUoeZ9Ir8Qfxj/y1Vx+j4PKuy8
         IOVpVgFp/k5YjV56fDk+iu4AHawH2gUKdFZMpgw/FwBCyqN6wrnvIRhDXYHj8ken4q6A
         nHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysk4WMk8NsMihs1evCSOYe7LHkphmnmScYSQbOC8Llc=;
        b=XwZ8pufyYz039lNU8kBBozVoeU4gectRexW3zaG+IflUZRjcxO0xybkSkhk9iawlSq
         Qtb3y9HWIYufB1Z25RP0FMB+yYaypmf32EBAsp+AraRQAGSKeNDtCHrc8qTjrgJqd63K
         Cdz4QKOK44+5w/I0u5U28CXptrOU6guWiZfUitqQlGY5GlLHlMBWGalanQcYZJhogC72
         OYogIx5A5hONA0yPB8AGbsa2nzdasOQGo7sYN2UCj26b12+iULAC7qQS2xX6Bl/kBD7Q
         9K/JHt8F3QTuxAlZGUa7/vr9UCVw9AtigQjFRndSvDuo37NqPY9NQng75q1p6Q12QjHT
         KFog==
X-Gm-Message-State: AGi0PuY/GtaZP0NLXKjfc2ogaKDKuhn9dZBJmoS+/N12Gb1hhdJNaYA2
        5Sfj+ji9eODGkNm/JgcGFGs=
X-Google-Smtp-Source: APiQypIUxB9mDL/04B4tBAHmaWMbUqrOKIOV9TnnpC5t2Iz3mxa2dl45kat7lf7lCzElc1tvOqJyNg==
X-Received: by 2002:a2e:b4f1:: with SMTP id s17mr15071165ljm.283.1587541559956;
        Wed, 22 Apr 2020 00:45:59 -0700 (PDT)
Received: from luk-pc.lan (host-46-186-7-151.dynamic.mm.pl. [46.186.7.151])
        by smtp.googlemail.com with ESMTPSA id c4sm3968427lfg.82.2020.04.22.00.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 00:45:59 -0700 (PDT)
From:   LuK1337 <priv.luk@gmail.com>
Cc:     Cameron Gutman <aicommander@gmail.com>,
        =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: xpad - Add custom init packet for Xbox One S controllers
Date:   Wed, 22 Apr 2020 09:45:45 +0200
Message-Id: <20200422074546.14993-1-priv.luk@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <92b71dc5-ddd5-7ffd-65f8-65a6610dfe43@gmail.com>
References: <92b71dc5-ddd5-7ffd-65f8-65a6610dfe43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Łukasz Patron <priv.luk@gmail.com>

Sending [ 0x05, 0x20, 0x02, 0x0f, 0x06 ] packet for
Xbox One S controllers fixes an issue where controller
is stuck in Bluetooth mode and not sending any inputs.

Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
---
 drivers/input/joystick/xpad.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 6b40a1c68f9f..c77cdb3b62b5 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -458,6 +458,16 @@ static const u8 xboxone_fw2015_init[] = {
 	0x05, 0x20, 0x00, 0x01, 0x00
 };
 
+/*
+ * This packet is required for Xbox One S (0x045e:0x02ea)
+ * and Xbox One Elite Series 2 (0x045e:0x0b00) pads to
+ * initialize the controller that was previously used in
+ * Bluetooth mode.
+ */
+static const u8 xboxone_s_init[] = {
+	0x05, 0x20, 0x00, 0x0f, 0x06
+};
+
 /*
  * This packet is required for the Titanfall 2 Xbox One pads
  * (0x0e6f:0x0165) to finish initialization and for Hori pads
@@ -516,6 +526,8 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_init),
 	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_init),
 	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
+	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
+	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
-- 
2.26.0

