Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819142FDB53
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 22:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389963AbhATUxz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 20 Jan 2021 15:53:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:46552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730347AbhATUuo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jan 2021 15:50:44 -0500
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7CB023600;
        Wed, 20 Jan 2021 20:50:01 +0000 (UTC)
Date:   Wed, 20 Jan 2021 20:49:57 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Zheng Yongjun <zhengyongjun3@huawei.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] hid/hid-sensor-custom: convert comma to semicolon
Message-ID: <20210120204824.0d52a2d2@archlinux>
In-Reply-To: <20201229181841.6d63213a@archlinux>
References: <20201214133212.3569-1-zhengyongjun3@huawei.com>
        <df1481e15c591106ba75ed85289b12507cbc8c49.camel@linux.intel.com>
        <20201229181841.6d63213a@archlinux>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 29 Dec 2020 18:18:41 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 14 Dec 2020 06:13:58 -0800
> Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> wrote:
> 
> > On Mon, 2020-12-14 at 21:32 +0800, Zheng Yongjun wrote:  
> > > Replace a comma between expression statements by a semicolon.
> > > 
> > > Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>    
> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>  
> Applied to the togreg branch of iio.git and pushed out as testing for
> the autobuilders to see if they can break it.
Hi Jiri,

Just realised this is in HID rather than IIO. I hope you don't mind as
it's now deep in a tree I'd rather not rebase.

Sorry about that.

Jonathan

> 
> Thanks,
> 
> Jonathan
> 
> >   
> > > ---
> > >  drivers/hid/hid-sensor-custom.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hid/hid-sensor-custom.c b/drivers/hid/hid-
> > > sensor-custom.c
> > > index 4d25577a8573..6c47a2e7623d 100644
> > > --- a/drivers/hid/hid-sensor-custom.c
> > > +++ b/drivers/hid/hid-sensor-custom.c
> > > @@ -728,7 +728,7 @@ static int hid_sensor_custom_dev_if_add(struct
> > > hid_sensor_custom *sensor_inst)
> > >  
> > >         sensor_inst->custom_dev.minor = MISC_DYNAMIC_MINOR;
> > >         sensor_inst->custom_dev.name = dev_name(&sensor_inst->pdev-    
> > > >dev);    
> > > -       sensor_inst->custom_dev.fops = &hid_sensor_custom_fops,
> > > +       sensor_inst->custom_dev.fops = &hid_sensor_custom_fops;
> > >         ret = misc_register(&sensor_inst->custom_dev);
> > >         if (ret) {
> > >                 kfifo_free(&sensor_inst->data_fifo);    
> > 
> >   
> 

