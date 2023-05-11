Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02AC46FFB5E
	for <lists+linux-input@lfdr.de>; Thu, 11 May 2023 22:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbjEKUjc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 May 2023 16:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238961AbjEKUjb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 May 2023 16:39:31 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFEBF0
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 13:39:29 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so43459621276.0
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683837569; x=1686429569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPotC0zFlPNtcMObMVmELxdnXPz39b6sZUmm6zOgyxo=;
        b=gGTCWTJTF5hldA4oKl8BORGib6HJaSuYNLFY2ONmtdsNKbOSopuMG8M+l+yFh9N3a0
         A23VtpOVw2EFp5m0eYMST2x/vT+MOHclw0C0vDR/X4Okix9qcJN2+r2owTmUOASosySM
         OUx+p8iN63VzhCYmN0EWGKLZu0FAsbAikwSZb/asPXNFo0/kIBK53mrHeSfocTx1aMk7
         Y1w+AjeWA45YIaGe8182bexPCh6/8NRs/lUuY45dLn4xekj/codxsMNP0Smp/JHBVeLd
         J/PIxF/Wb3ZkvQ1T/msXef7B3EUz60TQqNhODltTj94D4We2+Mt+9xS6WU8+J/kVhTmm
         pCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683837569; x=1686429569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPotC0zFlPNtcMObMVmELxdnXPz39b6sZUmm6zOgyxo=;
        b=emYRqCeJyn0/ehUZH/CcCBmSv6DzXj8mkolwHrVCk+AcNIhFC/Yw0iBLoYTYcUUnRU
         AcHq12vY7fm8//hpASCq8FpwiGzhnMgOID7BeOEpMe7ZS0oBg/Ro9b7LM1Vxe/coT6tx
         JrBQRDdNuLiZ8ik7Hdyl4AZQ34fgmKdJhsKjPltRJLn/2sRjlidkN+tyBplcjTod1N0L
         fLm0+uSYKaW4wQ/+zw2H0aQpUPBIp8BHGO1i1W4Q7NLEI7N5QioKBFoklfeiRQpWdWj7
         vycoOLdvaWXA2Z1MYyWq5zg1GjobVrH4rbWHOLuzEGJSwtJbt+ouQYAKI6q9LCD17D1f
         MbdA==
X-Gm-Message-State: AC+VfDxfFKzVa+JdAMNhb/4RzG6pCKlefVkwHQYilzPvpmQwu1EqIJSD
        HiX4pY2nTtyGhmjKNt1O1bIay7uSDEW11QrKFiuHIg==
X-Google-Smtp-Source: ACHHUZ6J8AXhNIs4LdLg2W8Ya7OpMAQJWI9ySklLxzKVsUcvMYkrM4av+Ro/kBeI7UZP6hLfkSA5V0YMPYlkU8dk/1U=
X-Received: by 2002:a81:920b:0:b0:55d:820f:11e7 with SMTP id
 j11-20020a81920b000000b0055d820f11e7mr21059000ywg.2.1683837568848; Thu, 11
 May 2023 13:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
 <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org> <CAMRc=MdsBiV3AvzSPtCuR58w0N9z7o+hUrBDtXUC4a++pECb8w@mail.gmail.com>
In-Reply-To: <CAMRc=MdsBiV3AvzSPtCuR58w0N9z7o+hUrBDtXUC4a++pECb8w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 May 2023 22:39:17 +0200
Message-ID: <CACRpkdaJrB1f13LB4aHSWys63448a4NQZORgwdk8z=C8qe-BDA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: Convert STMPE GPIO to YAML schema
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 11, 2023 at 4:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Applied, thanks!

That works ... but patch 2/2 depends on this one. (uses $ref).
You'd have to give Lee an immutable branch that he can pull
before applying patch 2/2 so he has the dependency, or let him
apply both.

Yours,
Linus Walleij
