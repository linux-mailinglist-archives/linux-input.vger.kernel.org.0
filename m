Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737FC2DEDDC
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 09:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgLSIiz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 03:38:55 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47895 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgLSIiz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 03:38:55 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C4F12E0002;
        Sat, 19 Dec 2020 08:38:12 +0000 (UTC)
Message-ID: <780add5d3010039df5a8f639ca47816b39af7304.camel@hadess.net>
Subject: Re: [PATCH 00/13] HID: new driver for PS5 'DualSense' controller
From:   Bastien Nocera <hadess@hadess.net>
To:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Date:   Sat, 19 Dec 2020 09:38:11 +0100
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Roderick,

On Fri, 2020-12-18 at 22:23 -0800, Roderick Colenbrander wrote:
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> 
> Hi,
> 
> I am pleased to share a new Linux driver for the PlayStation 5
> 'DualSense'
> game controller. The driver supports the DualSense in both Bluetooth
> and USB modes. Most controller features are supported including LEDs,
> Touchpad, Motion Sensors and Rumble.

Excellent, this is a nice early holiday present :)
I've just received a DualSense controller so I'll try to test this in
the coming days.

> DualSense supported is implemented in a new 'hid-playstation' driver,

"hid-sony-playstation"? Not sure how much the input/hid tree
maintainers will want to force this, but the same problem is going to
show up for the hid-based XBox controller driver (hid-xbox, or hid-
microsoft-xbox?) as hid-microsoft is as busy as hid-sony.

> which
> will be used for peripherals by 'Sony Interactive Entertainment'
> (PlayStation).
> Hid-sony will be used for devices for the larger Sony Group. We
> intend to
> migrate existing devices over time gradually to hid-playstation. We
> do not
> want to cause any regressions and maintain quality. As such moving
> forward,
> unit tests are important and we started by providing these through
> 'hid-tools'
> including DualSense.

I know it's not your job to handle those, but be careful with not
breaking the clone controllers. Plenty of folks use them, for better or
for worse.

> 
> The Linux driver exposes DualSense functionality as a 'compositive
> device'
> similar to DualShock 4 in hid-sony, spanning multiple frameworks.
> First,
> it exposes 3 evdev nodes for respectively the 'gamepad', 'touchpad'
> and
> 'motion sensors'. The FF framework is used to provide basic rumble
> features.
> The leds-class is used to implement the Player indicator LEDs below
> the
> DualSense's touchpad, while the new 'leds-class-multicolor' is used
> for
> the lightbars next to the touchpad.
> 
> Not yet supported are new unique features introduced by the DualSense
> such as Adaptive Triggers and the VCM based Haptics. These features
> require
> a large amount of data and complex data structures. It is not clear
> how to
> expose these. The current Evdev and FF frameworks are too limiting.
> We hope
> to have a dialog on how to expose these over time in a generic way.
> 
> Enjoy the new DualSense driver and let us know if you have any
> questions
> or feedback.

Is the audio jack on the controller already supported, or would that be
part of the features that aren't supported yet?

Do you think you might be able to share the information regarding how
the cable pairing is done, so we can add this support to bluez? I'm
fine with only sharing the implementation if you prefer to give me the
details privately (or through my employer).

Cheers

