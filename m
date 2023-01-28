Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D460867F986
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 17:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbjA1QXr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 11:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbjA1QXp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 11:23:45 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8021E5FA
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 08:23:43 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id p26so9952372ejx.13
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/VnHTYs7TpUcFDkOWjcIjoYKb7zcZR99FeN6TsqyDU=;
        b=LkySxajoMEfD6COiwKQb6x1xUWqIoxXM9WCmhAMHqVxv8Iu50OqogyryD9n67m7b5J
         +GE/av1AvpBBMxczhdG+6ZBEB9r8q/Kwlgct6TS/lf7YVzUsAdism9LMbHxdd5eK+JAr
         MTLX73WF3YJlmIFXj0ASKAKbvAvXJTVCdEKkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/VnHTYs7TpUcFDkOWjcIjoYKb7zcZR99FeN6TsqyDU=;
        b=Md4Q0sH/U+eBkQuRlxc19ljlr2maVDWL160fuJl79fITnoDQjeFQk1TckDlpfhrvDP
         JJfjNO9k28oDB652/XwaT4b9Di+SCvijJWgIB2KxYAbGO2IoSBqumsXfVxfOzhax3dkO
         aYIQ29nKuIvJhxLrjE8K9SmwHxRRb+Un2uFi+myorWbfO9DveShb/UNC7U/5vuAkcjVR
         BQJMsRW+tutMzu2FKKw9h1j80G5ZW45RDsHBmHz/eaJMEHSziW1Vf8EzLewI4EibI3pn
         ds8FLmrzQzgqcE3KZb1jtJPGI2Yk8ssZo1rKJqaEtXJgMMYMMA18koUur68kbrHKSEnV
         rSYg==
X-Gm-Message-State: AO0yUKV7ykWHIw2xfJoVjuyaQtPTmDtfcSh2nPAJgMgUP8zkDR/05KNN
        89aY/9f5K/BzWBMIbbVa00SasQ==
X-Google-Smtp-Source: AK7set9sSw1jiP2TNt3LNeAAfIcymypJW9SDN6AZ84YnauS5mzdx5dHAbNxYpKclJiJl2r8Uts+JvQ==
X-Received: by 2002:a17:907:a2ca:b0:879:9bf4:b88a with SMTP id re10-20020a170907a2ca00b008799bf4b88amr8578045ejc.77.1674923022365;
        Sat, 28 Jan 2023 08:23:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-25-102-201.retail.telecomitalia.it. [79.25.102.201])
        by smtp.gmail.com with ESMTPSA id b17-20020aa7df91000000b0049b5c746df7sm4109629edy.0.2023.01.28.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 08:23:42 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: edt-ft5x06 - fix typo in a comment
Date:   Sat, 28 Jan 2023 17:23:25 +0100
Message-Id: <20230128162325.64467-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace 'firmares' with 'firmwares'.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/edt-ft5x06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index ddd0f1f62458..04bfefe3c0e0 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -931,7 +931,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 	} else {
 		/* If it is not an EDT M06/M12 touchscreen, then the model
 		 * detection is a bit hairy. The different ft5x06
-		 * firmares around don't reliably implement the
+		 * firmwares around don't reliably implement the
 		 * identification registers. Well, we'll take a shot.
 		 *
 		 * The main difference between generic focaltec based
-- 
2.32.0

