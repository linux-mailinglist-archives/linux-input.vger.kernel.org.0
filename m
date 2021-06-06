Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8092E39CCB4
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 06:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhFFEN2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Jun 2021 00:13:28 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:38852 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhFFEN2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Jun 2021 00:13:28 -0400
Received: by mail-pg1-f178.google.com with SMTP id 6so11189124pgk.5;
        Sat, 05 Jun 2021 21:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XmD1IkT/S4UC4Eg2MOb4pM7PfvQWHUODo95RB9c6n6s=;
        b=iIA2l53mq92wKNErdD8L7pLnHIUaxFSRiH8tnC8qR6IVKpDEfNsH+e9+7YFEjiiume
         EaiO6ISxXQR+PiGTE6muxKmWHqjNzVdzV+i4ruuTSw9Rfj/irBJ+ikFzm4A5w+quhln2
         gZO+27Bb6wUuD81L0ZVyBabLX/xWtyY9WzkABl5xfqOuYZWeN0CA+Decb4BXsc2lGcCw
         LbOpTekzFa6Wtj/Le1nQBzxrWpuQ1jb4JXrR7jYCN15dHWJ7vgJM6hqRzPnisBADm59i
         0z6Y5PWV7YVp151vmuWiASYs5GniZMGVMqev3rQDH2dpGIWwtQqbEWHXEV8o8iB2bnzW
         ORcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XmD1IkT/S4UC4Eg2MOb4pM7PfvQWHUODo95RB9c6n6s=;
        b=HGDSFbmG86SaFKJEgH7t3lEcOaruf6oiTcv6AIvjSmbqn8mxk/vyJvtUQUlcclwrDo
         PWDXVphTksY6WuqfL7fPj0SOcugNCWyawwpOuX9aZSFLsJ/iqhPFvBK3w9qR2WamXN1O
         YkTu2kzeJuS8IJ/HmDCBW0n2+sIOgRVqiw1ezZViG4RiBKGnfG5lDeKkxljoS5/TQ++S
         XFNlukr1LvD1wzq3K3aXAuAK4PouAVYTrdvmSzxKnm738ltT4rJZZBLAQM6EFMdfG9E3
         nkED7+5xInmdJZCaowQjP1+xZRrCWY1X6LT8ev5f2/GJwYiH0tmnKrsqmSFUfXXNHCpJ
         KAIA==
X-Gm-Message-State: AOAM530DUyBAEal02QR9eRg2lOfOnPjJuE22yc7i6Jzud1jAXZycZvIq
        4pthe5rvf0+Y7W90fXLrdn0=
X-Google-Smtp-Source: ABdhPJwLkyHot02AfXgIpxdiJB33vW1D8xCwPn+AzOzWUVBp9pngJLkgtIdlZiSUG9v+f0s/mAHa0A==
X-Received: by 2002:a63:f154:: with SMTP id o20mr12336930pgk.53.1622952622964;
        Sat, 05 Jun 2021 21:10:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5762:ab6a:6802:ef65])
        by smtp.gmail.com with ESMTPSA id p11sm8531771pjo.19.2021.06.05.21.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 21:10:22 -0700 (PDT)
Date:   Sat, 5 Jun 2021 21:10:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] Input: cy8ctmg110_ts - let I2C core configure wake
 interrupt
Message-ID: <YLxKq9dP5Pjdzw5j@google.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
 <20210603043726.3793876-4-dmitry.torokhov@gmail.com>
 <CACRpkdZWkV6Uq98VjGMFp+EaoM8gZ_FYWF88PoRbwTjnGFcJfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZWkV6Uq98VjGMFp+EaoM8gZ_FYWF88PoRbwTjnGFcJfg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 04, 2021 at 09:32:53AM +0200, Linus Walleij wrote:
> On Thu, Jun 3, 2021 at 6:37 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > I2C core already configures interrupt as wakeup source when device is
> > registered using I2C_CLIENT_WAKE flag, so let's rely on it instead of
> > configuring it ourselves.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I wonder how many bugs of this deep semantic type we have in the kernel :/

I do not think this is necessarily a bug, it just shows age of the
driver that was written before I2C core was doing this set up for us.

Thanks.

-- 
Dmitry
