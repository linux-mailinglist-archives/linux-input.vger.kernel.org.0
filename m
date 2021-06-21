Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4FA3AE2C6
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 07:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhFUFc0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 01:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhFUFcZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 01:32:25 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3560EC061574;
        Sun, 20 Jun 2021 22:30:11 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t19-20020a17090ae513b029016f66a73701so4516041pjy.3;
        Sun, 20 Jun 2021 22:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4IlYTzqTiHSSyCrVD+PHTHP/vSzXrM8Iuj5rsEYS1ag=;
        b=Pbv+96vIF+02I2wwcvgORNfYiULcsseOROoTrlSkAdKQ8/0Jt3oHyCsTpSYEpixQa9
         0QcfW+xMj20lELFCZw3O2rZS61pC1kdLQl0qeDJp/c/mw0IKd4G6fmq0LMWvXKOT6g0q
         8bNbSxDCaQPn9FC4iYdH88nTPZyCMlmeA+pQ019Dm41oF6WiYiM3aR+qIYFQjwFIwSbu
         cG/ueNacxVotmLx/0LLZUEP24oAMu6qAq/V8Zj5IEiXkCPlapYJlpGprSHshJtBNz7fH
         dEJJqOaV+PYUmEEYIESe0gUDDDxg5hynZnKc1vnGDiiJX5pYvGd9U8V1yme0RS6atH1L
         IbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4IlYTzqTiHSSyCrVD+PHTHP/vSzXrM8Iuj5rsEYS1ag=;
        b=jEqZ72o3ZtKHdkyXBulqyvXwNJKgo00JOZErCp+ubLdJNt6hcVoobURrVeWSQPfh6p
         BvXgaB4hgKK1qm2nLXs/1GnJveoJgE6OR1d01pmyO5dYlRev9RpJ/4kZa9Tg48fns+CP
         5NhzLkp+MT/qlaB7EvLRpEsYdwLLNdSH/aNKV79GTP9j6pN2wXzEUe/fp331Nsl0ddRS
         gfRyvUaKy65F9NH0C78qeilXVHn1v9iyUDJ+WIc7vtqWRBHOm966UTZbXRgyk1qbWsJj
         zeHHpfw+BE6ylLbLTBxYD4xrdv/2LGxcY2+041vSyGgpx4agSBtxC1fwD3z4fCCrqbY7
         vVqA==
X-Gm-Message-State: AOAM531AmkpLH/F9uuQmuOTUgnAGp8l3aVUHTydGaz5MD/I1/eY3Zd5k
        QgT2raKf1uGDtJsNnv+mGGU=
X-Google-Smtp-Source: ABdhPJwxJnLSM4mz1fCQWv4Mof+GiaalZ0RUmJTvO4iQIhAj/uMqCpXrb8enkuozJHLC0dCp8MiF2g==
X-Received: by 2002:a17:90a:901:: with SMTP id n1mr35920253pjn.44.1624253410705;
        Sun, 20 Jun 2021 22:30:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:df5a:b40e:40c9:a3e7])
        by smtp.gmail.com with ESMTPSA id l6sm1210484pgh.34.2021.06.20.22.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 22:30:09 -0700 (PDT)
Date:   Sun, 20 Jun 2021 22:30:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sergey Larin <cerg2010cerg2010@mail.ru>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: stmpe-keypad - add STMPE1801 support
Message-ID: <YNAj30vl2yGxRX4e@google.com>
References: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sergey,

On Fri, Jun 18, 2021 at 05:51:49PM +0300, Sergey Larin wrote:
> @@ -176,7 +232,9 @@ static irqreturn_t stmpe_keypad_irq(int irq, void *dev)
>  		u8 data = fifo[i];
>  		int row = (data & STMPE_KPC_DATA_ROW) >> 3;
>  		int col = data & STMPE_KPC_DATA_COL;
> -		int code = MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);
> +		int code = variant->read_inverted ?
> +			  MATRIX_SCAN_CODE(col, row, STMPE_KEYPAD_ROW_SHIFT)
> +			: MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);

Do we really need to do this swap vs. simply arranging the keymap
differently for 1801?

Thanks.

-- 
Dmitry
