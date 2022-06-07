Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFDED53F761
	for <lists+linux-input@lfdr.de>; Tue,  7 Jun 2022 09:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237365AbiFGHie (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jun 2022 03:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiFGHid (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jun 2022 03:38:33 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A81E7CB7D;
        Tue,  7 Jun 2022 00:38:32 -0700 (PDT)
Date:   Tue, 07 Jun 2022 07:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1654587507; x=1654846707;
        bh=D9FtRQsL64UZzeNlDSZGhV3sxAUQRz/jzb9A2KCTcNc=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
         Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=lprYmJZmwMJvTYN0JJVzs8F7A0ZlKvZQjbW63QrWTgcjshwNqOYQ/cxsJQk/rm3zq
         6y8S6HvRriarbwUhAO01eym7shmHUYNgq/q0FRm4HKmuhi4Dbcj5+PnKTb3QzIL35x
         /JoZk/vUka8VsfNL5bH0brICZepJ4wNHuRQVwSI8LNFdRPj/3e/JKVvXtHLLDs07r1
         f0BUwG2VU8ePeu2ojyE2Rg/Ryu3e1EEF1YSnnowar60Epx9iQTy1QYBSpRE/B6h367
         8JRyvo4KVZB8lt900CqQr6qe18iNeH9Jz/EjlH7E9v7ke39eY/de6U/sy4jEtLx0lA
         9j6OsaTM/hkAw==
To:     linux-kernel@vger.kernel.org
From:   "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     dmitry.torokhov@gmail.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, rydberg@bitmath.org,
        zhengyongjun3@huawei.com, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, andi.shyti@samsung.com,
        stephan@gerhold.net, nikita@trvn.ru
Reply-To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Subject: [PATCH] input: stmfts: Add #define STMFTS_RETRY_COUNT 3
Message-ID: <20220607073809.21458-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add #define STMFTS_RETRY_COUNT 3 to retry stmfts_command() 3 times.
Without it, STMFTS_SYSTEM_RESET or STMFTS_SLEEP_OUT may return -ETIMEDOUT
to failed attempt due to no event received for the completion.

Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 drivers/input/touchscreen/stmfts.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen=
/stmfts.c
index c175d44c52f3..730035f5c62c 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -68,6 +68,7 @@
 #define STMFTS_DATA_MAX_SIZE=09(STMFTS_EVENT_SIZE * STMFTS_STACK_DEPTH)
 #define STMFTS_MAX_FINGERS=0910
 #define STMFTS_DEV_NAME=09=09"stmfts"
+#define STMFTS_RETRY_COUNT=093
=20
 enum stmfts_regulators {
 =09STMFTS_REGULATOR_VDD,
@@ -317,19 +318,20 @@ static irqreturn_t stmfts_irq_handler(int irq, void *=
dev)
=20
 static int stmfts_command(struct stmfts_data *sdata, const u8 cmd)
 {
-=09int err;
+=09int err, retry;
=20
 =09reinit_completion(&sdata->cmd_done);
=20
-=09err =3D i2c_smbus_write_byte(sdata->client, cmd);
-=09if (err)
-=09=09return err;
-
-=09if (!wait_for_completion_timeout(&sdata->cmd_done,
-=09=09=09=09=09 msecs_to_jiffies(1000)))
-=09=09return -ETIMEDOUT;
+=09for (retry =3D 0; retry < STMFTS_RETRY_COUNT; retry++) {
+=09=09err =3D i2c_smbus_write_byte(sdata->client, cmd);
+=09=09if (err)
+=09=09=09return err;
=20
-=09return 0;
+=09=09if (wait_for_completion_timeout(&sdata->cmd_done,
+=09=09=09=09=09=09msecs_to_jiffies(1000)))
+=09=09=09return 0;
+=09}
+=09return -ETIMEDOUT;
 }
=20
 static int stmfts_input_open(struct input_dev *dev)
--=20
2.30.2


