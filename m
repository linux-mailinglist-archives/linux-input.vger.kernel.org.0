Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1850432B98
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 03:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhJSBxT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 21:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhJSBxS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 21:53:18 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F38C06161C;
        Mon, 18 Oct 2021 18:51:03 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id q19so16249682pfl.4;
        Mon, 18 Oct 2021 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W6zebBp3/cNSIFBEzhNaSJIA/kpiHyPX3FngvMDuHxo=;
        b=mxEzbJsEej7alf/c7Rqg6s6T4WIWccI+DcmnvVUDAph6F6Y5FvoP4siIha8GB8kWVx
         zdZazAOrr/Tzstf32iVCiAv9w0XbESc9RwbBn2Pn4Xv63ogmHKK5qsSNoPHybu3B7i5/
         GuABv+6FU7h4ihXMcsnvMaofKdtMtL/asG4x3k657hQlkg+ASiTRlCMZZQaygQCJoJID
         5tVoUgLW3A0uA7ZD3htTvu5uKSooT5XFUi6artYk7YOqXDRsC6QHd3+sa4W+/B0kBn+y
         d6FeaqYphYrTcaAFwolbrYtP+upPc5zEKG7X+ljaUno/eH/zAD1N6J0LjLdkRG+u14Du
         WOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W6zebBp3/cNSIFBEzhNaSJIA/kpiHyPX3FngvMDuHxo=;
        b=DgRoIEQfJuiWb1A/6Q04GevVzm96f8Tlp83B9ylnhcziHilM7ffLj4VH3o9jzFXCOV
         8viKcPzlWh8H/GGQxfpTBEgvmqMIhr6iqxbGNlpXT2A7WBatI7Mz32DqLqmB0+t4kBgv
         hQ0K00f+SrljnegitY5vmHPZXvYCkgTaCqypO+ttDgicEh7vuIYL07S1G6NWuqcLWST7
         XcJjTUv7cyKmMl7KswRiG9LSVlx7kXFGhYfs1AzziuhE2QEAcBSPZB8475RfG7iT48VO
         3pgIprNRr+iRQ49h/0WRtPo5MhKWF8Zg6iCPDK+6DDjZw/nDpSoAhc8Z4z0JbQZiI9lo
         ORow==
X-Gm-Message-State: AOAM530oSslYY2rDxMf0ww4U3vGzi590tPFhNL/tw6r6onC2oVAXpiZy
        wU+1wJJSPBInYId+rGUaJpY=
X-Google-Smtp-Source: ABdhPJxePafQXN6g/Am43IBKiWrAhRILmosNqIluLBb3Iskbn1+O/XcM76lOoVlEMOYgtNbf/vj9uQ==
X-Received: by 2002:a05:6a00:8c4:b0:44c:9827:16cc with SMTP id s4-20020a056a0008c400b0044c982716ccmr31991830pfu.7.1634608262345;
        Mon, 18 Oct 2021 18:51:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:54f8:9d9:1fa7:9eae])
        by smtp.gmail.com with ESMTPSA id y142sm14301966pfc.169.2021.10.18.18.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 18:51:01 -0700 (PDT)
Date:   Mon, 18 Oct 2021 18:50:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ping Cheng <pinglinux@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, alistair23@gmail.com
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the
 data values
Message-ID: <YW4kgnI0DQHj4sw4@google.com>
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ping,

On Mon, Oct 18, 2021 at 10:41:55AM -0700, Ping Cheng wrote:
> Hi Alistair,
> 
> On Sat, Oct 9, 2021, 4:44 AM Alistair Francis <alistair@alistair23.me>
> wrote:
> 
> > Add support to the Wacom HID device for flipping the values based on
> > device tree settings. This allows us to support devices where the panel
> > is installed in a different orientation, such as the reMarkable2.
> >
> 
> This device was designed for hid-generic driver, if it's not driven by
> wacom_i2c.c or an out of tree driver.
> 
> wacom.ko doesn't support vid 0x2d1f devices.

I am really confused about this distinction. Could you please elaborate
why wacom driver only supports 0x056a (and, curiously, some Lenovo)
devices.

Thanks.


> 
> Nacked-by: Ping Cheng <Ping.Cheng@wacom.com>
> 
> Sorry about that,
> Ping
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  .../bindings/input/hid-over-i2c.txt           | 20 ++++++
> >  drivers/hid/wacom_sys.c                       | 25 ++++++++
> >  drivers/hid/wacom_wac.c                       | 61 +++++++++++++++++++
> >  drivers/hid/wacom_wac.h                       | 13 ++++
> >  4 files changed, 119 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > index c76bafaf98d2..16ebd7c46049 100644
> > --- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > @@ -33,6 +33,26 @@ device-specific compatible properties, which should be
> > used in addition to the
> >  - post-power-on-delay-ms: time required by the device after enabling its
> > regulators
> >    or powering it on, before it is ready for communication.
> >
> > +  flip-tilt-x:
> > +    type: boolean
> > +    description: Flip the tilt X values read from device
> > +
> > +  flip-tilt-y:
> > +    type: boolean
> > +    description: Flip the tilt Y values read from device

