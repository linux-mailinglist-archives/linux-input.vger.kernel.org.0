Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7544F9F2A
	for <lists+linux-input@lfdr.de>; Fri,  8 Apr 2022 23:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiDHVbH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 17:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiDHVbG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 17:31:06 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB116203
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 14:29:01 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id k25-20020a056830151900b005b25d8588dbso6969343otp.4
        for <linux-input@vger.kernel.org>; Fri, 08 Apr 2022 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8zF9zyFLeTOMQwkWfdgA4Lx2omEnjQSfdRu/ZeImfrc=;
        b=llJTcqiKoKFSD7vJbP1xxD5HuRarFC/SIhRozk5HD2VUwNErDT9ZbErxJ7HuYKe0o8
         jDvWXN443DyYjgZBHi12JlVXOYbag9KU6dpkt3MCzEFl8bwcYwJFhAlmfTnbktdVZ8Pz
         sWqdXUc1mjtN6MxAwfO0xcLkfPadNOnNczjkLRGJB7sSmAYaxd9H1+t4Kjms/KuibQQb
         qX49lZNA5Ho0fhpO53sKD9VrRqHGgu/4+3TXNt7T5CboeHdM9ImHex6xqrujY+n5uJXY
         vadEx1pmAF9st6mMDN1+Y+GlkRAlAPq8J+o1yQAx3LMuO7yfWivBxA/T1ipkVhN0xZDL
         IRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8zF9zyFLeTOMQwkWfdgA4Lx2omEnjQSfdRu/ZeImfrc=;
        b=mN8iNiLkR9dvC1UANthE6Dc1zmog7+HjnqCjfMj1/gQ8JU7nZVm7M+T2Dp6sC7MRXG
         8xBlZgOgbN59AmOnshyR0TU2/Z1Gga38c0ZrW9izOPfRY7bAHYKskPGGpspAb08TRkpW
         cmbPCRyib6ucAGzKO8v26fvCTDN3Izt+1RCNHqC/erJabRPBKoqDbDsrvMlQpkQOEs5Q
         86IE40mDzs6Fd/R7wx8Ehe1p2Y/uNnfC+kQP9CN1BzRK+y9+nmicejpB2/C7OsJkVZsK
         jIaBN48Mx1SWObGc9jm8yPKDf5wKtCqlpL1Nsajb+wsIIAj0IkDeERHJjCSON+3Hsz9M
         g/3g==
X-Gm-Message-State: AOAM530dKCPiTEzUMtXd2HuLCp3lsZkdcgRtkY0CUphjnsA9ngf3CBYF
        LqLIk/buH1M2mCrZ3fBD6hYPtPMvYbI=
X-Google-Smtp-Source: ABdhPJwrpyNvJCIydiA07bCLezijtBR8AbYhN0FA7wZVfobc11w5YuAwX6fDkI0ce6PT2l8ucCWd0Q==
X-Received: by 2002:a9d:6e98:0:b0:5cb:2560:9441 with SMTP id a24-20020a9d6e98000000b005cb25609441mr7616126otr.126.1649453340758;
        Fri, 08 Apr 2022 14:29:00 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id s6-20020a4ae546000000b0032480834193sm8675570oot.46.2022.04.08.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 14:29:00 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] input: adc-joystick: Stop using scan_index for reading data
Date:   Fri,  8 Apr 2022 16:28:57 -0500
Message-Id: <20220408212857.9583-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

For my Odroid Go Advance I noticed that the adc-joystick driver was
only reporting the y channel and on the x axis. After debugging, I
found that the driver was trying to read values from channels 0 and
1 even though my device is using channels 1 and 2. By changing the code
to use the axis index instead of the scan index when unpacking the data
from the buffer, the joystick begins working as expected.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/input/joystick/adc-joystick.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index 78ebca7d400a..fe3bbd0d4566 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -32,24 +32,23 @@ static int adc_joystick_handle(const void *data, void *private)
 {
 	struct adc_joystick *joy = private;
 	enum iio_endian endianness;
-	int bytes, msb, val, idx, i;
+	int bytes, msb, val, i;
 	const u16 *data_u16;
 	bool sign;
 
 	bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
 
 	for (i = 0; i < joy->num_chans; ++i) {
-		idx = joy->chans[i].channel->scan_index;
 		endianness = joy->chans[i].channel->scan_type.endianness;
 		msb = joy->chans[i].channel->scan_type.realbits - 1;
 		sign = tolower(joy->chans[i].channel->scan_type.sign) == 's';
 
 		switch (bytes) {
 		case 1:
-			val = ((const u8 *)data)[idx];
+			val = ((const u8 *)data)[i];
 			break;
 		case 2:
-			data_u16 = (const u16 *)data + idx;
+			data_u16 = (const u16 *)data + i;
 
 			/*
 			 * Data is aligned to the sample size by IIO core.
-- 
2.25.1

