Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA1D536354
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 15:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbiE0NbT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 09:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351875AbiE0NbS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 09:31:18 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0341B48B
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 06:31:15 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-300312ba5e2so47792307b3.0
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wVmL6VOt+bmFt5TwENkRIPY/11TIRFiDvjjaykp5D+c=;
        b=zuXhSBVu3/ujtCcuSYVqXoo1IoeJ/9znd6FeM4I9oomB/LSnF9NHbhRt2dCSqNew5B
         7FT4n8A4B1j1bBs2PN6FOK1RAB+8GGZMqBdoDdiBYh4VqIrGWoSg3qyiWMl46Qv1Qitd
         iVwqQKD/kPtnu9St4lzmgyN3vPiqRiybBnsYUEl4cnBNViCOzntRokTmtLJKgEuL9JOY
         yIu+QuF9AncPrLjYPwAByjnr4oIixoNxN8E4QqWr7Diwcc+FQW/HWk27UXX9T0vQOmAE
         disc2OUVxUsadZ7mls90VNf74cgJQalFADOeOeyTmNIRuFNbrbhqqD3r3pdNVQSCBbYr
         Brvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVmL6VOt+bmFt5TwENkRIPY/11TIRFiDvjjaykp5D+c=;
        b=tMgEEp3UwE4jptK1wgBP/QU7RDSzGwewkcXSKRdaNUukRtCJJL4u5gpeK+ahH4ynSA
         c4jH4+I2mw91n+5FIA5kDzO9de2SM2gS4G9hwdxj6cgjwKlwLWoNBk/23oUNA7x4fXCT
         bYETxdR6JvnkaHiqpyfCv2u1VM9lvU2mdw5ZIkghFuyc6KnlmLMF+gIFJ4oZGuslu0dU
         revVfwtfeCIPdQWbKsEqjYuk1bfISlLXp2FqrX+Yrz74A69YMf+LLiIMo/hNamAyhBgZ
         toA2RQqi428/YJZCCEdoJ3CavWz5XmC3qTNB/rneddU10c1he6ImShpdfR4lm7qepoaR
         14pg==
X-Gm-Message-State: AOAM532U3XT2i38ogud2He+hWZgAsLEsboY+Hvp+w2DXiwJonW0uWM0E
        VqhH/LwJdsMZEuOgCTMyQ/QE+YSX2fah3+Osk9fQueR8rO0=
X-Google-Smtp-Source: ABdhPJw1K+xFBwumsWMTu/KCPA0KtMnKOeSWZ1j91H9gFiqnqxD37M94+NPvsmv+rkTQHUPh074THc5X1iIe7jTd3Ms=
X-Received: by 2002:a81:7507:0:b0:304:c651:8a88 with SMTP id
 q7-20020a817507000000b00304c6518a88mr5627206ywc.448.1653658275106; Fri, 27
 May 2022 06:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
 <20220410120059.2583849-2-linus.walleij@linaro.org> <YpBjiw9kWZSLn85Y@google.com>
In-Reply-To: <YpBjiw9kWZSLn85Y@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 May 2022 15:31:04 +0200
Message-ID: <CACRpkdYv1+vBuax54e1vuVBrQRGU5ViqhPtLEfC5NMAQ_m_xPg@mail.gmail.com>
Subject: Re: [PATCH 2/5] Input: zinitix - Add dev variable in state
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 27, 2022 at 7:37 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Sun, Apr 10, 2022 at 02:00:56PM +0200, Linus Walleij wrote:
> > To avoid several steps of dereferencing the struct device from
> > the client, add a struct device *dev pointer to the state
> > container so we can easily get to the struct device. This makes
> > the code more compact and easier to read.
>
> Same concern as the previous patch...

No problem, I drop this too.

Yours,
Linus Walleij