Do these really need to be controlled separately from the main
touchcsreen orientation?

> > +
> > +  flip-pos-x:
> > +    type: boolean
> > +    description: Flip the X position values read from device
> > +
> > +  flip-pos-y:
> > +    type: boolean
> > +    description: Flip the Y position values read from device

We already have touchscreen-inverted-x/y defined in
Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
why are they not sufficient?

> > +
> > +  flip-distance:
> > +    type: boolean
> > +    description: Flip the distance values read from device

I am still confused of the notion of flipped distance.

> > +
> >  Example:
> >
> >         i2c-hid-dev@2c {
> > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > index 93f49b766376..47d9590b10bd 100644
> > --- a/drivers/hid/wacom_sys.c
> > +++ b/drivers/hid/wacom_sys.c
> > @@ -10,6 +10,7 @@
> >
> >  #include "wacom_wac.h"
> >  #include "wacom.h"
> > +#include <linux/of.h>
> >  #include <linux/input/mt.h>
> >
> >  #define WAC_MSG_RETRIES                5
> > @@ -2730,6 +2731,28 @@ static void wacom_mode_change_work(struct
> > work_struct *work)
> >         return;
> >  }
> >
> > +static void wacom_of_read(struct hid_device *hdev, struct wacom_wac
> > *wacom_wac)
> > +{
> > +       if (IS_ENABLED(CONFIG_OF)) {
> > +               wacom_wac->flip_tilt_x =
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-tilt-x");
> > +               wacom_wac->flip_tilt_y =
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-tilt-y");
> > +               wacom_wac->flip_pos_x =
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-pos-x");
> > +               wacom_wac->flip_pos_y =
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-pos-y");
> > +               wacom_wac->flip_distance =
> > of_property_read_bool(hdev->dev.parent->of_node,
> > +                                                       "flip-distance");
> > +       } else {
> > +               wacom_wac->flip_tilt_x = false;
> > +               wacom_wac->flip_tilt_y = false;
> > +               wacom_wac->flip_pos_x = false;
> > +               wacom_wac->flip_pos_y = false;
> > +               wacom_wac->flip_distance = false;
> > +       }
> > +}
> > +
> >  static int wacom_probe(struct hid_device *hdev,
> >                 const struct hid_device_id *id)
> >  {
> > @@ -2797,6 +2820,8 @@ static int wacom_probe(struct hid_device *hdev,
> >                                  error);
> >         }
> >
> > +       wacom_of_read(hdev, wacom_wac);
> > +
> >         wacom_wac->probe_complete = true;
> >         return 0;
> >  }
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > index 33a6908995b1..c01f683e23fa 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -3261,6 +3261,63 @@ static int wacom_status_irq(struct wacom_wac
> > *wacom_wac, size_t len)
> >         return 0;
> >  }
> >
> > +static int wacom_of_irq(struct wacom_wac *wacom_wac, size_t len)
> > +{
> > +       const struct wacom_features *features = &wacom_wac->features;
> > +       unsigned char *data = wacom_wac->data;
> > +       struct input_dev *input = wacom_wac->pen_input;
> > +       unsigned int x, y, pressure;
> > +       unsigned char tsw, f1, f2, ers;
> > +       short tilt_x, tilt_y, distance;
> > +
> > +       if (!IS_ENABLED(CONFIG_OF))
> > +               return 0;
> > +
> > +       tsw = data[1] & WACOM_TIP_SWITCH_bm;
> > +       ers = data[1] & WACOM_ERASER_bm;
> > +       f1 = data[1] & WACOM_BARREL_SWITCH_bm;
> > +       f2 = data[1] & WACOM_BARREL_SWITCH_2_bm;
> > +       x = le16_to_cpup((__le16 *)&data[2]);
> > +       y = le16_to_cpup((__le16 *)&data[4]);
> > +       pressure = le16_to_cpup((__le16 *)&data[6]);
> > +
> > +       /* Signed */
> > +       tilt_x = get_unaligned_le16(&data[9]);
> > +       tilt_y = get_unaligned_le16(&data[11]);
> > +
> > +       distance = get_unaligned_le16(&data[13]);

You are still parsing raw data. The point of HID is to provide common
framework for scaling raw values.

Thanks.

-- 
Dmitry
