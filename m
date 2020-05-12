Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C7B1CFFD7
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 22:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729029AbgELUvN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 16:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726661AbgELUvN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 16:51:13 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF3CC061A0C;
        Tue, 12 May 2020 13:51:13 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u22so5905137plq.12;
        Tue, 12 May 2020 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oJng9dQJuQxPUtpR8DFqp83AWfODJEvg6OPBy2AJ0nA=;
        b=dL2pYMsPCc2MhtRZyYEyonwcNSw+sbEft1mYQa086fd50ke6L9zDiJCGyyc9/PEqr5
         FNTFry6mlEl+8LtK8THWFzgyEfQyJbKEomPx+g6UkvZwySQWdhLJ4KjU0Aem1GaiTFKV
         V8JaKkKvApXbsniXVSTYzNIWLleljHs1z/VhIgp4Yzs+xka5OvuqA4gzCjt9ACTuCO6O
         frzjMUov1/+kzPO/BxCd3FdVGfEAt6AbATNf/z8+N9NC4/++jpHZj/Sl6lEXr5JpJBia
         SGJwbHXKR2KkLUDp69w232U960qHKD4w3HOdVt3P9UTNfngIqkcpDv5TGSrmrGkwlP9M
         /IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oJng9dQJuQxPUtpR8DFqp83AWfODJEvg6OPBy2AJ0nA=;
        b=MFGGTbrpBBSM4AkGEShvc88i073W0whdjcZmlofTVoqJtqQDIyZurBcDDRaF21XPEg
         hax+elh9pib1KeIvfTRRFYsdaSwMZd2DYW9Tz+ptHJj1HogwAIr6OQhMI4l8ADVb7lDe
         kJCm+GNZK31cdUFxXikAYPRx/tR+a4WD1ibvxNB+0zjnkue4LZvlEjzrVlGhGVZU0YV4
         CbXpo1OgEZQ+dQvzg8VAAe0sm0nt2iCRwwAdw+juCf4IEDDxA5BsEPer1rWT7TRyBzrx
         mt4Mbhu5KoMrpqDoonaxa/YHVQ+ubeU1LdmrXC+2379HBEBSfkcCDBbi4sl8xrc5GUaH
         cq3A==
X-Gm-Message-State: AGi0PuZ7wYcky9PUhR5jUED9BCoTBoQil9YscqP6+ZX+5NAIhFzc2P57
        Cva312UPaO+38NHmNMv+sT9ILVVLhmLfJfQobYI=
X-Google-Smtp-Source: APiQypKTeq1lB68VGWX4c5tYalRqzHPQM+TCExiYM+jApVYuNBs5tNJAXHSLc/i9/YwYfcEJftUgDWtOlWxQ/EqLwvI=
X-Received: by 2002:a17:90b:374f:: with SMTP id ne15mr30222698pjb.181.1589316672701;
 Tue, 12 May 2020 13:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200512204009.4751-1-bernhardu@mailbox.org> <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
In-Reply-To: <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 May 2020 23:51:01 +0300
Message-ID: <CAHp75Vfk+MU+XsPf4+upqzd7HyxBHgQBZ=BukUPxzd+8Bm9bOQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Yourbook C11B
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Bernhard_=C3=9Cbelacker?= <bernhardu@mailbox.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Otmar Meier <otmarjun.meier@nexgo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 12, 2020 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/12/20 10:40 PM, Bernhard =C3=9Cbelacker wrote:
> > Add touchscreen info for the Trekstor Yourbook C11B. It seems to
> > use the same touchscreen as the Primebook C11, so we only add a new DMI
> > match.
> >
> > Cc: Otmar Meier <otmarjun.meier@nexgo.de>
> > Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
> > Signed-off-by: Bernhard =C3=9Cbelacker <bernhardu@mailbox.org>
>
> Thank you, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I don't see it neither in our patchwork nor in Linux Input...

--=20
With Best Regards,
Andy Shevchenko
