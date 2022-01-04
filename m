Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E283A4849A8
	for <lists+linux-input@lfdr.de>; Tue,  4 Jan 2022 22:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbiADVEx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jan 2022 16:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbiADVEx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jan 2022 16:04:53 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC17C061761
        for <linux-input@vger.kernel.org>; Tue,  4 Jan 2022 13:04:53 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id v22-20020a9d4e96000000b005799790cf0bso48719904otk.5
        for <linux-input@vger.kernel.org>; Tue, 04 Jan 2022 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCtePTanf/zW9lVfq/J1G105iUcs2zw4EeWuPDxMyOg=;
        b=SZR7F1/1uB7p6V+WD0+oJ3EQMwTYAYd2B1LlLdgSJPGsX33kqc58llm3enahv3FalU
         t5fahl+BMszCOIYXR4OcP7D2dFSfKtS5S+YHxGlvt8Xa/iKPreIlB9+sGLOeA6xShl9u
         JCft+yOXzE/xP/YYXpANG/OPXvALLTUGGuyKdmS23G16y3SkXu7NSfJiJ3wNOFjLuKiQ
         5sNHJzTFGZaGrtWXmw1epJboN8u+DF0+mZfvNIVPFHtg3wOQIWg8BV4LWW0XMwaSsZTi
         A7OegrgEEEOsPT/PEdwqnYla2jBPGXOzzAASsxHNN5aTnUmjG7elBZEaasscN/yMwgKo
         M/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCtePTanf/zW9lVfq/J1G105iUcs2zw4EeWuPDxMyOg=;
        b=iuUVyrlJyl+mLFNstDZGNOAgds3ytKFfmGfEM4OCkPlndLvP3+g/0pSgdoUGCGL4+I
         PyJGL56pKdmBgghIp72sUtJ2mFdZ4lXOuSJ5fRnI3v7giFB0a25rozcyHpCIodo1Uwfa
         h2fHpTIc0zmVfwbsDv/k4Rg3yQ+2jUGOsGxQFMAdSPv24g+54XyNOTG9TmOYPTNYY1Zc
         ZW556Q2Qpw2iZpaGU6JodmYMC+nPrvdIsbf9LguMG7F7ncEjuR7/hZGIWWqgs9tak29P
         sErKpyLrAuvt0W2+dggKwkU3LEJVmSq1NRF9jZYICjPWZmyPWqhba7mlu6rs6Yyj9a/x
         TvDQ==
X-Gm-Message-State: AOAM530l+Qw98nc5nTQJJLP+K/VMOSX1uPOm6MmFtKTIXvkV2XcoUy9m
        +lt6CYIfjIB2QQWTmXNRb1EJUW6yzTZeSPKcWWtz0cxn56U=
X-Google-Smtp-Source: ABdhPJwUMXIwz4r+UdDrcL9aS4b+27UrKQWj5x7N6066VYRnyXlK1ovNwa/Fnwpyy5CAQR+HcBXlgATmy0ZFTLTG2Ok=
X-Received: by 2002:a9d:463:: with SMTP id 90mr37113104otc.35.1641330292493;
 Tue, 04 Jan 2022 13:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jan 2022 22:04:40 +0100
Message-ID: <CACRpkdaumfXijp_QGU8hL9TTmFYBNaaBe+_fuc1hCJnA_CfWNw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add touch-keys support to the Zinitix touch driver
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nikita,

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> This series adds support for the touch-keys that can be present on some
> touchscreen configurations, adds the compatible for bt532 and fixes a
> small race condition bug in the driver probe function.

This appears unaddressed since October?
I see there are just some small nits in patch 5 & 6 to fix, then
it is finished.

Do you have time to pick it up for kernel v5.17 instead?
Make sure to collect all Reviewed-by on this series.

Yours,
Linus Walleij
