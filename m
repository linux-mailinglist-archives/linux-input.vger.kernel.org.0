Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7487465F793
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 00:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbjAEX3u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 18:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjAEX3s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 18:29:48 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD876B195
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 15:29:47 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 192so210877ybt.6
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 15:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EuT1czzOoXwih8m8rN4+z91h2AhC6krGlbE7T+1VzH0=;
        b=OezEMvnD1IQZRKABfW4kVcBWaITkvzT9otH10fnovEoowN03M2XszAYArw4m88PlFV
         J7J9tgjD6xxb+qO4V7qsIAUbdVgOzBsozW3jYhpq4AyKLpJN4O5hEbBAe0HDOBJ5JkQg
         mXYXJu35855jF5He+MnpjSiSXq6pDGPmvmseBAEgXIz+Xc1bcpC0ILvzOaS5WOlQ5zmo
         b7jFeO4Kt7JzCszW5gzNt4tqUwydfIoNkr5eazrmukqZnXuI831YbHVhbUlqva48I/m8
         oJ1UUvWrzQnF/KTdn6i2s6EQRbpp6n6lYXn8sk17w2K+laFQJxyOw2Dmz2zgjku31uF/
         zxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuT1czzOoXwih8m8rN4+z91h2AhC6krGlbE7T+1VzH0=;
        b=ZtsfrlGAjk56kSXqxIsiny0QHgtYELp9jS6mEHTThLwX08YVESdlG1DKtkhHvdrG/p
         DbPSbBWeTU3/3Yh8bk74n16s3jL7nbgjyweW2U+uu3Koh6IM89nuWvccSMtpQfa3CKjS
         RTv4C6IR1GEus30bp+jdgLzUhOLz6MUh4+EYMhEIeLffRWsOFDaGPCAG/dXOCIuudSPh
         52oZbf59izIg9WkIS68R3+06aIbnzo1da/t+vp81f/yGLIZAWoJH0+aP7gQK5CMCLuuc
         zGSkTePS026LleL47F+Uc/5AsWooBHLBacVT6S6vGjs5M4kw98JKJa9thUYMhvt/jcvz
         DTEw==
X-Gm-Message-State: AFqh2ko6kKf6+4DkNY1LlKOWbfhFPbaDxMzvv+EMmRJGslaQ7xSL6Jey
        Xl0TDVfIlf4s6NGSNNdFyZMH/tKGfn8fIDhzIcs=
X-Google-Smtp-Source: AMrXdXtDhK3m89jyJMk+Qtn2tEMRWwDHnCHv61CVKnrM9KqrIC2YU6gtkpghmNL/OLG9r00Qa4FgrGFa3XpOoHGbP6U=
X-Received: by 2002:a25:ca85:0:b0:7b2:ad03:f79d with SMTP id
 a127-20020a25ca85000000b007b2ad03f79dmr796609ybg.435.1672961386280; Thu, 05
 Jan 2023 15:29:46 -0800 (PST)
MIME-Version: 1.0
References: <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas> <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
 <20221228215838.7rxsevi4wfldmm2j@ananas> <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
 <20221229192119.jy2q4xaipfplqjbd@ananas> <CAEc3jaAvAh__5AUwjat4qQzLzSsNCAncYQtEX5ExXX1Hxh9cLw@mail.gmail.com>
 <CAME7zCKPjFbE6nSSoQOVK=BnFG0YAvMgHjAmHKTXcxk3Weuo+w@mail.gmail.com>
 <CAEc3jaBz92QRKCs1Ckb0njDNMu4=CHZcUJ=MPif3Mzvw_Xok2w@mail.gmail.com>
 <CAEc3jaD78h1qbWg+QQ40_yv5xc-oGFHAEyEOx2Nh20C-pxwcJg@mail.gmail.com> <20230105182355.ke4xy2bayxmqdne3@ananas>
In-Reply-To: <20230105182355.ke4xy2bayxmqdne3@ananas>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 5 Jan 2023 15:29:34 -0800
Message-ID: <CAEc3jaD8kQtvcKxzt9yjzvOS6H3G9Utk7DzhFJiquXZq0R2-ZA@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: Fix division by zero
To:     Alain Carlucci <alain.carlucci@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, djogorchock@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alain,

I'm technically still on vacation, but this issue annoyed me a lot. I
had a look at other internal code and I'm relieved the code is
correct. (Well there is one tiny little issue around calibration,
which I will fix, but in practice only causes a tiny, tiny error).

I don't know why I thought it was wrong. Likely I had worked on a
patched kernel with some logic changed which caused these high values.

In any case I mentioned how the ratio was around 60 on my DS4. It
didn't make sense to me, but it is basically: 2000 / 32768 * 1024
(62.5). The 2000 is the range of the sensor, 32768 max value of 16-bit
signed, 1024 the scaling factor we use in the driver.

So basically:+    for (i = 0; i < ARRAY_SIZE(ds4->gyro_calib_data); i++) {
+        if (ds4->gyro_calib_data[i].sens_denom == 0) {
+            hid_warn(hdev, "Invalid gyro calibration data for axis
(%d), disabling calibration.",
+                    ds4->gyro_calib_data[i].abs_code);
+            ds4->gyro_calib_data[i].bias = 0;
+            ds4->gyro_calib_data[i].sens_numer = DS4_GYRO_RANGE;
+            ds4->gyro_calib_data[i].sens_denom = S16_MAX;
+        }
+    }

The same for accelerometer.

I will clean up the patch, add some other patches and send them out shortly.

Thanks,
Roderick

On Thu, Jan 5, 2023 at 10:24 AM Alain Carlucci <alain.carlucci@gmail.com> wrote:
>
> Hi Roderick,
>
> I just tried to see with evtest the values of gyro/accel after
> changing the driver so that follows the suggestion on the dsremap
> website: dividing by two speed_2x:
> speed_2x = (gyro_speed_plus + gyro_speed_minus) >> 1;
>
> The DS4 shows values no higher than 600000 (post-calibration) while
> heavily shaking the joystick. For the record, the calibration is:
>
> gyro_pitch_plus: 8848   gyro_pitch_minus: -8853
> gyro_yaw_plus: 8833     gyro_yaw_minus: -8827
> gyro_roll_plus: 8856    gyro_roll_minus: -8841
> gyro_speed_plus: 540    gyro_speed_minus: 540
> acc_x_plus: 8107        acc_x_minus: -8107
> acc_y_plus: 8259        acc_y_minus: -8259
> acc_z_plus: 8187        acc_z_minus: -8186
>
> This is an example of the output:
>
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 128610
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 95747
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 61321
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 28864
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 874
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -27802
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -54949
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -82064
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -110398
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -138107
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -170345
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -205239
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -242320
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -281525
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -318043
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -356748
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -394453
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -430628
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -465428
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -496105
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -526469
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -551897
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -554865
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -522127
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -450933
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -323041
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -180404
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value -44859
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 71006
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 148353
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 202209
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 242757
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 274183
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 298456
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 316106
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 331569
> Event: time [...], type 3 (EV_ABS), code 3 (ABS_RX), value 338942
>
> Thanks,
> Alain
