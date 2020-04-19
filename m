Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E441AF850
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 09:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDSHqf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 03:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725903AbgDSHqe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 03:46:34 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3139BC061A0C;
        Sun, 19 Apr 2020 00:46:34 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k21so6519125ljh.2;
        Sun, 19 Apr 2020 00:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XEstN1SgEvGh1nrX3CNzhK3F/ve2pikk0hjy+pd1w1g=;
        b=G1WAVyJYw1nYjFB9yztOZwG50VPCmIsppMClBRoZtoYJM3ocAdhXWwHeBRkm6lurB1
         PX6Q+JC0Eg5YhYMoIynB5PZw3PTShXh8VTuGWOfNJC2D30SaKU0mTD2ZpglYqXjffrNB
         b1dC5K07Yny3hEi2hCMETuG981J+3N2iC8VTIcEOV8eYDBCOWPOb8oRbiDGCNhdewn5Q
         N4YmTz2pNlFgo18BfbU6n6N4Hk4BKTOrZCpKqKIJQOOl/JubwVzgeKBbhnGlhtgstVi5
         pNQ8zlmGy1myQ/T1iJ1pjVqJjX7SMyF1FFe1V4iFdLPlNA0Dv5Irz1wUSYdWyna7TNwL
         EUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XEstN1SgEvGh1nrX3CNzhK3F/ve2pikk0hjy+pd1w1g=;
        b=G07CTWcyOfq5YwF2KLk1/ODoUyaJuWd58aVzOcWlof9LQZ1usQa8lnurp66as7fFc/
         BlaEO48pwLHWUAKcQbOXMiY8xldp8oj2pJmlkMeb8FN8mDRR2pLK4AVwWPHtFk2RQbPz
         ziUJ46rMT27ARbEiiu8uH0QMwOE1dk2KqEe65wIOOVUV+TH7VYkollQjdooEbdTwUd/H
         Wx8qCedEjIRw//vFe6xXA3Il1LSE8qCfusKpOODlbZW4UVUc0Z8u+6t+wOlRR/JetSA/
         VtzhIMZYZaA4/zVCzBnd07mOR2WqkQOu1CxT9SLIYEyQ8fMiUdyc2CkCh69a1IddNXZM
         dhGg==
X-Gm-Message-State: AGi0PuZ/FHqMHCrXHY9NHM3kQMBBKcMWVSA2Mz5q10GlLNW7ipeQoFtL
        2x0hs4l4oZdhgaz313y+TlTQiecX3aw=
X-Google-Smtp-Source: APiQypIHNnshfJJbE4qKO2Uv+cKUPcxtuv73re1pRTkPxUNmZ8MSf4BYda0S6cMv9ceyOTUMmOG2aw==
X-Received: by 2002:a2e:760c:: with SMTP id r12mr6461805ljc.139.1587282392694;
        Sun, 19 Apr 2020 00:46:32 -0700 (PDT)
Received: from luk-pc.lan (host-46-186-7-151.dynamic.mm.pl. [46.186.7.151])
        by smtp.googlemail.com with ESMTPSA id f2sm10954407lja.30.2020.04.19.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 00:46:31 -0700 (PDT)
From:   LuK1337 <priv.luk@gmail.com>
Cc:     =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: xpad - Update xboxone fw2015 init packet
Date:   Sun, 19 Apr 2020 09:46:23 +0200
Message-Id: <20200419074624.9955-1-priv.luk@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200419041651.GD166864@dtor-ws>
References: <20200419041651.GD166864@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Łukasz Patron <priv.luk@gmail.com>

Appending { 0x05, 0x20, 0x02, 0x0f, 0x06 } to
xboxone_fw2015_init fixes an issue where the
controller is somewhat stuck in bluetooth
mode until you plug it into Windows PC.

Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
---
 drivers/input/joystick/xpad.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 6b40a1c68f9f..894fa81f717a 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -455,7 +455,8 @@ struct xboxone_init_packet {
  * or later firmware installed (or present from the factory).
  */
 static const u8 xboxone_fw2015_init[] = {
-	0x05, 0x20, 0x00, 0x01, 0x00
+	0x05, 0x20, 0x00, 0x01, 0x00,
+	0x05, 0x20, 0x02, 0x0f, 0x06
 };
 
 /*
-- 
2.26.0

