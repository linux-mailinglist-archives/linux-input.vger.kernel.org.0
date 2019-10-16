Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5E13D8517
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 02:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388545AbfJPAvM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 20:51:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41316 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfJPAvM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 20:51:12 -0400
Received: by mail-pg1-f193.google.com with SMTP id t3so13178166pga.8;
        Tue, 15 Oct 2019 17:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ltDDMUh1xlGD4pSNgA8gXhuyIlk9MRYKGGQg9juTsMI=;
        b=ESng4kYOkOnZLU/DzjYsLdjh7C5CB6GUodh+IWsqAZ4P01OcAJtvt0DOLrVr7F/I8A
         n6sksneAap2FO8dVRMtdN8Ma7tQI6BF6QfgH86zssY3TVRgbsQOl3lYPIoDYeD5Q0dBq
         FhBLk9BDtFad/SKmPxUcLeQPy2LCcALb+nN/UUnucawqphDPr9zYfGQNGacfU6fpSoYJ
         Zto30yNn7g6J4goB+1X7AeiZxSqF4jhXneRascWSTsxNsTi5qUE3sfxcwH3lUA6N8rwc
         hMJMrAVISfOUAZsMVZpo5gz6LeWleKJGkkmuj2TiTmoFs6HsKrFFIGjx0ufbcyK+LqM7
         J3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ltDDMUh1xlGD4pSNgA8gXhuyIlk9MRYKGGQg9juTsMI=;
        b=EQu88cMbDBflGaGUbxC0foLi4e8rE++X8mXFD2o47PO4lE9kyw9vjxB2KVgJ+yk6aV
         hX/A54Q3Zjyna+TUnDKgBwtXzViuyjeGlSMZ+Eex/MHNlLs/8TcwZT+wuaiJdx614xdJ
         rpHb/C9wVoGOoR1GhU063pvwYLfg2r0pWcnK4Fxlfvbh8oPH5Nydva/7OSbLZtTkoKLN
         BdX6FhE6Tnn7b92ud2SbbuJCzubMTekswK2zrSNl6TP3HApM9Ld1FUwv2nVqc0fBQYkB
         8gcpJTCUnF5XJW6Qfs57+bwOucfz+c32Q9MeaRjh1ii7LE+gia/fr7XSMj8fIDxJGeiX
         EHdQ==
X-Gm-Message-State: APjAAAU2r4MHBxSdHTlDz7tM46+FlYvO3z2Mjd/1crpm5QbaSHd8FD24
        apMOcFgmNQ+2gOK45VhF9Qg=
X-Google-Smtp-Source: APXvYqwJDTu4vKA3PfnnGNTkK/CMsVarlVnprvX8tF/2URNi2jEGttdgSydEoyp1fgfzdyXw/3Z+nw==
X-Received: by 2002:aa7:8b4d:: with SMTP id i13mr15985072pfd.29.1571187070365;
        Tue, 15 Oct 2019 17:51:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 206sm21506960pge.80.2019.10.15.17.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 17:51:09 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:51:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "Input: elantech - enable SMBus on new (2018+)
 systems"
Message-ID: <20191016005107.GA35946@dtor-ws>
References: <20191001070845.9720-1-kai.heng.feng@canonical.com>
 <CAO-hwJJ_hjL8=D+BDTW6LQRhd86NawORuY-jnDF71mD88woiDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJJ_hjL8=D+BDTW6LQRhd86NawORuY-jnDF71mD88woiDw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 05:26:05PM +0200, Benjamin Tissoires wrote:
> Hi Kai-Heng,
> 
> On Tue, Oct 1, 2019 at 9:09 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > This reverts commit 883a2a80f79ca5c0c105605fafabd1f3df99b34c.
> >
> > Apparently use dmi_get_bios_year() as manufacturing date isn't accurate
> > and this breaks older laptops with new BIOS update.
> >
> > So let's revert this patch.
> >
> > There are still new HP laptops still need to use SMBus to support all
> > features, but it'll be enabled via a whitelist.
> >
> 
> You might want to add here:
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204771
> 
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> 
> Oops, seems like you are missing my acked by:
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> Also, don't we want to send this one to stable as well? I can't
> remember if we reverted it in all the released kernels.

It looks like we need it for 5.3 so I marked it for stable.

Thanks.

-- 
Dmitry
