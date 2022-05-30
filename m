Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349B55378D1
	for <lists+linux-input@lfdr.de>; Mon, 30 May 2022 12:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbiE3JvH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 May 2022 05:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233183AbiE3JvG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 May 2022 05:51:06 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BAE6E8E9
        for <linux-input@vger.kernel.org>; Mon, 30 May 2022 02:51:05 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id e184so8671534ybf.8
        for <linux-input@vger.kernel.org>; Mon, 30 May 2022 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+KeSo/fWvnc6u5MrUIaMKgF1g8SLQMm/WZBiY1MQVk=;
        b=epYrj8tuBlD7nPtwAqBw+avCcUvBwb0hoS9nKLq01KJTJdymZP7J8J1Hk3sMy1C3EM
         iblzDU/vGir36G7NOK+k7bkFlGDFwhYxopyELG2mdHjU1/KNUETtBt26SZt5VyxVdUXz
         a9SLKnz+f1EHW8n32gVL6bgPFikyXeDwv9y5nL1iAlBZil8sSb/uwMLexvmyvX0DAgHq
         FK1rzq6SWmSHPhF4rxFZd7eBjj/9OOXZHZFgMMXJWq7FsbTG1j+yteOb+BWYX/UPcXnf
         9cU5gUqpM3KP3k0Bn8kI7JxI4Yfi+9iJsm9fhRsWuizUHXbfIF/W90Q/E/O2pvBNLr61
         +N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+KeSo/fWvnc6u5MrUIaMKgF1g8SLQMm/WZBiY1MQVk=;
        b=A+p7DMU0WpQ55opKRtLY3dhoEO/fk+np+3zUMYnJteM7TUCMhmnhQywqtMMg8AuHJs
         7fSzW64B+A2kzM4GEP/Iku6LAJ/LqdJouO1bb3GiVl2si0zKt1A9xMGH/vFK5SDUmhSP
         k2dVHnwpDZSjgTzXObG4F1F5VvPuq9IP8ZcxtD/ZJ2z6zCppEj1wvt/8GV+bq5RdaUHb
         4juAwdnKGHW2n/H9kWLScrCzNUaAM7u5eZ7M7rmUCSyMBbtDHt2BDONpVB5qL6lQmOLM
         1ab+enPXHgVBtXAPY24XcXUqGcrgGvTUF07Pjj1PLtpFC12ingj2MwaUNStXEvo+bpz1
         8wng==
X-Gm-Message-State: AOAM532/qVL7FLqCzWnr1w8waFY/+dkm+GdFT186PXZu/BE2WwVUUOqs
        3/37Hc4hWg0nvDz5ksOQrL1ZAneVJogJ+geJEipalA==
X-Google-Smtp-Source: ABdhPJyi6lD5Sm8rQ9ac88KO/Xc8R6A9CcuTRPnROgWjKKyrcs5431nT919e9BUPNVD9slLLBdsrYwpsbgG4th6Ojdo=
X-Received: by 2002:a05:6902:704:b0:64d:f270:22b0 with SMTP id
 k4-20020a056902070400b0064df27022b0mr51748986ybt.626.1653904264637; Mon, 30
 May 2022 02:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220529132638.13420-1-danilokrummrich@dk-develop.de> <20220529132638.13420-2-danilokrummrich@dk-develop.de>
In-Reply-To: <20220529132638.13420-2-danilokrummrich@dk-develop.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 May 2022 11:50:53 +0200
Message-ID: <CACRpkdZ6ZaRRVzctb72oSbBL_Mwug5cZEKR7y_jbJ5N47psyFw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 2/2] dt-bindings: ps2-gpio: document bus signals
 open drain
To:     Danilo Krummrich <danilokrummrich@dk-develop.de>
Cc:     krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Sun, May 29, 2022 at 3:26 PM Danilo Krummrich
<danilokrummrich@dk-develop.de> wrote:

> The PS/2 bus defines data and clock line to be open drain, this should
> be reflected in the gpio flags set in the binding.
>
> Especially, this is important since the clock line sometimes is driven
> by the host while being used as interrupt source.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
