Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78F0C22C2
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 16:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731660AbfI3OIq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 10:08:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730266AbfI3OIq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 10:08:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56D07215EA;
        Mon, 30 Sep 2019 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569852525;
        bh=Qaimm3xK760SjQE+/FlUBIK0YdcNY1zFd3sUKe50vVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eOelHGX5cHWGtgb+AY8hi2O+xPEOI6xp/ainsB+MrCvD7LjDlh9927kvRd7rNwKB5
         BtQ/CxvCnsPVWBfkTVlRu/V0rG6xlp5UMUMWLFf/Xa4zrrBrPQNZov3WY74jRVFAIq
         JufiIYO650QMCtHV9IVUhNnGdeGgaKm2+Bdy04S0=
Date:   Mon, 30 Sep 2019 10:21:34 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v5 0/3] mfd: mc13xxx: Fixes and enhancements for NXP's
 mc34708
Message-ID: <20190930082134.GB2036553@kroah.com>
References: <20190909214440.30674-1-lukma@denx.de>
 <20190930095159.64e1001a@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930095159.64e1001a@jawa>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 30, 2019 at 09:51:59AM +0200, Lukasz Majewski wrote:
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

It's the middle of the merge window, 2 weeks where we can't add any new
code to any of our trees.  Please give people a chance...

greg k-h
