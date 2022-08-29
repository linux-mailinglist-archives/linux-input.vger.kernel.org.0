Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367575A464F
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 11:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiH2JpW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 05:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiH2JpW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 05:45:22 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEFE2B1BB
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 02:45:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id s11so9341461edd.13
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 02:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :from:to:cc;
        bh=s+XIEEWURZt1fMCirW3gSWf8Blcqle54zg04C50Q77I=;
        b=fbT2n5Y04vmbbOgbZlOvAqkL9pcmqWmRDH08hOMjiXyT9RKjfsSkPKmP2RPliC4dzm
         W/Evxd9miUpjHP2Xko0fPaVBem/S5mfmTwqRezeaR2vLWKCZTCsOBkm2EqV092kka35Z
         S/HT5aBGDyvRSpcwzsUtOfsoVgKiflEgTg3hu9aLOlrS6QSOM4p9fVOnuEHEJvF5yz+U
         ZYLdbPvG5UfCm0stJq8WVNoO9XIlfhaxpofDuXftBUJCO0i3h/klkCKEMP71uniYgNZv
         w8gm3jbXyY0UGsLcMRMASSGffYelvG1kU7GhcmO/vQW9IJH20IfheiJ3x0crKdU9vqBj
         R+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=s+XIEEWURZt1fMCirW3gSWf8Blcqle54zg04C50Q77I=;
        b=fxPf35Y1fxLlavA21bkCIiLGx1Dvs2ol0AUIfPuYvwZW59eA3duhVvOMbfPT18peL9
         gzb1JGg6MbDSRGXgrOY6RZk0sJUC+NkOmkr0lcK3DHcGNDdsIeXhandl+7yfFwIAjvSo
         oyIYSeiUl8eFLWr4f+3YvPLu2xI97E4+m8hw/uoCTwV31rw9Tw372VeCIljfAMBvhoKV
         ImGmsjG285cusdxuf2/djCo3fyraRbd3gQEsL/AYVTEgAsmaw40+djlKk+jIsu5Grjl7
         PSErgKX1/NwHNZS3fNHqi6/CFJKMeMeo8aNPkpp5x6e9TuyGmjnCGdFuGPvgJ9xeqk2u
         y5Qg==
X-Gm-Message-State: ACgBeo1/L4C290WqaZkEBSL2HqwQpfujgxlZ/xjQFSSaLcHZ4ZC1vMCk
        YudypZ7ZMCC7qJFYsdwWYsiE2OVA6l7AaV9r
X-Google-Smtp-Source: AA6agR7Dpw/WswmIkd4AkZsHmpn1h5GxieCBeMdcs6AF1nXf9IWQ/5Czr6weeE/LHsMqm9JP/tQ0FQ==
X-Received: by 2002:a05:6402:1706:b0:448:1b9f:d8bd with SMTP id y6-20020a056402170600b004481b9fd8bdmr8005656edu.397.1661766319535;
        Mon, 29 Aug 2022 02:45:19 -0700 (PDT)
Received: from 178-164-143-12.pool.digikabel.hu (178-164-143-12.pool.digikabel.hu. [178.164.143.12])
        by smtp.gmail.com with ESMTPSA id j5-20020aa7ca45000000b0044629b54b00sm5502726edt.46.2022.08.29.02.45.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Aug 2022 02:45:19 -0700 (PDT)
Date:   Mon, 29 Aug 2022 11:45:18 +0200 (CEST)
From:   Greg Tulli <greg.iforce@gmail.com>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] Input: iforce - add missing vendor and product ids to
 the Unknown device name
In-Reply-To: <CAKEH-64P5HTWtqrgGoS4RF74XXOvnDZ4o5z2bx7LZ=9r=3tsjw@mail.gmail.com>
Message-ID: <edc347e3-52d8-9621-c3f1-5c3872d95fcb@gmail.com>
References: <CAKEH-64P5HTWtqrgGoS4RF74XXOvnDZ4o5z2bx7LZ=9r=3tsjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


An unknown iforce device is named "Unknown I-Force Device
[%04x:%04x]". The vendor and product ids should be substituted.

Signed-off-by: Greg Tulli <greg.iforce@gmail.com>
---

diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/joystick/iforce/iforce-main.c
index b2a68bc9f0b4..6de5d06d2bd0 100644
--- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -323,7 +323,11 @@ int iforce_init_device(struct device *parent, u16 bustype,
 			break;
 
 	iforce->type = iforce_device + i;
-	input_dev->name = iforce->type->name;
+	if (iforce_device[i].idvendor)
+		input_dev->name = iforce->type->name;
+	else
+		input_dev->name = devm_kasprintf(parent, GFP_KERNEL, iforce->type->name,
+			input_dev->id.vendor, input_dev->id.product);
 
 /*
  * Set input device bitfields and ranges.
