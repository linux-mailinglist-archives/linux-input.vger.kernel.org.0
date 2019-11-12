Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704BDF850A
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 01:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfKLATr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Nov 2019 19:19:47 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34259 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfKLATr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Nov 2019 19:19:47 -0500
Received: by mail-pf1-f195.google.com with SMTP id n13so12001157pff.1;
        Mon, 11 Nov 2019 16:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9XUS0RArtltCarqslDlhRX2lt1+e26kyIEsWNVrGZy8=;
        b=M0B4mb0kMlFfnvvmsVd+oPm6uKLgur8tUXC8nu1wNl+KP5Ku70wCKdUDc5kjpZALON
         u5KX7XyFpXmRMeml55qUlITww0qK7CDKnaBNsvdWm4xiOGfGxDcMI1BtTKNsIj+TRKRo
         3qTPyuNJLUH0Y1lnnZoFaAlyE1DuXOViV7+4MSFCZwT+OeZzcCTf81BKwW3DsC3sW0M5
         PX2mohHXHubCAMFEbo/uidwVpVssYIzkFbSrVxD5oYEeutYtw+SnuOR7S5mrP6IRm34H
         UHUZYyAjXuJO13Qqr/T4yn0JG/vHQgabEupSuKv5y9Ed/tTXCRLNBJ11qTjT8my2edE2
         ZOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9XUS0RArtltCarqslDlhRX2lt1+e26kyIEsWNVrGZy8=;
        b=pMODbDm/FvU4PIqCd/Lw7BX5wIBo30yGO+CgoEa09/4CsmgIoC9jRggRH+LiqJ23zp
         TEUHkC+EIPPLHDQbELzMUWVDVPi6KDVm2DHLO4zx6WsqLxeqelwInVADMItMwF9GQWqa
         DhI6t74KgrnfGsavYGdebg3f3UVJ6Me6Y0SeQRe1JG31fAKiBUKxLVzLtt2FEcwP316M
         BbKBjiziEtOfpVtZoQXUVmOSBJK8h2dJgwbFDmZyUvUrjtIJxV3QvLIJsLN9TCOBORzI
         qXDYDdgWZfCXlhiQ4ADIDy4YFP548q6JzlDy9HtQGk1Cl7STMQGp0wQNx0rGhI4CQayN
         FCgw==
X-Gm-Message-State: APjAAAVj3XpmL+UpnYaLnzoH6nB7+gn28WJyD3roAc+joB3HM+WbIcdO
        Ddo4YqpwgvoPNydRMwdRNg6s1RKQ
X-Google-Smtp-Source: APXvYqyKkDSeNR/EhsxGKmm3gKFw7Fm5cRWJCJfs//cubgMimH/wNJayEdernB1SuFl0iCr2+Vh14w==
X-Received: by 2002:a63:4553:: with SMTP id u19mr31475923pgk.436.1573517984517;
        Mon, 11 Nov 2019 16:19:44 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i3sm15884156pfd.154.2019.11.11.16.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:19:43 -0800 (PST)
Date:   Mon, 11 Nov 2019 16:19:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20191112001941.GB192119@dtor-ws>
References: <20191104070116.GM57214@dtor-ws>
 <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
 <20191104233621.GP57214@dtor-ws>
 <CAGngYiW0+QkLNmjp4yre2upqsvgEL4Or8rm09k5o7=9WHryyhg@mail.gmail.com>
 <20191111181657.GA57214@dtor-ws>
 <CAL_Jsq+MgveQX+9sZ4Q2zqtYZWxEpMBXaDJRxjQ4B7em00VnRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+MgveQX+9sZ4Q2zqtYZWxEpMBXaDJRxjQ4B7em00VnRA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 11, 2019 at 12:43:19PM -0600, Rob Herring wrote:
> On Mon, Nov 11, 2019 at 12:17 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Tue, Nov 05, 2019 at 10:29:53AM -0500, Sven Van Asbroeck wrote:
> > > On Mon, Nov 4, 2019 at 6:36 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > OK, I refreshed the branch with fixes and a couple of new patches. It is
> > > > on top of 5.3 now. If this works for you guys I will be merging it for
> > > > 5.5.
> > > >
> > >
> > > According to the ili2117a/2118a datasheet I have, there are still a
> > > few loose ends.
> > > Some of these might be too inconsequential to worry about.
> > > Dmitry, tell me which ones you think are important, if any,
> > > and I will spin a patch if you like. Or you can do it, just let me know.
> > >
> > > >       { "ili210x", (long)&ili210x_chip },
> > > >       { "ili2117", (long)&ili211x_chip },
> > > >       { "ili251x", (long)&ili251x_chip },
> > > >
> > > >       { .compatible = "ilitek,ili210x", .data = &ili210x_chip },
> > > >       { .compatible = "ilitek,ili2117", .data = &ili211x_chip },
> > > >       { .compatible = "ilitek,ili251x", .data = &ili251x_chip },
> > >
> > > My datasheet says ILI2117A/ILI2118A, so maybe the compatible string should
> > > really be "ilitek,ili211x", just like the other variants ?
> >
> > We have not landed the DT for 2117, so we can either rename it as
> > "ilitek,ili211x" or have 2 separate compatibles.
> >
> > Rob, do you have preference?
> 
> The rule is we don't do wildcards for compatible strings. However, if
> there's not a visible difference to s/w or you can determine which is
> which by ID registers, then it is fine to have a single compatible. I
> couldn't find a datasheet, so can't give better answer.

OK, so I merged the branch keeping ilitek,ili2117 compatible.

Sven, please feel free to send the patches addressing issues you
discovered and I will be glad to apply them.

Thanks.

-- 
Dmitry
