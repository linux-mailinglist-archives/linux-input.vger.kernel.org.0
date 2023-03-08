Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3340D6B0E1F
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 17:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjCHQFn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 11:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbjCHQFX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 11:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9BE9744
        for <linux-input@vger.kernel.org>; Wed,  8 Mar 2023 08:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678291311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XISNUzBBCpQw9qCmD16wfk4bNgTWDc1iqenIgFH5QaY=;
        b=CJR3F3mW4GRlqyaU3kHyIR3/9Lsz998V8h3BNxG21f5LVLO1Ft/RtpL/UkXXVwU7RSp7UC
        NCmf7EcQOFNN0x0vO4AGhsn3s+KWXW3u6wMcW2ZO1aH61v4sMg4s5z9a5fgvZbSSHZcKiW
        aEqC/lM7hbGphpf+jxwo/Oivf1w3oho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-GlyyoOWcP8y_qjls5RLcuw-1; Wed, 08 Mar 2023 10:55:31 -0500
X-MC-Unique: GlyyoOWcP8y_qjls5RLcuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E458857D07;
        Wed,  8 Mar 2023 15:55:30 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.22.8.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4294A14171B6;
        Wed,  8 Mar 2023 15:55:29 +0000 (UTC)
Date:   Wed, 8 Mar 2023 16:55:27 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com>
References: <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
 <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mar 08 2023, Daniel Kaehn wrote:
> On Wed, Mar 8, 2023 at 9:26 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> > But if I refer "\\_SB_.PCI0.USB0.RHUB.CP21.GPIO", the IRQ is never assigned.
> > With the parent (CP21), it works.
> >
> > So I wonder if the cp2112 driver is correctly assigning the gc->parent
> > field.
> 
> 
> Did you make a change to the CP2112 driver patch to look for uppercase
> "I2C" and "GPIO"?

yes, sorry I should have mentioned it. This is the only modification I
have compared to the upstream kernel plus your patch series.

> Otherwise, it won't assign those child nodes appropriately, and the
> gpiochip code will use
> the parent node by default if the gpiochip's fwnode isn't assigned (I believe).

I don't think it's a fwnode issue, but a problem with the assignment of
the parent of the gc:
---
dev->gc.parent = &hdev->dev;
---

Because the function acpi_gpiochip_find() in drivers/gpio/gpiolib-acpi.c
compares the acpi handle returned by fetching the ACPI path
("\\_SB_.PCI0.USB0.RHUB.CP21.GPIO") and the one of gc->parent, which in
the hid-cp2112 case is the HID device itself.

> 
> If that was indeed your problem all along (and I'm not missing
> something else), sorry about that --
> I made a comment above, but didn't add much spacing around it to make
> it stand out (since I noticed you didn't reply to that part in your response)

Yeah, sorry I should have been explicit about this.

For reference, I am appending the full SSDT override which works.

Even if you don't have an i2c-hid device connected, this should at
least call the probe function in i2c-hid-core.c, which is a proof that
the ACPI binding is properly done (the first SMBus read will fail with a
timeout)

Also, I played around with the _DSD that Andy was mentioning (and some
others), hopefully this will help you getting the mapping from the
"cell-names" to the fwnode child index faster.

Cheers,
Benjamin

---
DefinitionBlock ("cp2112.aml", "SSDT", 5, "", "CP2112", 1)
{
  External (_SB_.PCI0, DeviceObj)

  Scope (\_SB_.PCI0)
  {
    Device (USB0)
    {
      Name (_ADR, 0x00010002) // _ADR: Address
      Device (RHUB)
      {
        Name (_ADR, Zero)
        Device (CP21) // the USB-hid & CP2112 shared node
        {
          Name (_ADR, One)
					Name (_DSD, Package ()
					{
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () { "cell-names", Package () {
									"i2c",
									"gpio",
								}
							}
						}
					})

          Device (I2C)
          {
            Name (_ADR, Zero)
            Name (_STA, 0x0F)
          }

          Device (GPIO)
          {
            Name (_ADR, One)
            Name (_STA, 0x0F)

            Name (_DSD, Package () {
              ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
              Package () {
                Package () { "gpio-hog", 1 },
                Package () { "gpios", Package () { 4, 0 } },
                Package () { "output-high", 1 },
                Package () { "line-name", "gpio4-pullup" },
              },
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
        }
      }
    }
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
          I2cSerialBusV2 (0x2c, ControllerInitiated, 100000,
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
      Name (_DSD, Package ()
      {
          ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
          Package ()
          {
              Package () { "irq-gpios", Package () { ^TPD0, 1, 0, 0 } },
          }
      })
      Method(_CRS, 0x0, NotSerialized)
      {
        Return (ConcatenateResTemplate (SBFG, SBFB))
      }

      Method(_DSM, 0x4, Serialized)
      {
        // DSM UUID
        switch (ToBuffer (Arg0))
        {
          // ACPI DSM UUID for HIDI2C
          case (ToUUID ("3CDFF6F7-4267-4555-AD05-B30A3D8938DE"))
          {
              // DSM Function
              switch (ToInteger (Arg2))
              {
                  // Function 0: Query function, return based on revision
                  case(0)
                  {
                      // DSM Revision
                      switch (ToInteger (Arg1))
                      {
                          // Revision 1: Function 1 supported
                          case (1)
                          {
                              Return (Buffer (One) { 0x03 })
                          }

                          default
                          {
                              // Revision 2+: no functions supported
                              Return (Buffer (One) { 0x00 })
                          }
                      }
                  }

                  // Function 1 : HID Function
                  case(1)
                  {
                      // HID Descriptor Address
                      Return (0x0020)
                  }

                  default
                  {
                      // Functions 2+: not supported
                      Return (Buffer (One) { 0x00 })
                  }
              }
          }

          default
          {
              // No other GUIDs supported
              Return (Buffer (One) { 0x00 })
          }
        }
      }
    }
  }
}
---

