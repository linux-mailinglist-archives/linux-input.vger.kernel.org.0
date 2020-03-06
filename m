Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFAF617BD93
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 14:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgCFNER (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 08:04:17 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36004 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFNER (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 08:04:17 -0500
Received: by mail-ot1-f68.google.com with SMTP id j14so2333618otq.3;
        Fri, 06 Mar 2020 05:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JzaIUkVFuv9lgRBDj65Rp9bla52M7lQaJkCFR0Rkn9g=;
        b=oLZiMIfgnTWzWxig66om1AOGXmnlMmbTCaQeUNOJ56qYaXbgQPulhNpaHW0/A+SFsr
         6rATLI95kd0U06nZsp7ZolWSiL8ViBdrGzmqU97Za6lVc27NXM0DbzfoKSQd5G3Q5IJG
         i/m+TFW5XyomvnyAXPqs+bViVFUhrOZJ8/q50YxZzYOvDXi2FftruPAWYGauFMhmDleW
         urkYKXN9C6oQ9yED/EjS0Hq0/WgzwrAIo4g6uV3jdgQRMmqIE+LcA/g7bKjUpvrQOTl1
         hp0anOFOHOg0eZRBFNTueHs9P8GRPrQhaIzTCCl1IuLl35bCtPsAH3RU69O8wXpHUlPj
         76UQ==
X-Gm-Message-State: ANhLgQ2i1ZI8eBkRuvmPvvvtgxit9SHD8UN3gLitTL4oLPOy3t4NhdFg
        /p2V5QnG1aitQNYK7SMIO0YsVSz8FuO4jKJlWHI=
X-Google-Smtp-Source: ADFU+vtqli4FexOlC4pW3IiMfTl6lS7NnILzq0dOAQMcB1RM09RIUnawy1+ah+fUgYEeWIKgFWSXGlCFXhq90n5aPDo=
X-Received: by 2002:a05:6830:1e9c:: with SMTP id n28mr2275502otr.107.1583499856380;
 Fri, 06 Mar 2020 05:04:16 -0800 (PST)
MIME-Version: 1.0
References: <1583336650-25848-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
In-Reply-To: <1583336650-25848-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 14:04:05 +0100
Message-ID: <CAMuHMdUWQVhzk17FNsOpeMFgUNBdg-XYujDfSbnrwOu5gVxFcw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: iwg22d-sodimm: Enable touchscreen
To:     Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marian,

On Wed, Mar 4, 2020 at 4:44 PM Marian-Cristian Rotariu
<marian-cristian.rotariu.rb@bp.renesas.com> wrote:
> In one of the iWave-G22D development board variants, called Generic SODIMM
> Development Platform, we have an LCD with touchscreen. The resistive touch
> controller, STMPE811 is on the development board and is connected through
> the i2c5 of the RZ-G1E.
>
> Additionally, this controller should generate an interrupt to the CPU and
> it is connected through GPIO4,4 to the GIC.
>
> Touch was tested with one of our iW-RainboW-G22D-SODIMM RZ/G1E development
> platforms.
>
> More details on the iWave website:
> https://www.iwavesystems.com/rz-g1e-sodimm-development-kit.html
>
> Changes from v1:
>  -remove redundant GPIO code
>  -remove obsolete and unused properties
>  -sync property values with the comments & the bindings

Thanks for the update!

> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.7.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
