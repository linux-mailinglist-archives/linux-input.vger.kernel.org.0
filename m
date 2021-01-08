Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AC92EF1B4
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 12:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbhAHL7R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 06:59:17 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41483 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbhAHL7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 06:59:17 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AACD940009;
        Fri,  8 Jan 2021 11:58:35 +0000 (UTC)
Message-ID: <ef676ccf09452797730469500766a4ffc991c2dd.camel@hadess.net>
Subject: Re: Logitech M705 mouse not disappearing when turned off
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
Date:   Fri, 08 Jan 2021 12:58:35 +0100
In-Reply-To: <66a19853e1d9e3c0a404c7a65adc6fff6b177fb9.camel@hadess.net>
References: <c680fafd0d67bdca6ee114e542a0af99828acb83.camel@hadess.net>
         <66a19853e1d9e3c0a404c7a65adc6fff6b177fb9.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2021-01-08 at 12:42 +0100, Bastien Nocera wrote:
> On Fri, 2021-01-08 at 12:23 +0100, Bastien Nocera wrote:
> > Hey,
> > 
> > I have recently bought a Logitech Marathon Mouse/Performance Plus
> > M705,
> > and I ended up with 2 power_supply class batteries for it when it
> > was
> > turned off already when using kernel 5.9.13.
> > 
> > Using a newer kernel (5.11-rc2), the power_supply class device
> > doesn't
> > disappear either:
> > <snip>
> > I'll look into the upower problem soon.
> 
> Filed as:
> https://gitlab.freedesktop.org/upower/upower/-/issues/134

I actually don't think this is a bug. The docs for "online" mention:
"
Indicates if VBUS is present for the supply. When the supply is
online, and the supply allows it, then it's possible to switch
between online states (e.g. Fixed -> Programmable for a PD_PPS
USB supply so voltage and current can be controlled).
"

So this isn't really something we can use to signal that a device is
plugged in or not.

And the docs for "present" say:
"
Reports whether a battery is present or not in the system.
"

Well, that would mean that the device is there, but no battery is
present. eg. an XBox joypad without batteries but plugged in to the
system via USB.

Looks like a bug in the hidpp kernel code. This is what "solaar show"
shows for the device:
"
  3: Marathon Mouse M705 (M-R0073)
     Device path  : /dev/hidraw4
     WPID         : 406D
     Codename     : M705 (M-R0073)
     Kind         : mouse
     Protocol     : HID++ 4.5
     Polling rate : 8 ms (125Hz)
     Serial number: B14D65DA
     The power switch is located on the base.
     Battery: unknown (device is offline).
"

Cheers

