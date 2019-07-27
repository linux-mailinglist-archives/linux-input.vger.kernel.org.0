Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2696E778B8
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2019 14:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbfG0M0x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Jul 2019 08:26:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44882 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728666AbfG0M0x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Jul 2019 08:26:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so26013447pgl.11;
        Sat, 27 Jul 2019 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZLbr+/N0UmJ/GLrZO46NMnnhsZmq5MgztPMhV/uqWqo=;
        b=dTmYM1hAc2nBjU3MEqnGM2SxSTmR0iY5EIzZkTRJqZe0iCnDfoR4QVIAO9RRieD1IS
         CoLBh0NQ6YlHgub37tr0HfrdSJpEc8GuA4tT5OAWTFvhvQGrSQKA56ZkJDkvrvOnx1bp
         N9zOAsufz7zF8IfmURm0ZeFdRPqNGFmOG6/RmYaN1tUaosDkBXfsN9j3oxl5TvheufyV
         IUPefVg6n34qWbkPlYYrn7NDYZEtSfqttmhFWQGklzzXHh/cNWudNV6eDYo5JdMPpYir
         Cu+bmb6WLMTg1rQmvoqEfdF9bqvbSYbD4cE6ttlxjV5irc4gwEeP2Cui6/6t7oBjNlva
         bzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZLbr+/N0UmJ/GLrZO46NMnnhsZmq5MgztPMhV/uqWqo=;
        b=SacQMQ9pLUJIc4/OllOqOY06ZX5CXSy2SWaxEfhfMA0EM3ujDjAXmHqEje1ELtfjoZ
         LmuTKw71EeHwDRx/fOlADp8L7lwiOF0EFjkPjGBJGxAdPklDpTc3j1r3l13p7pZRQXBU
         OD07+6GT6psa23m3FsEOvSrleltul7huvBzFogqdzeGfGfR2WD7yn27IOEuHORSbhnpL
         3EjCT6LHWxgx1GP3TTuCgloPkSRBTcR6aVmOh/i62ve2bu/fA7WnI91VN0USm3YFM4Eu
         7TUoMmmozK9XxcRcAMTf5zyOgGfqmVIiLbVRxxsdXxEHpmgOmCavUz6x8Rpb68dsbNwi
         PjIA==
X-Gm-Message-State: APjAAAWbbDZyCvU9IsuBVmyBO4hDOrptr56Gfkl8BtfaGu2JjQjIlNSo
        i4/4g8/4dGoe9Bsu/KjrEPl8dbZNeABaipasmm8=
X-Google-Smtp-Source: APXvYqxPB5dVV9tFEHC321JcL22pSpM+OBrkQL+ENpCdnQiZpfjfNFDkvGXGkXbkfY/BZgCF+mSdviVLyOxaV/QllfI=
X-Received: by 2002:a63:6eca:: with SMTP id j193mr20517551pgc.74.1564230412476;
 Sat, 27 Jul 2019 05:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-2-luzmaximilian@gmail.com> <CAHp75Ve+3c-TFeN3Dh-DB75Rjft8mY2DA8vNkrFyp7JK-ZOjDA@mail.gmail.com>
 <20190727091541.GD795@penguin>
In-Reply-To: <20190727091541.GD795@penguin>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 Jul 2019 15:26:41 +0300
Message-ID: <CAHp75VdsL+-bhAUcxLKFKLZedN3gFD3jxnhELD1RtKGSHdagjw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] platform/x86: surfacepro3_button: Fix device check
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
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

On Sat, Jul 27, 2019 at 12:15 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Jul 25, 2019 at 08:57:53PM +0300, Andy Shevchenko wrote:
> > On Sat, Jul 20, 2019 at 6:05 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
> > >
> > > Do not use the surfacepro3_button driver on newer Microsoft Surface
> > > models, only use it on the Surface Pro 3 and 4. Newer models (5th, 6th
> > > and possibly future generations) use the same device as the Surface Pro
> > > 4 to represent their volume and power buttons (MSHW0040), but their
> > > actual implementation is significantly different. This patch ensures
> > > that the surfacepro3_button driver is only used on the Pro 3 and 4
> > > models, allowing a different driver to bind on other models.
> > >
> >
> > Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > assuming it will go thru Input subsystem.
>
> I can take it, but I do not think it is dependent on the other change
> and thus can go through platform tree as well.

Pkease, take it. I do not expect any changes to the driver this cycle.

-- 
With Best Regards,
Andy Shevchenko
