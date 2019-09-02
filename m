Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9727A5AC6
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 17:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfIBPsn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 11:48:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43368 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfIBPsn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 11:48:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id u72so3457068pgb.10;
        Mon, 02 Sep 2019 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=00Z8SB/tWkNKKYJEkG1yfoy8qzemlSRtnt5gqe/oRpM=;
        b=Sly0qenuf0ST8bD/pEmAd/pbgw7ipM0RG12TcCSMNg2/t+GFXYpHZ/TAZc/hOEaVHk
         F0YJBf02/pQbkK3lU45bgZmwDJh6j9NpBrMeA6IGGslx53v8qbaPmIXE6l+khC+Z7Zwg
         7w8L7ojvgZkwWn//ikfV0KJYGFZcDRTVJPYbexymINR8WgfsrL1CDbyf+7NfDsoaGLyc
         LIOW6Q+jqhKa1D3a3nB1RV09N24VWePNeTVFDudEWIxRwls7rOpqbv3DdIduqFFgu2sT
         1OQtYS6wQ7psTRje8ulRKYt6tqsu9mIqisV3z6sKQAeF25Y9BTcofpgUVjmL0yHhdMzk
         RAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=00Z8SB/tWkNKKYJEkG1yfoy8qzemlSRtnt5gqe/oRpM=;
        b=a5cgQ9GRClh/hfJOoQ0qjzsKHjM7XGbBY0IVfzGnMfkTarSs+YzZ03yiOj7+AIG3VF
         rekugu3jLOTlCsEAEK2YPy/01w41deuv5Mm60j1GL+LcrRg7Ju5JozkGbf60saEKd6xL
         Z4+h8h25cW0uJdYoif3UsxYEB+AF8efBNQh3O2np+WzO3zjRho/wkQp+BWSE5bSfltu+
         D8F5AEO7TO6z+1rnfVyZu9yy78SacslECTBIqZzT/KvChzZ+vqguiIVceCElRAkgd+mA
         OTPDR+ERO5ATtiRItanUDuT95WkKwo6K5JbJ/7NkhjoYTL3eJKE0gKA3ahwlmxPSJIR5
         T0Uw==
X-Gm-Message-State: APjAAAX6q1UUVnHd3xtH6Rcjqg2nvy/BcdnGqufWIpRQIVJdjs9P3UpW
        JfLWewx30saMFL+5NhsVnQU=
X-Google-Smtp-Source: APXvYqws3eY8AZTSNJrnZTSqfEwyH6Yv/qV3203jN9YSP6d3VxjK2FNOwPTCnB2Tz4iAAnMMZO2gJQ==
X-Received: by 2002:a63:c009:: with SMTP id h9mr25680208pgg.166.1567439322213;
        Mon, 02 Sep 2019 08:48:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u17sm3797893pfm.153.2019.09.02.08.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 08:48:41 -0700 (PDT)
Date:   Mon, 2 Sep 2019 08:48:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Denis Carikli <denis@eukrea.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] Input: tsc2007 - use GPIO descriptor
Message-ID: <20190902154839.GJ187474@dtor-ws>
References: <20190823071021.5598-1-linus.walleij@linaro.org>
 <20190826220022.GA7663@dtor-ws>
 <CACRpkdbv8yVP==WDo-wBgotyvnPhApTCD2x7oamCHBQKuNp3RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbv8yVP==WDo-wBgotyvnPhApTCD2x7oamCHBQKuNp3RQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 27, 2019 at 09:42:46AM +0200, Linus Walleij wrote:
> On Tue, Aug 27, 2019 at 12:00 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > >  Optional properties:
> > >  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> > > -  The penirq pin goes to low when the panel is touched.
> > > +  The penirq pin goes to low when the panel is touched, so make sure to tag
> > > +  the GPIO line with GPIO_ACTIVE_LOW.
> >
> > I think this is too strong. I am sure that one can come up with a way to
> > connect the attention signal though polarity inverter and then one would
> > have to specify GPIO_ACTIVE_HIGH in the DT.
> 
> Yeah this is something that has been discussed recently as
> Harish is suggesting to add an actual inverter to the device
> tree model. As the description of reality in the device tree is
> incomplete, these flags, which should nominally be consumer
> flags and indicate the behavior of the consumer, becomes
> a panacea for solving shortcomings in the device tree model.
> 
> I am in favor of introducing explicit inverters in device tree,
> as it makes the descriptions more consistent: e.g. regulators
> are consumer oriented, they even model rails to make things
> very clear on where a voltage applies, whereas GPIO polarity
> is defined as "trial-and-error until whatever makes the system
> run" more or less.
> 
> > Can we say:
> >
> > The penirq pin goes to low when the panel is touched, so GPIO line
> > should normally be tagged with GPIO_ACTIVE_LOW.
> 
> Sure, this is not the place for hashing out DT design issues,
> can you fix when applying or should I send a new version?

I can fix it up on my side, once I hear from DY folks that they are OK
with existing DTS changes.

Thanks.

-- 
Dmitry
