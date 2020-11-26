Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79C92C596C
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 17:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403841AbgKZQnN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 11:43:13 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56209 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730181AbgKZQnN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 11:43:13 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 737F520006;
        Thu, 26 Nov 2020 16:43:11 +0000 (UTC)
Message-ID: <f0a3e23f8e650b679fde299702685588b6cf54a3.camel@hadess.net>
Subject: Re: Support for Logitech g703 mouse battery levels
From:   Bastien Nocera <hadess@hadess.net>
To:     Max Illis <max@illis.uk>, linux-input@vger.kernel.org
Date:   Thu, 26 Nov 2020 17:43:10 +0100
In-Reply-To: <CAA5fPw=5SJvsYjoZDECAhHDe5XeLt-HmEvMrmgaeJ7hQMwHnRg@mail.gmail.com>
References: <CAA5fPw=5SJvsYjoZDECAhHDe5XeLt-HmEvMrmgaeJ7hQMwHnRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-11-26 at 15:57 +0000, Max Illis wrote:
> I raised a ticket on upower, but have been pointed here
> (https://gitlab.freedesktop.org/upower/upower/-/issues/125)
> 
> _Some_ info is reported:
> 
> ```
> /sys/class/power_supply/hidpp_battery_1$ ls
> device  manufacturer  online  powers  serial_number  subsystem 
> uevent
>       wakeup27
> hwmon3  model_name    power   scope   status         type      
> voltage_now
> ```
> But nothing is reported by upower apparently due to `capacity` or
> `capacity_level` missing


The voltage is output, but it's not interpreted, so it's impossible to
know what XX volts corresponds to as a battery level.

Hans, Benjamin, any ideas how this could be better handled? Are we
going to need voltage <-> capacity mapping?

Cheers

> 
> I'm running Ubuntu 20.10 Linux 5.8.0-29-generic
> 
> LMK if more info is needed
> Max
> 
> max@illis.uk
> 07803 009 004
> 
> max@illis.uk
> 07803 009 004


