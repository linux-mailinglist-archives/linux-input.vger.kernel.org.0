Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7302248E7D9
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 10:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237425AbiANJvm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 04:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiANJvm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 04:51:42 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D77C061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 01:51:42 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id i17so2303846pfk.11
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 01:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ysgOIMLFm9/wdxG1WZrFppzGrq/rNzk9Sz1dF/VX8Zg=;
        b=jhca76/HF9VStbVqQPiEkxUAb1CGhhBO61CeZXd6/En6ggqj2B0KY2xpKtzWdlLaLo
         gU6zAc9aifO17oKvHQkRUlxHHujYa4lK6nPHatbGKnH0ef5o5PNSzdZEA6RFoHiA+nlC
         0K2kamUHnAz4ABVJpZQxoHEVvNbydt+iN6JkCaaLS/Vqc3S7lOv0xmmdhePg14pciV7O
         29EAkj02MnlvfW+KZ9Yueh1juDLFWkioEl3+i6zPf357Juh5M5SiPpBEbqGt7qmi0Zo7
         qQaWwqp+98bAhYAiIJtw4pIxcalamVw/fgR7PQPDwozxET6DQbOp84k7fAoy1PJc2Mc6
         abuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ysgOIMLFm9/wdxG1WZrFppzGrq/rNzk9Sz1dF/VX8Zg=;
        b=01g/AYxlu5qfbPD7IC26MiUK0AJWrvSvd/Na3qbh6jUDzKO6tiEHet15Z3GxMGhuoh
         uzOSH1FjOgEkcvlKlNOV8Nr6CDNUbe13qsbjGLMfW0aTxv7tS/8j3OT259Lr/YHj2alP
         +lYGSRkzTrVSpKWjx72j2Hxyqxv/hWPvcgMswML6H39Cit+zbCT13BQ+WpD4Ri57MuL/
         5oeUkmFilIJLvr9WNPNw2yi+8TIeqGZ7sGa5ZBgApUdVPDO3rjeep7vqnAdU6xbW3wey
         F0Sky4bJsu+pQF3ci3VBDq5Lf3uZV+NQmHJrhUP8YRv65UMXVN8/1IVe/2izOptxXr+/
         nk8Q==
X-Gm-Message-State: AOAM5330i2LQmEBXEx5uhgjGAxJVFowiiAQfXnqGkVeiwtFLyWW/SQs7
        5L/TUWiZlzyiWwK88iTahSx/BYma/FkBFYI5bydUxfTBuDI=
X-Google-Smtp-Source: ABdhPJyjesBgfdl+0lL1gHGDe1NpB328vYyr5h9V/3NoXq+OWa9x8K9fwvoVR1js5yQxEcG/Fze8lNCw8tUb1lZjS+I=
X-Received: by 2002:aa7:9ecc:0:b0:4c0:aac7:59ad with SMTP id
 r12-20020aa79ecc000000b004c0aac759admr8068529pfq.79.1642153901517; Fri, 14
 Jan 2022 01:51:41 -0800 (PST)
MIME-Version: 1.0
References: <1637085699-1914-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1637085699-1914-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 14 Jan 2022 11:03:30 +0100
Message-ID: <CAMZdPi_aF0MgVJmZ36r6=n7xbyWcyGCOGBD6cZHbDeVZU5rufQ@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics-rmi4 - Add I2C wakeup support
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, 16 Nov 2021 at 18:50, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> This adds wakeup capability to the I2C bus, and prevents regulator
> shutdown when activated.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

I Submitted a few changes for rmi4, still in new state. Should I
resend, is there anyone else I can include for review?

Thanks,
Loic
