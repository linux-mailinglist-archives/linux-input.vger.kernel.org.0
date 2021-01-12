Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D222F26C8
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 04:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbhALDor (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 22:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbhALDor (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 22:44:47 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE9FC061575;
        Mon, 11 Jan 2021 19:44:01 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n7so548601pgg.2;
        Mon, 11 Jan 2021 19:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g0LA2f85ruTd8j6JSyNyo+4Zil1414FJsUe+l3QuCJI=;
        b=EGLHtybCsoN/SaP8Gct77imb9qIV75xWNfOLb1ev533SpWbFVBzG65wqZ7Lox3umji
         cvPHMwK1J4xvGD3tYbrgDASiGqYyJLUuXFgzOpOfq6AVqDJr0Z+br0zB1bgcNG8IZJgS
         g/ArtkJRCHRg7Eg0bfa/jcY47EtX7qFEXOuowws2AZtljzJXZLDFKOisN3cGMEgao2FL
         /luk7iIkHO5EpHOe508+gFgTyEYakDrvJSeU96piyAvHhEEPjWW93PHU6A4ImMl6HuQO
         mHO9GHHqiZkyG6qE7ogssceDXYxXSMcfIPOwvQNiyk47934YxCxKdfcs39cPBlmjEWqQ
         EZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g0LA2f85ruTd8j6JSyNyo+4Zil1414FJsUe+l3QuCJI=;
        b=U1jo7Xd5GA7rKzdKsQFtYazJ6XIjXwc62h5C/z2BJvEOqAWiPYqsKfqkTdPZ8njwtC
         4UxSKmH9IvnQx6YKFgbzDS3hXkqHTdAjMAePiAlDpSexOc+MvTm+XcwMex53V47bX4l+
         sLr6VOP+qeYt4upBm0hi9RbjFBajO+Z2pDKFvFkTeyP/8zKMYO3gifvvJ7L8HDpaWUPq
         dHp72//lzl6s80AmnrGSs7nwgGCjJrNEYDANC53Qk+uyXRetITIlb/+yj5SxCXlFeReP
         KGPKQvvhnH3Pe5r004M8NOMYK2PdVhDdppPSaSrgunFrL5Mhk9Rq4pTGQVLAB4GbD/1W
         irOA==
X-Gm-Message-State: AOAM530s/fyyrHKYRAJ99VZ9Yw856a3N9BiY3BQvTPqM2So5x6sAwbrL
        Wz2GdNyxvkt7veEooG/+3+fq0J7XcIY=
X-Google-Smtp-Source: ABdhPJx2jZeQ2/PvTxGeFg86CetPWJWt+uz+O+gIvMm3O9TYzQcZ8kEaNSKitZp+1pJROpc1f0IPHA==
X-Received: by 2002:a63:464a:: with SMTP id v10mr2656462pgk.393.1610423041000;
        Mon, 11 Jan 2021 19:44:01 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 17sm1336770pgy.53.2021.01.11.19.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 19:44:00 -0800 (PST)
Date:   Mon, 11 Jan 2021 19:43:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Souptick Joarder <jrdr.linux@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: ariel-pwrbutton.c: Remove unused variable
 ariel_pwrbutton_id_table[]
Message-ID: <X/0a/SgL5kWX/7/T@google.com>
References: <1608581041-4354-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zb2O3SFx6xDtwdSgHYH-zeGXwuf1=Hr5yYXnCDqAza9KQ@mail.gmail.com>
 <X/OQZcsD15Fl/XVw@google.com>
 <20210112032028.GB1503339@demiurge.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112032028.GB1503339@demiurge.local>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 12, 2021 at 04:20:28AM +0100, Lubomir Rintel wrote:
> On Mon, Jan 04, 2021 at 02:02:13PM -0800, Dmitry Torokhov wrote:
> > On Tue, Dec 29, 2020 at 01:15:10PM +0530, Souptick Joarder wrote:
> > > On Tue, Dec 22, 2020 at 1:34 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> > > >
> > > > Kernel test robot throws below warning ->
> > > >
> > > > >> drivers/input/misc/ariel-pwrbutton.c:152:35: warning: unused variable
> > > > >> 'ariel_pwrbutton_id_table' [-Wunused-const-variable]
> > > >    static const struct spi_device_id ariel_pwrbutton_id_table[] = {
> > > >                                      ^
> > > >    1 warning generated.
> > > >
> > > > Remove unused variable ariel_pwrbutton_id_table[] if no plan to use
> > > > it further.
> > > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > 
> > > Any comment on this patch ?
> > 
> > Lubomir, would you prefer to remove the table or add it to the driver
> > structure as ariel_pwrbutton_driver->id_table?
> 
> I believe it can be safely dropped, as the OF match seems to be
> sufficient.
> 
> Thank you for the patch Souptick.
> 
> Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>

Applied, thank you.

-- 
Dmitry
