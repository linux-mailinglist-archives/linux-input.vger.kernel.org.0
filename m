Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125FE2B9C29
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 21:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgKSUiR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 15:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbgKSUiR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 15:38:17 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAB4C0613CF
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 12:38:17 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id m13so7557870ioq.9
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 12:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=uGxEdo4z2Fo09XFScVmizUN5EA7fGtySLAQoU+W7dgQ=;
        b=FPleixf4Zbst5C5Ap95xI1nx5ouzLB2J9vd8O3FT3Z0lnTlGVspoQQGWTr38g6ffTx
         swloyv3Jb/moN5QnGMUQsg8LYMlDNhFXUuGAnO4RWATcYn2Ebp7hcVcD6cW/LaXYKZyd
         vut4cMdxJswDJEkplg2HBspwOscdkGLrZJAUY2XuTiiYDdad9ZXYjP78a6iqtciTbKX4
         nsB8omnu0oIcSQrSLXuEI2j6wA6dFKl6ni5a4LWXgC8DRtrv5yYz5rDonTEMovIcbWt2
         u513eR5u0zkuy6I8PwoG6hMGGpWprwjYbCkMitT1+AUQKIdPxMyrhwkz0hyWtIGMtkwI
         andA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=uGxEdo4z2Fo09XFScVmizUN5EA7fGtySLAQoU+W7dgQ=;
        b=ji8MaUJNiCH5n+V8VoTXRkaBVQIiBH2tPQGl+DgAsnuqb5mQcS7aZ9Ppxi2TNwlurb
         RRTMQ7KN+cWilOIuXcrIXizSzkxioBfVLAkqXKMIleIl4Px0U7l2XXHKpQEoTpfDQt52
         f9A1DbM1DmpH1qQjilz+MhlICyd9SZJFFWQIlQeYeMj/Y+is6OHfFeuQLiNdjZgKmVaB
         GdMPDBbAbuZjVvBdnrF6nP2VDfs5ftMq7pmffW7Ui2/qmEjGxEfdilOO1g7wivWfmKIT
         IMNLQj2x6pjOuUj6m8/SyiSPexG1Aka8VJZt/H5RXZjZifdvDU/kCv3R4OF2XVmzHMFI
         W2lQ==
X-Gm-Message-State: AOAM531uVb7q8auPu0t0QDC60zjHiFYsd8piXn3o+nwd+PLAmISxDzlV
        ITQBkOCYK4azF/Ay10v1lElyQGlNg5R9nPYBFrxdgDTZOoVnyg==
X-Google-Smtp-Source: ABdhPJxFmDoQwtxVFyCUI9qNBR4wPJC+wifiybPsiBWIH+hUxA2YUmvEPJjO9LXg1uLf+hvXzw9tbe8XrT+xxD6PV9A=
X-Received: by 2002:a02:a30a:: with SMTP id q10mr14171308jai.16.1605818282756;
 Thu, 19 Nov 2020 12:38:02 -0800 (PST)
MIME-Version: 1.0
From:   Christopher Piggott <cpiggott@gmail.com>
Date:   Thu, 19 Nov 2020 15:37:51 -0500
Message-ID: <CANgRfonL-125j2pLkt+DpvZqEByr5vm1SSiRt1moLKPSWB_6Yg@mail.gmail.com>
Subject: Special eGalax driver for android to deal with affine transformations
 of touch surface
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I asked this question on the main kernel list, not realizing
linux-input existed - sorry.  Let me try this again.

I  have a touchscreen device that uses an egalax controller.  When it
starts up, it gets grabbed by hid-generic.  The basics work, but for
some reason a few manufacturers put the touch controller 90 degrees
out of whack with the actual display, so you have to do an affine
transform to rotate it either CW or CCW 90 degrees like this:

     abs_y = x
     abs_x = YMAX - y

The way I normally would fix this is all within xorg, but what I'm
doing right now is for android and I need to fix it up entirely in the
driver.  The trouble is, hid-generic grabs the device, and there's not
really a place in there (at least not that I can see) where I would
want to do this.

What I would like to do is make a replacement driver that can,
optionally, give you a place to poke in a transformation matrix -
perhaps into /sys somewhere, I think I know how to do this:

- I added an option to Kconfig called (for now) HID_EGALAX_CHRISP
- Modified drivers/hid/Makefile to add obj-${CONFIG_HID_EGALAX_CHRISP}
       += hid-egalax-chrisp.o
- Modified drivers/hid/hid-quirks.c such that this particular VID:PID
combination does not include HID_QUIRK_MULTI_INPUT
- Make a .config that turns that driver on

My template is basically the ALPS touch driver.  My driver is
basically empty right now.  It declares its interest in this specific
device:

   static const struct hid_device_id hid_device_table[] = {  {
HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, 0xeeef, 0x0001) }, { } };
   MODULE_DEVICE_TABLE(hid, hid_table);

and it declares a HID callback table that looks like this:

    static struct hid_driver hid_egalax_driver = {
            .name = "hid-egalax-chrisp",
            .id_table = hid_device_table,
            .input_mapping = egalax_input_mapping,
            .input_configured       = egalax_input_configured,
            .raw_event = egalax_raw_event,
            .probe = egalax_probe,
    };
    module_hid_driver(hid_egalax_driver);

All those functions just do printks so I can try to figure out what
it's doing then build up a real driver from there.

The problem I have is that even with all these declarations
hid-generic still grabs control of the device and none of my own
functions ever get called.

I have two questions here:

- What exactly is the procedure by which you tell the HID subsystem
"Don't use generic, I have a specific driver for this?"

- Is my overall approach here sound?   i.e. should I be adding
a quirk instead?  (Not all eGalaxy devices will be rotated, though,
so it would still have to someone be user-configurable)

--Chris
