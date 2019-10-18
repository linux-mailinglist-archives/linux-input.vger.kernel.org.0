Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96EEEDCF6B
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 21:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506005AbfJRTjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 15:39:51 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39375 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505992AbfJRTju (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 15:39:50 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mrxjf-1hjTbV3OxZ-00o0kM; Fri, 18 Oct 2019 21:39:49 +0200
Received: by mail-qt1-f170.google.com with SMTP id n7so10752588qtb.6;
        Fri, 18 Oct 2019 12:39:48 -0700 (PDT)
X-Gm-Message-State: APjAAAUK5K9x/R6uirYIaH9GaEfAt5J9Eqfxp+mosm0Vgq/0cewGOobI
        OI3Kwv2eQPQYptIzcxgSX6a9M3ISTcgHqSf50/w=
X-Google-Smtp-Source: APXvYqymx9pRQIUe2GYLUGRMu9h+M26SuGVUoD8rv9IlkdyulST9oDUMU0vWJ1+HJSdIkbSMY8qPMr5o0NKJV3kBq/8=
X-Received: by 2002:ac8:6956:: with SMTP id n22mr11586436qtr.7.1571427587664;
 Fri, 18 Oct 2019 12:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-29-arnd@arndb.de>
 <20191018184815.GP35946@dtor-ws> <CAK8P3a27==9TeS-RWEvrpnxh+6McqRF-xeb8WPj9pHOn+0zbOQ@mail.gmail.com>
In-Reply-To: <CAK8P3a27==9TeS-RWEvrpnxh+6McqRF-xeb8WPj9pHOn+0zbOQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 18 Oct 2019 21:39:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0AP8q9Hk1DB+E=xFGV5RqXnkjkcZRobgU1NRDFMH00AA@mail.gmail.com>
Message-ID: <CAK8P3a0AP8q9Hk1DB+E=xFGV5RqXnkjkcZRobgU1NRDFMH00AA@mail.gmail.com>
Subject: Fwd: [PATCH 29/46] Input: touchscreen: use wrapper for pxa2xx ac97 registers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Wz3Fi9UiXU9+UcMz0qKaLkLgty2yDv0Y3PQQgWLNrn9Y0xImMiK
 8L0RKi2nfv0XDU8VyxieYNZU7GyBRf9ouDlH62Wb5aSTJWSqbjoxo0CptSDUTC64ILdccab
 GxpbMyRuU3i/5AqNsTPh4uELAHpoMLsI3c6hMx5G+vRIh14GQGSFrg3+GRDs2EQQcfGlZ1x
 5y+RXd1QC4jb43v0QEVUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xZiNwD2NB1w=:XGz2CoblvP1GYfGg0A/JUU
 haYn97PtA1OTO6hIncdQAktykgfCHdR6mx+Z7DgZmrAfLWe7FAVlKdVwDDBjs+LMnnIGKpNYc
 8YuZDw/jXVuKg7NzOp1Up4aUao56+QBrTcR7UW8sY+VY74S0ftML4ZOCUYy8807+8SOvUYaJI
 TuXwN5v6ooA2M7SCzdpJleBEMVFbbcqaHMtedUUExwb3aT4RvCwkQ3qhmCCKguQGSzONvGC/H
 AVONIxsZ8yzi7IReSryTz42lRhM4T5usyCs81nXQxfc/HPgmXCRzrC/M9JB2eaq0ReaOn9bTY
 6GLUAouZtUVVLhhXIiez38gGNDqre7WX9NQwWxskI04l4PigDZP524n3iPQMTvfmF85790Hwl
 H1WDqxAlaTiMBNtIV4Wzq6Imam1RkEPaWejiHE1eqClWlYeTSUAUaVWITHEFQrGGkL32aTORf
 RfBRjfooNc/AqJp+EVYH8bm+d+qBCFl329IqZW7Dl5+A6BmjDI0hRVxclano1Usfnx3tiStup
 uLOnOo5mCb/wSeQ/ISGGZsZVxZDBFMa8z2Q/wXhk9Zgk9xNK+ZB3sWK3LtyrKEtidD85CnDSr
 bMNK0m73po/EewKIeGe5HfSRbJ/6UtEqKAuCAEAjIESX4ZTbV04uGkJhdK8KWZOp95Phu4YoK
 T54DlleleyAbZxqLgUE3bn8Weskbq1psXTbVFb6lhyrvZehlg94rq6kwZDS955Mj95Fr1hiVz
 oH5yy4e3Xff+EZ/1+EKFyo8ZLkitzxixXkdQtZWEMoA9KkzCWnUHoly8xg9HPEJ/H7lQkh9N8
 uonOo7wqHKMAptb/qAqmRJ4D1uHn2irzgN3T2Le965h9doCbtjWADjuMaEGNjhm6fZUdbZefb
 aUyGOZgshiYm3XHjbESA==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 8:48 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Oct 18, 2019 at 05:41:44PM +0200, Arnd Bergmann wrote:
> > To avoid a dependency on the pxa platform header files with
> > hardcoded registers, change the driver to call a wrapper
> > in the pxa2xx-ac97-lib that encapsulates all the other
> > ac97 stuff.
>
> Not supper happy about adding module dependencies. Can we include
> mach/regs-ac97.h from include/sound/pxa2xx-lib.h and use static inlines?
> Someone needs to include mach/regs-ac97.h in the end...
>
> Or there is something later in the series that needs it?

One of the goals of the series is to completely remove all mach/*.h headers
and place them somewhere else, ideally inaccessible to device drivers.

In case of mach/regs-ac97.h, the later patch "ASoC: pxa: ac97: use normal
MMIO accessors" passes the physical register base address as a platform
device resource that gets ioremapped in the ac97 driver, rather than
hardcoding the virtual address in a global header.

I agree that the exported function is still ugly, but I hope it's enough of
an improvement over the previous state that we can do it anyway.

If you have any better ideas though, I can give that a try, too.
One possibility would be a higher-level interface exported on top
of 'struct snd_ac97', but I could not figure out how to do this.

     Arnd
