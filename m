Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71B7266366
	for <lists+linux-input@lfdr.de>; Fri, 11 Sep 2020 18:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgIKQPh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Sep 2020 12:15:37 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:44838 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgIKPb7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Sep 2020 11:31:59 -0400
Received: by mail-ej1-f67.google.com with SMTP id r7so14320810ejs.11;
        Fri, 11 Sep 2020 08:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7GFfCvow/YG2PC4PNBavqBdXR1kQF0CV+iI3Qu1eqX0=;
        b=I89XRvtihi1LZe6mAXmx21WHa2vE2/ZO8otgupGS2QXH8DTyKUcw+Q0kgwpwIueA4W
         pcWOiA80F+BpYg6Op52gn+b5EzFmret5z06CGKVQkZ+czlXSgMfId698fpaX/DyqB5kK
         w/Jk/Dlte5Nz/Q5rURzkkYHvcCxxoGfHC8L0HwgFXwRD8iKmucehEwWXFhXu7/+4XCcG
         wqe9A3FMJtKbGjVptyltt46FFgxIl9IV5lymh077QVuMMklXwRF4BwqndvylH4lIcBzY
         X2axWpnpYhweehyHT/5s104A/MHm2wKQE81jX1hrM16xWhxaXrF3hgwYLMre8k0cgmpk
         hKAw==
X-Gm-Message-State: AOAM531GX/W+DQYVRSyVwN6rbfiRluVgFVdBnqBh55Dd3qjAlknF73v3
        TxsVOmr0qC/VRSdHL+iPeB4=
X-Google-Smtp-Source: ABdhPJzDn5Wly6uwRoIOHH+dj9CVJvOVyEn3ZbrNf8ZH0nahm2X7W9H9Osv6jT+VeStW/xhQuu62Gg==
X-Received: by 2002:a17:906:1787:: with SMTP id t7mr2699547eje.173.1599838317355;
        Fri, 11 Sep 2020 08:31:57 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id y9sm1890741edo.37.2020.09.11.08.31.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 08:31:56 -0700 (PDT)
Date:   Fri, 11 Sep 2020 17:31:53 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] Input: ep93xx_keypad - Fix handling of
 platform_get_irq() error
Message-ID: <20200911153153.GA18022@kozik-lap>
References: <20200828145744.3636-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200828145744.3636-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 28, 2020 at 04:57:41PM +0200, Krzysztof Kozlowski wrote:
> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.
> 
> Fixes: 60214f058f44 ("Input: ep93xx_keypad - update driver to new core support")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. None
> ---
>  drivers/input/keyboard/ep93xx_keypad.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Hi Dmitry,

Any comments on the series?

Best regards,
Krzysztof

