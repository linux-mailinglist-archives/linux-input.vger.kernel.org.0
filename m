Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1A0D11E50C
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 14:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfLMN4o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 08:56:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34719 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfLMN4n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 08:56:43 -0500
Received: by mail-lj1-f196.google.com with SMTP id m6so2671260ljc.1
        for <linux-input@vger.kernel.org>; Fri, 13 Dec 2019 05:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ng0J7VT6q7et93hoQowYvQqzLfb9VIPnBEUDJ7gqlTQ=;
        b=a7VtdNfHIVILhuTWgjDaH90Fod1yB199ZL5r5mn6i4THtWtQEmPH/80tBhAvFb2KbB
         yIdi/QHqtBtrv8HC1b3iZZ1tPyZjOfk/FQIjWMiX2h688sfN4AXvyKc5nzSFeTYvBSKE
         7JlvVL8AGXd7X4Lpz8QGLCSGmZKW9577YuwJvHYfKT9afQZu4Wx/L55yqoShjOmsAjTk
         4j/BN4Whchk2P92Zep2kex1nqoloN3cLNLkBhpQgfZFknQ3NmneYmojRpBhR+20laW4F
         P70/2ApsdcbiKLhVM13ta3Z0O1KKYVhkyhZ0fYXtmEgAu0629c6/T/AT4aHX82ooblbb
         VmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ng0J7VT6q7et93hoQowYvQqzLfb9VIPnBEUDJ7gqlTQ=;
        b=clYn+fiQ+O+Foc00iDg1al2LepPSVs+Rcj8iaePGfk2QBKxW8KPiHFXHKuHuEA62GE
         negwjZnT4ywBhOB4cWuqz+84pwgTOm73oLFJiGajxHehGvjadwHc4FCkqYm5GcSeG1Fo
         VNp+N0vn9qM70J9O1DzYnEkGRtRCmblrUPqx+VkB5vTDVHJNfxm7sNzZkTj8D35grp+R
         pFAAiL72MCgGEf276BapQjX7lXJv8usgLFBfl33P/2Qx7E5ROqmI94TqcFjl/2iq/KdV
         uh+lP2/mSjTWGCHXLWgxcRHPqW/6ihSxuZlIMwBqZK/IdkNjoXp5MtV3swvWWZDy1RGh
         Qofw==
X-Gm-Message-State: APjAAAVkQQobwXvbxYfKwBmmH6Ba80CxMpJ3pLSvr8qGerfJYVhom7Lm
        lR8H3ih7iYmoAnxfa/ime1Y3p0WF0brjCbxSI7moug==
X-Google-Smtp-Source: APXvYqy0vWEsCjDFZyfSN/Lrm144Do0DBoodpv0T4Wt1uLstCAlXzPsbmrt/BMig0xLpHmCvNRunXlxDBV860t28M7A=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr9521183ljm.233.1576245401607;
 Fri, 13 Dec 2019 05:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20191205002503.13088-1-masneyb@onstation.org> <20191205002503.13088-2-masneyb@onstation.org>
 <0101016eee224b50-8a5545e2-837f-41c2-9574-b385e111a6b3-000000@us-west-2.amazonses.com>
 <20191210115153.GA10298@onstation.org>
In-Reply-To: <20191210115153.GA10298@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 14:56:30 +0100
Message-ID: <CACRpkdY+yP6-MyFw1tFvVN_FjNfPBGYZxiK5rZiS5Yyp7eainw@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: qcom: add support for setting the duty cycle
To:     Brian Masney <masneyb@onstation.org>
Cc:     Taniya Das <tdas@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 10, 2019 at 12:52 PM Brian Masney <masneyb@onstation.org> wrote:
> On Tue, Dec 10, 2019 at 04:47:35AM +0000, Taniya Das wrote:
> > On 12/5/2019 5:54 AM, Brian Masney wrote:

> > > I'm not sure about the relationship of the m, n, and d values,
> > > especially how the 50% duty cycle is calculated by inverting the n
> > > value, so that's why I'm saving the duty cycle ratio for
> > > get_duty_cycle().
(...)
> > > +static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
> > > +{
> > > +   struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > > +   int ret, d_reg_val, mask;
> > > +
> > > +   mask = BIT(rcg->mnd_width - 1) - 1;
> > > +   d_reg_val = mask - (((mask - 17) * duty->num) / duty->den);
> > > +   ret = __clk_rcg2_configure_with_duty_cycle(rcg, rcg->freq_tbl,
> > > +                                              d_reg_val, duty->num,
> > > +                                              duty->den);
> >
> > The duty-cycle calculation is not accurate.
> > There is already a plan to submit the duty-cycle changes from my side.
>
> OK... I assume that the m and n values need to be changed as well. I
> couldn't find any docs online about the meaning of the m, n, and d
> values and how they relate to each other.

I have also at times struggled to understand this.

If someone could just in a very concise form describe how these
rcg[2] clock dividers work and how m,n,d work that'd be GREAT.
ASCII art etc would be a bonus :)

Like with a patch with a big comment in
drivers/clk/qcom/clk-rcg.h

As these tend to be quite regularly reused and incarnated in
ever new silicon a complete picture for developers would be
much appreciated.

Yours,
Linus Walleij
