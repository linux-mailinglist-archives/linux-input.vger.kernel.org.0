Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110276EF88C
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 18:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjDZQkL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 12:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDZQkK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 12:40:10 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27722727
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 09:40:08 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-32abc2e7da8so19601135ab.3
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682527208; x=1685119208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4gwcCmmM+Y1PLgZw9XcWeLGKRKHQq/1YEoQ0r3Lmgc=;
        b=crLkQwUQQ3nXeRFdyqa+13zRbDZxwaKCyPY+cbnyuNPizvmIZ7qSkx1kV1TfGrHIEE
         RcGysh7goZgwwJV9T+GV1Ml11aWOZ6M0d/GLSC2nvBCmTkJOR7yLCaFupfOJXJABXFhh
         trW0m/75bBn8vzaK0ztI0UlvWiM/aKGxPqVIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682527208; x=1685119208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4gwcCmmM+Y1PLgZw9XcWeLGKRKHQq/1YEoQ0r3Lmgc=;
        b=MTrSoq0hoCg8TWLGJFGktGpR3LSyQRHoQ77Y+RUSBBt0tpm+feHR+aIl6itYw5MKNk
         ShLyXU78efACG97ED0xZKuGKGZKPwUUh6p3Kd0IcjzKK/YRC4exw/MasxtNGUy7x6vl8
         RxKyLnEufqXYDsHfatqNINYXG8wqN0BAf49yvO3TC28eclIEU/BjlGnCI8cwTGPHC6ey
         Ss7tE/DLXq3bQqqbFzEITCZFhpT+/WAaamf3WJHJOk4EpNq/8YNOIHJ6Gejfap2/UQwo
         UE9QH73pjkbzI+XgF0KKNkiRvsiSsiiWqgd4g1S5EpyWyzab5VKi/0eX19xgrppHKmIk
         fCrA==
X-Gm-Message-State: AAQBX9dbHvnFJ5AWec5FX+/yfNW7CxwMC1uDrn6qaH4iUcS2+OCEWniq
        SkztlZ6dXiXykrcnenC7AhNGTwut0wNFRaZBvjY=
X-Google-Smtp-Source: AKy350b+XjAhiQRC2OUlENfrNEhNQpUky+c33CQb4OeJFNJavdOTBOcSn4GylOcWNEc62gtIcIj0jw==
X-Received: by 2002:a92:c985:0:b0:325:b96e:6701 with SMTP id y5-20020a92c985000000b00325b96e6701mr9782365iln.2.1682527207842;
        Wed, 26 Apr 2023 09:40:07 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id h14-20020a056e020d4e00b0032aef6b60adsm4410629ilj.34.2023.04.26.09.40.06
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 09:40:06 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-32ec968434eso285955ab.0
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 09:40:06 -0700 (PDT)
X-Received: by 2002:a05:6e02:1be7:b0:32a:f049:edc0 with SMTP id
 y7-20020a056e021be700b0032af049edc0mr280720ilv.17.1682527206123; Wed, 26 Apr
 2023 09:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230426144423.2820826-1-fshao@chromium.org> <20230426144423.2820826-3-fshao@chromium.org>
In-Reply-To: <20230426144423.2820826-3-fshao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 26 Apr 2023 09:39:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUXAje++Za2UZU3gVTGR7iCEHA23ZSqWcscg0VsO3g8A@mail.gmail.com>
Message-ID: <CAD=FV=UUXAje++Za2UZU3gVTGR7iCEHA23ZSqWcscg0VsO3g8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: i2c-hid: goodix: Add support for
 "goodix,no-reset-during-suspend" property
To:     Fei Shao <fshao@chromium.org>
Cc:     Jeff LaBundy <jeff@labundy.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Apr 26, 2023 at 7:44=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> In the beginning, commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the
> reset line to true state of the regulator") introduced a change to tie
> the reset line of the Goodix touchscreen to the state of the regulator
> to fix a power leakage issue in suspend.
>
> After some time, the change was deemed unnecessary and was reverted in
> commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line to
> the regulator") due to difficulties in managing regulator notifiers for
> designs like Evoker, which provides a second power rail to touchscreen.
>
> However, the revert caused a power regression on another Chromebook
> device Steelix in the field, which has a dedicated always-on regulator
> for touchscreen and was covered by the workaround in the first commit.
>
> To address both cases, this patch adds the support for the new
> "goodix,no-reset-during-suspend" property in the driver:
> - When set to true, the driver does not assert the reset GPIO during
>   power-down.
>   Instead, the GPIO will be asserted during power-up to ensure the
>   touchscreen always has a clean start and consistent behavior after
>   resuming.
>   This is for designs with a dedicated always-on regulator.
> - When set to false or unset, the driver uses the original control flow
>   and asserts GPIO and disables regulators normally.
>   This is for the two-regulator and shared-regulator designs.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v3:
> - In power-down, only skip the GPIO but not the regulator calls if the
>   flag is set
>
> Changes in v2:
> - Do not change the regulator_enable logic during power-up.
>
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

You already carried over my Reviewed-by tag, which is fine. ...but
just sending a quick confirmation that v3 looks good to me. Thanks!

-Doug
