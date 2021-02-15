Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DED31B62A
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 10:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhBOJFg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 04:05:36 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:43259 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbhBOJFe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 04:05:34 -0500
Received: from [172.23.56.21] ([87.123.99.195]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M4JiJ-1lBqtU34fR-000HtR; Mon, 15 Feb 2021 10:02:50 +0100
Message-ID: <96cc49f2254a006f6a9501a3843c2a739a18a4b3.camel@richard-neumann.de>
Subject: Re: [PATCH 3/3] AMD_SFH: Add DMI quirk table for BIOS-es which
 don't set the activestatus bits
From:   Richard Neumann <mail@richard-neumann.de>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     linux-input@vger.kernel.org, Shyam-sundar.S-k@amd.com
Date:   Mon, 15 Feb 2021 10:02:48 +0100
In-Reply-To: <eac9fd4c-f3ea-1127-a59d-aaa01ca8e0bc@amd.com>
References: <20210128121219.6381-1-hdegoede@redhat.com>
         <20210128121219.6381-4-hdegoede@redhat.com>
         <eac9fd4c-f3ea-1127-a59d-aaa01ca8e0bc@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kMHKNIkwZdSIZDAxWfXumLMTBdTFWHsSVblLI433bROVZ7jB6tT
 moObVZ6DpQAIl1AeOz++65G9VWPLNniE+Humfjo7Z1jRHpI20tDm+W4+k+n3pNorhoQJwqo
 GOrhdX5l0E7KRDDy3C2R5ZCB9hPkDHHYq22sSKpZtSMFBz6A2pnIBNHr/SvGX0xrAo/ors7
 pr93IYpuvjKL1mJQeDSKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gQEYizHgu/0=:aGU2bGqA/PHjEqdZMEraYA
 UhGII1+45rcll7mDaZ3slzrfO2CytuoTF1tONguWWvmqPV/jF0q8Dz191/RACHW24scyIln+U
 EJPl32/5IDK77uPhPsrbY7qtng+W18JaNdSFgrRKPqqBWcNZscIwdiDVAWRYWS5fEMgcr3uXb
 Z5UPcvs/r6lLIy2rOdE1Q6i0WVXYIcSarEGnYVYWe35R0+jLNhgVLI+xRpeckpshhSOWdje84
 78CjMfljoJrjuZ9HPEMT3vt6VSm29sc8aWLVliCyjYv+LDFTXLgN8SsiL31CPYbzUhJA6oKy6
 EnD9pGJ360mDqMlCConAEwPWZ5HkENHHMJ1665Pk5BQg0FF1XoObvRy5aM3TQkEYpQPnQGmIx
 +IkUhIWR2xBKJuFMpA1lXWuQzulGAj6Jl2NUVQ7wJn1TvaCbI2v/20li23DVZV8AQ+D5oZl0a
 YCRZATiKEQ==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

My 13" model is a Raven-Ridge device:

$ grep -i model /proc/cpuinfo | head -2
model		: 17
model name	: AMD Ryzen 5 2500U with Radeon Vega Mobile Gfx

Since the accelerometer is also reported working on the 15" device, I'd
assume that the corresponding DMI record is also fine.

However, I don't know whether there are newer models on the market with
the same product names, which is why in my patch I used the board's
serial number for DMI matching instead.
This, however, seems unlikely since the series "13-ag0xxx" is included
in the product name, so we should be fine here.

Am Montag, dem 15.02.2021 um 13:54 +0530 schrieb Shah, Nehal-
bakulchandra:
> Hi Hans,
> On 1/28/2021 5:42 PM, Hans de Goede wrote:
> > Some BIOS-es do not initialize the activestatus bits of the
> > AMD_P2C_MSG3
> > register. This cause the AMD_SFH driver to not register any sensors
> > even
> > though the laptops in question do have sensors.
> > 
> > Add a DMI quirk-table for specifying sensor-mask overrides based on
> > DMI match, to make the sensors work OOTB on these laptop models.
> > 
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199715
> > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1651886
> > Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor
> > fusion hub")
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> > b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> > index ab0a9443e252..ddecc84fd6f0 100644
> > --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> > +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/bitops.h>
> >  #include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/dmi.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io-64-nonatomic-lo-hi.h>
> >  #include <linux/module.h>
> > @@ -77,11 +78,34 @@ void amd_stop_all_sensors(struct amd_mp2_dev
> > *privdata)
> >         writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
> >  }
> >  
> > +static const struct dmi_system_id dmi_sensor_mask_overrides[] = {
> > +       {
> > +               .matches = {
> > +                       DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360
> > Convertible 13-ag0xxx"),
> > +               },
> > +               .driver_data = (void *)(ACEL_EN | MAGNO_EN),
> > +       },
> > +       {
> > +               .matches = {
> > +                       DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360
> > Convertible 15-cp0xxx"),
> > +               },
> > +               .driver_data = (void *)(ACEL_EN | MAGNO_EN),
> > +       },
> > +       { }
> > +};
> > +
> >  int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8
> > *sensor_id)
> >  {
> >         int activestatus, num_of_sensors = 0;
> > +       const struct dmi_system_id *dmi_id;
> >         u32 activecontrolstatus;
> >  
> > +       if (sensor_mask_override == -1) {
> > +               dmi_id = dmi_first_match(dmi_sensor_mask_overrides);
> > +               if (dmi_id)
> > +                       sensor_mask_override = (long)dmi_id-
> > >driver_data;
> > +       }
> > +
> >         if (sensor_mask_override >= 0) {
> >                 activestatus = sensor_mask_override;
> >         } else {
> Can you please confirm that HP Envy x360  is whether ryzen 4000 (Renior
> based) series or ryzen 3000 (Raven based) series? As of now current
> upstream code does not have support for Ryzen 4000 series
> for which work is in progress. However, for Ryzen 3000 based series
> this patch looks fine and thanks for the contribution.
> 
> 
> Regards
> 
> Nehal
> 
> 


