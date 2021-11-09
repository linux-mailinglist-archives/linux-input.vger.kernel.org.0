Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5F344A5DB
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 05:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242769AbhKIEpo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 23:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242764AbhKIEpn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 23:45:43 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5635AC061767
        for <linux-input@vger.kernel.org>; Mon,  8 Nov 2021 20:42:58 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so16905613otj.5
        for <linux-input@vger.kernel.org>; Mon, 08 Nov 2021 20:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRWrAVz0LbsjGfzT/KErKvm82LLvk3rt/5LNrrCj4jM=;
        b=k8LtbYvz/V8FJOqGJxyALA7GqYWynBUH520RA+hNxHBem4RnCwwK6YCLwweF0LCcnH
         4BIex3m870z6ZhvdQnLcfHM7XNK68wTrqQkDaTqysUGZqQq2GWtUzGIntFC2a2jLa4hj
         qsmMY3FoF+8JlwfacNNgHtKDw9ErBwNJxsbnhkH+zFnAe3FCjqFAK4pgSItnBCDNGhXt
         w9UqcIlc1ZDEaabVgGPH6WWDDWIvEgUK/ehJIAymx8qY+fcusnU75Ti+wb0t2GdyxWXq
         qg4rjaWAQJQtI2uyDbFLveQEiUt+ezSToGZE9+ncNwo5PBflEnagyIswz/JWyfInqaZ6
         dZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRWrAVz0LbsjGfzT/KErKvm82LLvk3rt/5LNrrCj4jM=;
        b=JAyXmKyQgaCHlP/Pd4svNnNjZzuVemyfD+LK0qIpazcnwbFM+BlBUL/Bosb3jHuz6L
         QyL9zjj3EVhPDt7T8DpSTEMc9butuZeEbAVYNca1FZUo1Kls/3F9NAfN5RVA1G5HPihk
         Z2hJ2LoEdBWDH/JR1p4tAT0bBJIYoXISQPzx4K393yxF5R+9XUh77PRkY94VHneiX6rv
         nJ3gVgfKU6TupJGFaIhW+Ze7xJCJGmU+SH3kw7aJlFBt/j/LtXl354OQ4nhJLFXSSt19
         vy83t9GHT2JmmUu8Kcvtf3YnqbdC1WSUt1IlEI6rAuyEAE5Cz3uQOsyfuu0muYoouY9/
         FtZA==
X-Gm-Message-State: AOAM530LvmbbxJZGJZO2T+hLNCjC/tGi1ROByzmQK+TzdDP6gxoKY31B
        5Ws50Q/I9vOlS3TyNeHtaGjEZjuv/25m/h28n1JA7jQ23RY=
X-Google-Smtp-Source: ABdhPJxiBqLFXtpx4U2A/SmFkodEEd+6sULFRqg+EnNMAnE2WeB72WVAAQ/aF3fE1KT6+Y/1vp13qdcNom199WfnBLk=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr3615949otk.179.1636432977687;
 Mon, 08 Nov 2021 20:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-7-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-7-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:42:46 +0100
Message-ID: <CACRpkdbffWNHZZvP+cCU12umvt6T7cshAgxuDzu1OFanMVUFDQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] input: touchscreen: zinitix: Add touchkey support
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

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> Zinitix touch controllers can use some of the sense lines for virtual
> keys (like those found on many phones). Add support for those keys.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
