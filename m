Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1E85C680
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 03:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbfGBBEV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 21:04:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:58523 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727047AbfGBBEV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Jul 2019 21:04:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jul 2019 18:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,441,1557212400"; 
   d="scan'208";a="184379133"
Received: from chenyu-office.sh.intel.com ([10.239.158.163])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2019 18:04:18 -0700
Date:   Tue, 2 Jul 2019 09:14:44 +0800
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
Message-ID: <20190702011443.GA19902@chenyu-office.sh.intel.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-2-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702003740.75970-2-luzmaximilian@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,
On Tue, Jul 02, 2019 at 02:37:39AM +0200, Maximilian Luz wrote:
> Do not use the surfacepro3_button driver on newer Microsoft Surface
> models, only use it on the Surface Pro 3 and 4. Newer models (5th, 6th
> and possibly future generations) use the same device as the Surface Pro
> 4 to represent their volume and power buttons (MSHW0040), but their
> acutal implementation is significantly different. This patch ensures
> that the surfacepro3_button driver is only used on the Pro 3 and 4
> models, allowing a different driver to bind on other models.
>
This method overall looks ok to me.
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/x86/surfacepro3_button.c | 38 +++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
> index 47c6d000465a..0e2c7dfafd9f 100644
> --- a/drivers/platform/x86/surfacepro3_button.c
> +++ b/drivers/platform/x86/surfacepro3_button.c
> @@ -20,6 +20,12 @@
>  #define SURFACE_BUTTON_OBJ_NAME		"VGBI"
>  #define SURFACE_BUTTON_DEVICE_NAME	"Surface Pro 3/4 Buttons"
>  
> +#define MSHW0040_DSM_REVISION		0x01
> +#define MSHW0040_DSM_GET_OMPR		0x02	// get OEM Platform Revision
> +static const guid_t MSHW0040_DSM_UUID =
> +	GUID_INIT(0x6fd05c69, 0xcde3, 0x49f4, 0x95, 0xed, 0xab, 0x16, 0x65,
> +		  0x49, 0x80, 0x35);
> +
>  #define SURFACE_BUTTON_NOTIFY_TABLET_MODE	0xc8
>  
>  #define SURFACE_BUTTON_NOTIFY_PRESS_POWER	0xc6
> @@ -142,6 +148,34 @@ static int surface_button_resume(struct device *dev)
>  }
>  #endif
>  
> +/*
> + * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
> + * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
> + * device by checking for the _DSM method and OEM Platform Revision.
> + */
> +static int surface_button_check_MSHW0040(struct acpi_device *dev)
> +{
> +	acpi_handle handle = dev->handle;
> +	union acpi_object *result;
> +	u64 oem_platform_rev = 0;
> +
> +	// get OEM platform revision
> +	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
> +					 MSHW0040_DSM_REVISION,
> +					 MSHW0040_DSM_GET_OMPR,
> +					 NULL, ACPI_TYPE_INTEGER);
> +
Does it mean, only 5th, 6th and newer platforms have OEM platform revision?
3rd/4th will get NULL result? Or the opposite?
> +	if (result) {
> +		oem_platform_rev = result->integer.value;
> +		ACPI_FREE(result);
> +	}
> +
> +	dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
> +
> +	return oem_platform_rev == 0 ? 0 : -ENODEV;
if 3rd/4th do not have this oem rev information while 5th/newer have,
why the latter returns NODEV(it actually has this info)?
> +}
> +
> +
>  static int surface_button_add(struct acpi_device *device)
>  {
>  	struct surface_button *button;
> @@ -154,6 +188,10 @@ static int surface_button_add(struct acpi_device *device)
>  	    strlen(SURFACE_BUTTON_OBJ_NAME)))
>  		return -ENODEV;
>  
> +	error = surface_button_check_MSHW0040(device);
> +	if (error)
> +		return error;
> +
ditto, 3rd/4th get error=0?
>  	button = kzalloc(sizeof(struct surface_button), GFP_KERNEL);
>  	if (!button)
>  		return -ENOMEM;
> -- 
> 2.22.0
> 
Best,
Yu
