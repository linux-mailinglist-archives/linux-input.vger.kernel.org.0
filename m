Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A32426F4667
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 16:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbjEBOxr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 10:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbjEBOxq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 10:53:46 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C7D2126
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 07:53:39 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b996127ec71so5860639276.0
        for <linux-input@vger.kernel.org>; Tue, 02 May 2023 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039219; x=1685631219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rSWq6ufcNwqR6jShOa+WlN0AdC1KgJTfOHM3kYDaQ94=;
        b=HCGdZE2flZzr2fd2/1VfLcQgo/FYFKRYVlYlVeFe/TanV11z7mDpPPZcWH35L2LT3l
         kFfthSkyKjxR4rJ5q69WR5yiPVJrVWNG5elEjoJQPdc+l5ByYEo4ZZBJMEEW0HWH2b97
         2U5AHqBoCyWU5ogrF94ucI754ZFtZlBomCug7v2xfG15bp7MSTu6KbVsVyXaZDbLgpr7
         3ZHWN5NfjkcsyfMJjnXyiBgX9si5i5XLqlDGKp/EzAjt0+Ath3ntM3kU06RgsrthYvJ6
         5tuaxo6eWOjGDNzKxjzsmbe521/4ejWLEfNBbpwhpeUlm5KnMfRst5PAnp3KMsf1A2vm
         G4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039219; x=1685631219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSWq6ufcNwqR6jShOa+WlN0AdC1KgJTfOHM3kYDaQ94=;
        b=lixd8P7DLI75DGG0LwuGg8W6FOLrlxCoTbZiDJP/SVT0C+r2iPdxEXjxvhn8bpFGHT
         YLQKKkHNQo+5rc5Sjc2/UIVDQbPzHcdvLJI8aEya2+h8m74thmYGj3FlKkEeMthMBvPA
         0By2Q9/Hk5icwmb9+rNmUBr3erHuX1ZfW+xwJcvV+7hKUraYybA5cdPR+/H3PZXNMZCS
         R66QJgouf17UsMC18lSUYvWVcOhTaCI+T14QsV3SyyZCOFJ+zffyB9i5icf84mfkRxJn
         eSeT/Hd8YqIpYvpzYOI5oRjKrdS1MPiY/Jj0W8/6HbceDMHXrxzzlmHB4yf2xwVN4vQ+
         bXFw==
X-Gm-Message-State: AC+VfDyPOjLSnE0Qdt7bB1ziYEaQwVqcLp22OMTf9XBDMJACievzSV/a
        ySRxKJ5PD8D5qXwTRfMqviyW9qxFHoxq6+Z5KwUAdw==
X-Google-Smtp-Source: ACHHUZ5jjzC6wz/P4PZED0NI1OnrteBXG7BZ4g1KlIM0VGi6rlDkkbWYK4WpqCmWqpPQ1OXzcDt8w580B52FoeX2Bl4=
X-Received: by 2002:a25:b31c:0:b0:b9d:a328:1128 with SMTP id
 l28-20020a25b31c000000b00b9da3281128mr12202370ybj.13.1683039218841; Tue, 02
 May 2023 07:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230323093141.4070840-1-peng.fan@oss.nxp.com>
 <20230323093141.4070840-2-peng.fan@oss.nxp.com> <ZDN00vwyCOzFrDYt@google.com>
 <DU0PR04MB94172C2BBB554E472576B2BA889B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <DU0PR04MB9417185EB8243ED2D60A6E43889B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <CAPDyKFruZOP65k0SEEmCGtopp8ywJA92ChGZs2ZR=nVxqUC0OQ@mail.gmail.com> <fcfd3b04-ce51-af95-5d94-cc244d75727f@oss.nxp.com>
In-Reply-To: <fcfd3b04-ce51-af95-5d94-cc244d75727f@oss.nxp.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 2 May 2023 16:53:03 +0200
Message-ID: <CAPDyKFp0a4QtLL8yE9pPw2DbCKsjB5UyYeuy2rWB=FEfm5+MqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] input: imx_sc_key: add wakeup support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peng Fan <peng.fan@oss.nxp.com>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 20 Apr 2023 at 09:54, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> Dmitry,Ulf
>
> On 4/18/2023 4:32 PM, Ulf Hansson wrote:
> > On Wed, 12 Apr 2023 at 17:58, Peng Fan <peng.fan@nxp.com> wrote:
> >>
> >> +Ulf
> >>
> >>> Subject: RE: [PATCH 2/2] input: imx_sc_key: add wakeup support
> >>>
> >>>> Subject: Re: [PATCH 2/2] input: imx_sc_key: add wakeup support
> >>>>
> >>>> On Thu, Mar 23, 2023 at 05:31:41PM +0800, Peng Fan (OSS) wrote:
> >>>>> From: Peng Fan <peng.fan@nxp.com>
> >>>>>
> >>>>> Add support for waking up from system wide suspend.
> >>>>>
> >>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >>>>> ---
> >>>>>   drivers/input/keyboard/imx_sc_key.c | 2 ++
> >>>>>   1 file changed, 2 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/input/keyboard/imx_sc_key.c
> >>>> b/drivers/input/keyboard/imx_sc_key.c
> >>>>> index d18839f1f4f6..234f23cf9990 100644
> >>>>> --- a/drivers/input/keyboard/imx_sc_key.c
> >>>>> +++ b/drivers/input/keyboard/imx_sc_key.c
> >>>>> @@ -151,6 +151,8 @@ static int imx_sc_key_probe(struct
> >>>> platform_device *pdev)
> >>>>>    priv->input = input;
> >>>>>    platform_set_drvdata(pdev, priv);
> >>>>>
> >>>>> + device_init_wakeup(&pdev->dev,
> >>>> device_property_read_bool(&pdev->dev, "wakeup-source"));
> >>>>> +
> >>>>
> >>>> I wonder - could we move this to the device core?
> >>>
> >>> I see lots device drivers parse wakeup-source, so I also follow That. Not sure
> >>> whether could move this feature to device core, but anyway I could give a
> >>> try.
> >>
> >> Do you think it is feasible to move device_init_wakeup into device core
> >> part?
> >
> > Not sure it would really improve things that much. Subsystems/drivers
> > need to make additional configurations based upon whether this DT
> > property is set anyway.
> >
> > Perhaps an option is to make this a part of the common input subsystem
> > helper functions instead? Other subsystems do this, but I am not sure
> > how feasible that would be in the input case.
>
> How do you think of below patch?

Seems reasonable to me, but I can't really tell if this makes sense
for all input drivers.

Dmitry?

>
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 37e876d45eb9..a98a9f37e1f5 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -2402,6 +2402,10 @@ int input_register_device(struct input_dev *dev)
>                          __func__, dev_name(&dev->dev));
>                  devres_add(dev->dev.parent, devres);
>          }
> +
> +       if (device_property_read_bool(input->dev.parent, "wakeup-source"))
> +               device_init_wakeup(&pdev->dev, true);
> +
>          return 0;
>
>   err_device_del:
>

Kind regards
Uffe
