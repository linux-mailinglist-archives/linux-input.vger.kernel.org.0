Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1908A6AE032
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 14:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjCGNS6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 08:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjCGNSk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 08:18:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BDD166FD
        for <linux-input@vger.kernel.org>; Tue,  7 Mar 2023 05:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678195035;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W+ygoGubyf3twf0j32IrnMaEy5WCJEE/nnSufW1Ej/I=;
        b=asi8n62xlM2DF/uVyVFfhIn26f92lqBEP2BwHAfgDO1steR1v9A48xu0LxnZFOEZbKuMuU
        eNQRYj2hh4oWqGyFrD/PxDZ/ANtZ1ePq5Nqx+VhGg8tiNBF/ympPegF3irD1g00IxnY0cq
        H/v25mKTdR7i6cTl6Ho3HE9LXPm6XUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-4AyKS0rtPmyMhiJFgO1Mtg-1; Tue, 07 Mar 2023 08:17:10 -0500
X-MC-Unique: 4AyKS0rtPmyMhiJFgO1Mtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E38873813F23;
        Tue,  7 Mar 2023 13:17:09 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.22.8.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8A44010E7B;
        Tue,  7 Mar 2023 13:17:08 +0000 (UTC)
Date:   Tue, 7 Mar 2023 14:17:06 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Kaehn <kaehndan@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
References: <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
 <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mar 06 2023, Andy Shevchenko wrote:
> On Mon, Mar 06, 2023 at 01:40:16PM -0600, Daniel Kaehn wrote:
> 
> ...
> 
> > Device (SE9)
> > {
> >     Name (_ADR, 0x001D0001) // _ADR: Address
> >     Device (RHUB)
> >     {
> >         Name (_ADR, Zero)
> >         Device (CP2) // the USB-hid & CP2112 shared node
> >         {
> >             Name (_ADR, One)
> >         }
> >     }
> > }
> > 
> > If I'm understanding correctly, this adds the SE9 device as function 1
> > of PCI device 0x1d,
> 
> To be precise this does not add the device. It adds a description of
> the companion device in case the real one will appear on the PCI bus
> with BDF 00:1d.1.
> 
> > then RHUB as the USB controller it provides, and finally, CP2 as the
> > USB device attached to port 1 of the controller.
> > 
> > With this as the loaded dsdt table, the USB device now has a firmware_node :)
> > #> cat /sys/bus/usb/devices/3-1:1.0/firmware_node/path
> > \_SB_.PCI0.SE9_.RHUB.CP2_
> > 
> > After applying my patches, the HID device also references this node:
> > #> cat /sys/bus/hid/devices/0003:10C4:EA90.0003/firmware_node/path
> > \_SB_.PCI0.SE9_.RHUB.CP2_
> > 

Great! Thanks a lot for that. Turns out that with both of your inputs I
can also do the same, but without the need for OVMF and DSDT patching,
with just an SSDT override.

Turns out that the override documentation [1] mentions "This option
allows loading of user defined SSDTs from initrd and it is useful when
the system does not support EFI or ..."

FWIW, I am attaching my full DSDT override in case it is valuable:
(on my system, the default USB controller (non-xhc) is at PCI address
1.2, which explains the slight difference). It can be loaded in the same
way you are overriding the full DSDT, but with just that compilation
output:

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
          Device (I2C)
          {
            Name (_ADR, Zero)
            Name (_STA, 0x0F)
          }

          Device (GPIO)
          {
            Name (_ADR, One)
            Name (_STA, 0x0F)
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
          I2cSerialBusV2 (0x00c, ControllerInitiated, 100000,
              AddressingMode7Bit, "\\_SB_.PCI0.USB0.RHUB.CP21.I2C",
              0x00, ResourceConsumer,, Exclusive,
              )
      })
      Name (SBFG, ResourceTemplate ()
      {
          GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
              "\\_SB_.PCI0.USB0.RHUB.CP21.GPIO", 0x00, ResourceConsumer, ,
              )
              {   // Pin list
                  0x0002
              }
      })
      Method(_CRS, 0x0, NotSerialized)
      {
        Return (ConcatenateResTemplate (SBFB, SBFG))
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

This almost works. Almost because the I2C device is correctly created,
but I have an issue with the GpioInt call which is not properly set by
the kernel and which returns -EDEFER. /o\ 

> > With this all said -- I noticed iasl prints this statement when trying
> > to create a node with a lowercase name:
> > "At least one lower case letter found in NameSeg, ASL is case
> > insensitive - converting to upper case (GPIO)"
> 
> Yes, because it should be in the upper case.
> 
> > I wonder if this suggests that adding a call to toupper() to
> > acpi_fwnode_get_named_child_node would be
> > an appropriate solution for the node name casing issue....
> 
> I dunno. You need to ask in the linux-acpi@ mailing list.
> To me this is corner case that can't be easily solved
> (because two different specifications treat it differently.
> 
> You also need to ask DT people about capital letters there.
> And my guts tell me that it's probably also carved in the spec
> as "must be lower case" or alike.

FWIW while trying to enable this, at some point I named the I2C and the
GPIO entries "I2C0" and "GPI0" (with the number '0', not the letter
'o'), and it was not working as you would expect.

It is commonly accepted in the ACPI world that the names do not carry
meaning AFAICT, and so I think I agree with Andy's initial comment
regarding using indexes, not names to also fetch the I2C and GPIO nodes.
You can probably have a fallback mechanism for when "i2c" is not
present, or simply check if you are in DT or not and use the names only
if we are in DT.

Thanks a lot to both of you, this will be tremendously helpful to me.

Cheers,
Benjamin

[1] https://www.kernel.org/doc/html/latest/admin-guide/acpi/ssdt-overlays.html#loading-acpi-ssdts-from-initrd

