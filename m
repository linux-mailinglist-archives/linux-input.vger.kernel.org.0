Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F189B6A267E
	for <lists+linux-input@lfdr.de>; Sat, 25 Feb 2023 02:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjBYBWW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 20:22:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjBYBWV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 20:22:21 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D8A5583
        for <linux-input@vger.kernel.org>; Fri, 24 Feb 2023 17:22:20 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id E010FA2AC;
        Fri, 24 Feb 2023 17:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1677288140; bh=MehVff0Xk6uIWCLJaKhlDyABzpbF7sin7qcyCjdoHhI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NkTXvKPqPvWO3hj5HayZNbzz/RG7oFCdxs4ioqM0HCjkaIeS739/iCX2nsNFQ2Z1m
         g7oWRKjn0J+AC1oRBug1UqUTzsZI56sadYmodmH8gdEM/n1xSvOTaxusXSgKcQrBEj
         yat8Y+LZotSuvS2SWJhFOBjtxmp/cGm0VbQLG1ruzqhNzfSUe9jDap70nWJH4La1s6
         OY64eti9pE1zpwn5eN8t3r/2bWTdQLxW76Sjb+8wNht0/tyRLV1gAX7kkMYADvk8y8
         VJEcdUbvDLb54EGC9MZyG4WXzAA02D1EFNuLZqBx48DzMPy+wwFSc3lWMDqS3vB2Cw
         kxfsvqydKZciQ==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/3] Input: xpad - remove unused field in VID/PID table
Date:   Fri, 24 Feb 2023 17:21:47 -0800
Message-Id: <20230225012147.276489-3-vi@endrift.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225012147.276489-1-vi@endrift.com>
References: <20230225012147.276489-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The list of specific VID/PID combinations for various controllers recently
added a new field "xtype". However, this field isn't used, nor filled in in the
table itself, and was likely added by mistake and overlooked during review.
Since this field isn't used, it's safe to remove.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 04af2213407f..d244ba22b85e 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -126,7 +126,6 @@ static const struct xpad_device {
 	char *name;
 	u8 mapping;
 	u8 xtype;
-	u8 packet_type;
 } xpad_device[] = {
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
-- 
2.39.2

