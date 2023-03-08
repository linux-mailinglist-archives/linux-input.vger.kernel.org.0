Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C84386B03A5
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 11:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjCHKDx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 05:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjCHKDu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 05:03:50 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07F35D769
        for <linux-input@vger.kernel.org>; Wed,  8 Mar 2023 02:03:43 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id x1so10817760uav.9
        for <linux-input@vger.kernel.org>; Wed, 08 Mar 2023 02:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678269823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMdUMlj0XmPUveQzJeLk9r/vOeqJlYjouzlykYT11MA=;
        b=Lne1oQoiZHLXQBhaG3QhFfwtWM3ad+QxaBu8/PX8JuCcWGCFjHE2Pb8Q3s71Z43C6M
         CouWCgdribgzGO194hYJl6p0auejNv7JWsdvprI3appp9WdOUJybNosiMGlcM27JMoBM
         PnU8fr8eHaam/6iQHN6eNTLIA+Bn1BJ+YTGIcrLde8/Hr69XVFjWSgzwI553LhySpvp5
         AR+XrsxpQBp+84CqCiLv9zoYNRAXFtYJQm3tE74UZ+UR2WPOyZphaHEYX3u6zrOvX3TZ
         MenpTcI13Fwrg1+PELXnsGlVXUAuh1IQN/RsGcBX2rpyNJMvSFwDvQAAZ59G4cMT9khu
         Hw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678269823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMdUMlj0XmPUveQzJeLk9r/vOeqJlYjouzlykYT11MA=;
        b=tC79amHWy5oLdtPVbIGsvOwW4FuBriD3gXNZ2FyW7rQdC0HzdZprnn1zy0tzhOqUiA
         pOZAhBsAvba3wAeH/UakBpiyVtrwljuRghOUpVOEE7Zn5dhyEk9f+Jsy8hTv/6V0gwKv
         r2yyv8GRWl+YpAsTdeWy+lKme3yUW/qGNu/e+BICOryILLXDEk7x1luqac7A+kNYLuFF
         J245wqixoBJQf3HRo27D88R76UBTrFBoCSV1cloNDogCoGRUbzlhS0W6xSVKsyUP7Wso
         Hn9kysCcQcklNyJRfkHLrPvI4iqaaTVhmW0q8JlaZP5pd+D6XWRYh5uA2hVXHMx7QVb8
         nHOQ==
X-Gm-Message-State: AO0yUKUNnMG/Ozw0NNioMVFOgOl+3+ZE0QItlYGHc0YnkGsLwO9hU5V+
        +jQ7YAkeGVMvZx4Vh1FtNmfPqeZKKZYoUm/Qd+2Hew==
X-Google-Smtp-Source: AK7set/4NAlzO/F0U68VZ8WAiZMF1Th7hMJ+Fgf+WS+Ds4xtoYDcQ6TX5Va7AX85Uu1oBabSjSXuJapuFZRo3ayua1w=
X-Received: by 2002:ab0:5402:0:b0:68a:6c1e:1aab with SMTP id
 n2-20020ab05402000000b0068a6c1e1aabmr10995834uaa.2.1678269822997; Wed, 08 Mar
 2023 02:03:42 -0800 (PST)
MIME-Version: 1.0
References: <ZAYCRPsKR8Je6LOW@black.fi.intel.com> <CACRpkdY3pCu6gZ-kA8uHAcCBpx_0AKwVLp+UyYO0dnWdt+fZKw@mail.gmail.com>
 <ZAZqy+LFkZuj+T4P@surfacebook> <e4cdd1f9-fc79-4f91-a4df-ab5f5a94faa3@app.fastmail.com>
 <CAHp75Vds2cLoTciFdQmEZsXsS0ND_HJmn1MNm6hsApFazkFAHg@mail.gmail.com> <ZAcjM5Ceivzyghcf@smile.fi.intel.com>
In-Reply-To: <ZAcjM5Ceivzyghcf@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Mar 2023 11:03:31 +0100
Message-ID: <CAMRc=Mey_FoHZp9RaxDK6tduBdf9j6Cn9oSPoYd0RRdR-xdroQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.3-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 7, 2023 at 12:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Mar 07, 2023 at 11:51:44AM +0200, Andy Shevchenko wrote:
> > On Tue, Mar 7, 2023 at 10:09=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
> > > On Mon, Mar 6, 2023, at 23:35, andy.shevchenko@gmail.com wrote:
> > > > Mon, Mar 06, 2023 at 10:50:40PM +0100, Linus Walleij kirjoitti:
> > > >> On Mon, Mar 6, 2023 at 4:14=E2=80=AFPM Andy Shevchenko
> > > >> <andriy.shevchenko@linux.intel.com> wrote:
> > > >>
> > > >> > Hi Linux GPIO maintainers et al.,
> > > >> >
> > > >> > Combined series to clean up headers in the GPIO library and driv=
ers.
> > > >> > Along with it, drop a few unused legacy APIs.
> > > >> >
> > > >> > This tag is immutable, enjoy!
> > > >>
> > > >> Thanks for coordinating and getting this sorted and tested Andy, p=
erfect
> > > >> job as always!
> > > >
> > > > You're welcome!
> > > >
> > > >> > intel-gpio for v6.3-1
> > > >>
> > > >> But I think you mean it for v6.4?
> > > >
> > > > Well, techically speaking it didn't make v6.3-rc1 due to cross-depe=
ndencies.
> > > > Starting from it it may be applied to v6.3 or to v6.4.
> > > >
> > > > Up to you and Bart, but I prefer not to rebrand the tag, if it's an=
 option.
> > >
> > > I think it was clear that this would not make it into 6.3 after
> > > the decision to rebase on top of 6.3-rc1. However, the tag name
> > > and description both look like they make sense for 6.4 the way
> > > you wrote them.
> >
> > Okay, I will rre-tag this.
>
> Now it's tagged as intel-gpio-v6.4-1. Should I send a new PR?
>

Yes, please.

Bart
