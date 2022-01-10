Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1F748A159
	for <lists+linux-input@lfdr.de>; Mon, 10 Jan 2022 22:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343708AbiAJVCo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jan 2022 16:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239741AbiAJVCo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jan 2022 16:02:44 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D754C06173F
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 13:02:44 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id l8so11671368plt.6
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 13:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CWNHHGNZIQuPkboCsWS/8OAultq7gh/gxjnGC+JI2OY=;
        b=EZKn6rupu8RV1rZ0L3ixiwVCj0APU1YokUnLQOumh3B8Dwhrzj1NGLfswJ/Jfk6CFJ
         9BeyF5D4ZEwt//DAxE8130ISs2shmXoEucsrnJIoL7OsbDk4MXo4chjpq0yQ1KH9bOou
         dqNlLxs0WOcKcyAQNMA2LyLn0rTbm2+ISdhJJ/OwAQvldXoL9w5HQ0+kcN9r/4XF/OcT
         omUPJwMdTHdXOfu0UMxRNNfcYqj2IBg6gRVFvmVhma2BEpIE3V2bvpfiBmy8wUPrfZSq
         Of6a+jME2nx+ntiN8vEITHzZX+o2Y0NpG6JY+BAPFKNwnrdH04FghwMTK8RGm6DMll43
         brEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CWNHHGNZIQuPkboCsWS/8OAultq7gh/gxjnGC+JI2OY=;
        b=Al8DT2xVNNBtsQyD8JQvx5481o7nwCjVnL+4BkyXSx+XKHLToflqyugnQb9uYCcxBf
         ZRwN2C4BUr/1HZ+9YREahF2qsA3h4mKTKhkPUnqIZvDyfChrCNvzCnwls2Bxy2T/tQvx
         2Q6cmnqAlyrUsL0qgcj56udMh2ecRWpxcVh1D2b94X6yOHPDbDhOfxjfY3+1GJMFTOYB
         R3LnWDm1IKWvHdy6zLtbCvYixQ11JiajG6mD0XemLE1q4Je21KDhC9qtw7c7dLoLSwRb
         L8R7XLVuRMzuNQPLcDiAl1gG677G+HmTssOJnj1ySK4NsYVVLWFPt/zSzXwBBgUh19ca
         gl8g==
X-Gm-Message-State: AOAM530wehmjmOu//pw3TmZuRQmrRamgCKQ7hLC/JwS9rV3i2hTtcHJx
        nDl5mVX+cqFJ/6HG7ZYQO/o=
X-Google-Smtp-Source: ABdhPJyrsFnSKJZqgcgv7UapEqmVfpBrrczBRW37iXpz43Ivgq/adUuHDHq3xaQFwYOUSTRTKYJHyw==
X-Received: by 2002:a17:90b:4d8c:: with SMTP id oj12mr1653761pjb.11.1641848563633;
        Mon, 10 Jan 2022 13:02:43 -0800 (PST)
Received: from google.com ([2620:15c:202:201:1d28:509e:281:5bca])
        by smtp.gmail.com with ESMTPSA id l11sm7821826pfu.115.2022.01.10.13.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 13:02:42 -0800 (PST)
Date:   Mon, 10 Jan 2022 13:02:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
Message-ID: <Ydye8C1MjxpHHF5P@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com>
 <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 10, 2022 at 08:43:28PM +0100, Angela Czubak wrote:
> Hi Dmitry,
> 
> On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Angela,
> >
> > On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > > Add a function to switch off ABS_PRESSURE generation if necessary.
> > > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > > themselves from ABS_MT_PRESSURE.
> >
> > This needs better explanation for why it is needed. I assume this is to
> > use ABS_PRESSURE to report "true force" for devices. If this is correct
> > then I believe we should define a new flag for input_mt_init_slots()
> > and check it here and also use it to calculate the force across contacts
> > in input_mt_sync_frame().
> >
> > Or did I misunderstand the point?
> >
> I would say you understood it correctly, though to my mind it is not a
> static behaviour,

It should be, otherwise how will userspace know the meaning of the
event?

> i.e. we may want to switch this kind of calculation on and off.
> Are flags intended to be modified at runtime?

No.

> For instance, if user decides to remove the release or press effect (previously
> uploaded by them) and there is no default one per device, then we should switch
> the haptic handling from kernel mode back to device mode.

Why? I think if user removes effects then they do not want to have
haptics effects. I am wondering if this whole thing made too complex.

In my mind we have following cases:

- OS does not know about these haptics devices (touchpads). They work in
  device (?) mode and provide haptic feedback on their own.

- OS does know about haptics devices (that includes having both kernel
  *and* userspace support for them. If one is missing then the other
  should not be enabled, it is up to the distro to make sure all pieces
  are there). In this case OS controls haptics effects all the time,
  except:

- OS supports haptics, but switched it to device mode to allow haptics
  effect playback when waking up.

> Currently it
> also means
> that the driver stops generating ABS_PRESSURE events on its own and so
> input-mt layer may/should be used again (i.e. mt report pointer emulation).
> Anyhow, if it would be actually better to calculate the true force in
> input_mt_sync_frame()/input_mt_report_pointer_emulation()

Thanks.

-- 
Dmitry
