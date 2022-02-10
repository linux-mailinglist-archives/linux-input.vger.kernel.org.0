Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57FD4B19CF
	for <lists+linux-input@lfdr.de>; Fri, 11 Feb 2022 00:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345895AbiBJXun (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Feb 2022 18:50:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345893AbiBJXun (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Feb 2022 18:50:43 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EAC5F7B
        for <linux-input@vger.kernel.org>; Thu, 10 Feb 2022 15:50:41 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id bt13so20221696ybb.2
        for <linux-input@vger.kernel.org>; Thu, 10 Feb 2022 15:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hjqjyiq+YanJM9r+MSYUsXMNcE5U+j3JeGuDxm9l+cg=;
        b=w6ygwCST3sWTGzR/MzLI+iT1H1xADJpjilEAOb5rqJsuAHmA55nuGfnJtgodvMRgwA
         YEiQpRvq3ILJlaYM4eMM5+hmKjCPh9hKt9hpxt40nnjSVRx9vOFRL3F+/w7Pg237flYr
         ffAHqxzfXPXO6kMy+ZE2JR4C3Gb3+c0Jfahrk0qukARaQkGBL/HdUOU23Q73s3RQPpPz
         AcxdSlWV1qhbyD21BpiVaFdn2m8fvviGUuaeeE0Kl4lVjztribFwuRWG+nfylAkEyxQl
         ZvmieBVTv6ovduFStnIHmtdB62zGmeH6af9lXrIsBu51iNAmiyO+APtUpJJhroWBXUyR
         7VLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hjqjyiq+YanJM9r+MSYUsXMNcE5U+j3JeGuDxm9l+cg=;
        b=pLrAGqD4ESKog6IIu7p3GuQpts6VBDWv6VIn+LgbIeNLywubZrEoCYg00DzQFaECir
         lkTTvK24JnsKnfbeN2uW9ClTDw4jfGO0vOrhLcfnxA5kAJTWhJZMbBuT8QjBnZq7Uz6B
         ldEPVrlCQpSMZ/XixBCQGQqBE0RDyjU/LCRWLkkrOrI3E4k2qK+KMcU2L4kX0IHHan65
         5eXnkJ1nQJWI6AXuT31TU3Yj1kXz7eHcfhavrw6xyhxLxA+CsGe0LsPXvhB6ScmpOS7d
         tpORyx+xQF0KvlDgQzAn9TkfLAgsY9RlnpEKKzFAcA986eaLl28Vc8XoR+hP0qkwtQ6V
         q1sw==
X-Gm-Message-State: AOAM531C4vZUIz7pmgdAhYe4z+DuHg3lo2tqSCK4wxli4//2qeqgPeSR
        gfNIfSUan1tyHM50Zs5KGdnd1uL1U2cpOzFUlrSXrg==
X-Google-Smtp-Source: ABdhPJx908m+swlqxGjab8+arRYZp1wBGa+IaZNrNQ0lnHOGZTX417Fqb41hwAaTjIXE6AhkR+Fsi76lUGckqp4+0zw=
X-Received: by 2002:a25:5143:: with SMTP id f64mr9885978ybb.520.1644537040823;
 Thu, 10 Feb 2022 15:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20220210155835.154421-1-markuss.broks@gmail.com> <20220210155835.154421-2-markuss.broks@gmail.com>
In-Reply-To: <20220210155835.154421-2-markuss.broks@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 00:50:29 +0100
Message-ID: <CACRpkdZsQyDN+k5r-TmVH5JrJ5EbANTtQ2WGX-WTO+t9usJegw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input/touchscreen: bindings for Imagis
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Alistair Francis <alistair@alistair23.me>,
        Hao Fang <fanghao11@huawei.com>,
        Colin Ian King <colin.king@canonical.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Jeff LaBundy <jeff@labundy.com>,
        Joe Hung <joe_hung@ilitek.com>,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
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

On Thu, Feb 10, 2022 at 4:59 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> This patch adds device-tree bindings for the Imagis
> IST3038C touch screen IC.
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>

Looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
