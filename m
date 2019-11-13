Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B591EFB929
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 20:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfKMTu3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 14:50:29 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35268 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfKMTu2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 14:50:28 -0500
Received: by mail-pg1-f195.google.com with SMTP id q22so2024482pgk.2;
        Wed, 13 Nov 2019 11:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BFoRUmVGuqfT8D907Uc8h7RLulbYqimY28gR6tuKhsw=;
        b=STfRnUb5HQzoMpwJTkSiSPorz5xOTt8hyuLlhaoKkTg+O44qxcE1vmvZMhAYZEvBKG
         jR6l5klwJAb2UEDyzhCDIhEm1ZO/T+wqXxDeaac86LCWt40PMi5VQ8aC1j8X067ln14a
         orgIvc9Ym+gAg9W3ZkzLLS/WdZeD/XTQEDg4YBlqM9b3JUQiJEzVsD9LbnHQg9+2i4bs
         8z+7Yi6HYJAf2xZtx2KU/SpEI7NnJq79k2UZwju7YiVJBzwA3/vLULB24xa7GbRpnDeM
         ewMyZt/FMdv4DaR/DItD892Ey2qCtHfgtX/49fejw8Vv107Cj4TYa76li9PKd6htlAEI
         GFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BFoRUmVGuqfT8D907Uc8h7RLulbYqimY28gR6tuKhsw=;
        b=obO1sSGwnHDQfFMcAzD3wdWkp4taJY/yrN9r+ze/5kT1r6fCyLUyDCUGPR/gOnrOty
         PqyTE2G2GDWH4MqFOu7ssiK5AHqq+3+YlX9UwKvkTEIOL61teIsTLGfBUcPSJUQhupEF
         73HtIk02i0Tycr+9Z+KXSoVTUHbzwmaA6x9GznFNwcEVFpoiIktGw8TyBKttpPTOaVtR
         dIBnU2B4ELVDdVsc5q0O1Njla2KQuOurR5zLWoOjPNyrWLgwyQjOy4V92LXKuBuHIIh+
         +nSgznn9j3wvw4hwQNPFn7D48Qiv5M1M1Oz/gWLWF3tMbZbvDzXyEKO0aXRB62naFgPy
         j11w==
X-Gm-Message-State: APjAAAWSWXuQTyAJmsspRyUcf320rJ/SU0kHT0S78ADUpDB6PQ/A0iN8
        fEdwS2oNFjS8BhNgf1nsvTyXIiFX
X-Google-Smtp-Source: APXvYqyDcTlfFfZhm7DnVu+YXm2FzNnTSWG9/naSvT8E52WFWjnPC9VUxoRRXnsHn+jyY6ZRJv5UTw==
X-Received: by 2002:a63:7c10:: with SMTP id x16mr5640672pgc.176.1573674627887;
        Wed, 13 Nov 2019 11:50:27 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j5sm3875541pfe.100.2019.11.13.11.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 11:50:27 -0800 (PST)
Date:   Wed, 13 Nov 2019 11:50:25 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: synaptics-rmi4 - add missed operations in remove
Message-ID: <20191113195025.GR13374@dtor-ws>
References: <20191113063656.8713-1-hslester96@gmail.com>
 <20191113082315.GP13374@dtor-ws>
 <CANhBUQ3CaRm1SjO4DJOSHpodUpJrHstzD5MYk13vo=EEigDEYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANhBUQ3CaRm1SjO4DJOSHpodUpJrHstzD5MYk13vo=EEigDEYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 13, 2019 at 04:52:59PM +0800, Chuhong Yuan wrote:
> On Wed, Nov 13, 2019 at 4:23 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Nov 13, 2019 at 02:36:56PM +0800, Chuhong Yuan wrote:
> > > The driver forgets to deal with work and workqueue in remove like what
> > > is done when probe fails.
> > > Add the missed operations to fix it.
> >
> > Is it really possible for the work to still be pending when fully
> > registered device is properly unregistered? I thought we'd wait for
> > successful data acquisition in rmi_f54_buffer_queue() before unregister
> > can complete.
> >
> 
> In fact, I am not familiar with the mechanism here...
> I have checked other drivers with video_unregister_device and found none of
> them deals with work in remove.
> Therefore, I think your opinion should be right and we only need to deal with
> the workqueue.

OK, please send the updated patch then.

Thanks!

-- 
Dmitry
