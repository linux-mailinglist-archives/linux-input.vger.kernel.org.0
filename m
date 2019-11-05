Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50358EF8A0
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 10:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730475AbfKEJZv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 04:25:51 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35380 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730666AbfKEJZv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 04:25:51 -0500
Received: by mail-lj1-f194.google.com with SMTP id r7so12264028ljg.2
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 01:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k8LC5hoQOSSC3SYIdMqveplyFLeeSr89WqnCil+AS+E=;
        b=w76q11BCIBe59Mmf6DY+f8/pscc+d0jjzVhnZMY2wavCZw1hfWfQa59gIGMkWkfX6V
         7Ju/8lwlgbw0zEfv7/Ja2CpBuZFIOq0svpp2ozaca1Iz6wL78qT8mYqfF/9Qau+dyPm5
         Vigtyj0ZMX5wYJTnBycUg8mYx598+Q5CpionMfqiLFIK5zlxtsNvBAjutiG048/snHzl
         oyHV2lK33ABHUBfJERNid6lTsuPdYvt0Tslq2d9GWtEVKuEQxe9g4VQ1Y7HLya8XXx0N
         JI4Ybxidp502FZeLUgAQ9FUI/wAfDbfYXg2/YPGTV1DwHrJfKklLod01tnE2WbpHQm9D
         MpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k8LC5hoQOSSC3SYIdMqveplyFLeeSr89WqnCil+AS+E=;
        b=ENFs5TjjtIhJSB8+ZLaOOCxYW0NK3ruW8S+1izKwGhhEoPWz6aWviRww+D+e4ycW+b
         HEiMy5tbV6xer4b2J4mIET20jdsgnKrxoeMZDqO3nlIuncMFPPoGG0y06j4hsOpG2atb
         GPIOU4xbg0+6X8gM0EgPbALUhXxd7HlY6SRhxeDc5uj4LHbFzU3ubqg7w9SPwvgp1hnK
         SGSDIcp2RAO9uVODA5wPkXOi3FQrfOoLRXC2MfePjiJW8JzNj80wTnDhrJBTh6w/Mk66
         llI1Y+rFWpHRDHpMQt3GPUgPvxL4LDMH4gKp7nQMrnNWm3dU5XjTFYDV28ZELICf6mzN
         lKPA==
X-Gm-Message-State: APjAAAVW1Ytr6WTWPRIJSo1Y/tOEvzTrH8ow4ETDzoBEpKxmP9q1+i/e
        B0MBbcWCZQMKoaJpwY7erWWPxps9S7Q5wI308OdK+w==
X-Google-Smtp-Source: APXvYqzOSHsg62Fj4vlheyb1uz8LbSqHiWIcvvFBmqGNwblm2et9MzcOhrpktjoIYMoo2tnFaHHN7BmRLDAaoZ8KOCU=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr22351639ljd.183.1572945947937;
 Tue, 05 Nov 2019 01:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-25-arnd@arndb.de>
In-Reply-To: <20191018154201.1276638-25-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 10:25:36 +0100
Message-ID: <CACRpkdbsJn6axZC2_gHq8JCo2bE2Ra=+cavGeR6qpsASnEW9yQ@mail.gmail.com>
Subject: Re: [PATCH 25/46] ARM: pxa: mainstone-wm97xx: use gpio lookup table
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 5:42 PM Arnd Bergmann <arnd@arndb.de> wrote:

> This driver hardcodes gpio numbers without a header file.
> Use lookup tables instead.
>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
