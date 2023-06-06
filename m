Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDD3724CAA
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 21:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239358AbjFFTNw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 15:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239518AbjFFTNf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 15:13:35 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D5710FA
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 12:12:47 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-653bed78635so3038842b3a.0
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686078767; x=1688670767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UJYBcDT3tnGKj6BsJtuvb52P6xz1+HZVD1MEKMkcSw=;
        b=O1yTcVgYMu2nJ7CN4BzaCWoMB0exVxVhlveUI9V+r7D0EvpT0gU/IMJoeT64OC5OUX
         MnnP9FmMEozO0g7g9sKuJzYdESmyUc5DRtZ6gqFs5g8YlgcciXeeZmpMXs3Q/GiMdRVm
         dRnX7Wy2fcvCJAB4J5wpcFU3rlSTTSSewNUMBswEbxLrnNy2DSoK1i62euQ0pWUi3wst
         Uk8OeumAMRIVDGtP6o8BgUUFANELYomi1Rezz0kHc7po2rtkDgCVJTiktUXSocZm/Vkh
         qJe5rar70ESLN90L/KtUIPZkKV0H9wt9daPQrR4We4uE61kdHn/lZw+q5PSKyhWaN67Y
         QU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078767; x=1688670767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UJYBcDT3tnGKj6BsJtuvb52P6xz1+HZVD1MEKMkcSw=;
        b=OoDDYYIgMnr1S1/UNyK04g8eeMLAtaQWJ/N5ao/WWnjrrWn7kugzonePQbjmPYMQdU
         vDATFqne0UySO4e7JO/ltylj97zY++xyOzZMZvlH/U6ZeDIcUzr3F7UfCbC/UqbF4JPa
         uAztNS+QRX+PSnqfzKemi8ShSLJSQdxSDaubhwA9jUuPBCOB59qh3vj8Mug/OztJwMbJ
         npae5daDJR3zfwMCTM+6On+ciC47g+3HxXq/IuuUUULBqwwnfsy4sv9QT8wIfBjHkBMD
         anf7AIFJDZTyQ4BbkU+DDUWL7vAd68Z8hhj3uQErH12T5F7n1mAckmcTor3Be9WSeePS
         8Zyg==
X-Gm-Message-State: AC+VfDxtbqCIXoJ0tQmFow5E5ES7C+omEgnvIgJrTVYj69LSE1rRDlao
        UErnj/a4opFJaWdvT6r30zs=
X-Google-Smtp-Source: ACHHUZ4uZY9THvaXTTL7FUaJmbSA2SdWyzTc86lZfLpo0gqG8RP1b3VKvNIfo96uriz9z7Ej7WWNgA==
X-Received: by 2002:a05:6a20:26b0:b0:104:a053:12dd with SMTP id h48-20020a056a2026b000b00104a05312ddmr510114pze.10.1686078767296;
        Tue, 06 Jun 2023 12:12:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id k7-20020aa790c7000000b00659af3079d3sm4231671pfk.16.2023.06.06.12.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:12:46 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:12:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] Input: tps65219-pwrbutton - Convert to .remove_new()
Message-ID: <ZH+FLCkoHZQckbni@google.com>
References: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 05, 2023 at 06:14:57PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning).
> 
> To improve here there is a quest to make the remove callback return void.
> In the first step of this quest all drivers are converted to .remove_new()
> which already returns void. Eventually after all drivers are converted,
> .remove_new() is renamed to .remove().
> 
> Before this driver might have returned an error. In this case emit a
> warning that tells more about the problem than the generic warning by
> the core, and instead of making the remove callback return zero
> unconditionally, convert to .remove_new() which is equivalent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thank you.

-- 
Dmitry
