Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A525E137FE4
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2020 11:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbgAKKYF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Jan 2020 05:24:05 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:33431 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730755AbgAKKXG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Jan 2020 05:23:06 -0500
Received: by mail-io1-f68.google.com with SMTP id z8so4791304ioh.0
        for <linux-input@vger.kernel.org>; Sat, 11 Jan 2020 02:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vU2+i2GO3WHRg+jV5YDCjUlPGe/9rhbunzFmSeBXEWs=;
        b=apGZuJagwClqbxqX07aG9onUwlXW+H6wqSje8JaxzprMtEUYR5NB1bvF15EYuwiCMe
         J/6L1a0tS80/ibAhAGjIApfioD9g98McJp6RDN+tDdZWxUZ7ePfYbizd/kcOtS18BrLb
         8yBicbElljp0ywh37I6WLhmWlzMukCi2WNOrZQ1HPb4CyOqN+VhSN0NeCqTNrh0YsctB
         5q8UlfGE+WDxXcKItttXVsB5ZKS2u49Y5b+jjIsvM7z/LBqyns97E7vt2c8S6WEPES5Z
         ZXFdudV/uob5aIHPpn56BS8LcdHKJOtRsVDXgJFWX4s73n9/2fASW2Z8uFAK64DDxD6S
         tc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vU2+i2GO3WHRg+jV5YDCjUlPGe/9rhbunzFmSeBXEWs=;
        b=j/1QuCuCrqfGTFsf2SstLz/R7YJhj0rvs8LoA4R4ZJ+5XSancw8b2RFK1Wxgi1pCkH
         L47uhhGN9VIpyGwE/aTJFqD4b+zh1zolbWMw7U2d4fKd4lVyTFYAVjiO/vdzndSMcXbC
         ux8LMlAyBq3yfDs/u3rVmk+wVOSz69HIcSJO5kyQBRuZtBAKvcZO0/viHhcZfRORveYh
         zq+r80NqPXg7wN3W9q6j3mZEqQm7pYEue9wKrBuePstp/GAFa4wkbJu2RHv1Lu9V2Qmp
         ho8VL6+Db+GUIvOL5KuhUD/saHh8kPwAWwVJ0LPjbFpzyO/Gz9qaRamHMq/SfLxLy/tB
         s5Sg==
X-Gm-Message-State: APjAAAWiCtWNXYY8NolccGfJf1kOqNd71ClgsW3lGXCynanmaHm2gNPo
        TWfQMi5oZsjTJnCiXUdPTbF4IXNyF4KuqoBXrFL4LGwv/aE=
X-Google-Smtp-Source: APXvYqzpvyDTaxYdZtZGArwDIzWwAKCU3pngPn20GQcVt5O6FZInAzvQo0UuAlIgrGMYv/s2x55pDLoDBJmaLmIxHFg=
X-Received: by 2002:a05:6602:2352:: with SMTP id r18mr5779111iot.220.1578738185997;
 Sat, 11 Jan 2020 02:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20191210100753.11090-1-brgl@bgdev.pl> <20200110182841.GT8314@dtor-ws>
In-Reply-To: <20200110182841.GT8314@dtor-ws>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 11 Jan 2020 11:22:55 +0100
Message-ID: <CAMRc=Mcu-oNC009JLkNSDrKjg_ygb63ZTnrmu+8NwNZrOVsEZQ@mail.gmail.com>
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

pt., 10 sty 2020 o 19:28 Dmitry Torokhov <dmitry.torokhov@gmail.com> napisa=
=C5=82(a):
>
> On Tue, Dec 10, 2019 at 11:07:53AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We need the of_match table if we want to use the compatible string in
> > the pmic's child node and get the onkey driver loaded automatically.
>
> Do we really need of_match table or adding
>

Not really. Technically not anyway but we merged bindings that define
it (at the time I didn't know any better) and seems we're stuck with
it. Please see the discussion below a similar patch for regulator
subsystem[1].

> MODULE_ALIAS("platform:max77650-onkey");
>

This is already in there, but if someone defines the compatible in the
device tree as per bindings, the module won't be loaded despite the
MODULE_ALIAS() definition.

> will work as well?
>
> In general, do we ever instantiate onkey portion from device tree? Or
> is it always an MFD cell that is instantiated unconditionally?
>

Bart

[1] https://lkml.org/lkml/2019/12/10/271
