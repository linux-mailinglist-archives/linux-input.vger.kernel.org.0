Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965062C004F
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgKWGxk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:53:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWGxk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:53:40 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C8DC0613CF;
        Sun, 22 Nov 2020 22:53:40 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 81so13372339pgf.0;
        Sun, 22 Nov 2020 22:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AqH+kLyfNSbRjDLKPT+SsIsj8+I7WO+7Bvg2fjY/Z0A=;
        b=comoGkzQSq1akMG2KJ1yCSrD9omTjuStH07ueYahOT3p63sAn/er4GTzVWll/kYSob
         RttxTru+pvJBIUCDKvP6UfOeMh8TmXN2cnTvSO7JU+VbARt9THgQTEt3O7YGM4oaVnme
         HXq8YD+EHHpw6UWla+ZutbEY8X7SVdmCpNJPKK3Vw9RAiPtGWZZbOq9EAgVyEMgyuMQk
         SeLhD6FfT0NKx0zs9hvLH8Yyd4Gy/GxVsqDYu5QLtSoTrKp9PJbCHX8db+cT7vwjJDF2
         2UDswjl1gbuX3YH1CfUWENk2PYaF5vq+zglEeYp5zhVzbveAkVA7YjqU+M2wWAl0N8ox
         c/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AqH+kLyfNSbRjDLKPT+SsIsj8+I7WO+7Bvg2fjY/Z0A=;
        b=uNmUWlOngJAl2VAwAGrI2NcqFHQQ2NpZThB0PTfd0iHaf7opAU2CtPUBgT3dN6EV2z
         zKhMwDtqxEJBYnfOTdHHYQnSYj+qbWWDnIKyyhmaoveXVQASqzz9xVliyj6iPRlFWMAF
         FZVqkIfB8/B5WfqM+rN5Xno+mBn2ru3HHIx5UvYDMFvdAuSpm6PtxN8JBFK6bLJ4ux54
         kBcJf36X11VLapeNuty0WfuCkcyLAnPPf2Q05GIJ9u8cxnMfzbf+rZjD9uLgxebv16Nl
         awkqc65WZU0e8pAPmdZJGoXrQ9Q+9gTILsSHtCJKYAux+SMJjMCIpdwGQcnd723PfNUl
         /wyA==
X-Gm-Message-State: AOAM53102ws7QfWyFC3cUFETag+VtUpEy8oWkqODQP54+j6ij++b7+XE
        JTDzuy26o1ivn9ExrIV0tGI=
X-Google-Smtp-Source: ABdhPJxlhqDP+WPcjP6wtxfCWA1hDSDeC7I4IiqEu8VeQwLU92AnH2VGwpeOUkRk2VvH3vLpfo5t2w==
X-Received: by 2002:a63:283:: with SMTP id 125mr5373383pgc.282.1606114419926;
        Sun, 22 Nov 2020 22:53:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m2sm9896986pgv.0.2020.11.22.22.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:53:38 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:53:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andrej Valek <andrej.valek@siemens.com>, nick@shmanahar.org,
        hadess@hadess.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: goodix - add option to disable firmware
 loading
Message-ID: <20201123065336.GC2034289@dtor-ws>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201029170313.25529-2-andrej.valek@siemens.com>
 <20201029203608.GE2547185@dtor-ws>
 <a5964429-a472-6b78-e53c-69b4cb115b94@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5964429-a472-6b78-e53c-69b4cb115b94@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 10:56:20AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 10/29/20 9:36 PM, Dmitry Torokhov wrote:
> > Hi Andrej,
> > 
> > On Thu, Oct 29, 2020 at 06:03:11PM +0100, Andrej Valek wrote:
> >> Firmware file loadind for GT911 controller takes too much time (~60s).
> >> There is no check that configuration is the same which is already present.
> >> This happens always during boot, which makes touchscreen unusable.
> >>
> >> Add there an option to prevent firmware file loading, but keep it enabled
> >> by default.
> > 
> > I thought that Goodix was losing firmware loading at poweroff. Is this
> > not the case with this model?
> 
> So first of all there are 2 sorts of firmware involved with the
> Goodix touchscreen controllers, the actual firmware and a block
> of config data for that firmware which I presume adjusts it for
> the specific (model of) the digitizer which is attached.
> 
> ATM the mainline Linux driver does not support models where
> the actual firmware itself needs to be loaded (because they
> only have RAM, so they come up without firmware).
> 
> I do have one model tablet with a ROM-less goodix touchpad
> controller, so if I ever find the time I might add support
> for loading the actual firmware.
> 
> So what we are talking about here is just loading the config
> data and I'm a bit surprised that this take so long.

So I am still confused about this: is the config stored in RAM or NVRAM?
I.e. do we actually need to re-load it every time on boot, or it
supposed to be flashed only when it is changed (or lost)?

Thanks.

-- 
Dmitry
