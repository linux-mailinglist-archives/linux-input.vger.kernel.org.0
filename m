Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB20149A693
	for <lists+linux-input@lfdr.de>; Tue, 25 Jan 2022 03:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3419547AbiAYCTQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 21:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3413949AbiAYAl3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 19:41:29 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FAAC05430A
        for <linux-input@vger.kernel.org>; Mon, 24 Jan 2022 14:26:06 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id p203so11491913oih.10
        for <linux-input@vger.kernel.org>; Mon, 24 Jan 2022 14:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0f9IE0661xn75d7FB58FYRPdONZNDHV3u2RCDMrfPKY=;
        b=EWlkmAb7Ul4Ffei88oljh0OwBQEwXbmzrxbR/cnGeD2jWgIqm1x1KwqYS68Rgb1UpZ
         8zCdBgfypwTTgPupSEvLCx3qBU/5wIdCu8uixoRm8q2AEZmXjd3B7gB9VuwFN8RHdlsr
         +JESdkZq/QKiaKYrgnN9u/fAlBCXT6PgYz1QcN/9md4yVQkf2His7KOOIeVIHpIbFvRD
         nQ9kDegKOZznR6QXRAT4Xir/RNdEaQ1sDDIHclh15BDAs8QtnqLk5V7CohXfp235MqQZ
         rDbU9ZZomLnuc9j+1cWayOUsbH0JqZtSXGiOFBVxNfEDodifeOk/127iUu8AvkpbVWA2
         cXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0f9IE0661xn75d7FB58FYRPdONZNDHV3u2RCDMrfPKY=;
        b=GFrEXQtWOro+6PyQ6XAUxZAbbgDHuYzgKjXFwP6/KNY2x1hpUAOcU6mCfeJecau5od
         ZEd09jx9D4iXMyKZrnVl4733vtRdPwTdXxxDlKF9AsbwYSU9UlvXS7Z2ZXVfbTOMSHwa
         LLQsiPL3su36mr2o23LoaQknKzeFqLXE8RfS3Eg+zlU+cwe9D0sxgQXcwRhhQlvCHWDr
         Un8Ug7LGENEOXW+bO3HjOpbwv61Yg+kYsOFTcVScLZVe5lqHi/x8YnLuCqUrMkPI0YOs
         wZ3Si1H5hu/SGevzB01pGaZQW1Tpizrx1EpxJnGDuEagbUvPbJ52hIjAfULi/Ic+9QSJ
         Y6Rw==
X-Gm-Message-State: AOAM532niqL7lF8sWMUT5XYlMQ+1Npa9agBRnb/Tzpf4QbvPwMQZO1My
        jgrkw/q1CSV0Gu0J7iyd6fgwbw==
X-Google-Smtp-Source: ABdhPJxXbqFIHTkb9LGW/rQzTM3c48C2VAmE9h9yQupw4WHAdviB6jCOJ4HVxKbwi1TqoSS6qMzF4w==
X-Received: by 2002:a54:460a:: with SMTP id p10mr3214270oip.163.1643063166131;
        Mon, 24 Jan 2022 14:26:06 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id w191sm3496715oiw.42.2022.01.24.14.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:26:05 -0800 (PST)
Date:   Mon, 24 Jan 2022 14:26:34 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Anjelique Melendez <quic_amelende@quicinc.com>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        collinsd@codeaurora.org, skakit@codeaurora.org
Subject: Re: [PATCH 3/3] input: misc: pm8941-pwrkey: avoid potential null
 pointer dereference
Message-ID: <Ye8nmnQ3F4QcTIJs@ripper>
References: <20220120204132.17875-1-quic_amelende@quicinc.com>
 <20220120204132.17875-4-quic_amelende@quicinc.com>
 <YenpwnE3WrIEAOlm@ripper>
 <e2015c19-b73b-39a7-ba73-708b2c4552c7@quicinc.com>
 <CAE-0n50+1OU2yt2gihHHCEn-cE-CZuqa_U9W=xWCuYeCQdzExw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50+1OU2yt2gihHHCEn-cE-CZuqa_U9W=xWCuYeCQdzExw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu 20 Jan 20:18 PST 2022, Stephen Boyd wrote:

> Quoting Anjelique Melendez (2022-01-20 16:25:26)
> >
> > On 1/20/2022 3:01 PM, Bjorn Andersson wrote:
> > > On Thu 20 Jan 12:41 PST 2022, Anjelique Melendez wrote:
> > >
> > >> From: David Collins <collinsd@codeaurora.org>
> > >>
> > >> Add a null check for the pwrkey->data pointer after it is assigned
> > >> in pm8941_pwrkey_probe().  This avoids a potential null pointer
> > >> dereference when pwrkey->data->has_pon_pbs is accessed later in
> > >> the probe function.
> > >>
> > >> Change-Id: I589c4851e544d79a1863fd110b32a0b45ac03caf
> > >> Signed-off-by: David Collins <collinsd@codeaurora.org>
> > >> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> > >> ---
> > >>  drivers/input/misc/pm8941-pwrkey.c | 4 ++++
> > >>  1 file changed, 4 insertions(+)
> > >>
> > >> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> > >> index 0ce00736e695..ac08ed025802 100644
> > >> --- a/drivers/input/misc/pm8941-pwrkey.c
> > >> +++ b/drivers/input/misc/pm8941-pwrkey.c
> > >> @@ -263,6 +263,10 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
> > >>
> > >>      pwrkey->dev = &pdev->dev;
> > >>      pwrkey->data = of_device_get_match_data(&pdev->dev);
> > >> +    if (!pwrkey->data) {
> > > The only way this can happen is if you add a new compatible and forget
> > > to specify data and when that happens you will get a print in the log
> > > somewhere, which once you realize that you don't have your pwrkey you
> > > might be able to find among all the other prints.
> > >
> > > If you instead don't NULL check this pointer you will get a large splat
> > > in the log, with callstack and all, immediately hinting you that
> > > pwrkey->data is NULL.
> > >
> > >
> > > In other words, there's already a print, a much larger print and I don't
> > > think there's value in handling this mistake gracefully.
> > >
> > > Regards,
> > > Bjorn
> >
> >
> > We would like to the null pointer check in place to avoid static analysis
> >
> > warnings that can be easily fixed.
> >
> 
> Many drivers check that their device_get_match_data() returns a valid
> pointer. I'd like to see that API used in addition to checking the
> return value for NULL so that we can keep the static analysis tools
> happy. Yes it's an impossible case assuming the driver writer didn't
> mess up but it shuts SA up and we don't really have a better solution
> to tell tools that device_get_match_data() can't return NULL.

I'm not saying that device_get_match_data() can't return NULL, I'm
saying that in the very specific cases that it would return NULL it's
useful to have a kernel panic - as that's a much faster way to figure
out that something is wrong.

And as a timely coincidence I tried to introduce such a check last week,
for a case where the cause of the dereference issue definitely wasn't
obvious to me and Greg among others told me that it's wrong:

https://lore.kernel.org/linux-arm-msm/20220118185612.2067031-2-bjorn.andersson@linaro.org/


And just to be clear, I don't care about this case in particular, but I
fear that we have a lot of SA warnings to shut up throughout the kernel.

Regards,
Bjorn
