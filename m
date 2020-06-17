Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C711FC6FF
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 09:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgFQHRF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 03:17:05 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40227 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQHRF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 03:17:05 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N6bsG-1ipZ8D2Pi2-017zvT; Wed, 17 Jun 2020 09:17:03 +0200
Received: by mail-qt1-f175.google.com with SMTP id w90so751645qtd.8;
        Wed, 17 Jun 2020 00:17:03 -0700 (PDT)
X-Gm-Message-State: AOAM53130BrU9USZtErF23TQobrdR1KS1IhlnIL2ygjbrYj8neALDC/z
        A8uQPIsed7+gr7aCQT266pufBp2IQtBJfWmU1F8=
X-Google-Smtp-Source: ABdhPJyWa8LewoQBzabNarDH0ZTp0ECXYU14r5yxZh7G4mXnu9ldr8IzKJjlSDz5qUf/PhHXTGzsDygZ0gCOlJviwqY=
X-Received: by 2002:ac8:7417:: with SMTP id p23mr25192754qtq.204.1592378222298;
 Wed, 17 Jun 2020 00:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200617065539.25805-1-geert+renesas@glider.be> <20200617065539.25805-2-geert+renesas@glider.be>
In-Reply-To: <20200617065539.25805-2-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 17 Jun 2020 09:16:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05scGaz6ATu1-QkbxOsgCW8_OAGSZ0v9GRt6P3Xs5Qxg@mail.gmail.com>
Message-ID: <CAK8P3a05scGaz6ATu1-QkbxOsgCW8_OAGSZ0v9GRt6P3Xs5Qxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] sh: Remove SH5-based Cayman platform
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gRl57bWkffm+CaqkIeMVZp0WQx49c8rLT46PvPSGZmBlzJXrdK0
 Ql081LnA1FimtLSZ7iI+IgfvATE6DVlS1YZaXhhzuZUflS1mWfWQXj6fNGlnGcY5sfDTp/v
 ambn7weAvywSWwV/BsSfkgqTLCk3IBDwsrKLeKNFSUiAm4ANfNr69QVn9+Z03hol3Zt0caW
 XcLLoYCCTxgn8w6qbPklA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PTJ70fZYDtw=:u/cDzZH6Dq+XqbOv1U7OFG
 ensXK6wwhVrmtTWQbpZYAZ4a/SXOjDJlfhkVY1P9hkn7Qtrkx/9wUQAeMVTY//8qZ1gKqiaxt
 0avfe85TDnH3/qMJT9IMc+FFI3WguBQbWKhWeKd4h00Prdu4YQWVui5XVjMmW0WY7//cW7bi/
 hqEps/m3x6Uca1y9WupW1LN9F50gqXcPD120Cc1xQ6v4iIg/RqFvta9CwTACFt03Cn2gkpmZf
 +/DaGHhp1KMeR1h/JSGcydJgOa3cvBwaq6iIyFo7mrWtkJVvlY0bXZve1+38mIiM0aCxQWYag
 TX3JfX1tRIYwxt1qCcceZgUu50HS6sJSII+phbtcqcLRqp5G1MvJUhtuQ+eQ0fB9kyvjhXhzM
 l2WQowm2F+gqjMSScMMQmmnAzGTr5XrXuMTtWbYpl9UGHgr/8LaJF3HDhgLqJyZdp55lQd3O8
 XmpD4XUshfI18DT3caqI+KExvdxrG8hLzXaGjq/TlkDMnHcQBHXMcPucCb8LXC67Omw9NMWwT
 yL0LKjIe+/tEhrRmxJxQr8ztD7YC21R0rLvTOY71OYWoim63lnPbkSND50zZkql9GrZxCq213
 d/JkL+eNYaa+nnNAQ2l2AJPoedDf4+9wa7EOFsf6klFqtoOu0EZB9nglBnwUgzizXDj6nH/4/
 a2g05XG7jpGP4koO2rN3vzTPpkRUqki/KPqMXCTMKzcMTPbYsCLc6ZDEZ6ZobmBfT6WsGexv/
 fceY+R3CYQgxv7Hu5DzFsuixTBM3AVXOLNzzi6zAJyQOozZ9A5sk/Ntt/Sv9xCOfk/kIQMCbV
 oEhWa2j/0hCq1GtWokwQ3E7CXn5wB5ZcVQePrCJPDDw+FVd1+g=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 17, 2020 at 8:55 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Since the removal of core support for SH5, Cayman support can no longer
> be selected.
>
> Fixes: 37744feebc086908 ("sh: remove sh5 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Good catch!

I thought I had recursively checked for all unused Kconfig symbols,
but I somehow missed this.

Acked-by: Arnd Bergmann <arnd@arndb.de>
