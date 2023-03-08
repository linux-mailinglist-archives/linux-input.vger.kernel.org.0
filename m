Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B646B0CA1
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 16:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbjCHP1K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 10:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjCHP1J (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 10:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAF0D08C9
        for <linux-input@vger.kernel.org>; Wed,  8 Mar 2023 07:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678289179;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wNXjpof/uhmqwmR/NRwY+puK+KCBcC0QzH+Z2A0E3EY=;
        b=RqY0G77jJQu14Q2IHe3XlbzRgwo653oKH79vfh4jHVrfUJx62Aw7F02Uy4DoD3CxEx9it7
        LQlvEEVFjSL7yUbcQR5c54+8QqKZjkPAFYoQWwB5AROrPJZ9G+sA/4R00yLHz+len3Eqij
        I/J8ndOn0fnicnQlRJEnmucayBAai/s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-TzB_dRZUPUGvj08tChEaHQ-1; Wed, 08 Mar 2023 10:26:16 -0500
X-MC-Unique: TzB_dRZUPUGvj08tChEaHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 587501C27D81;
        Wed,  8 Mar 2023 15:26:15 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.22.8.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C5614171C3;
        Wed,  8 Mar 2023 15:26:13 +0000 (UTC)
Date:   Wed, 8 Mar 2023 16:26:11 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
References: <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mar 07 2023, Andy Shevchenko wrote:
> On Tue, Mar 07, 2023 at 03:48:52PM +0100, Benjamin Tissoires wrote:
> > On Mar 07 2023, Daniel Kaehn wrote:
> 
> ...
> 
> > So I can see that the device gets probed, and that all ACPI resources
> > are tried to get the IRQ.
> > Right now, I see that it's attempting to bind to the acpi resource in
> > acpi_dev_resource_interrupt() (in file drivers/acpi/resources.c), but
> > instead of having a ACPI_RESOURCE_TYPE_EXTENDED_IRQ I only get a
> > ACPI_RESOURCE_TYPE_GPIO for the GpioInt() definition in the _CRS method.
> > 
> > So I am missing the proper transition from GpioInt to IRQ in the acpi.
> 
> I'm not sure I understand what this means.
> 
> The Linux kernel takes either Interrupt() resource (which is
> IOxAPIC / GIC / etc) or GpioInt() (which is GPIO based).
> 
> In both cases I²C framework submits this into client's IRQ field.
> 

I finally managed to get past the retrieval of the GpioInt.

Turns out that the function acpi_get_gpiod() matches on the parent of
the gpio_chip (gc->parent), which means that, with the current code and
my SSDT, it matches on the HID CP2112 ACPI node, not the GPIO one.

For reference (with lots of boiler plate removed):

        Device (CP21) { // the USB-hid & CP2112 shared node
         Device (GPIO) {
            Name (_ADR, One)
            Name (_STA, 0x0F)

            Name (_DSD, Package () {
              ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
              Package () {
                Package () { "gpio-line-names", Package () {
                            "",
                            "",
                            "irq-rmi4",
                            "",
                            "power", // set to 1 with gpio-hog above
                            "",
                            "",
                            "",
                            ""}},
              }
            })
         }

  Scope (\_SB_.PCI0.USB0.RHUB.CP21.I2C)
  {
    Device (TPD0)
    {
      Name (_HID, "RMI40001")
      Name (_CID, "PNP0C50")
      Name (_STA, 0x0F)

      Name (SBFB, ResourceTemplate ()
      {
          I2cSerialBusV2 (0x00c, ControllerInitiated, 100000,
              AddressingMode7Bit, "\\_SB_.PCI0.USB0.RHUB.CP21.I2C",
              0x00, ResourceConsumer,, Exclusive,
              )
      })
      Name (SBFG, ResourceTemplate ()
      {
          GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
              "\\_SB_.PCI0.USB0.RHUB.CP21", 0x00, ResourceConsumer, ,
              )
              {   // Pin list
                  0x0002
              }
      })
---

But if I refer "\\_SB_.PCI0.USB0.RHUB.CP21.GPIO", the IRQ is never assigned.
With the parent (CP21), it works.

So I wonder if the cp2112 driver is correctly assigning the gc->parent
field.

Cheers,
Benjamin

