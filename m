Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E514C6E6711
	for <lists+linux-input@lfdr.de>; Tue, 18 Apr 2023 16:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjDROW5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Apr 2023 10:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjDROW4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Apr 2023 10:22:56 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEFB9EE6
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 07:22:30 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-504fce3d7fbso4361383a12.2
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681827748; x=1684419748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr9HMDo/MJuNTypI5wjgUQXDgpx9NKUHRJlWMwJUMe0=;
        b=lRk+QFnlSqDxzU3eT4rs73hVScoqFv1RrT3WJsME63uRLoBjSHoyorSQTcGqboKkhS
         ZSrmb6GYzdM95LJjof5njuIyOwaP8wKZZcJgjArXB21he8BNind+ICxQuOocobrvsbmo
         pPpLErigyJTAVFr5YO6I4CGiltD9xWzBSEDLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681827748; x=1684419748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr9HMDo/MJuNTypI5wjgUQXDgpx9NKUHRJlWMwJUMe0=;
        b=IMHZMbDPFvI6qWlf6MntiBstZbCrJ6bF8NvgcluuYmHAYVkgCgv/qJZ43Z4sflCutx
         /t2PpyenG26YOl2VvCFgBaARcr2YiD4F4tl8yeLoudFw3hl7Ybshui11gVqcKa0EQ46v
         8+ohL1yKdGDOEVhvkNBTOUSHVBnMx4yoG37rJP7dsi925PT5fhRrzCNRViKnrA9cT1ul
         bLuboBXKT3lAmLwjMQkHvPGA7unHn387FUkvpHNU+lEwcEAZtgCADzq63uZcID0gNZma
         yfmypH4KsOh8vGZOBo356nTmHc9gILkwFVAcWm7Y5qa/94cN2xSGsraSsOSK5vW9pa47
         vliw==
X-Gm-Message-State: AAQBX9d1TPVBFDo18ewmxuPshJiy/AN+mM92B7TaahV8/oXuj/oIhd2U
        UecDrd75Ii19+hgq7mpJ2HxXqskjG9oXuMMDcKf7MQ==
X-Google-Smtp-Source: AKy350ZwL6w9kjHEVS5iNJycYrgGZh+pK8JuWOIe3Cqs2h+MBzMRKF0Ge+/WaH4wziiNFTwqfzdyNQ==
X-Received: by 2002:aa7:c254:0:b0:506:7695:ed16 with SMTP id y20-20020aa7c254000000b005067695ed16mr2448046edo.40.1681827747775;
        Tue, 18 Apr 2023 07:22:27 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id b24-20020a05640202d800b005068053b53dsm5970563edx.73.2023.04.18.07.22.27
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 07:22:27 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f09b9ac51dso69178885e9.0
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 07:22:27 -0700 (PDT)
X-Received: by 2002:adf:e195:0:b0:2d7:9771:fc4b with SMTP id
 az21-20020adfe195000000b002d79771fc4bmr620802wrb.5.1681827746736; Tue, 18 Apr
 2023 07:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-3-fshao@chromium.org>
In-Reply-To: <20230418124953.3170028-3-fshao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 18 Apr 2023 07:22:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVH3H9R=dnrOkiCEa-+izcSKjfdXbRDP8bc4xo_AhMnw@mail.gmail.com>
Message-ID: <CAD=FV=WVH3H9R=dnrOkiCEa-+izcSKjfdXbRDP8bc4xo_AhMnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: i2c-hid: goodix: Add support for
 powered-in-suspend property
To:     Fei Shao <fshao@chromium.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Apr 18, 2023 at 5:51=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
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
> To address both cases, this patch adds the support for the
> `powered-in-suspend` property in the driver that allows the driver to
> determine whether the touchscreen is still powered in suspend, and
> handle the reset GPIO accordingly as below:
> - When set to true, the driver does not assert the reset GPIO in power
>   down. To ensure a clean start and the consistent behavior, it does the
>   assertion in power up instead.
>   This is for designs with a dedicated always-on regulator.
> - When set to false, the driver uses the original control flow and
>   asserts GPIO and disable regulators normally.
>   This is for the two-regulator and shared-regulator designs.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
>
> ---
>
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 46 +++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 7 deletions(-)

I privately reviewed earlier versions of this patch, so it's
unsurprising that I have no comments. Assuming that the DT folks don't
have any objections to the bindings change, this LGTM.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
