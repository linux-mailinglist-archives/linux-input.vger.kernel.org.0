Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEB4515E49
	for <lists+linux-input@lfdr.de>; Sat, 30 Apr 2022 16:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiD3Oqk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Apr 2022 10:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiD3Oqj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Apr 2022 10:46:39 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85B161295;
        Sat, 30 Apr 2022 07:43:16 -0700 (PDT)
Received: from mail-ot1-f42.google.com ([209.85.210.42]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mn2eN-1oAYcv3eXX-00kApA; Sat, 30 Apr 2022 16:43:15 +0200
Received: by mail-ot1-f42.google.com with SMTP id w8-20020a9d5388000000b006060c4a9ee3so483894otg.10;
        Sat, 30 Apr 2022 07:43:13 -0700 (PDT)
X-Gm-Message-State: AOAM530lJLjGIGkDDyrzz26RBeTaJulD941ict7DOulu0ByeoygDj/K8
        6EElQtNwsRwKvdAYHK7cp/6ch1znfnysExWofiY=
X-Google-Smtp-Source: ABdhPJyu1oLM1IRKTqR+eQdQ1rsYTJoLMnuBV/FFpB8y5vKEh5sII8e/hMlA25PDcp1w4A+thLzVKyWiU6hDO089+bw=
X-Received: by 2002:a0d:d804:0:b0:2f4:e47d:1c2c with SMTP id
 a4-20020a0dd804000000b002f4e47d1c2cmr4143200ywe.320.1651328616903; Sat, 30
 Apr 2022 07:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net> <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net> <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net> <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net> <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net> <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net> <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
 <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net> <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 30 Apr 2022 16:23:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
Message-ID: <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        IDE-ML <linux-ide@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-rtc@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:H6IJBEz+ZpomKcFiPidyhkUxEF5w0DLXHe/vMZwISX/BHUEDMJn
 8j/HagrzkYpHjm2t/x9VBIXKuZQV3AqFInnFiSwWiMPGzFWgqdFaN5rcXKOnBegblTTz6EE
 uMjlCJwhQjwp4SwKefBkyCGNKMB/lV4MYEcHOR/J4MeULTPINTxBzZPO8P1uDY4R9JHxRtP
 0MMFl3XheI0bnuRT/Sk3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VPedLqT9np0=:7zewjiKp3tbI7dQZ8xe6nI
 U8UyWjOB5sNHgwM5+P1UxSMkme5dnGMow4JYAXQQ+TyLo6IlRzottshuhG0lTTHDzwK9hQrlY
 WYvK6HHh957URL/wUs3GqBxThWlKzULBdPhuatwg4rNa6ER5kWaDoomIGdUoaPtFyRGQlv/TI
 1THH6UeYG//B659nk9K8vn932sLO3QESSnVOErCi1lAtUnazuP71bmCtdQ9NFdeps5CgcKWd3
 1snKB2ECaTsCBZ4myNVW/ycvuSPkDjdAS+0HiSyY6BsCWQcWR3KQXJkVI53uYv8iZvCeYHYWk
 LAoLR8GYSoqGu0Ogm6H3riBYXyT6TWPbLw3n8s9bF0eA1UeKPSMhmcNhAeP5cHaYDPebkOuMF
 iAoQ4UQqc5wSQRxeOEbTatJd+YoZzPf1eRftohhpaGfZswgOUEkty3hzYs7Dy2YzMErRkARB0
 2t/42VQiWjkml54rDgbucXTDT2nqxnASsJfyCVnBC4r8MYeqQACR8cJpHNXkPEa9rj8iYwsP8
 azvt6us6rZIC6gpX2nXLnNRBi4FqMELPeKL0pY7lskwIZKw6UnbHe5uOUOeKuUkwNsuxJNodk
 m+0P6Io3MXrOI3z/mHHUgs52ZL/DSK+5dnEj0ajN29iX2nYVMlV5rsNwhO+YEDK0xm0hl451K
 QG2G8hAuzwVzXeUY4LHg5uUFifmMYEhKR49z3K60I6J0brkvufGKlMgjl3pfD3/H65u1slhxb
 xkRJqjsZLimrMAQQM5VL0URHZgEoVMI6lTiza95jjdhehR2zvCmXW7h88TViDEodkWXvCu2PE
 mtOr5S65VuWBVzrJV26tfgq81fvr+wRRe+GnTvbKD3PrbnwkmQ=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 30, 2022 at 3:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Apr 30, 2022 at 2:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/30/22 01:04, Arnd Bergmann wrote:
> > > and concluded that it must have done this for a long time. In my own qemu
> > > instance, I see a crash from iWMMXt, but that works fine on your machine.
> > > OTOH, your failed instances all look like they either time out or
> > > failed to find a
> > > rootfs. I tried passing an MMC device as root, and that works here.
> > >
> >
> > Booting from mmc works for me as well. Booting from pcmcia worked before,
> > so I assume that there must be some regression.
>
> Ok, got it, and managed to reproduce the hang now. My "ARM: pxa/sa1100: move
> I/O space to PCI_IOBASE" patch managed to get it to the point of detecting
> the pcmcia device instead of crashing, so I assumed it was enough when it
> clearly was not. Before that patch, it still works, afterwards it hangs with
> "pata_pcmcia: probe of 0.0 failed with error -12" as mentioned above. I'll
> have another look.

Got it: as the PCMCIA bus on this machine is the only thing with an I/O space,
I assigned it port number range 0-0x1000, with an io_offset of 0, but this
was apparently unexpected and triggered this sanity check:

static int static_find_io(struct pcmcia_socket *s, unsigned int attr,
                        unsigned int *base, unsigned int num,
                        unsigned int align, struct resource **parent)
{
      if (!s->io_offset)
              return -EINVAL;
      ...
      return 0;
}

I moved the devices around now, giving zeus/viper I/O space an offset of
zero, and moving PCMCIA to offset 0x10000 and 0x11000 for the two slots,
which now works because the io_offset is nonzero. I've regenerated the
branches again, and confirmed the for-next branch still boots from pcmcia.

        Arnd
