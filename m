Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEA040EAD3
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 21:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhIPTbs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 15:31:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:54640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232339AbhIPTbr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 15:31:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA59A610E9;
        Thu, 16 Sep 2021 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631820626;
        bh=9qRDdP6gfHQc9hhGvzgphNmJhjP4BYaLxJ8+rvQ48Do=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uYjB8O3mGxxihk4B4upmCralEF5o6Aoz9riIrmdtdO8Ciu6UJQUPaoda0fGm5XXvF
         8J6liGirTA0NHuA729Qkcn2PHbFREpQuRi2xsArseqmIhTQ45yYkgZ7eQQMFHGP4Vz
         z/+K8cx09aX/EqngLRQJwt/0+WbLQiYgS4hFW4RWi+ZcYYI6m0taqoJ6Y/wIE/mUrT
         lHtn3agVbAjeJahDgCzKck7rMcREPeh4l0AbXIyprKusSltWiIz6c7+27zbBsh79qG
         B8wi0Lk5g2PWP91osENruUUM7PHq8yjWVwmnTNjhLsHKnomArUPrbUeQCqhu1OMpED
         eORkXY4KvoYQA==
Received: by mail-pj1-f45.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so8311095pjr.1;
        Thu, 16 Sep 2021 12:30:26 -0700 (PDT)
X-Gm-Message-State: AOAM533EQzIqpO5BSX1XV7MoNAfS/CIjywmD8ACVHcjRVInRLEEIzQuW
        iWD5krjL+dmsE45XOBBZ0u3jbPqcfikuGNPH8SE=
X-Google-Smtp-Source: ABdhPJz9aQpTWcQ7/SiKiJtQrXmzD46+b88wZ/HHYHJ3KKzj4pO51H7Ki1wGQBosVOgPTh5jjsbJPw0Sax5iMLwba7E=
X-Received: by 2002:a17:90b:4c52:: with SMTP id np18mr16157304pjb.157.1631820626338;
 Thu, 16 Sep 2021 12:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153056.13674-1-caihuoqing@baidu.com>
In-Reply-To: <20210916153056.13674-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 16 Sep 2021 21:30:14 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc9FtV6Pe55mk-HBS77vYo=rWauPOF_LJw3RuTyKC+XyQ@mail.gmail.com>
Message-ID: <CAJKOXPc9FtV6Pe55mk-HBS77vYo=rWauPOF_LJw3RuTyKC+XyQ@mail.gmail.com>
Subject: Re: [PATCH] Input: ad7879 - Make use of the helper function dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 16 Sept 2021 at 17:47, Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/input/touchscreen/ad7879.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)


Please do not send patches one by one but group them in a series.

The patches you sent were already sent before:
https://lore.kernel.org/lkml/20200827185829.30096-1-krzk@kernel.org/

If such conversion is still applicable (although I have doubts -
preferred is to remove dev_err entirely), then I can rebase my older
series.

Best regards,
Krzysztof
