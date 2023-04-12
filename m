Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF916E0231
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 00:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjDLWyi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Apr 2023 18:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjDLWyi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Apr 2023 18:54:38 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5A4CF
        for <linux-input@vger.kernel.org>; Wed, 12 Apr 2023 15:54:37 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id ca22-20020a056830611600b006a3c1e2b6d2so8739028otb.13
        for <linux-input@vger.kernel.org>; Wed, 12 Apr 2023 15:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681340076; x=1683932076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g30FzRjm0pF3p9bY5Bw+umnxGOwPcNFqorzfNbhlVWk=;
        b=MAP7X+b31KcL1I1fSZ6diweALCMeHkbX41kQiCjnIBXzPUydIQomRhwK3NxVTdlyPk
         ulWRBdnmoW2lFVUGn3lhHHDYW+aU3JKOj4KA/NYw5Q0g8ZPKTvZZrOLH/K2ozEtoLT3y
         Lx6zL8o0mePBqIjjmGnUj9Y+4pZJO3X5nKk+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681340076; x=1683932076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g30FzRjm0pF3p9bY5Bw+umnxGOwPcNFqorzfNbhlVWk=;
        b=ZY0cAHSuUiiYv2b7y9UVC0CJDw9VBbasnoKYMQCFTWYM32GyWB4UUFe6XfbgITmAfj
         Rg+HyE21G8/UaCfMpFksGl92n0SUoqcEHT/322m4rZqoZp3fjvmVtAjPuOoHUCDDmc9O
         7eXG3UPsdqHIqo3pYSl3kGAESESzr6OOJLMbH95VZIdW6+v/JDGA803QWso1lTwpb82q
         I11rhmQAMH41Wv0GIKHRo96TrurFE4v0PPCj8/5fpFk5W9sM1uUDjnjEJBYHZVO8m3rr
         PBoJWWJeV8J6l3Xo4k+2Qat1WrhX3YvanzcNbXXne4iOi5EYVXu94/JKWl8RXahaiuRk
         LQ/g==
X-Gm-Message-State: AAQBX9fxTQNNIPHwZbtWHV93hNqQNBLZ5y5XP73/47Z5VHtBV4Q5g5V6
        kPvxrXCucJV5LhpFqgofgSXWpg==
X-Google-Smtp-Source: AKy350bZsg+5nuz06PUUB6/mVTgMUxvqz17jDRWxqhkWSiRGGLj1VaLsQV8e0dLlQ0EqqIy++QZW2Q==
X-Received: by 2002:a05:6830:130d:b0:6a1:20b9:34b6 with SMTP id p13-20020a056830130d00b006a120b934b6mr37437otq.0.1681340076606;
        Wed, 12 Apr 2023 15:54:36 -0700 (PDT)
Received: from jdenose34.roam.corp.google.com (99-137-158-190.lightspeed.cicril.sbcglobal.net. [99.137.158.190])
        by smtp.gmail.com with ESMTPSA id g7-20020a9d6207000000b006a3170fe3efsm138681otj.27.2023.04.12.15.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 15:54:36 -0700 (PDT)
From:   Jonathan Denose <jdenose@chromium.org>
X-Google-Original-From: Jonathan Denose <jdenose@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>,
        Aman Dhoot <amandhoot12@gmail.com>,
        Lyude Paul <lyude@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH] Input: synaptics - disable intertouch for Lenovo L440
Date:   Wed, 12 Apr 2023 17:54:17 -0500
Message-Id: <20230412175311.1.Ieb687047a5b75c7b7ee5dd258207ef5ca9a3b728@changeid>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When intertouch is enabled for the L440 a (deep)sleep/resume
cycle causes the touchpad driver to hang which causes the
touchpad to become unresponsive. Disable intertouch resolves
this issue and the touchpad is fine after resume from sleep.

Additionally, when the PNP id for the L440 is only removed
from the topbuttonpad_pnp_ids list, a message is logged to
enable psmouse.synaptics_intertouch, which would cause the
sleep/resume issue again. By removing the PNP id from
topbutton_pnp_ids and then adding it to the
forcepad_pnp_ids array, intertouch is disabled and the
message is not logged.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---

 drivers/input/mouse/synaptics.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index fa021af8506e4..77a4f58128e84 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -150,7 +150,6 @@ static const char * const topbuttonpad_pnp_ids[] = {
 	"LEN2001", /* Edge E431 */
 	"LEN2002", /* Edge E531 */
 	"LEN2003",
-	"LEN2004", /* L440 */
 	"LEN2005",
 	"LEN2006", /* Edge E440/E540 */
 	"LEN2007",
@@ -198,6 +197,7 @@ static const char * const smbus_pnp_ids[] = {
 static const char * const forcepad_pnp_ids[] = {
 	"SYN300D",
 	"SYN3014",
+	"LEN2004", /* L440 */
 	NULL
 };
 
@@ -1769,6 +1769,8 @@ static int synaptics_create_intertouch(struct psmouse *psmouse,
 		.flags = I2C_CLIENT_HOST_NOTIFY,
 	};
 
+	psmouse_dbg(psmouse, "topbuttonpad is: %s\n", topbuttonpad ? "true" : "false");
+
 	return psmouse_smbus_init(psmouse, &intertouch_board,
 				  &pdata, sizeof(pdata), true,
 				  leave_breadcrumbs);
-- 
2.40.0.577.gac1e443424-goog

