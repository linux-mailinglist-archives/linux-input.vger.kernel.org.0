Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968BA2EF442
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 15:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbhAHOzz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 09:55:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:50498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbhAHOzz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 09:55:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83170235FF;
        Fri,  8 Jan 2021 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610117714;
        bh=b371CPuhZ8sdWbGeXW8xhatSptW+DNr/MiaYoSUDTfo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=TrvvxQ9yDSdy4XMmsuqZvOuyHORPZXOZ4mwQf1Hozvl0k+hg8hc/QQ7ockGQU707A
         7FnkJFtzHpKYJ/SW3vHIDlwye9QFJA33EOPsaFLhL0gDj498YsGGtabRy1iVx4xVMk
         agNlmmeff1ksvNhVMm606vDTBMB2QRgRz4Hoj+Eo5tiw+6EHwIxFJpsc6nfkKr5Wdu
         tr9YgNfNCuVV5SK5CVZHzLaryh+w2S52L1AfAP5P4dD4U0ML+xbW36FgAtd/+Xhwq/
         PSehSPQlhNxk0Xjni9ab//Yaegw4hPs8xxqcxzFtUqb/xmN1eoLR2+lgfGy+MWYW79
         5o/aePNKIbKMg==
Date:   Fri, 8 Jan 2021 15:55:11 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
In-Reply-To: <e832278f9021c0f71afc5f90261bd17aea45a336.camel@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2101081554190.13752@cbobk.fhfr.pm>
References: <20210104182937.1472673-1-lains@archlinux.org>  <nycvar.YFH.7.76.2101081438530.13752@cbobk.fhfr.pm> <e832278f9021c0f71afc5f90261bd17aea45a336.camel@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 8 Jan 2021, Filipe Laíns wrote:

> > > -static int hidpp20_query_battery_info(struct hidpp_device *hidpp)
> > > +static int hidpp20_query_battery_info_1000(struct hidpp_device *hidpp)
> > 
> > That '_1000' suffix looks strange to me, as it's not completely obvious 
> > just from looking at the code what it actually means. Would it perhaps be 
> > more readable to call it something like hidpp20_query_battery_level(), and 
> > symmentrically change hidpp20_query_battery_info_1004() to e.g. 
> > hidpp20_query_battery_voltage() ?
> 
> The problem here is that hidpp20_query_battery_info_1004() does not set the
> battery voltage, it is also the battery level. The best alternative I can think
> of is replacing the 1000/1004 with slightly mangled HID++ feature names, like we
> do on the other feature function. The drawback here is that I think that could
> get confusing quickly.
> 
> hidpp20_batterylevel_query_battery_info()
> hidpp20_unifiedbattery_query_battery_info()
> 
> Note that this does not provide *that* much more information than the feature
> number, though it is probably the best option. What do you think?

Alright, what a mess :) Would it perhaps help if there is at least a short 
comment preceding the function definition, noting what the constants 
actually are?

> > [ ... snip ... ]
> > > +       /* if the device supports state of charge (battery percentage) we
> > > won't
> > > +          export the battery level information. there are 4 possible
> > > battery
> > > +          levels and they all are optional, this means that the device
> > > might
> > > +          not support any of them, we are just better off with the battery
> > > +          percentage. */
> > 
> > Could you please use standard kernel commenting style here?
> 
> Oops, sorry. Will do :)

Thanks,

-- 
Jiri Kosina
SUSE Labs

