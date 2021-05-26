Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32963391524
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhEZKlL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:41:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234050AbhEZKlF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:41:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B089613D3;
        Wed, 26 May 2021 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622025574;
        bh=XkkR+3D/FW9VYxBOYTi3kuPLSQb/fFmFtNWeOGh98uU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=bGJcvcujacwa2IPyL5izJYMIWtVxwBpUeou1i8mqK/XXq7Y52M3LW71d+rogG8ZXi
         nSzo3U58Io9VJ/eYtQ/JE/lNguf+UXD8UeG3/uX96fMFlBbR2zw/HtlkPZ6scJIpKo
         0M/u6PGuxw4QwVAlqYPItzDwjmR9zuC2lBxBPv/nC3kq/v8tWaVtXLkifJOhbZ1z0P
         O5FY0RiH8W8zgaKiXe91N7cc6SAhF5tOJMQaFZeuNNtfit8xP92bXGbwzBL+zcIkdv
         Nj4dYAoWfCsFmqdN4WZTTklN2IhX5ZV2m2mXDxEct3Rck4NcJns7uiHoapcrIDO1PN
         genHFjPxf2rhQ==
Date:   Wed, 26 May 2021 12:39:31 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>
cc:     trix@redhat.com, benjamin.tissoires@redhat.com,
        pedro@pedrovanzella.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: initialize level variable
In-Reply-To: <a81900062b1e517ea20ecbf9324ddaf33e15f262.camel@riseup.net>
Message-ID: <nycvar.YFH.7.76.2105261239240.28378@cbobk.fhfr.pm>
References: <20210507191819.71092-1-trix@redhat.com> <a81900062b1e517ea20ecbf9324ddaf33e15f262.camel@riseup.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 16 May 2021, Filipe Laíns wrote:

> > Static analysis reports this representative problem
> > 
> > hid-logitech-hidpp.c:1356:23: warning: Assigned value is
> >   garbage or undefined
> >         hidpp->battery.level = level;
> >                              ^ ~~~~~
> > 
> > In some cases, 'level' is never set in hidpp20_battery_map_status_voltage()
> > Since level is not available on all hw, initialize level to unknown.
> > 
> > Fixes: be281368f297 ("hid-logitech-hidpp: read battery voltage from newer
> > devices")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/hid/hid-logitech-hidpp.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-
> > hidpp.c
> > index 69670ca7e1e1..61635e629469 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -1265,6 +1265,7 @@ static int hidpp20_battery_map_status_voltage(u8
> > data[3], int *voltage,
> >         int status;
> >  
> >         long flags = (long) data[2];
> > +       *level = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
> >  
> >         if (flags & 0x80)
> >                 switch (flags & 0x07) {
> 
> Hi Tom,
> 
> Taking a look at how this function is used, it does make sense to initialize the
> level, thank you :)
> 
> Reviewed-by: Filipe Laíns <lains@riseup.net>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

