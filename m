Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A927896F6
	for <lists+linux-input@lfdr.de>; Sat, 26 Aug 2023 15:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjHZNnU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 09:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbjHZNnS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 09:43:18 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45598E5
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 06:43:16 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so1787023276.2
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 06:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693057395; x=1693662195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQjPQncEhFfHNzBdVkIuccPrrLI6I2i5ji4GfF/HXGA=;
        b=QvvEjqaW5NGoyt/76vLwvsGtmjlx8KRWvOgu7djTaLs6HVjP2bQ+y3O3rXiBpHB4ND
         dufr+C03tyf8LoHVBkNhQ1cVnJ3cJkmbNZVbZphZAXpMe7nxFVleet9nv3WWH4jM+zzo
         cBvZOg4a8FaVSXj+xNrzs9sQV9lWpcDi8jpFHVhJa2e+/iMfVB42m7f6TmEuD43fqtP4
         fjSG47UagO4++sROhcVl+7zAainIDKnkmhT9LG0L76XU6ueySYYWbDfhn01/Lqa5sJpj
         vyhK9TN90NcJ9+BeW7sNg9EDFuTxqSA/rXKG0IFwKhFj8o0d8BCAIG7srFElkpy3YCeD
         4Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693057395; x=1693662195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQjPQncEhFfHNzBdVkIuccPrrLI6I2i5ji4GfF/HXGA=;
        b=cK4nHHvnUTu178WB/XZHVAjfozBqVfY9GRjklXEQHpuqxUuqypTzbivS8WLq1qZPPX
         KbInNXjQcelTjR1wYPfv13Uwa6yeQF2XWjDlmApNw5Ot+4Boty1kVqq9KWuHPHu8cDc7
         Pvv7Sg/9TiqPKTd/r010kfwBJ0iyuN3R2m3G3aygi+yJZJcVYr9jsMyurLY2YbK9VxiN
         bAuG6J5rejzkasv5DTp8uP7MfKxkqx9gPaUNoxMdAG6vB0dijwkLtvifPYC4UAATn4Kf
         t/IB37D27fk30yMXx2x+soMEdxoEyPe41YOgUQYSu6iR3hx5HiCRROHMXwyoXsIQA3Ou
         MmcA==
X-Gm-Message-State: AOJu0YxovifdoEBAStYd9ND6W3JycdabpF/IcpPDmNB4t9mzJ6gHzd1X
        MzV7NUoZrlpJy2riH0KOuPgTTmK1ANbWFdmO9nnyuQ==
X-Google-Smtp-Source: AGHT+IHcDC3t4yiX2xuvB5FhDZS40/AzZ3y3R7pq8UQJuwx3jDiV0nPfvPkBvp/zXSlwDRB6pfbVs/gMDuNNbBcLPK4=
X-Received: by 2002:a25:dfd4:0:b0:d05:fa02:5bf5 with SMTP id
 w203-20020a25dfd4000000b00d05fa025bf5mr23538354ybg.48.1693057395493; Sat, 26
 Aug 2023 06:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-17-dmitry.baryshkov@linaro.org> <2dea943a-7a9e-4963-8ae5-6b126c750f80@linaro.org>
In-Reply-To: <2dea943a-7a9e-4963-8ae5-6b126c750f80@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 26 Aug 2023 16:43:04 +0300
Message-ID: <CAA8EJpoB6JYrFPZ7PMrVYvuwxgu6SH1zuPWG3q8Xy1J2YcCPcA@mail.gmail.com>
Subject: Re: [PATCH v3 16/32] ARM: dts: qcom: mdm9615: split PMIC to separate
 dtsi files
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 26 Aug 2023 at 15:08, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 22.08.2023 02:13, Dmitry Baryshkov wrote:
> > The PMIC is not a part of the SoC, so move PMIC to a separate file and
> > include it from the board files.
> >
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
> > +                     pmic {
> Are you leaving an empty subnode here?

No. It contains 'interrupts' property (which is specific to the SoC).

-- 
With best wishes
Dmitry
