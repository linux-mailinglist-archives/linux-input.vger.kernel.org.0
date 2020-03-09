Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8232817E574
	for <lists+linux-input@lfdr.de>; Mon,  9 Mar 2020 18:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgCIRMH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 13:12:07 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:46249 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgCIRMG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 13:12:06 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 56514240005;
        Mon,  9 Mar 2020 17:12:04 +0000 (UTC)
Message-ID: <952a2e46f202e405e1dea0d5f2ee317ab05b376f.camel@hadess.net>
Subject: Re: [PATCH v3 04/11] Input: goodix - Add support for getting IRQ +
 reset GPIOs on Cherry Trail devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 09 Mar 2020 18:12:03 +0100
In-Reply-To: <20200307121505.3707-4-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
         <20200307121505.3707-4-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.92 (3.35.92-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2020-03-07 at 13:14 +0100, Hans de Goede wrote:
> On most Cherry Trail (x86, UEFI + ACPI) devices the ACPI tables do
> not have
> a _DSD with a "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID, adding
> "irq-gpios" and "reset-gpios" mappings, so we cannot get the GPIOS by
> name
> without first manually adding mappings ourselves.
> 
> These devices contain 1 GpioInt and 1 GpioIo resource in their _CRS
> table:
> 
> Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> {
>     Name (RBUF, ResourceTemplate ()
>     {
>         I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         GpioInt (Edge, ActiveLow, Shared, PullDefault, 0x0000,
>             "\\_SB.GPO1", 0x00, ResourceConsumer, ,
>             )
>             {   // Pin list
>                 0x0013
>             }
>         GpioIo (Shared, PullDefault, 0x0000, 0x0000,
>             IoRestrictionOutputOnly,
>             "\\_SB.GPO1", 0x00, ResourceConsumer, ,
>             )
>             {   // Pin list
>                 0x0019
>             }
>     })
>     Return (RBUF) /* \_SB_.PCI0.I2C2.TCS1._CRS.RBUF */
> }
> 
> There is no fixed order for these 2. This commit adds code to check
> that
> there is 1 of each as expected and then registers a mapping matching
> their
> order using devm_acpi_dev_add_driver_gpios().
> 
> This gives us access to both GPIOs allowing us to properly suspend
> the
> controller during suspend, and making it possible to reset the
> controller
> if necessary.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Bastien Nocera <hadess@hadess.net>

