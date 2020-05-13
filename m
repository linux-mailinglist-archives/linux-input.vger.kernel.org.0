Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140E51D1C09
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 19:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732781AbgEMRRy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 13:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732731AbgEMRRy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 13:17:54 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01696C061A0C;
        Wed, 13 May 2020 10:17:53 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so25355pfc.12;
        Wed, 13 May 2020 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2++y918DL6PTyMaBo9uWOYP73v5btFVUqOxYUo6Bzug=;
        b=lB+abop11oXqetyMDjeQ+mgP1UCQEbaWzlG2CTB7t4rromwp/ZK1Bf+3X2Z9T3UURu
         nNtRu3PTsVC4F9DJZmQndwAJP+xyjIlYc3hLu/37qTl/wIjP9zAWJaZgK7EPs/MwFhMB
         82ALQaSyAfUgoEFucO/nEYzdCAaWzPaa/uxramJ8sdm68DGfDIOqXmUfJzU8Lb0Ahx+q
         s4YbFfJYYu0V19R4ZrU7Kk+dmV5aVIZfJfBWqUtNlXffOI7LuP8/e+ay1n6ROdyc/EuP
         iw43akFsbKDBMu0rcCUbYCmnJ4vlNmQaa+0emilBElguLzjmihAz4ZyFChPxOOlmPoC/
         FpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2++y918DL6PTyMaBo9uWOYP73v5btFVUqOxYUo6Bzug=;
        b=cThWce+7kUzBbKi0t6q+Csg9TouyoQeVAcy8pw2Tz3lrWtcs9sfjUE2d8jpQ9xq8MI
         iqp0ebGNTa5KGwjTzg0ef9SP2Ht5NJ7ERzh2qusZQcxgb7iY0iTRw0b6QahoTc0191+W
         yJIsu2ZlCVbic00cUDXoOrlG6eJjOSK45OkA6Lv0PH7sqQT2iF/0iK9MVEMeFs3PnNU+
         up/SzN/KK0yPLXY5sroWSS5vcmrQUECl/wrDtVnuLooACy4CSVRjzmsQqxsrWEWitQLy
         FxQsc/40EHEo5FnWXDUExV9nKu1A7bRsUAhrB+enwRqDsbjtfKG/MN3L2TEfqyVyHTc2
         IGdA==
X-Gm-Message-State: AOAM530UwWHUrq4P42PEGQJC5Ffzawct0PDGjzb0e7S7VHpDIb9zU7TK
        lWmJEkffjH+VLHtxc7JY+B6ToXatVnxq5fGNu/A=
X-Google-Smtp-Source: ABdhPJx3ye+2uJcTGtYr1d0+pqiV/lh8ldJSlQrDipXGD+anGJWN0wqNeyc34Wt/CdrT8pyL2Xjt02E+0HIpqvdeFQA=
X-Received: by 2002:a62:5ec7:: with SMTP id s190mr316240pfb.130.1589390273448;
 Wed, 13 May 2020 10:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200512204009.4751-1-bernhardu@mailbox.org> <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
In-Reply-To: <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 13 May 2020 20:17:46 +0300
Message-ID: <CAHp75VejzaZL26ztQMFGjAAMC3B8mkSnXSvGhyFeiHUbUUpp=w@mail.gmail.com>
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

This doesn't apply to our for-next.
Please, rebase, add Hans' tag and resend, thanks!

--=20
With Best Regards,
Andy Shevchenko
