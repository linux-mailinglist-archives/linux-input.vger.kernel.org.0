Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64306923E0
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 18:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbjBJRAw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 12:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjBJRAm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 12:00:42 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDC8795FD
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 09:00:41 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id bv2-20020a0568300d8200b0068dc615ee44so1696653otb.10
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 09:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbJmqPWnhU2fzuW6EfX3HBGUxbnNbk0AgxNrozbd3eA=;
        b=F3PBfoy5nOeRgmuMDO1fhNshVtnpRJXUqqZvWJwLOM61FmisRaSfuE5vq/ey6ZI855
         c+kH9f5p52EqBbrBmNyCC3SlJW2lfgAMuMswj6Yy7Wbpz8OMEz2UoF6Ln5o30DWRYdL4
         RNqnuBEID+snQk6sbpE254oTPcPykKAyp2eX3pi5k4HQUoOjp/0RyjHePAlbUFj3gK72
         VfVwBMETWgoNkWHo3eDzuGkcynQYPbUF/q3dncnmhGp/Fx9IjzrTJODQhF2QLoNeW3IX
         BkrYDb0BpP/eEUbI7Rj+CijnKc1ni4r3sg6X1K2omcqPZeHRXgajqjUgC30KJD5tmeEv
         EAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbJmqPWnhU2fzuW6EfX3HBGUxbnNbk0AgxNrozbd3eA=;
        b=OB1rzIdrASlhAfnxmd7N0bYlB4SllJl+eaUwqurYcEdrfsSmubB0C86OB6Kq4OhHpd
         RBZdn1bFnz7BDOfL7c1iyEK8g444aGhrDdJOazX0PCO0raQs5/UnNdViUQU+3+V5E/gk
         4nIBCVSxVWpYgCkpGtutWgjCBSrmIeuY12ODAfQlzavBTFSfPa4DmvrHxrDChRt8tcFR
         L/RzjPzAoGJrB2zcYBmVCyl/BURCrsjB5/37/nE74jiQsNnaUC7FYBKc9BaCkKK1KTg3
         n4PU0QVy7Cy1ZCjd6HWKfW5sqODjwaFL3wCvAfKwWpNH7DWaD6bcNSA/Ije1f5b3ytbd
         BJ2A==
X-Gm-Message-State: AO0yUKW7JxKkQoELBF9KNz7vJcdvID66UtuKCk+pVQttLXX4BKGAE3vC
        8zz8cI5kWcom75Efc18KChA=
X-Google-Smtp-Source: AK7set9fi1P+R7rxEBLssXHMQBCSGN9VfqkTGWzzG9wjJGp1jwl7jtt11J55HmdRiNdbYBW82Lrf+g==
X-Received: by 2002:a9d:6ad5:0:b0:686:b1e5:6e93 with SMTP id m21-20020a9d6ad5000000b00686b1e56e93mr9187046otq.30.1676048440549;
        Fri, 10 Feb 2023 09:00:40 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id d64-20020a37b443000000b0071f0d0aaef7sm3777185qkf.80.2023.02.10.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:00:39 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH] HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
Date:   Fri, 10 Feb 2023 11:00:44 -0600
Message-Id: <20230210170044.11835-1-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The CP2112 generates interrupts from a polling routine on a thread,
and can only support threaded interrupts. This patch configures the
gpiochip irq chip with this flag, disallowing consumers to request
a hard IRQ from this driver, which resulted in a segfault previously.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---

Note -- this patch was first submitted with the patchset:
"DeviceTree Support for USB-HID Devices and CP2112"

It is now submitted separately upon request, as it is not coupled to the
other patches in that series.

 drivers/hid/hid-cp2112.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 1e16b0fa310d..27cadadda7c9 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1354,6 +1354,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	girq->parents = NULL;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_simple_irq;
+	girq->threaded = true;
 
 	ret = gpiochip_add_data(&dev->gc, dev);
 	if (ret < 0) {
-- 
2.25.1

