Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282B634E5FA
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhC3LB5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbhC3LBs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:01:48 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B10C061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:01:48 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id v26so15956201iox.11
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ftmX8N/dYE1WuURYX8szZckJy5Ue0HGMSjMBt34aOTQ=;
        b=iARHqRWKl/7qmpNh2Z3stV/VBND9Pl3iwcXEKEwDpbiEHF2bp1ljxYfMmulqgOYg/B
         /BL9c35Y0VB2/HdAeTIWNQLFDkRrLctiMtt6xWMjSdpZUZdykWSB/rOrWvigWILbsdJd
         u58etywYmJ3m+dvoQLO6eJhJ5cmx1rEBD29Nuzt8ByjhiALQnBzx+xsMGeXwpLlGjOxC
         z2MsT6tfnsSwba8cVyOnv+O9WQA/1hMK4EDs8EX4E42L8ZC/hxsqQ6OEvxYG/OqyCJ7a
         yB/UpfoCiClyll8sr0txZgwUbc6abt2sSTrhUfmL9UvJYI3120TVv/BQo7sn4EtlmmPF
         l8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ftmX8N/dYE1WuURYX8szZckJy5Ue0HGMSjMBt34aOTQ=;
        b=ExlSLlfWWddOPQPGEWk+cy3vrcy0dZbsq9zLybPqUMe+NkO15qqkF7EGRZqCeFsSOB
         V8W7CDX/McjLspovmbPh27D6Uu+JFbH5SdMiFbDH7SeYvQgpGjdP50AbqAcWUvf0hB/m
         v4CrRfU9SrrLuetdckXAgcrXMutkZPgX0Ys3LvjKB+827QAhjNPCTXce1bdY2VgUXjIn
         MKKDFx4IJhU7eqGWkVyTvl/ZkHaW7thJNbBQqp/Bi0K+Jkvs0JkbxVvyzY7+3PkdmL+5
         R+RTN415tFcOxQQ7tKXPsbZoTdGvDayfSISVVg2d5QVHAvGmKirPzkxFGIX3h/EhPDau
         +r4A==
X-Gm-Message-State: AOAM530QB6eMh4p64+k+zPQ6RTCcv4ecmg+QxUfnZr1YKKtxE2Ip/Wv2
        9wysZdllmrn2pAXDdTdL9plk4mAEh6x1lHnEyjhKdA==
X-Google-Smtp-Source: ABdhPJz2KxljFTx8UkOgLpFvV0cyDLITfloVrIAS0JgmctmbvfD9PGcsrRsquFhDszrMwFA06uZlN3vLOaSVpOlx/TE=
X-Received: by 2002:a6b:b447:: with SMTP id d68mr23540164iof.87.1617102107961;
 Tue, 30 Mar 2021 04:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085424.2244653-1-linus.walleij@linaro.org> <20210330085424.2244653-8-linus.walleij@linaro.org>
In-Reply-To: <20210330085424.2244653-8-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 30 Mar 2021 13:01:37 +0200
Message-ID: <CABxcv=nCbX6S2r6bXvLRAz_uU7piVjjK26x6-Gma+o8ejR4yGQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] Input: cyttsp - Flag the device properly
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 30, 2021 at 10:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This device is certainly a very simple touchscreen so
> we set INPUT_MT_DIRECT.
>
> The sibling driver for CY8CTMA140 also sets
> INPUT_MT_DROP_UNUSED and experimenting with this driver
> it clearly does not hurt: the touchscreen is working just
> fine so let's set it for this one as well.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
