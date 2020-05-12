Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCB01CFFF3
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 22:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbgELU6E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 16:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELU6E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 16:58:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E8CC061A0C;
        Tue, 12 May 2020 13:58:04 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so6248917pgv.8;
        Tue, 12 May 2020 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lWVK1FACn+wJeq7qZs57K7YYeZ4F4zJ1GYHSxsOXWGk=;
        b=XxYv4EgdYhWpw0E+DZAy+TFCn4kPxUHi9BuV1t0S20SZ1zMARKCijzip/6YwlOlHhu
         2IR21zouEhI4LEc5AUZg7YMBLU+awaZRDEFG6RKNN9bNT0tj/m3+8hMgbgtcxP4quO52
         hIMiNgcVNxyUYggenFryLZ/nc0ZVCT54XR9H8liUSyThujyd/cPWndotQXim8isiYS+h
         M8e+OPnQAM6PFzuN6bZewy/NhQb35tjPbk+ztU9pOV67PaJfNWQ9GjcSPVM0VzqOYIFm
         cgSS/ELDzJ3UtahLHHLftaNEULXtmnVGxNNMiiR7j0LzZF5Zp91z9aVsVbprIZLQtEPJ
         Xfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lWVK1FACn+wJeq7qZs57K7YYeZ4F4zJ1GYHSxsOXWGk=;
        b=CbugjPtqqhSlCDTbv6zV9dlPZ+JMPuXfqMUeialXC50mvJBDr26Yn9UUBkMCfoO87g
         p/MzlEuEOZbjMFPQDUoEnFcjlDo18G/ngyJ/IE8lCKAKdn5XM1RW0Ykndei96oBZbJES
         qoZWw9vx9nDEqTEPnz0S1/XZE0KOJ4MbR+BfjK47UVPMaBnJEFzBExgxPrg8nXNgRN2C
         tcJZLi7PnZxmQ/QFp6WFdYt5ggyWtkCr+6k+njWYyP23iuLObNRNmUsWE4jvQYe9mknr
         Z8aABKMi6uPPBYElZDdTHAevEzkrSPb6i6Ca5sa0Tjm2aT/ccDGhNhb4FSmhithD+S21
         WNHw==
X-Gm-Message-State: AGi0PuY+/R65Vz7gzhOAJgX/aVKXAEyjGOOxlYhQfNK2qYhGI/uI7JJL
        AGKAcJ4Uff/GSUljJ9d5AMhkS6d9td7UzZeLSsU=
X-Google-Smtp-Source: APiQypKI8FjdbEyVTcX7DvwSpFyqkiOOhwS501KYvrM6PubS4UC3qvsJBHQOLo00aLXmZVhkXqmL3DHcCX0tCDyNWFs=
X-Received: by 2002:a62:5ec7:: with SMTP id s190mr22127799pfb.130.1589317083846;
 Tue, 12 May 2020 13:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200512204009.4751-1-bernhardu@mailbox.org> <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
 <CAHp75Vfk+MU+XsPf4+upqzd7HyxBHgQBZ=BukUPxzd+8Bm9bOQ@mail.gmail.com>
In-Reply-To: <CAHp75Vfk+MU+XsPf4+upqzd7HyxBHgQBZ=BukUPxzd+8Bm9bOQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 May 2020 23:57:51 +0300
Message-ID: <CAHp75Vc7A-L5UYZQQXYenZQG-GD1ZM7Pfi4dChHm2xy1BJB0Ow@mail.gmail.com>
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

On Tue, May 12, 2020 at 11:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 12, 2020 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrot=
e:
> > On 5/12/20 10:40 PM, Bernhard =C3=9Cbelacker wrote:

> I don't see it neither in our patchwork nor in Linux Input...

Okay, no worries, it came at last.

--=20
With Best Regards,
Andy Shevchenko
