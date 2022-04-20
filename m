Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C555083A8
	for <lists+linux-input@lfdr.de>; Wed, 20 Apr 2022 10:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356666AbiDTIoK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 20 Apr 2022 04:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiDTIoK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Apr 2022 04:44:10 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36043137C
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 01:41:24 -0700 (PDT)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 95A6BCF13F
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 08:38:48 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 5829B40004;
        Wed, 20 Apr 2022 08:38:42 +0000 (UTC)
Message-ID: <892475a2d458aa1e8f5027f13d6582f0f6b4b05e.camel@hadess.net>
Subject: Re: [PATCH] HID: wacom: Correct power_supply type
From:   Bastien Nocera <hadess@hadess.net>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Date:   Wed, 20 Apr 2022 10:38:41 +0200
In-Reply-To: <nycvar.YFH.7.76.2204111708230.30217@cbobk.fhfr.pm>
References: <20220407115406.115112-1-hadess@hadess.net>
         <nycvar.YFH.7.76.2204111708230.30217@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2022-04-11 at 17:08 +0200, Jiri Kosina wrote:
> On Thu, 7 Apr 2022, Bastien Nocera wrote:
> 
> > POWER_SUPPLY_TYPE_USB seems to only ever be used by USB ports that
> > are
> > used to charge the machine itself (so a "system" scope), like the
> > single USB port on a phone, rather than devices.
> > 
> > The wacom_sys driver is the only driver that sets its device
> > battery as
> > being a USB type, which doesn't seem correct based on its usage, so
> > switch it to be a battery type like all the other USB-connected
> > devices.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  drivers/hid/wacom_sys.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > index 066c567dbaa2..620fe74f5676 100644
> > --- a/drivers/hid/wacom_sys.c
> > +++ b/drivers/hid/wacom_sys.c
> > @@ -1777,7 +1777,7 @@ static int __wacom_initialize_battery(struct
> > wacom *wacom,
> >         bat_desc->get_property = wacom_battery_get_property;
> >         sprintf(battery->bat_name, "wacom_battery_%ld", n);
> >         bat_desc->name = battery->bat_name;
> > -       bat_desc->type = POWER_SUPPLY_TYPE_USB;
> > +       bat_desc->type = POWER_SUPPLY_TYPE_BATTERY;
> >         bat_desc->use_for_apm = 0;
> >  
> >         ps_bat = devm_power_supply_register(dev, bat_desc,
> > &psy_cfg);
> 
> Thanks Bastien, makes sense. CCing Jason and Ping (the Wacom driver 
> maintainers) to get their Ack.

Hey,

I know both Jason and Ping, but their name didn't show up when running
get_maintainers.pl and neither of their names are in the MAINTAINERS
file.

This probably needs fixing.

Cheers
