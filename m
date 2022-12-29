Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFDE6591DB
	for <lists+linux-input@lfdr.de>; Thu, 29 Dec 2022 21:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbiL2U5C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Dec 2022 15:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiL2U5A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Dec 2022 15:57:00 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E5FB1FD
        for <linux-input@vger.kernel.org>; Thu, 29 Dec 2022 12:56:59 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-45f4aef92daso275508487b3.0
        for <linux-input@vger.kernel.org>; Thu, 29 Dec 2022 12:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ihKu5ELZcBRucgwI5O0UvvW5hjYBusIzqRwj7dSzfOY=;
        b=AX3t9jMUX5pdQH7ff5EOxMCxQkxUvUT9ptHZRif1EQoNWU8Flyf1zwcQzRB/FxeqFP
         /03r+Z3sQYDwPtK83JS1dIErTQ+lHqyLh5jLTeVPVXQourn3E48AZUDUDkeYOQ7LlEdV
         FLkQuOE7RVBGTAeZC/vjhbuUnHgQkFG/MwnOWLui81I+0lZlLMAJEKPHK6e+1how8GWd
         KTHRTmSDL5e2jV9mJ4SmsLY0LaY5OK3h2zxQo8I/DE5ExFQEQeOUK1qdZdvHkhle2kjt
         bXpsZEBZuAXZNZg6ZCRytUdL7auMtOOt96fqhtPJYa4VqGgxPub/mCLqOZZHXpF62vLk
         EKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihKu5ELZcBRucgwI5O0UvvW5hjYBusIzqRwj7dSzfOY=;
        b=70QNc2urxFRLfkXSHRH4IyQrte+Sk6a5iW2HJbYgoQL59qv7SNDz0igtienr7I897Y
         aNG5foI7u5lq7C10J4wqqlPrPjeaIeCaz9Gh9iM1rBkdq0q/Dc5DyNlxRCN9rzqq7ujX
         8KTBHdcscu57+tURFHj6mWzjv1XEIoawwXCTjsY86QAKurgY6SdgCYmYQb4P/CsSLR4L
         jtn5bLc524UEA8+9dqXVWLmSbndrRWHZkVj/yBYGEvtcyxlNnlcCJErWgkWx8DRGV8pP
         1D1yU64HXooAIzKlaIWsJfzcu1Met6SVCwWeJfMdA8vO6/Pb29FWlQzOkVkNanOUtACQ
         M80A==
X-Gm-Message-State: AFqh2kpx45O8iJQhARHTmlcOGqJGO8l7kpveA/TFZgbN3pqvbenVAs4l
        4y/XKYNaO+KvNcbl3Rria9k3eECw4CWD+hSwT4sEJ0rv
X-Google-Smtp-Source: AMrXdXsgOzG5x3PxLGg8NUEUvGj2QEhyWG5rkuDaLUCd92tQz9fUTaAdk24GCLqjwJimyJkz8UXukfgfQb+RnGSpkMg=
X-Received: by 2002:a81:1d93:0:b0:476:40af:a522 with SMTP id
 d141-20020a811d93000000b0047640afa522mr2242363ywd.518.1672347418667; Thu, 29
 Dec 2022 12:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20221226000722.2xgbvsnrl6k7f7tk@ananas> <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas> <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
 <20221228215838.7rxsevi4wfldmm2j@ananas> <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
 <20221229192119.jy2q4xaipfplqjbd@ananas>
In-Reply-To: <20221229192119.jy2q4xaipfplqjbd@ananas>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 29 Dec 2022 12:56:47 -0800
Message-ID: <CAEc3jaAvAh__5AUwjat4qQzLzSsNCAncYQtEX5ExXX1Hxh9cLw@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: Fix division by zero
To:     Alain Carlucci <alain.carlucci@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
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

On Thu, Dec 29, 2022 at 11:21 AM Alain Carlucci
<alain.carlucci@gmail.com> wrote:
>
> Hi Roderick,
>
> >Give this patch a try. It is against hid-playstation, which as of 6.2
> >supports DS4. Let me know if it works. You can see the sensors working
> >through evdev on the motion sensors device.
>
> Thank you for the patch, just tried. I think there is a typo in the
> condition of the for-loop that sanitizes the input.
> Instead of `; i < ARRAY_SIZE()` it's written `; ARRAY_SIZE()`,
> which always evaluates to true. The loop then overflows the array and
> crashes the kernel.

Ooh oops. It was a quick patch I wrote without testing.

> By the way, the DualSense code has similar calibration code and also
> there the input is not sanitized.
> I think it's quite easy to create a fake DualSense device with
> an Arduino that emulates the protocol up to calib_denom=0, just to
> exploit that and crash every linux machine is plugged in. Or even
> worst, exploit that via bluetooth.

You are right it probably won't hurt to duplicate the logic there.

> >If you want to dig deeper, you can play around with
> >dualshock4_get_calibration_data in hid-playstation. The particular
> >report (though not fully documented in the driver) does contain a lot
> >of device info (firmware info, manufacturing dates, various strings).
> >You can probably find the details online. Some data there might be
> >weird or not populated.
>
> Thank you! Just discovered that this strange DS4 (CUH-ZCT2E) replies
> all zeros both to HID request 0x02 (get calibration data) and as the
> BT address (request 0x12, Pairing Info), which explains why BT is not
> working.

There is definitely something weird with your device. Something must
have gotten wiped somehow.

> I tried to request version info (0xa3), the response seems the same as
> another fully-working and original CUH-ZCT2E:
> """
> Build Date: Sep 21 2018 04:50:51
> HW Version: 0100.b008
> SW Version: 00000001.a00a
> SW Series:  2010
> Code Size:  0002a000
> """
>
> Anyway, I have seen that request 0xA2 puts the DS4 in an alternate
> boot mode, probably DFU mode, where the device reboots as 054c:0856
> and waits for data, which seems totally undocumented online.
> Do you know anything about this mode?
> It would be amazing to be able to reflash the original firmware,

Unfortunately I can't disclose any of that information. I can say that
on DS4 it wasn't common to update firmware (as opposed to DualSense)
while out in the wild. Some of these requests and others are probably
used to initiate firmware programming and programming of MAC address,
calibration data and other settings. It is probably quite involved and
hard to get right without bricking your device.

> Thanks,
> Alain

Thanks,
Roderick
