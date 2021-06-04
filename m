Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8583539B3F0
	for <lists+linux-input@lfdr.de>; Fri,  4 Jun 2021 09:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhFDHeG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Jun 2021 03:34:06 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:33513 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhFDHeD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Jun 2021 03:34:03 -0400
Received: by mail-lf1-f47.google.com with SMTP id t7so5504336lff.0
        for <linux-input@vger.kernel.org>; Fri, 04 Jun 2021 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmvzwN2PhN4D6doozCLoTCSRtV8PNmRSUf70knyKygY=;
        b=VKgonetGhwkdh3p5GzyHz3fb2C2eHBZpW8vXddarJjps4MoO4NYl/ZaW2aGXwsKhl2
         RwHQG2OhGJl26h/UkO36x5csPdcUn3lzQXGWTfWm9To/J/9WLnADo3laZGOsrup0s9mo
         PLlIEaSb1N2gfIw73iu8mkBgdTmXK6LxRbSdLhHf06NhizoyCP9QK7+N4NXQ1RPBoBE1
         2bG4fK/zSKDmWehB9q67v9DPEtqpXa5lpqS0t0k2docp3/xjIHm0fZMDxgJduvvfv751
         HeM4q7rRAh2dyL3WZ2gb6fz/G34Q/36lSMzl1oMlRIyfnYWp7alGIQQ0VkELhive9AdR
         EHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmvzwN2PhN4D6doozCLoTCSRtV8PNmRSUf70knyKygY=;
        b=RGHSWKKM5Zt3OYgkvgQclsWb6OztQ4FCD4ovPXNYlARoPSzX2am+WmcvvctPUXunVb
         srXaAsg7f3+BSqUeulucQgvgdRT47L/WjmfPz6roPqFMfiTajr0NATBjBZrR/a9j6KuH
         3JjGtE9AKVyhMnmvod6S2IIxJFp62P9lIlbF3Z9I1yqVWcvfa3t9J4Gh2TuNmpxp24se
         J+onMzwuWJC3pNlXB3LCOgLRM71qucGQKjDXSy9HmCygSC82AnCLbVn2VlJZI2Pk43GA
         4hjAixbsA/A9qqcceCaM/CvFdUTlFEGRPFdJtfyXxPQv+I0D90YdYobl4nIqDMeZKK/w
         N3rQ==
X-Gm-Message-State: AOAM5305ttoHph7oFKTTu4s4wTg5KOTvqf11j/RUeTedXhBqb9WhRQiK
        8vAeK4gRvpuPXfVhiTebf2/5dmhKcmNrirEjUHoTEA==
X-Google-Smtp-Source: ABdhPJw/g7Ppk/QNRZ6RrxFDv9My3nGxs8YayvDdjsIPhq6PB228bvlEC8Xzphi5oB3P7V9LawXhGQiPjxxch6U+B+c=
X-Received: by 2002:ac2:4c8f:: with SMTP id d15mr1829213lfl.157.1622791876843;
 Fri, 04 Jun 2021 00:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com> <20210603043726.3793876-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20210603043726.3793876-2-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 09:31:05 +0200
Message-ID: <CACRpkdbyu9tYwwN=yhx_5RWxKngBy10U5rqD=VAd+YhoEWo-rA@mail.gmail.com>
Subject: Re: [PATCH 2/7] Input: cy8ctmg110_ts - do not hard code interrupt trigger
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 3, 2021 at 6:37 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Rely on the platform to set up interrupt polarity/type properly instead
> of hard-coding falling edge.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
