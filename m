Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C7667FACF
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 21:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbjA1U0O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 15:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbjA1U0N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 15:26:13 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EC9974E;
        Sat, 28 Jan 2023 12:26:12 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id jr19so6973701qtb.7;
        Sat, 28 Jan 2023 12:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=GKIuk772QE2v02yt/wXoHqaULN88l0wbCXkSj5HiRTiWU44xg17i8yzXajuWZ01kwk
         LSN2W7LO6PdYHlw8mv5PXfN7w6Yfav3OsybJydBLWJUoMugen80QfqBTawNelrRJVDJW
         Kui2FyexGUwGMX9DtQjppzKkEwAK/03+ka8e+Fcn3J7bZ9fBVORirKsCA5/vWi3PrBkZ
         9Xbl0ct8GMfETX71O9tjYvCEIHHiEU/DwfbKcArMQdnAe8ru4BRjrvxuaa8IHwbBvth6
         l/8Ifw5vePJlgs/4L04yo7Ye6yZ1AoW1fILs9PHR8XcqcSEqjgXG26Qv9jmlisxEYGoo
         erqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=d9PasDmuCfGaV3w3/3ApKGsgVDArQ0uI5J6d7FvudkzKIv47MWGTBD2/dqG4r2O2GR
         BshH7byVWAtUWbE64omPPn6I+mVVD2M1XMrT2mZYNYT1wAsgAzq8kSKXhiAxe/s42ZAU
         f5w4VsCPEbo/AWia7Md4xqEx5snZVQw6hoEtWX3BBfX/e2p1tz5IYE0745Ajhe3p48uu
         4Sx1vT78ZIN9iN2dRbGTIcB6FNjJ7RBS3z/WxRNxbJToQGoVb0zah5NHzUVocAyxpEl9
         QK4DMTKA6myVNKenwZ/mNZVMqZn2iPdBDizN5EaZksl1b3Ki0AEnFHWddU8jozv1gtay
         rLow==
X-Gm-Message-State: AFqh2krNSgvyo2so6T8YtSC06h51H5vai+XtmrEtR420XpbRzu+FD6rj
        z/S8izE9rAXpKQn78qUlc3yxSHGx89gcc30L
X-Google-Smtp-Source: AMrXdXsvYLogNEoYbs8voafCF7oSyNjF4f2/cY6lecilaEdFI+OOGCB5jsjsPj875IrhELv0UdRVVg==
X-Received: by 2002:a05:622a:2298:b0:3b6:2ff8:3009 with SMTP id ay24-20020a05622a229800b003b62ff83009mr64180996qtb.2.1674937571216;
        Sat, 28 Jan 2023 12:26:11 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id q26-20020a05620a025a00b0071de2b6d439sm52460qkn.49.2023.01.28.12.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 12:26:10 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH 3/4] Fix CP2112 driver not registering GPIO IRQ chip as threaded
Date:   Sat, 28 Jan 2023 14:26:21 -0600
Message-Id: <20230128202622.12676-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230128202622.12676-1-kaehndan@gmail.com>
References: <20230128202622.12676-1-kaehndan@gmail.com>
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

