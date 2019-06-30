Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01F55AF2F
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2019 09:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3HSx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 03:18:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33016 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfF3HSx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 03:18:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id x15so5011449pfq.0;
        Sun, 30 Jun 2019 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L1zJ2W+96P13I/+gOzVIhzbXaF9vE8FnVg3sinlm8kw=;
        b=RfkjlSI+78cCByRJyNCQkZ9m0+2ScCsAj7a7yjXw+iKVXYU35+MSDQc5n70nhVJfq+
         4RL1UU+Fss+/gLVeiU2OyjAfsqgFBiVrQakal7tuo0zAJLKzj0TFvq1+JcvfY++qUSoe
         Xh7CnVH3PWL4nxzIxBxIfqLZP3vaULjeuZ3X7hxpHxHfIeA7duqRMFqSvGDPE6mt7pcu
         QWBC52vOAgn8kWyL4s73X7hlwlHJSFmFgAkMtChZ9Jc9dME7KEs94AN4ygMmFMvB3WgX
         8diNIhO0orMJAmWGX0pCVmIX94I6SiwefcH81W28WnvyMErzH+G1CUoTQalZl8iIjoa3
         3gOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L1zJ2W+96P13I/+gOzVIhzbXaF9vE8FnVg3sinlm8kw=;
        b=Swl1EvXA5bRzmixTmSAa7NLU3n+yrS/UZRJ+20C/ANNCFR2TYcvUV+klr8sO25cn8T
         8vaJ6L56XTvCHA6niSVzxJGGyoAK0qyfkTOWw6bNj0zeTnj1qXcLi0GmGbxbD8XIa9dT
         4PbTgFmH8fYDiYGxyO44itHKC/uk8n9Da+5AyY0AujWR3+yKlDGw2ztLtDpzxQ8bkUDH
         gejHIxcWzMu0eMMA714pflM0xK0Vd4pmuOGuBXfPsodk5GsZsJ8gpHaojCXrnZcvrvcH
         t/5xF6PIVbemknq0Cm2INQnOSS6Jcp2DFyd9hN1VV3T6uwX/vwgZa9WhDUyMuoh+668D
         KzCQ==
X-Gm-Message-State: APjAAAWeouiLZ94328IBAjk4vE9HOhwpq6vcAFgFNaO1ANDKE8HrHwMP
        FLcTF4FHVxgqTFsZJ2VWACg=
X-Google-Smtp-Source: APXvYqw/AYvmo+4cEzjA8UtFDO+cQHBLBzP1386VYzmO26ym583UvDi9cfABTn0zEKKl+5kbM0IHFA==
X-Received: by 2002:a63:c60b:: with SMTP id w11mr17431144pgg.356.1561879132310;
        Sun, 30 Jun 2019 00:18:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j2sm7736958pfn.135.2019.06.30.00.18.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 00:18:51 -0700 (PDT)
Date:   Sun, 30 Jun 2019 00:18:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, xnox@ubuntu.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 1/5] Input: elan_i2c: Export the device id whitelist
Message-ID: <20190630071849.GC91171@dtor-ws>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
 <20190621145042.38637-1-jeffrey.l.hugo@gmail.com>
 <20190623062000.GB204275@dtor-ws>
 <CAOCk7Nr4+Sj9U=qAZTEhPGgZNrZ1VVvNtuUg-9vQzp15xFdCUw@mail.gmail.com>
 <CAO-hwJLEDCbMud6dCfvXzwDfauAgfOZmQwkmELEF2e6-4Oe6=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJLEDCbMud6dCfvXzwDfauAgfOZmQwkmELEF2e6-4Oe6=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 27, 2019 at 04:29:29PM +0200, Benjamin Tissoires wrote:
> On Thu, Jun 27, 2019 at 4:02 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Sun, Jun 23, 2019 at 12:20 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Fri, Jun 21, 2019 at 07:50:42AM -0700, Jeffrey Hugo wrote:
> > > > Elan_i2c and hid-quirks work in conjunction to decide which devices each
> > > > driver will handle.  Elan_i2c has a whitelist of devices that should be
> > > > consumed by hid-quirks so that there is one master list of devices to
> > > > handoff between the drivers.  Put the ids in a header file so that
> > > > hid-quirks can consume it instead of duplicating the list.
> > > >
> > > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > >
> > > Benjamin, are you happy with this version?
> >
> > Benjamin, ping?
> > Sorry to be a bother, but I'm still anxious to get this queued for 5.3.
> 
> Ooops, yeah, sorry I missed Dmitry's email.
> 
> Fine by me:
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Applied, thank you.

-- 
Dmitry
