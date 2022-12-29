Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1CF2659129
	for <lists+linux-input@lfdr.de>; Thu, 29 Dec 2022 20:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiL2TVY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Dec 2022 14:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiL2TVX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Dec 2022 14:21:23 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D2B11A20
        for <linux-input@vger.kernel.org>; Thu, 29 Dec 2022 11:21:22 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso3628027wmq.1
        for <linux-input@vger.kernel.org>; Thu, 29 Dec 2022 11:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUuq78iGpGYbnua3mIXOOmcjqDnt6J4Rj15Tg97DMKw=;
        b=WTeV5J49RaYiOOpFJ1kWpH4hvcoQf5zDjoaNK8GRDzHiCaT4xsy0zHLIUvCNEaIzbG
         nMrZzdOZh9Ju8LZy3QjJ26VefywXTcL/IjEzhmpX5lg7gvUV0Y4RTu9cdV4zAzTc4Wrn
         gaX8IYBTjuUeGjyZk3Kkg3L+bnvJ+wJUKtkjgiPV9WeMLDr/eTZZIzS9bIebnAoIF5GZ
         2OV3wm92Kd1gepevHnHzHlmvSUQuV+/S6VJIbmB/m6LJA2udTCUXLmU9djqLWxpmjlik
         RPv95s7LKZgxVUNjE+0NB2YZdLtvyj6qRqP/Wa2lrnnHWMUGI3rOfPeTSJfVvHWDU39W
         qBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUuq78iGpGYbnua3mIXOOmcjqDnt6J4Rj15Tg97DMKw=;
        b=m6v4H5e/I74YIPYWvJmupZ9qHLHI4Eg2m8GFrKnLMqj/nOre6XmnuhKANmnyD9X9xS
         DLTgZEWmI3E2XuqWUbVuMQHwCr6pG+SW8L74ftHr3cSeQZKKkh5YFsosC4KOKCnbXy7c
         dJpSy2GFCWSiYiEpDXcngZoylps2rkM8FTjLN8UCcZBUZNh3hSiiwDh5zOIGcXe1HnKe
         x0kYHoZU8c5PyDNqJ1M96NkiI8DFAN3cnAVuin+E1TyaaCqcSJgZ2CNWQvx8Yw+uWU3B
         YTNNybGBUyxQIra2L39U7dxe3yUcIknYUdYBhLhorcLTdLZtdyk+RVvCWJzOTGynCvjN
         SWww==
X-Gm-Message-State: AFqh2ko8psP/hVgt7MsCErcLT267bTOUGPUdKaXZFlKGbp2radDo/nw/
        oatXCF4VZgOKUIE8BNkl0a4=
X-Google-Smtp-Source: AMrXdXtGhW7BPP02sbv9GsLizS2b951tfVIM2IVFXdGLAiGKCOWSw3WKJGxHqY53+rxZiHh3g+8gww==
X-Received: by 2002:a05:600c:2247:b0:3d3:4b1a:6ff9 with SMTP id a7-20020a05600c224700b003d34b1a6ff9mr20967775wmm.26.1672341681046;
        Thu, 29 Dec 2022 11:21:21 -0800 (PST)
Received: from localhost (net-93-66-65-174.cust.vodafonedsl.it. [93.66.65.174])
        by smtp.gmail.com with ESMTPSA id iv7-20020a05600c548700b003d35c09d4b9sm34645222wmb.40.2022.12.29.11.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:21:20 -0800 (PST)
Date:   Thu, 29 Dec 2022 20:21:19 +0100
From:   Alain Carlucci <alain.carlucci@gmail.com>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] HID: sony: Fix division by zero
Message-ID: <20221229192119.jy2q4xaipfplqjbd@ananas>
References: <20221226000722.2xgbvsnrl6k7f7tk@ananas>
 <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas>
 <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
 <20221228215838.7rxsevi4wfldmm2j@ananas>
 <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

>Give this patch a try. It is against hid-playstation, which as of 6.2
>supports DS4. Let me know if it works. You can see the sensors working
>through evdev on the motion sensors device.

Thank you for the patch, just tried. I think there is a typo in the
condition of the for-loop that sanitizes the input.
Instead of `; i < ARRAY_SIZE()` it's written `; ARRAY_SIZE()`, 
which always evaluates to true. The loop then overflows the array and
crashes the kernel.

By the way, the DualSense code has similar calibration code and also
there the input is not sanitized.
I think it's quite easy to create a fake DualSense device with
an Arduino that emulates the protocol up to calib_denom=0, just to
exploit that and crash every linux machine is plugged in. Or even
worst, exploit that via bluetooth.

>If you want to dig deeper, you can play around with
>dualshock4_get_calibration_data in hid-playstation. The particular
>report (though not fully documented in the driver) does contain a lot
>of device info (firmware info, manufacturing dates, various strings).
>You can probably find the details online. Some data there might be
>weird or not populated.

Thank you! Just discovered that this strange DS4 (CUH-ZCT2E) replies
all zeros both to HID request 0x02 (get calibration data) and as the
BT address (request 0x12, Pairing Info), which explains why BT is not
working.

I tried to request version info (0xa3), the response seems the same as
another fully-working and original CUH-ZCT2E:
"""
Build Date: Sep 21 2018 04:50:51
HW Version: 0100.b008
SW Version: 00000001.a00a
SW Series:  2010
Code Size:  0002a000
"""

Anyway, I have seen that request 0xA2 puts the DS4 in an alternate
boot mode, probably DFU mode, where the device reboots as 054c:0856
and waits for data, which seems totally undocumented online. 
Do you know anything about this mode?
It would be amazing to be able to reflash the original firmware,

Thanks,
Alain
