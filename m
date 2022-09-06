Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D75C5AF7FB
	for <lists+linux-input@lfdr.de>; Wed,  7 Sep 2022 00:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiIFW27 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 18:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiIFW26 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 18:28:58 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF84186C5
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 15:28:57 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id cu2so26543269ejb.0
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 15:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oOdjtWoEzwzEzBCEi29UV4Widw7zGEnkb6xM+Aik0Pg=;
        b=le8j+0xAOah4jVyIZzHnu2IeY+kvgZstrNTB2EOkGFRSh24AWTM1Xj63HHJI+QHlRf
         pEFKAdIyki3bmnYHCxW8OmgHLL52/h9as8vhq7Z+Ya1gb+yKME/NewKE7Z1BdHizbNI/
         o3+GtdAPZo77s2yGSP3DSAh6+t5CVTC2zWrcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oOdjtWoEzwzEzBCEi29UV4Widw7zGEnkb6xM+Aik0Pg=;
        b=BLOaPXOsQqDowzyf6yTSq3b0pLDCuWn87Z1KLtaOGQ2GmFbp029q0pPjKKb3lnCwQm
         pbTNMM3mOLG46jRZa6N8M/T/IFfELpa3TJe9R3tI34p+l+fv7ZHOMu6Jgk586V2eS4S5
         soUa0nW46lWV4+kFplOjvU9XKmq4WYDD05368F55Fn2W2UMRruiXyZwBzwAysqNweHsv
         0WkBHqAI/vq0+ALOMhKDCDE7tjyCzXbfh3zoaEhE9hxIiJTXCOANksuYr4rdXTEbI6ED
         HS8m8/4SvklEJXmLNu4aEjsahXe/MFOEEtc9eiBYj4nOZ1ReglGhKQHXzZN1NuvUaaWo
         Xjyw==
X-Gm-Message-State: ACgBeo2xxGqhv4Hw4JMNv4SLUyFu36cX1+hC5O453vvIEPFp6opKta9w
        Ri9AagSV55syvbIF81iAz0ecaJEh/UT5e21V
X-Google-Smtp-Source: AA6agR7FZGJIubC/Wopo+VTn8aStKR8+xVXOMyFzrOGDpImPP1cAJgK+l18F7sDhWTQs6GJlDohoWA==
X-Received: by 2002:a17:907:7d8e:b0:742:8ea0:686c with SMTP id oz14-20020a1709077d8e00b007428ea0686cmr388183ejc.591.1662503336116;
        Tue, 06 Sep 2022 15:28:56 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id fs18-20020a170907601200b006fef0c7072esm7288431ejc.144.2022.09.06.15.28.53
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 15:28:54 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id az27so17525227wrb.6
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 15:28:53 -0700 (PDT)
X-Received: by 2002:a5d:59af:0:b0:226:ffd5:58d with SMTP id
 p15-20020a5d59af000000b00226ffd5058dmr289347wrr.405.1662503333512; Tue, 06
 Sep 2022 15:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220902082843.1.I7da6ff6c8e8700624d61e51ff7d09e151bd83dcb@changeid>
 <20220902082843.2.I19ac6cf9b8502d92f551ff4166861debb14576ec@changeid>
In-Reply-To: <20220902082843.2.I19ac6cf9b8502d92f551ff4166861debb14576ec@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Sep 2022 15:28:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZQVfb7=+xN-kVPk6yWeYmrfuMtd=fUjXp6e_JHByAGg@mail.gmail.com>
Message-ID: <CAD=FV=VZQVfb7=+xN-kVPk6yWeYmrfuMtd=fUjXp6e_JHByAGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] input: touchscreen: elants_i2c: Add eth3915n
 touchscreen chip
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Sep 2, 2022 at 1:33 AM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> The eth3915n requires more delay time than the eth3500 when reset.
> Define EKTH3915_RESET_DELAY_MSEC as the reset delay time of eth3915n,
> about 300ms.
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
>
> ---
>
>  drivers/input/touchscreen/elants_i2c.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index c9dd703b0c7d8..60ddb58281bdf 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -116,6 +116,7 @@
>
>  #define ELAN_POWERON_DELAY_USEC        500
>  #define ELAN_RESET_DELAY_MSEC  20
> +#define EKTH3915_RESET_DELAY_MSEC      300
>
>  /* FW boot code version */
>  #define BC_VER_H_BYTE_FOR_EKTH3900x1_I2C        0x72
> @@ -133,6 +134,7 @@
>  enum elants_chip_id {
>         EKTH3500,
>         EKTF3624,
> +       EKTH3915,
>  };
>
>  enum elants_state {
> @@ -664,6 +666,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
>
>         switch (ts->chip_id) {
>         case EKTH3500:
> +       case EKTH3915:
>                 if (!error)
>                         error = elants_i2c_query_ts_info_ekth(ts);
>                 break;
> @@ -1361,7 +1364,17 @@ static int elants_i2c_power_on(struct elants_data *ts)
>         if (error)
>                 return error;
>
> -       msleep(ELAN_RESET_DELAY_MSEC);
> +       if (ts->chip_id == EKTH3915)
> +               /*
> +                * There need delay 300ms for power on sequence.
> +                * T1 + T2 + T3 >= 305 ms
> +                * T1: 0<time<500us
> +                * T2: >5ms
> +                * T3: >300ms
> +                */
> +               msleep(EKTH3915_RESET_DELAY_MSEC);
> +       else
> +               msleep(ELAN_RESET_DELAY_MSEC);
>
>         return 0;
>  }
> @@ -1686,6 +1699,7 @@ static const struct i2c_device_id elants_i2c_id[] = {
>         { DEVICE_NAME, EKTH3500 },
>         { "ekth3500", EKTH3500 },
>         { "ektf3624", EKTF3624 },
> +       { "ekth3915", EKTH3915 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, elants_i2c_id);
> @@ -1702,6 +1716,7 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
>  static const struct of_device_id elants_of_match[] = {
>         { .compatible = "elan,ekth3500", .data = (void *)EKTH3500 },
>         { .compatible = "elan,ektf3624", .data = (void *)EKTF3624 },
> +       { .compatible = "elan,ekth3915", .data = (void *)EKTH3915 },

Adding giant delays isn't my favorite, but it seems like the trend in
touchscreens is that newer ones take forever to power up. I guess this
is no exception. FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
