Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 494845C6C0
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 03:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfGBBq4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 21:46:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:23456 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbfGBBq4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Jul 2019 21:46:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jul 2019 18:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,441,1557212400"; 
   d="scan'208";a="165505063"
Received: from chenyu-office.sh.intel.com ([10.239.158.163])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jul 2019 18:46:52 -0700
Date:   Tue, 2 Jul 2019 09:57:17 +0800
From:   Yu Chen <yu.c.chen@intel.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2 1/2] platform: Fix device check for surfacepro3_button
Message-ID: <20190702015717.GA20346@chenyu-office.sh.intel.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-2-luzmaximilian@gmail.com>
 <20190702011443.GA19902@chenyu-office.sh.intel.com>
 <91349d00-e7e2-887b-45e5-4689a401aa2f@gmail.com>
 <d7e17f54-4c33-fa8d-be03-9e507da8e495@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7e17f54-4c33-fa8d-be03-9e507da8e495@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 02, 2019 at 03:33:20AM +0200, Maximilian Luz wrote:
> On 7/2/19 3:25 AM, Maximilian Luz wrote:
> > On 7/2/19 3:14 AM, Yu Chen wrote:
> > > On Tue, Jul 02, 2019 at 02:37:39AM +0200, Maximilian Luz wrote:
> > > > +/*
> > > > + * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
> > > > + * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
> > > > + * device by checking for the _DSM method and OEM Platform Revision.
> > > > + */
> > > > +static int surface_button_check_MSHW0040(struct acpi_device *dev)
> > > > +{
> > > > +    acpi_handle handle = dev->handle;
> > > > +    union acpi_object *result;
> > > > +    u64 oem_platform_rev = 0;
> > > > +
> > > > +    // get OEM platform revision
> > > > +    result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
> > > > +                     MSHW0040_DSM_REVISION,
> > > > +                     MSHW0040_DSM_GET_OMPR,
> > > > +                     NULL, ACPI_TYPE_INTEGER);
> > > > +
> > > Does it mean, only 5th, 6th and newer platforms have OEM platform revision?
> > > 3rd/4th will get NULL result? Or the opposite?
> > 
> > Correct, from my testing (with limited sample size) and AML code: 5th
> > and 6th generation devices have a non-zero OEM platform revision,
> > whereas 3rd and 4th gen. devices do not have any (i.e. result will be
> > NULL).
> > 
> > > > +    if (result) {
> > > > +        oem_platform_rev = result->integer.value;
> > > > +        ACPI_FREE(result);
> > > > +    }
> > > > +
> > > > +    dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
> > > > +
> > > > +    return oem_platform_rev == 0 ? 0 : -ENODEV;
> > > if 3rd/4th do not have this oem rev information while 5th/newer have,
> > > why the latter returns NODEV(it actually has this info)?
> > 
> > Since we always expect a non-zero platform revision (for 5th/6th gen.),
> > we can initialize it to zero and use that as "unknown"/"not available".
> > So if it can not be determined, we return NODEV.
> 
> Sorry, small mistake here: If it can be determined (i.e. is 5th or 6th
> gen.) then we return NODEV. Not the other way around.
>
How about using a boolean, according to the function name, if a mshw0040 revison
is detected then returns true other wise false. Other than that,
Acked-by: Chen Yu <yu.c.chen@intel.com>

Best,
Chenyu
> Also to clarify on your last question:
> 
> On 7/2/19 3:14 AM, Yu Chen wrote:
> > >   static int surface_button_add(struct acpi_device *device)
> > >   {
> > >   	struct surface_button *button;
> > > @@ -154,6 +188,10 @@ static int surface_button_add(struct acpi_device *device)
> > >   	    strlen(SURFACE_BUTTON_OBJ_NAME)))
> > >   		return -ENODEV;
> > > +	error = surface_button_check_MSHW0040(device);
> > > +	if (error)
> > > +		return error;
> > > +
> > ditto, 3rd/4th get error=0?
> 
> You are correct.
> 
> Maximilian
