Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7FF2176A7
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 20:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgGGS06 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 14:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728246AbgGGS06 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jul 2020 14:26:58 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F444C061755;
        Tue,  7 Jul 2020 11:26:58 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id w17so2617741ply.11;
        Tue, 07 Jul 2020 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qvQ9BWiorgAMI59gx7e2L9Kar4VUwCoPb3oUywbJHwA=;
        b=Cdl5hKZTByffG8WuN6tekngHahUumklqO8yyUjeyMcdCBhBH2Qp1rcDismVcXbVLR/
         Mk1luMjdd31WhHG716Jy1lTOTs8MWdzPPmgCH4LYUr3bOR0KgXgTHFUUixgVPhM+b1OK
         VeUFh9xgoFDPUkNndq3tHTmTnfm0q8eyvGocTgCetxrWAW48wGZgS2pnCi6c79NMt6Cd
         qXpwLmtcerGizQSiqkjVTQzho6RH3CNjXEqvyoZThZXHTEnVSZrVtDInWTry6HnFRUSL
         fVm2mvDFnz4kJlLsgnlDFMohjHrY9i9NSBhPBV0IUnIhZM8qZs6VOk36YCmyDgv0VFVF
         z76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qvQ9BWiorgAMI59gx7e2L9Kar4VUwCoPb3oUywbJHwA=;
        b=iEE8TDiERHODivc+iVNE8cA0kswSEpmJhZkkrlNRSs9vLgzQDoaWmn65x3cX3XRd7J
         qlH73GTDoEzEy0S3us3TTd5GC9RC42xeC+RNtk3dKx2YdEbQNTlu11ySL61fwH2MBdL3
         tpY22RwYrKkVLPISxqgpkg6K0LOPbhlb+JqK+9qI6AzmDDbfqJ5xUESkBD/g0defLuUt
         kiVw0k0UFk19aneWd/hgJw52KrOQ5RaKsNzHXcW3TBsw/M6UUijKeW1snt6nHS5WfhPA
         VcyQFgeEMUaMpszxGgeCtFWMSjtz7sSs6uNs96wP/u5QoXz1tDtEQysIKqzE+j3MUCUH
         T5og==
X-Gm-Message-State: AOAM531SZD1UwLiHs5UM2ZZ1Rbo0BqCx3P+FgbN2eHiBcT4JhjkbrpS2
        DRhRqlSL64MF+YOYTfGFvJU=
X-Google-Smtp-Source: ABdhPJx2Xl7Qi1XE1pQddLYTBMwkm97nQVhC2vVlLRHiG1EAW8UiZzMDfZT9OqEAKL6SEU5kIePbAw==
X-Received: by 2002:a17:90a:2e18:: with SMTP id q24mr5325457pjd.25.1594146417651;
        Tue, 07 Jul 2020 11:26:57 -0700 (PDT)
Received: from dtor-ws ([100.99.132.186])
        by smtp.gmail.com with ESMTPSA id c139sm8637148pfb.65.2020.07.07.11.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:26:56 -0700 (PDT)
Date:   Tue, 7 Jul 2020 11:26:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH][next] Input: Use fallthrough pseudo-keyword
Message-ID: <20200707182654.GF3273837@dtor-ws>
References: <20200707180857.GA30600@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707180857.GA30600@embeddedor>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 07, 2020 at 01:08:57PM -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thank you.

-- 
Dmitry
