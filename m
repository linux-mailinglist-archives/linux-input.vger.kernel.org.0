Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD454958E2
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 05:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348124AbiAUESh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jan 2022 23:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233924AbiAUESh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jan 2022 23:18:37 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9636C061574
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 20:18:36 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id x31-20020a056830245f00b00599111c8b20so10327120otr.7
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 20:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=X+027WAXIEf9otddXJOLwu3Q7db/hKp3YNkSsFObVoo=;
        b=g2HmbwnVrjJJTz5/dipfRDJG8eT7xdVFBFo+FRwfGPuvLs4BaLMkSPfqdLnSTVAg+0
         PZGlX22ic1QLJ2B/baSXOd17CvZwptwXX0Vuhq5LI9r/vdjakWz6sS67Fkex8AsBm2oy
         0CBgfcdgKiX1f+zbEcAs1vUsZcXN1LGVyJzjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=X+027WAXIEf9otddXJOLwu3Q7db/hKp3YNkSsFObVoo=;
        b=tuF8EhUUjZdfK5ttzKh8VOS6O1OB+jo+1bDbsrjC0I+lhGzecD3ev/6xuWcRGMhL+x
         bAmdO0nRzSzIhWCa6BJIk6I/6DxFil7H1ktyDsyQMyTNEL6UaBXG10LQG+l5nkquSIeF
         g0f31NV5TQFtc7omZ8nZ5UwYuP3AENEtsNN/4P+M+/T/avm5UX0SRUESgcHo2pgUbphE
         EVeWC01IszfaqcTyFIYP0fflk47wVLKtkvg5qNvouZxSdGIG3Qrh73qxAdf8f7iGUJol
         iEF5tUJfkitnDOQ7b/blpFHtS7rI9adEQwQcuuc81MDGaimYKRu8uUSPH7yi0Wyv1Uvg
         jGCA==
X-Gm-Message-State: AOAM5311vy7D/ae2GWZJVmMjD19xvdSo3zeob4skHwN8pASLga3yWQm3
        GbL9h6nxZtyInPElUZX51pEfhd8ySHt5xNWqAwyyVg==
X-Google-Smtp-Source: ABdhPJyc1dJG2DBLziGQ6/BQDrbk7P2KSwENbshVTH9OiBCmKoRRHH00Pt3dS/I27eysMcU6r1aFXTWKmrC2/wPSXNg=
X-Received: by 2002:a05:6830:1614:: with SMTP id g20mr1542245otr.77.1642738716150;
 Thu, 20 Jan 2022 20:18:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Jan 2022 20:18:35 -0800
MIME-Version: 1.0
In-Reply-To: <e2015c19-b73b-39a7-ba73-708b2c4552c7@quicinc.com>
References: <20220120204132.17875-1-quic_amelende@quicinc.com>
 <20220120204132.17875-4-quic_amelende@quicinc.com> <YenpwnE3WrIEAOlm@ripper> <e2015c19-b73b-39a7-ba73-708b2c4552c7@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 20 Jan 2022 20:18:35 -0800
Message-ID: <CAE-0n50+1OU2yt2gihHHCEn-cE-CZuqa_U9W=xWCuYeCQdzExw@mail.gmail.com>
Subject: Re: [PATCH 3/3] input: misc: pm8941-pwrkey: avoid potential null
 pointer dereference
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        collinsd@codeaurora.org, skakit@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Anjelique Melendez (2022-01-20 16:25:26)
>
> On 1/20/2022 3:01 PM, Bjorn Andersson wrote:
> > On Thu 20 Jan 12:41 PST 2022, Anjelique Melendez wrote:
> >
> >> From: David Collins <collinsd@codeaurora.org>
> >>
> >> Add a null check for the pwrkey->data pointer after it is assigned
> >> in pm8941_pwrkey_probe().  This avoids a potential null pointer
> >> dereference when pwrkey->data->has_pon_pbs is accessed later in
> >> the probe function.
> >>
> >> Change-Id: I589c4851e544d79a1863fd110b32a0b45ac03caf
> >> Signed-off-by: David Collins <collinsd@codeaurora.org>
> >> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> >> ---
> >>  drivers/input/misc/pm8941-pwrkey.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> >> index 0ce00736e695..ac08ed025802 100644
> >> --- a/drivers/input/misc/pm8941-pwrkey.c
> >> +++ b/drivers/input/misc/pm8941-pwrkey.c
> >> @@ -263,6 +263,10 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
> >>
> >>      pwrkey->dev = &pdev->dev;
> >>      pwrkey->data = of_device_get_match_data(&pdev->dev);
> >> +    if (!pwrkey->data) {
> > The only way this can happen is if you add a new compatible and forget
> > to specify data and when that happens you will get a print in the log
> > somewhere, which once you realize that you don't have your pwrkey you
> > might be able to find among all the other prints.
> >
> > If you instead don't NULL check this pointer you will get a large splat
> > in the log, with callstack and all, immediately hinting you that
> > pwrkey->data is NULL.
> >
> >
> > In other words, there's already a print, a much larger print and I don't
> > think there's value in handling this mistake gracefully.
> >
> > Regards,
> > Bjorn
>
>
> We would like to the null pointer check in place to avoid static analysis
>
> warnings that can be easily fixed.
>

Many drivers check that their device_get_match_data() returns a valid
pointer. I'd like to see that API used in addition to checking the
return value for NULL so that we can keep the static analysis tools
happy. Yes it's an impossible case assuming the driver writer didn't
mess up but it shuts SA up and we don't really have a better solution
to tell tools that device_get_match_data() can't return NULL.
