Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC88D398010
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 06:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbhFBERd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 00:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbhFBERd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 00:17:33 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5076C061574;
        Tue,  1 Jun 2021 21:15:50 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id h16so928031pjv.2;
        Tue, 01 Jun 2021 21:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/1wSyt9lFdOW+ZpHSxjEn9egCfQ8IpXv9FipEBLxVKA=;
        b=A0zZaxAbhJjpcQ6ZlZ5KabO4GHlMw7dRWskq7QPKx0KrpNisezotqM+N1+MQawtzip
         cHVFfMR0RcUhjfBBVs1ojRbH5vAHWHDZ7W0Yk80W/hkKXlwER+79glZocKvVaYn0eRCd
         gByvwFhj8QzFN9OEHnxOX1+0hbRN1i98905UMOrOxdi97An3tb+8m8HxowQtSA7cfK8n
         tPittSPYKEqw7xK3fI1fTnoxhfrfC3APOLvil65vQB115anWo9fTa5oxVBvN025Cp2wl
         GCzRZJ94Bazx5QKBsYYkwJpqHj22ZSbi2PUcqU1w0TGjLX2E5in5QatIBbC9vyX8Qc/W
         KT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/1wSyt9lFdOW+ZpHSxjEn9egCfQ8IpXv9FipEBLxVKA=;
        b=XjlBjWO73wfp9YB33AO/UwZtYNfpnSFeOVIPZ1jY9zQQ15qErbes/uga3DEby9bXRm
         I4PIhSi0coHI5ZlNqaO/t0/hjx0j2pRSxiiTGfFVNiv7LqtEcViAD0Lp2JiW854rFam8
         Z7USPSbEMLsbnSU/dW9yxTvohvCRxYQI5Z4bkzC0U06bY5vTv9j8NwOLXCyVr+i+1LpW
         BEuhycyd65+yPVAHyJQQh99R9X8A6UcshlEA8IJmR5kqXpwWxIDv/lWS4AooBpckwb3P
         8l91oOZm0TmsRFVQrDspHKjpqQOKjQRtohhL+2au+/yQLauXinguoQD9rxxcnki0wlvd
         DzYA==
X-Gm-Message-State: AOAM531M4nKsbfdkQD+BzvpKly+WehFvMnzxOdOwIlKYHbNPv9cEAoD/
        sojjhcK6d2GmeLoTeD9SrgQ=
X-Google-Smtp-Source: ABdhPJyPfEgLySzIcgD97mB22RFDByH3ihiCq4Sa0rTLX1HYtlfhh+50oXuL2mi1wdMQMq+yubr79A==
X-Received: by 2002:a17:902:bf04:b029:fd:7c7c:bbf3 with SMTP id bi4-20020a170902bf04b02900fd7c7cbbf3mr29016675plb.59.1622607350098;
        Tue, 01 Jun 2021 21:15:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a596:b3cb:1a6:1ee4])
        by smtp.gmail.com with ESMTPSA id lp13sm3331919pjb.0.2021.06.01.21.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 21:15:49 -0700 (PDT)
Date:   Tue, 1 Jun 2021 21:15:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2] MOUSE_ATARI: fix kconfig unmet dependency warning
Message-ID: <YLcF8k71w1mhN9OX@google.com>
References: <20210527001251.8529-1-rdunlap@infradead.org>
 <CAMuHMdWxBDM6za4_zPrkPGja8K6vy47gfdzYMNjJ-i1n1ySsHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWxBDM6za4_zPrkPGja8K6vy47gfdzYMNjJ-i1n1ySsHA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 08:56:30AM +0200, Geert Uytterhoeven wrote:
> On Thu, May 27, 2021 at 2:12 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > Since the code for ATARI_KBD_CORE does not use drivers/input/keyboard/
> > code, just move ATARI_KBD_CORE to arch/m68k/Kconfig.machine to remove
> > this dependency.
> >
> > Removes this kconfig warning:
> >
> > WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
> >   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
> >   Selected by [y]:
> >   - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]
> >
> > Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Michael Schmitz <schmitz@debian.org>
> > Cc: Roman Zippel <zippel@linux-m68k.org>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: linux-input@vger.kernel.org
> > Cc: linux-m68k@lists.linux-m68k.org
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Suggested-by: Michael Schmitz <schmitzmic@gmail.com>
> 
> > ---
> > v2: move the symbol outside of INPUT_KEYBOARD (Geert) -- all the way
> >     to Kconfig.machine (Michael). Thanks.
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> I'm willing to queue this in the m68k for-v5.14 branch, if Dmitry agrees.

Sure, works for me.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
