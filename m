Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C08C9136D6C
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 14:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgAJNGt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 08:06:49 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:41459 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbgAJNGt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 08:06:49 -0500
Received: by mail-il1-f196.google.com with SMTP id f10so1702557ils.8
        for <linux-input@vger.kernel.org>; Fri, 10 Jan 2020 05:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eRVtfzsCGIossuuL7cnCXyDDfgkQkbd5CLV0LTy3I5E=;
        b=XWaCmKBFzN2Y5NZDm//zDs3SPd0G2WhOEgbl2BJTajnWYGTlYDyzynl+yAEx/sqzQP
         LFS7LV3uaXEFCwAVXLTNpOgZBHomeCBhKW9B72RGnlLbXPOnbJjnfvN+ZFejyU2qfra+
         Jskj37Zpnl7gVrwfRUz3uZIVeUBCJA84K/oGnt+lL2QYTTDYnAiGYSSP8b7vpBUeQxrO
         xxIhZm8xDqupKI9Xc5KUEF7mDLhAtPT0KSZSNfl+1KM0L7HJH35eObKc9bS6yVcbm1UY
         sbtEZhEdOY5F1X+nFNoTXp9kobsTlcVpCKab2Fq7+iIniPl/CWFyp6qKVPlVS6VZmm34
         57mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eRVtfzsCGIossuuL7cnCXyDDfgkQkbd5CLV0LTy3I5E=;
        b=dG3UL049ah1kxbbPzJZ7yMekonOfRh0oM6A1Egid+CZwBDj2XuaweNDSbJVFe6EHc7
         nnyy/48Xb++kzFy88JCmyoJY7zsuPRjmqN5C4B6CkB9CXnGFsez5jPuZGlwc2XM/iw3X
         7tgSr7HKrsY+YHIlZyPLXltRulTqj0nq17+ASx6zLf1q2i3bkVhkVO3DgZnuBhgijo08
         w8cOTMSUZMN0HC95CwD/YxI4ULMP2Zul399fNAKuA2csLevfqCr3UuRwyFL9ZctUo++k
         mn+Z/3ZyNGBKKAmpjrdgXiNVDHCpmSrdx6M4MlSyYpNi2bqh0Q2UveJ0pc9Xnq8hzt8z
         Q6Xw==
X-Gm-Message-State: APjAAAWySUdJfNLDvVNrCePhNpuOsuk1eua7l336zu5EVWb0GtXlb3+x
        CrMJ+53uYqPpFZ8f6yOePtcAQZU/6ZTw3VIqs6CCZg==
X-Google-Smtp-Source: APXvYqwYWJ9PiiNCPZyLCC9T8oTUWALv8iFTSCJyENrTo6u2vU1Ps8DqBOCwXX6I83W5rN3aQv8fh0944ArWbVp5iUk=
X-Received: by 2002:a05:6e02:5c8:: with SMTP id l8mr2529843ils.287.1578661608697;
 Fri, 10 Jan 2020 05:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20191210100753.11090-1-brgl@bgdev.pl> <CAMRc=MfZmMV58kYD=bhuUCY0n3eb5iVy1kY=6NJsx6guagCd=Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfZmMV58kYD=bhuUCY0n3eb5iVy1kY=6NJsx6guagCd=Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Jan 2020 14:06:38 +0100
Message-ID: <CAMRc=MceORQp1L278uNykQP1T8mfi9hH1UMhRanU0asqVjjR1w@mail.gmail.com>
Subject: Re: [PATCH] input: max77650-onkey: add of_match table
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

pt., 3 sty 2020 o 14:12 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a)=
:
>
> wt., 10 gru 2019 o 11:08 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82=
(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We need the of_match table if we want to use the compatible string in
> > the pmic's child node and get the onkey driver loaded automatically.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Gentle ping.
>
> Bart

Another week, another ping.

Cheers,
Bart
