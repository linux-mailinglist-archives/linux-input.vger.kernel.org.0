Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEEED6F30E6
	for <lists+linux-input@lfdr.de>; Mon,  1 May 2023 14:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjEAMcu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 08:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjEAMct (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 08:32:49 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5421B4
        for <linux-input@vger.kernel.org>; Mon,  1 May 2023 05:32:47 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-55a76ed088aso5056937b3.2
        for <linux-input@vger.kernel.org>; Mon, 01 May 2023 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682944366; x=1685536366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saLlI1ZIdIuVeBvItkdx6UO8jJPiYG/StXLOyKUam/c=;
        b=UtQJppbIaeWCJZCe5kzV5SxS+teZdro5jVVEsFZWePDKPiWqLNCvnQgLNycS8A5kqb
         qi82n20oDXLhuftGQ4MssEcuL8VNzrn9PGf0HM+nLrTO7Mm94Ego1P32nzjMH6WZKpqm
         cokZsywkNBnbZeKgRjrSGEBdfhKYVEo6fMv0O+Snw1Jb5KMvCWVcjdWDZuyvHzUtMTFS
         e1iBgG2ifCTmsAE8ue1r4AaKRJp67gOQvIKmGxGEN9JaHhFUEb740VXFisjZJY4oUQhr
         3fEDUyggMqK3E6BIPEW1z69OCVx2kUw2ZsdzkU4xOKSvkU0vrxx/R2ateWQ+LBjUVcfY
         AM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944366; x=1685536366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saLlI1ZIdIuVeBvItkdx6UO8jJPiYG/StXLOyKUam/c=;
        b=S5LPg+3dGjKZPka0HUl0e9yD6I8h4zXO2B8WPgop70W25wAcHAZGRXZKdQg7zEj77v
         jkujLnxzO/S7LuINbw5AhT652nnk0Aq9ElBBV5rX9WJeBVw588o5buRy5aHa4aumTrNU
         XVI9t7tvkdxq0WpXxshPektr6jnJTNcMs0jEH+/oyGcQLoIxb5MLLos0TPhvlmF4+B3h
         qYjU/X9je1K8PLvzG90cny4U9rFlVzaXgkJ3BwBerQtSiyt8EIph5ZxaUAiQ1LUgMTD1
         vepueTRmW3hiUxQn20YveRFvInILSZ6JYE5TLVQw40gYkFyUbEjhy5RkaXwEatcG0uYh
         8zow==
X-Gm-Message-State: AC+VfDyl3FNpNyMs7G5qn74eTwVdykoj+k45htH0azPgYfVV7EUB6xGl
        w2SgQl4f0PWc3YA9vpxjMu23v1TRliHnEC0kWD2pqg==
X-Google-Smtp-Source: ACHHUZ6LQTpwPVCXtPWDxlmBfW91jf3TvTjmIYbwnoqnGegBd2aXJK0pOhf7P3F43EveBNYhHX59vTH3zulYGcWljYw=
X-Received: by 2002:a81:a187:0:b0:55a:6080:9882 with SMTP id
 y129-20020a81a187000000b0055a60809882mr1947780ywg.25.1682944366146; Mon, 01
 May 2023 05:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230425115049.870003-1-javier.carrasco@wolfvision.net>
In-Reply-To: <20230425115049.870003-1-javier.carrasco@wolfvision.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 May 2023 14:32:34 +0200
Message-ID: <CACRpkdYWJdyLkgNaSJx+ZzoCjrLA2wNiRnirfHUqS04XGLqx=g@mail.gmail.com>
Subject: Re: [RFC v1 0/4] Input: support virtual objects on touchscreens
To:     Javier Carrasco <javier.carrasco@wolfvision.net>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stephen Boyd <sboyd@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Uwe Kleine-g <u.kleine-koenig@pengutronix.de>,
        Bastian Hecht <hechtb@gmail.com>,
        Michael Riesch <michael.riesch@wolfvision.net>
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

On Tue, Apr 25, 2023 at 1:51=E2=80=AFPM Javier Carrasco
<javier.carrasco@wolfvision.net> wrote:

> Some touchscreens are shipped with a physical layer on top of them where
> a number of buttons and a resized touchscreen surface might be available.

The APQ8060 DragonBoard even shipped with two different
stickers to be put over the touchscreen: one for Android and
another one for Windows Mobile.

True story!

Yours,
Linus Walleij
