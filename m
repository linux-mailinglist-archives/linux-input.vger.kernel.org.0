Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A728F31BA6B
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 14:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhBONfE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 08:35:04 -0500
Received: from lists.nic.cz ([217.31.204.67]:40690 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230218AbhBONcu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 08:32:50 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 06030140A94;
        Mon, 15 Feb 2021 14:31:45 +0100 (CET)
Date:   Mon, 15 Feb 2021 14:31:44 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, dmitry.torokhov@gmail.com,
        pobm@protonmail.com, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
Message-ID: <20210215143144.060fdbe6@nic.cz>
In-Reply-To: <20210215004549.135251-2-roderick@gaikai.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
        <20210215004549.135251-2-roderick@gaikai.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 14 Feb 2021 16:45:46 -0800
Roderick Colenbrander <roderick@gaikai.com> wrote:

> +	led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstation::%pMR::rgb",
> +			ps_dev->mac_address);
...
> +	ret = devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc_dev);

The LED subsystem has a predefined schema by which LED names should
look like:
  devicename:color:function
(Not all fields are required, but the order must be preserved. The ':'
 character should be used only as separator of these fields, so not MAC
 addresses in these names, it will confuse userspace parsers.)
See Documentation/leds/leds-class.rst

The devicename part should not be "playstation". It should be something
otherwise recognizable from userspace. For example an mmc indicator has
devicename "mmc0", keyboard capslock LED can have devicename "input0"...

In your case the name should be something like:
  input3:rgb:indicator

Different existing functions are defined in
include/dt-bindings/leds/common.h.

BTW there are extended versions of LED registering functions, suffixed
by "_ext". These accept a struct led_init_data. If a fwnode of the LED
is passed to the registering function via this struct, the LED core
will compose a name for the LED itself. But since your LEDs don't have
device-tree nodes because they are on USB/BlueTooth joysticks, you
either have to compose the name itself like your code is doing now, or
you can propose a patch to the LED core, so that LED core will be able
to compose the LED name even without a device-tree node.

JFI, the function part is (in the future) supposed to somehow define LED
trigger which the system will assign to the LED on probe, but this is
not implemented yet. Currently when the LED has a devicetree node,
the trigger is assigned from the `linux,default-trigger` property, but
the idea is to infer it from the `function` property.

What is this RGB LED supposed to do on the joystick? Is it just for
nice colors? Or should it blink somehow? Can the hardware in the
joystick blink the LED itself? Or maybe fade between colors?

There is for example the pattern LED trigger which changes the LED
brightness by a defined pattern. I am planning to add multicolor
support to this trigger, because our RGB LED controller can offload
such thing to hardware.

Marek
