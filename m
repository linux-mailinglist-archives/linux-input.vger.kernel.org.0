Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDDB545761
	for <lists+linux-input@lfdr.de>; Fri, 10 Jun 2022 00:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237016AbiFIWY4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jun 2022 18:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245551AbiFIWYz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jun 2022 18:24:55 -0400
X-Greylist: delayed 425 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 09 Jun 2022 15:24:53 PDT
Received: from govanify.com (govanify.com [IPv6:2001:bc8:6005:126:ec4:7aff:fee4:6de2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 27E9624AEC5
        for <linux-input@vger.kernel.org>; Thu,  9 Jun 2022 15:24:53 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:272:dad0:597f:4427:53cf:1a33])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by govanify.com (Postfix) with ESMTPSA id 04F266C065B;
        Thu,  9 Jun 2022 23:15:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=govanify.com;
        s=fujiwara; t=1654812913;
        bh=KyOQpbXN5lo/Gp5zTDXgTTon17y3jSDDtUOOD1z9ges=;
        h=From:To:Cc:Subject:Date;
        b=d2kR/teL6sVM+oTAc5fuTY+HVphWVeidw3S3lqJhjWzoeK6wFnnJ2t5rkX8rrR/kn
         V0weT0GuLSdJNzIT7CJlM5ggAjKgYfHtJsUWSFZ8++T9D46OsUOrqlM7k9Ve8Klw+V
         V+o3dSvt+VhNDVnxuZxPjO9vRHILX4xORwbC6UPs=
From:   Gauvain 'GovanifY' Roussel-Tarbouriech <gauvain@govanify.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc:     Gauvain 'GovanifY' Roussel-Tarbouriech <gauvain@govanify.com>
Subject: [PATCH] Input: synaptics - enable TrackPoint on ThinkPad T25
Date:   Fri, 10 Jun 2022 00:15:55 +0200
Message-Id: <20220609221554.25459-1-gauvain@govanify.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Confirmed to work with psmouse.synaptics_intertouch=1
across reboot/S3. This keyboard has only been shipped
with the ThinkPad 25th anniversary edition and is the
only modern revision of the 7 row keyboard ever made.

Signed-off-by: Gauvain 'GovanifY' Roussel-Tarbouriech <gauvain@govanify.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 434d48ae4b12..e3a7209434c5 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -177,6 +177,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0091", /* X1 Carbon 6 */
 	"LEN0092", /* X1 Carbon 6 */
 	"LEN0093", /* T480 */
+	"LEN0094", /* T25 */
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
 	"LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
-- 
2.36.1

