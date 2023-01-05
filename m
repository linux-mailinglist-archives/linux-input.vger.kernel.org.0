Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34D65F3A2
	for <lists+linux-input@lfdr.de>; Thu,  5 Jan 2023 19:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbjAESYD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 13:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjAESYC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 13:24:02 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1598F53720
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 10:24:02 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so2861618pjd.0
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WCB9Pqnmy3FV/sI7W65zlBgSINFypF4TPmTVJFxNTlo=;
        b=H31qXKiUKXPgchmkJrO2ogKU4GaTP6jkz03R2SsdLctUPGVnL/soLMygm3tHsdaCKv
         laImXIQ1hV/KPKgkCUSpYClcyMiyOsb4JM0dZJLZXWta1LfaFHEcai+dy4llG7rPMfnO
         tMngndzODrrpvJCZDJJnA9SWXKa86GIjceUyursCnpwz64WTDiC5cCubhfrvquetls4j
         vQeza1x1oqfH1vrXNT5HEP+QqfpElOIATjaGCRY2HBf6Vuf9lfCx32uy56lf7rIXG7PP
         mYmldMq+MOD2v0+QLqxa7HnUneqnTpVFaSJZDiC9qVw7aXhum++aOVPgHvkfDOtjC5vO
         UdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCB9Pqnmy3FV/sI7W65zlBgSINFypF4TPmTVJFxNTlo=;
        b=cTzwaXIgiDOk8DRf526rmoqr+Tr0EWBWhIPZCkw0ZtEVtRczXeWW9XMbcQGqrfpRIH
         LpYKp1xcTAZU8rWT50C2plCZDF8upIU3ZdCAQ/+PTqmDkcmVQV8rOin8qxS88e5fRnkT
         GW39EnAvUWYzVd0c/YETMUQoluVsDNfsAB0NuV6HIFIpscCbTl9GZDLXVW9JD48lwnBN
         ma/ZZzp8lRGAa+KGacw/DfhWr2il2a+VizmyGDPb1hpVpnnckizDZlgDKWiDs4GbdHEm
         4TgmZOfgjM1/yX8ytYhZDbYbbmf9XoMoCgeMTq4wSorcXn6Ea7gEaVIP6kXKH8/CvPQm
         aT+w==
X-Gm-Message-State: AFqh2kqKtOG1dlBgk6W4d8nCRJeh2OiyeX4XvWavGpj0TFcCgqY+2Ihv
        31qc6PebY8+yOi0EQRVMv8EgBLeXbZFIzLcEtLg=
X-Google-Smtp-Source: AMrXdXsAaZPE7+Wi2nQora+BeYkY73oLEZZ0EUqmkFv/1q1wU5aOXpNPSQTnOXXDfKtrtuTwdSxFSg==
X-Received: by 2002:a17:902:7048:b0:18f:438a:cfe1 with SMTP id h8-20020a170902704800b0018f438acfe1mr55969120plt.59.1672943041414;
        Thu, 05 Jan 2023 10:24:01 -0800 (PST)
Received: from localhost (net-93-66-86-112.cust.vodafonedsl.it. [93.66.86.112])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902d2d000b00176b84eb29asm26329958plc.301.2023.01.05.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 10:24:00 -0800 (PST)
Date:   Thu, 5 Jan 2023 19:23:55 +0100
From:   Alain Carlucci <alain.carlucci@gmail.com>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, djogorchock@gmail.com
Subject: Re: [PATCH] HID: sony: Fix division by zero
Message-ID: <20230105182355.ke4xy2bayxmqdne3@ananas>
References: <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas>
 <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
 <20221228215838.7rxsevi4wfldmm2j@ananas>
 <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
 <20221229192119.jy2q4xaipfplqjbd@ananas>
 <CAEc3jaAvAh__5AUwjat4qQzLzSsNCAncYQtEX5ExXX1Hxh9cLw@mail.gmail.com>
 <CAME7zCKPjFbE6nSSoQOVK=BnFG0YAvMgHjAmHKTXcxk3Weuo+w@mail.gmail.com>
 <CAEc3jaBz92QRKCs1Ckb0njDNMu4=CHZcUJ=MPif3Mzvw_Xok2w@mail.gmail.com>
 <CAEc3jaD78h1qbWg+QQ40_yv5xc-oGFHAEyEOx2Nh20C-pxwcJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEc3jaD78h1qbWg+QQ40_yv5xc-oGFHAEyEOx2Nh20C-pxwcJg@mail.gmail.com>
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

I just tried to see with evtest the values of gyro/accel after
changing the driver so that follows the suggestion on the dsremap
website: dividing by two speed_2x:
speed_2x = (gyro_speed_plus + gyro_speed_minus) >> 1;

The DS4 shows values no higher than 600000 (post-calibration) while 
heavily shaking the joystick. For the record, the calibration is:

gyro_pitch_plus: 8848   gyro_pitch_minus: -8853
gyro_yaw_plus: 8833     gyro_yaw_minus: -8827
gyro_roll_plus: 8856    gyro_roll_minus: -8841
gyro_speed_plus: 540    gyro_speed_minus: 540
acc_x_plus: 8107        acc_x_minus: -8107
acc_y_plus: 8259        acc_y_minus: -8259
acc_z_plus: 8187        acc_z_minus: -8186

This is an example of the output:

Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 128610
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 95747
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 61321
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 28864
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 874
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -27802
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -54949
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -82064
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -110398
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -138107
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -170345
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -205239
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -242320
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -281525
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -318043
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -356748
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -394453
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -430628
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -465428
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -496105
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -526469
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -551897
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -554865
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -522127
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -450933
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -323041
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -180404
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -44859
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 71006
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 148353
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 202209
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 242757
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 274183
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 298456
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 316106
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 331569
Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 338942

Thanks,
Alain
