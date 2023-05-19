Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212A0709901
	for <lists+linux-input@lfdr.de>; Fri, 19 May 2023 16:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjESOJE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 May 2023 10:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbjESOJD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 May 2023 10:09:03 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3476D1A5
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 07:09:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso1778289a12.1
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684505339; x=1687097339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nO2IMSaci1mLkURs2Rerjvjr6e18HL0QFWSpDQYnXvg=;
        b=U2U4r2IfK1jqKF/mNm2KBqvjWNjdQTp0YZz6jcDMwgeHMql/r0VVaJW2RthUbcW0ax
         BMCxfExFR9p+czfqKl5v/pNtRk1gq+UPKYyDNdm9IaFkXAmx4bAWzZS3KqgM/whKTF3F
         YzxcIGVt7VJPpvqqLQrpK3Cni8Y+R8aeYnlh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684505339; x=1687097339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO2IMSaci1mLkURs2Rerjvjr6e18HL0QFWSpDQYnXvg=;
        b=cAOyc5VBiT+mWAL+if0GBMTKHssUxYJt2K/rgnuxV9w3/+JAkjrsUs82dNXXl5QPxT
         8uASbMoW7v/tWsNqrExopAqvizQvIj69v7A+pPRRMTdAtTdEDLODez+KVspVOo9kTEpn
         qhsy75n41B+9nk3566zf9AzQU6sgSJVl1z+EJEz2c4WkbP3TmVzCE5uBho9WIWprQa2Z
         jfGTvgwjHUjySz5srcQeNvWDW8+1qZ0XlI6oiJD+kPu/ggCjAhIcdoF6USpd9qW7sBVF
         439lnI4AyTxIJs2ZXjxv23XCsT7kn0yExYrjVgZ0vhZYxTRQBpfn6LeCNz1wn6cqYeuU
         NrUw==
X-Gm-Message-State: AC+VfDzYyWlrE6ARiBumVUCnyzi4/WsTfuQbppqYFiuPiFUVHskjeBRR
        xY+wedoYnYMAasMbiqLSmIQlpQpfyzjr595qK+U=
X-Google-Smtp-Source: ACHHUZ7Iq0GoE7Pl15dmUHNO54/cYdMBhLYBiy8Pupsaa1YPSYRupSKwJShJPqBjnNM7GnVJD87MVw==
X-Received: by 2002:a17:902:f7d6:b0:1aa:fec9:5219 with SMTP id h22-20020a170902f7d600b001aafec95219mr2438332plw.61.1684505339404;
        Fri, 19 May 2023 07:08:59 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902b20400b001a6ed2d0ef8sm3448976plr.273.2023.05.19.07.08.58
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 07:08:58 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ae3f74c98bso121695ad.1
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 07:08:58 -0700 (PDT)
X-Received: by 2002:a17:902:dad2:b0:198:af50:e4de with SMTP id
 q18-20020a170902dad200b00198af50e4demr206507plx.4.1684505337704; Fri, 19 May
 2023 07:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230427035656.1962698-1-fshao@chromium.org>
In-Reply-To: <20230427035656.1962698-1-fshao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 19 May 2023 07:08:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
Message-ID: <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
To:     Fei Shao <fshao@chromium.org>
Cc:     Jeff LaBundy <jeff@labundy.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Apr 26, 2023 at 8:57=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> These changes are based on the series in [1], which modified the
> i2c-hid-of-goodix driver and removed the workaround for a power leakage
> issue, so the issue revisits on Mediatek MT8186 boards (Steelix).
>
> The root cause is that the touchscreen can be powered in different ways
> depending on the hardware designs, and it's not as easy to come up with
> a solution that is both simple and elegant for all the known designs.
>
> To address the issue, I ended up adding a new boolean property for the
> driver so that we can control the power up/down sequence depending on
> that.
>
> Adding a new property might not be the cleanest approach for this, but
> at least the intention would be easy enough to understand, and it
> introduces relatively small change to the code and fully preserves the
> original control flow.
> I hope this is something acceptable, and I'm open to any better
> approaches.
>
> [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chromium=
.org/
>
> Changes in v4:
> - Minor coding style improvement
>
> Changes in v3:
> - In power-down, only skip the GPIO but not the regulator calls if the
>   flag is set
>
> Changes in v2:
> - Use a more accurate property name and with "goodix," prefix.
> - Do not change the regulator_enable logic during power-up.
>
> Fei Shao (2):
>   dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
>     property
>   HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend"
>     property
>
>  .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 +++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)

Just double-checking if there is any work needed on this series. I
think it's ready to land but I wanted to double-check.

Thanks!

-Doug
