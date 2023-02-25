Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66ED56A267F
	for <lists+linux-input@lfdr.de>; Sat, 25 Feb 2023 02:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjBYBWX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 20:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjBYBWW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 20:22:22 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF7F268F
        for <linux-input@vger.kernel.org>; Fri, 24 Feb 2023 17:22:21 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 78223A2B0;
        Fri, 24 Feb 2023 17:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1677288140; bh=0lHvOQva6jtWeKfNQP6ApmewXX19YHK86Cmr2ipzgFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yYhNR9wU8wTSivaXL7fYL6Sq0GDV1Tbn3kk4CXi6FBAoBottpi11Q83t044S1l5jQ
         wCE0K9vqiEQsvhbvxb07I/KtKUVAPSF97BoA859ME9CnBk4UQnW2G4X70Mbw368sL9
         lG4GGC30F5LHvCl6TR7808oFzG8N9XvsqzzlPfW7vmJQL10rHNs5TEu9iVglXUXpjp
         ktdEf8yXai8H6mgKRX7y96O6D8In76dS74pUxEXCgKX/HgtW21Y2kgScvZmrdIwlXf
         BGJzUeIHTyQJyBOVHSzlTgVla3H+VxkcV2DaC5KSuyYtqcxX2S2aqmHPMezbXCjVwK
         oQ6sDZK2aEjww==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/3] Input: xpad - Add VID for Turtle Beach controllers
Date:   Fri, 24 Feb 2023 17:21:48 -0800
Message-Id: <20230225012147.276489-4-vi@endrift.com>
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

This adds support for the Turtle Beach REACT-R and Recon Xbox controllers

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d244ba22b85e..a4f9a21f1355 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -475,6 +475,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori Controllers */
 	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
 	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
+	XPAD_XBOXONE_VENDOR(0x10f5),		/* Turtle Beach Controllers */
 	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
 	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
 	XPAD_XBOX360_VENDOR(0x12ab),		/* X-Box 360 dance pads */
-- 
2.39.2

