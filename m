Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E54E255BF6
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 16:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgH1OHt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Aug 2020 10:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgH1OHq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Aug 2020 10:07:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CD4C061264
        for <linux-input@vger.kernel.org>; Fri, 28 Aug 2020 07:07:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t23so1460102ljc.3
        for <linux-input@vger.kernel.org>; Fri, 28 Aug 2020 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXw6jts2nsYSAhAF2pX/V5F5FIEIJGBdwNqcoUzNLi0=;
        b=bKzltRWz0IbvUHKtrIJh/h/7tq/4EAfisXj8cgUQ8RM52S9V2Uo/kdjK0Da6jwzPUn
         aGTjhk+C+VS6RtNFKe2Py1DbaJKDBg+w3ntY8w1cPZoQvaws69eE4wcahbfqg7c1WWNC
         E9XkAg8oJBlMNHyuuJW+h3EG1uF/GjeycEomTAmUgcL7VEZFFVqN2cJr02jQnLArUFKK
         J92VjrcirmzfT2LsrORFVRFkZWOGMLwA9tLJHriZoMmk9LUf3recjeSWZ6QTyGtgOSJc
         KqryynlnCuFVYrylXw++CWGiHlpnFICSb7q5xX3P1B3k5XObSKlLKSKSaz1ekI93SPat
         YlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXw6jts2nsYSAhAF2pX/V5F5FIEIJGBdwNqcoUzNLi0=;
        b=Sr23HwWpuygELi+scYtJiogqsbYNryOS/iIr5f21EL3vWMBJa9csSxKUxLYYf8tkbB
         rcg2OpOU6X8FiacKG+4X/SLY/X7ZBYbShd+6dI0yRT6mNk2lglk4kjlFgUUDi/tPJGMh
         q0AYaupg9ALGKEZGT3oN6zBLVM6yDIgPFlGdtNT0Dkapi0jRv3tYbQxLgek8J24LZIWT
         DrOK3/dJEU0yQtA9NGuNZCQ3BKjRhWjRK+Cu0uD/Ds2ydMHNipKPAdFtVP0r6XAmD1OX
         D2qNDKAJ8tpmArn1qEXuRI+Jl/1lOJGWSTZUG+wGxy71F0skWwVXuEtWy7tCmevLH3xL
         6hZg==
X-Gm-Message-State: AOAM531+uGBX6MGByYaD6YCNQxHVbcjK63BkICJ5FrUxxi4AmBqkBQ3V
        gF+PJaIcznngUJW6Ai1Dmmxhwu9bU8URIX38dlUeTw==
X-Google-Smtp-Source: ABdhPJxmfPfdAg/SmdRoxRZDXdikl7Bvgy1DgMT38TnEcNwFaKqtAHmRcVdjjWguMH4j6ynYk0f7GTMzB3He0xiJq2s=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr1010532ljb.283.1598623663298;
 Fri, 28 Aug 2020 07:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-12-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-12-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:07:32 +0200
Message-ID: <CACRpkdZaS-GSpDBLXnvhsEV867b99=nh2KPWSK6eORRnKWgoSw@mail.gmail.com>
Subject: Re: [PATCH 12/24] Input: cy8ctma140 - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 8:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
