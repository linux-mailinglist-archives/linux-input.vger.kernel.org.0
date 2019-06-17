Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DE248671
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2019 17:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbfFQPBj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jun 2019 11:01:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35075 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbfFQPBi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jun 2019 11:01:38 -0400
Received: by mail-pl1-f196.google.com with SMTP id p1so4205569plo.2;
        Mon, 17 Jun 2019 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DK4VSjN1sob6Ys3TeAB1A5Qsui8AAUFNe25z7eT/ra0=;
        b=T5J2xyAh9hyECX3nx7L2vEm4/nXLJW9FAmDNPuKh+sEhmC7c7+7pLhZ4A5A3d/Y6y/
         9xw8yaXZqaFUArtD/lSgkNVmN6CEbuAzsbh+j5RZWUFnjHqItDJc25p0fi3DnxPdMg3e
         zueIJDTK9i7w5KRDXu5NAQpcD5Y/gF5apvJejoGfHgBk/S9oU+47V0YkN0AkjTgm+nBZ
         xBckc3ab/QmTmApWRvHYhFsR2LQdubqUZWGT/L8XxXywBdH8/DDvv3xlGkNfAUU02OMR
         as5VOlwEO2Tp4ehVlOEpvdZNAYewR8smFZeIvX1iktloTKRphBi2ju0GrbVQobU6a74E
         mzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DK4VSjN1sob6Ys3TeAB1A5Qsui8AAUFNe25z7eT/ra0=;
        b=EBhAEcZkxZK8Yv+qgCrC6qeXoyo6h9n3vQG84yCop3c6M78vP1uKOLPQw+lz1NByE2
         ortZvwaso9+4rlrPnXeFU9j29IUNyxfqoB2M0hOD69uBPwuhssL5S0OnVMB3JEWBCX5G
         1I2ZOzJmFTD74eh6F8wsocxip3DA1peILysknSAdWatbl+jT9fjwlHmCyzSYrm1djO02
         +FCQfxDzooooh2ZB7for9MxFMSg2e5u/fL3r+nDNPlvVQGTOKamS4WBdxlehn4Ldg979
         xv29OneCLp/M6G1VBQ+Kt6eLeJBpzXoiA0GnvDkqpHTvnQTHYuJS53TtSH+BdLwTWREF
         1Q2A==
X-Gm-Message-State: APjAAAVzytfrO7QuN/74FUV/L4WgvXzN8wGVkYJgmTcgK9NviT413YqY
        esRHc/FxV/yqAoApwIB6s+80r0YMD9A9xgfRtj951NZx
X-Google-Smtp-Source: APXvYqzM+1/dHDDciBN7VUx+ozEpqEfd0t/O3kidDOz8P0L23Mcdvp+pQgmj9zJONwgY+l/eWQPnNEY9A86NWdz5WQ4=
X-Received: by 2002:a17:902:934a:: with SMTP id g10mr98394560plp.18.1560783698126;
 Mon, 17 Jun 2019 08:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190612124053.119182-1-me@myself5.de> <736848fd-1c45-0bd9-bfd1-747c716bd953@redhat.com>
 <CAHp75Vdzf7bMQq2WP59Pux6QXD4GTcPLjryEecAsHJiAEewjcA@mail.gmail.com>
 <CAHp75VeSPYakPF-xUcaVOmnMEpv-UZFSrERMSCBi53ov5oA=0g@mail.gmail.com> <2819fd39-ce88-c50f-1fbf-f527d71d63e4@redhat.com>
In-Reply-To: <2819fd39-ce88-c50f-1fbf-f527d71d63e4@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 Jun 2019 18:01:27 +0300
Message-ID: <CAHp75VdUhZZAq3UP=AkFGbk9tgaBnfScrja8XO4v3C-DwyM3Jg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Update Hi10 Air filter
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Christian Oder <me@myself5.de>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 17, 2019 at 3:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 17-06-19 14:38, Andy Shevchenko wrote:
> > On Mon, Jun 17, 2019 at 3:37 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

> >> By some reason patchwork doesn't have a trace of this.
> > I meant, Hans, your message, the patch itself is there.
>
> Weird, no idea why this is happening.

For sake of testing, can you bounce the first message you sent here?

-- 
With Best Regards,
Andy Shevchenko
