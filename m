Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0ED5D513
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 19:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfGBRNk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 13:13:40 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41870 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfGBRNk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 13:13:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id m7so702164pls.8;
        Tue, 02 Jul 2019 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMmY/EmBDHRwzGOg6QKWgI4bnbMuLFbtkiBtFkYdt0g=;
        b=BptMFKNJAX+benhstGMez9zdl8mS2nykF4E5vC1Ha2dII7WT/F+yQAzjn3PJ3FZ52T
         9RiwURv25KYuUh0Z59AX6JHoyIgTKYNberdr/l+vOQZDIXQNNlOQNCleW90fJ4H5KxDj
         aeZa/OZ/qnog9Oz1/n/gtoItr5Qm/GfI2nhCqy/8Lmq+lcRZWIICHjFg7DiKsVmpxzGm
         Rb2vsPwSFQybIjGgPyc8JfaOvx3F52kw0q+XD+y4fnA7cbpJN+GZbWIH47pBz/FdkasO
         CFea1MJCNem6xn3CcbSG+xnT98207tebxox+M8nTI+4QEyqfR8Ojj8BonKFPk5HykYWe
         v6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMmY/EmBDHRwzGOg6QKWgI4bnbMuLFbtkiBtFkYdt0g=;
        b=Jt/FJz7PotUQoQ5GvlmE6VN1aWMYeY+wa1Q0aeXL4RIsYeXj5lRBmx+Qj00BHJlGdd
         Hk73q3DkJ0S0MB8IUgFxv/Uoqo9q1UxLeJTt4WG3LF2Jg/ckhEV1kMfu9+j9A7Xriyvd
         0zInAvScBYv5el17kIM/eLASNDCGTrHBck+KtKK0lq+aXLJqhsJKpCYrKlm2f0gvDuAI
         6qgeHncbi7r2uYBjIRIU9V5TQd37ob+PBFDUjMG8JlFIgEBUytTV1bb1nBGH0Hbirf9y
         UcIuSzq2NGimYH8/7hAsvDl8k1e3OwJ58UWDdPVT0kGUc28QuB4T3AoHz4hRDzEGfDN8
         iAIg==
X-Gm-Message-State: APjAAAU2N0mWhxRQS+Hg1ayGb7ljs0snTh0/VdtL62KZDQvti/2ADxiK
        KQl7hEBhg7dfVHEpBOt7xgvd1PpjOOWhv+b4XlM=
X-Google-Smtp-Source: APXvYqwbztzyWoGiTMQMDfeT5/bfyf/ibZNPyr02y4RMWlBoY/ksPjxdsC3NfKSJXiOUiizWWVW6kqYH97ArSMcRR2M=
X-Received: by 2002:a17:902:934a:: with SMTP id g10mr37207521plp.18.1562087619463;
 Tue, 02 Jul 2019 10:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
In-Reply-To: <20190702003740.75970-1-luzmaximilian@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Jul 2019 20:13:27 +0300
Message-ID: <CAHp75Ve-f-piRxwG2u2djWGt2fUKkvZSDJ+XkjGKLmMZeLEYsw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Support for buttons on newer MS Surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 2, 2019 at 3:38 AM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> This series adds suport for power and volume buttons on 5th and 6th
> generation Microsoft Surface devices. Specifically, it adds support for
> the power-button on the Surface Laptop 1 and Laptop 2, as well as
> support for power- and (on-device) volume-buttons on the Surface Pro 5
> (2017), Pro 6, and Book 2.
>
> These devices use the same MSHW0040 device as on the Surface Pro 4,
> however, whereas the Pro 4 uses an ACPI notify handler, the newer
> devices use GPIO interrupts to signal these events.
>
> The first patch of this series ensures that the surfacepro3_button
> driver, used for MSHW0040 on the Pro 4, does not probe for the newer
> devices. The second patch adapts soc_button_array to implement the
> actual button support.
>
> I think the changes to soc_button_array in the second patch warrant a
> thorough review. I've tried to make things a bit more generic to be able
> to integrate arbitrary ACPI GPIO power-/volume-button devices more
> easily, I'm not sure if there may be reasons against this.
>
> These patches have also been tested on various Surface devices via the
> github.com/jakeday/linux-surface patchset.
>

> Changes since v1:
>   - [PATCH 1/2] platform: Fix device check for surfacepro3_button
>     No changes.
>
>   - [PATCH 2/2] input: soc_button_array for newer surface devices
>     Ensure the patch compiles without CONFIG_ACPI.

I re-pushed to my queue, though if you are going to send a new
version, check my repository for the titles of the patches (you need
to use correct templates for the subsystems).

>
> Maximilian Luz (2):
>   platform: Fix device check for surfacepro3_button
>   input: soc_button_array for newer surface devices
>
>  drivers/input/misc/soc_button_array.c     | 145 ++++++++++++++++++++--
>  drivers/platform/x86/surfacepro3_button.c |  38 ++++++
>  2 files changed, 171 insertions(+), 12 deletions(-)
>
> --
> 2.22.0
>


-- 
With Best Regards,
Andy Shevchenko
