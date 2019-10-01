Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2621C2D93
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 08:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbfJAGlg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 02:41:36 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52521 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbfJAGlg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Oct 2019 02:41:36 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so1902070wmh.2
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2019 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=k6qAJrWkJugJ+YyUVWwhzQnnSRT/IhjCBIC0PqWjhZc=;
        b=cbFiVcXSWYBflxC9W25SeEQySmTY13LMor81UTl+hDJNCN/MClkjr0C3HXHRqxtjnp
         ka9jopuu0cfxVmNUoWGpq4hU5TimpokAoV+maf7vGS9m66qAQk7RFQBq5KInXUGC8z4L
         goCM9g7369v856CrQdJVbytKbPxj+QBVClqw+SMs3AHyfKQWkxf0qw/okOmVrN1VRbBF
         4P+6NuoqeTw5abV+mRFJnUtp9tixR4UdxeqQdtOOCuFHwJMGBv0IiYjqVGlvtQdluXTR
         UtPAq2//ItvspYFR0LR9a634GT6tTrKHQz3a+idRXa0/lhbRV0Ik8INiUfGr23Sa/4Hs
         VZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=k6qAJrWkJugJ+YyUVWwhzQnnSRT/IhjCBIC0PqWjhZc=;
        b=EWBlCKlUKhatsLd4qt85yuDekLGEn/78UTpcKqzoDCcOKGahsS84gKZMTDrfjhm8lA
         faB6p5DYr8LirqxWPrMzH09UsCklUptUKVyxsaGnHTSUmsP//46i/f6ZQ24FgYz+6e50
         V5Sdm/IpFgywQD0ePBjCvzFf0V7W/NN0PhUXycfgoZXpwHFm3GGZJ7qk9jvS/iHvNCkj
         kqUwKkwpyPrG52Vbc9dEeqCOtOjL7+5nlG1pDAmBeJuUYfSBW0Qn/nllPewiTKTLHt4O
         lPk8Rqn+Ow1OPPpG4cnnIWdVaeTZZsALMtqvsDmMV84y8gFMZmblHB6rbC9KuBeCqdr6
         IP6g==
X-Gm-Message-State: APjAAAWSvFwlN4+CBHsXjtyzlWWqSuWgtyKCCF7USokxT3qiQ5/jfKbJ
        nbhPqBVaWKDic/CVkNeNNJpAQA==
X-Google-Smtp-Source: APXvYqyd5/xCoi4aJNPbWGQpM9k1bRxwu4LYRcxqpmwT/41TmMSserFaqUkyTLP0bdvSXYjCbSoXaw==
X-Received: by 2002:a05:600c:224e:: with SMTP id a14mr2181172wmm.174.1569912092996;
        Mon, 30 Sep 2019 23:41:32 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id o22sm39910169wra.96.2019.09.30.23.41.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 23:41:32 -0700 (PDT)
Date:   Tue, 1 Oct 2019 07:41:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/3] mfd: mc13xxx: Fixes and enhancements for NXP's
 mc34708
Message-ID: <20191001064130.GA11769@dell>
References: <20190909214440.30674-1-lukma@denx.de>
 <20190930095159.64e1001a@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190930095159.64e1001a@jawa>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 30 Sep 2019, Lukasz Majewski wrote:

> Dear Lee,
> 
> > This patch set provides several enhancements to mc13xxx MFD family
> > of devices by introducing mc34708 as a separate device.
> > 
> > This IC has dedicated pen detection feature, which allows better
> > touchscreen experience.
> > 
> > This is the fifth version of this code (v5).
> > Discussion regarding previous versions can be found here:
> > https://lkml.org/lkml/2018/4/12/351
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1661934.html
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1664296.html
> > https://lkml.org/lkml/2019/7/17/705
> 
> Gentle ping on this patch series. It is now 3 weeks without any reply...

Please take note and follow the kernel release cycle.

These patches were sent after the release of -rc7 i.e. very late
in the release cycle and a point where most kernel maintainers stop
reviewing/applying patches and start to prepare for the impending
merge-window.

Also, there is no such thing as a gentle ping.  If you genuinely think
your patches have unlikely("slipped though the gaps"), then post a
[RESEND] complete with a note alluding your reasons doing such.

> > Sascha Hauer (3):
> >   mfd: mc13xxx: Add mc34708 adc support
> >   input: touchscreen mc13xxx: Make platform data optional
> >   input: touchscreen mc13xxx: Add mc34708 support
> > 
> >  drivers/input/touchscreen/mc13783_ts.c | 63 ++++++++++++++---
> >  drivers/mfd/mc13xxx-core.c             | 98
> > +++++++++++++++++++++++++- include/linux/mfd/mc34708.h            |
> > 37 ++++++++++ 3 files changed, 185 insertions(+), 13 deletions(-)
> >  create mode 100644 include/linux/mfd/mc34708.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
