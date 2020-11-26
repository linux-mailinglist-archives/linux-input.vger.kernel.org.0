Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6FA2C5C20
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 19:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404774AbgKZSqy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 13:46:54 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54591 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404752AbgKZSqy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 13:46:54 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EEDF720003;
        Thu, 26 Nov 2020 18:46:51 +0000 (UTC)
Message-ID: <992fe59c8da939e1adae51c8e6a52812da05e700.camel@hadess.net>
Subject: Re: Support for Logitech g703 mouse battery levels
From:   Bastien Nocera <hadess@hadess.net>
To:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>,
        Max Illis <max@illis.uk>, linux-input@vger.kernel.org
Date:   Thu, 26 Nov 2020 19:46:51 +0100
In-Reply-To: <ef254031acfe25c2fccb1fb724fc7889117e451e.camel@archlinux.org>
References: <CAA5fPw=5SJvsYjoZDECAhHDe5XeLt-HmEvMrmgaeJ7hQMwHnRg@mail.gmail.com>
         <f0a3e23f8e650b679fde299702685588b6cf54a3.camel@hadess.net>
         <ef254031acfe25c2fccb1fb724fc7889117e451e.camel@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-11-26 at 18:40 +0000, Filipe Laíns wrote:
> On Thu, 2020-11-26 at 17:43 +0100, Bastien Nocera wrote:
> > On Thu, 2020-11-26 at 15:57 +0000, Max Illis wrote:
> > > I raised a ticket on upower, but have been pointed here
> > > (https://gitlab.freedesktop.org/upower/upower/-/issues/125)
> > > 
> > > _Some_ info is reported:
> > > 
> > > ```
> > > /sys/class/power_supply/hidpp_battery_1$ ls
> > > device  manufacturer  online  powers  serial_number  subsystem 
> > > uevent
> > >       wakeup27
> > > hwmon3  model_name    power   scope   status         type      
> > > voltage_now
> > > ```
> > > But nothing is reported by upower apparently due to `capacity` or
> > > `capacity_level` missing
> > 
> > 
> > The voltage is output, but it's not interpreted, so it's impossible
> > to
> > know what XX volts corresponds to as a battery level.
> > 
> > Hans, Benjamin, any ideas how this could be better handled? Are we
> > going to need voltage <-> capacity mapping?
> > 
> > Cheers
> > 
> > > 
> > > I'm running Ubuntu 20.10 Linux 5.8.0-29-generic
> > > 
> > > LMK if more info is needed
> > > Max
> > > 
> > > max@illis.uk
> > > 07803 009 004
> > > 
> > > max@illis.uk
> > > 07803 009 004
> > 
> > 
> 
> Relevant UPower issue: 
> https://gitlab.freedesktop.org/upower/upower/-/issues/110
> 
> Logitech gave us permission to use the battery curve in OSS software,
> I can get
> it from them.

But where's that "battery curve"? If we need to put it somewhere, it
would be incredibly useful to actually know what it looks like.

(And it looks like it's what I asked 9 months ago as well :/
https://gitlab.freedesktop.org/upower/upower/-/issues/110#note_411028
)

> 
> The issue is where to put it. I am not sure Benjamin would be happy
> with
> embedding it in the kernel driver. I think knowing that was been the
> blocking
> factor, although I did not do a good job trying to following it up.
> 
> Cheers,
> Filipe Laíns


