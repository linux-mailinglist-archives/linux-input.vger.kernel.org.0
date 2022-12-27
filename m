Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDFE656CCB
	for <lists+linux-input@lfdr.de>; Tue, 27 Dec 2022 17:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiL0QR3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Dec 2022 11:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiL0QR2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Dec 2022 11:17:28 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEDD1A6
        for <linux-input@vger.kernel.org>; Tue, 27 Dec 2022 08:17:27 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-381662c78a9so189550167b3.7
        for <linux-input@vger.kernel.org>; Tue, 27 Dec 2022 08:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eAs4orGsDYIO2gr8ETpt3jr59GujQmX85T91JLa48E0=;
        b=h8kiy6uxcDN9HVaLLKYCPNzLDu3djn6xpn9hp93FTrPJzWUqFWVYGnn1jddj22Lnyn
         b66Y9KReqqnGmY//eKDYyISKxbYlshVaZMMyBfnTDCq0JqQJl/YsdW1dfM2jtzZiWfrr
         nQ990eXc/sh3Zjpfftujv3oR5cux7eQq4Gu8syVnUCj8mbsjpp5fpJvZNT/x4RIKbpBu
         sdB+6epvzNr6UKuLhC/ouX2ZyCHwTwWNxh5ZJrYr+voydpPB9K96WQL9x78evvNLDHsi
         f2g7yQ2Yf+yH3cFgi50iaSI6QIQxSnwfyBo1oeIwWA+VEF3IilXcz/5cUlbSsHgkfIGg
         G7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAs4orGsDYIO2gr8ETpt3jr59GujQmX85T91JLa48E0=;
        b=sE3M6QDiu2bGCuDKjg9JfP5ODdxCG0MCfSTuo8CaUk5aJYn8bCy6hESPEmOme8Yod/
         bv5fgL7WXruSWLqrdYGNOQnL27eWndtN0O/e4++O8jb49WSH7FM3UU7oUtpHKoefKzqd
         ALYFWWLow/NIdfBplpNP8uXki2XaGVyBp+QwCtEVgwHrGLV5wxzF/zPyV1gSTwd+r3rA
         LopnmCW8KHtXJT/72A1H3h00oGpkIDQPFR7wEd77Ihnwh2fF5jFms5x6K8Y/CI/Kqzao
         iLrR4qsQsHVi6l4ZMawveHJPEgiLi4i6glAGzuWFly2p4KlYxuKYG8eQheOVjcXCdX7S
         /tvw==
X-Gm-Message-State: AFqh2kpHN82cBaGySmpOUN4W3OM5yDhDJ/Ectyufki+K+jAaZKVTMlnK
        dHve0llH1JGJn0tGSEAMMEH4TD6vS9BXZJBA/XI=
X-Google-Smtp-Source: AMrXdXvETWHabph9QvE4EK+y/Kz2C6CUZmlIGcmSJpFRmQocIhucinuZeyQoJ/jGzBgxT6lKIYNkNHsaRwTVLV4h20U=
X-Received: by 2002:a81:9e05:0:b0:459:6fe3:fd8a with SMTP id
 m5-20020a819e05000000b004596fe3fd8amr2503450ywj.319.1672157846807; Tue, 27
 Dec 2022 08:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20221226000722.2xgbvsnrl6k7f7tk@ananas>
In-Reply-To: <20221226000722.2xgbvsnrl6k7f7tk@ananas>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Tue, 27 Dec 2022 08:17:15 -0800
Message-ID: <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: Fix division by zero
To:     Alain Carlucci <alain.carlucci@gmail.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org
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

Thanks for sharing your patch. Others have encountered similar issues.
This is the case when the calibration coefficients are incorrect.
These are hard programmed into devices from the factory. It are
typically clone devices, which don't implement all DS4 functionality
properly.

Can you try printing all the variables (gyro_speed_plus,..
acc_z_minus) for your device as decimal numbers from the
get_calibration_data function?

I have been considering to add a little bit of clone support code if
possible to the new hid-playstation as long as it doesn't pollute the
code too much or causes issues.

Thanks,
Roderick

On Sun, Dec 25, 2022 at 4:08 PM Alain Carlucci <alain.carlucci@gmail.com> wrote:
>
> Hello,
>
> Today I connected a partially broken DS4 via USB and got a kernel
> panic with a division by zero in the hid-sony driver.
>
> The issue is caused by sens_denom=0 in the sensor calibration data,
> which triggers a division by zero when dualshock4_parse_report() is
> invoked, the division happens in the mult_frac() macro.
>
> This patch applies a workaround that allows the DS4 to be used even
> with a broken sensor: if the denominator sent by the device is zero,
> it is replaced with 1 and a warning is emitted.
>
> Signed-off-by: Alain Carlucci <alain.carlucci@gmail.com>
> ---
>   drivers/hid/hid-sony.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 13125997a..f8b05cb29 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -1714,6 +1714,7 @@ static int dualshock4_get_calibration_data(struct sony_sc *sc)
>         short acc_z_plus, acc_z_minus;
>         int speed_2x;
>         int range_2g;
> +       int calib_id;
>
>         /* For Bluetooth we use a different request, which supports CRC.
>          * Note: in Bluetooth mode feature report 0x02 also changes the state
> @@ -1858,6 +1859,23 @@ static int dualshock4_get_calibration_data(struct sony_sc *sc)
>         sc->ds4_calib_data[5].sens_numer = 2*DS4_ACC_RES_PER_G;
>         sc->ds4_calib_data[5].sens_denom = range_2g;
>
> +       for (calib_id = 0; calib_id < 6; calib_id++) {
> +               /* Ensure there are no denominators equal to zero to prevent
> +                * crashes while dividing by that number.
> +                */
> +
> +               if (sc->ds4_calib_data[calib_id].sens_denom != 0) {
> +                       /* Denominator OK, skip this */
> +                       continue;
> +               }
> +
> +               sc->ds4_calib_data[calib_id].sens_denom = 1;
> +
> +               hid_warn(sc->hdev,
> +                        "DualShock 4 USB dongle: invalid calibration for sensor %d\n",
> +                        calib_id);
> +       }
> +
>   err_stop:
>         kfree(buf);
>         return ret;
> --
> 2.39.0
