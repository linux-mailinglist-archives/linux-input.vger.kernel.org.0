Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095B144D511
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 11:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhKKKhl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 05:37:41 -0500
Received: from todd.t-8ch.de ([159.69.126.157]:60729 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhKKKhk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 05:37:40 -0500
Date:   Thu, 11 Nov 2021 11:34:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1636626890;
        bh=aBlydR7c5HlIpwugUVKyBf1SZBRGaTAtRZG6QBHMdmw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fY+DfBWPYJLdBHhxB8cJALXUSAedjVMjdwfAvrHQNw/Ou/YcjY23rITjQPBKij53I
         2XrsTkkoYDKBh+gK6kqpRHX4c+DvkKr+dsT8NlwMlohNqW1JJPONbvYIThVgPY5aTA
         i0LosUsgWbAM7Ks9/pvmXpU+02qLv21wNUKTmzz4=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] HID: intel-ish-hid: fix module device-id handling
Message-ID: <b87d00eb-1d89-4241-a631-1cb70ec7550e@t-8ch.de>
References: <20211111085842.2846422-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211111085842.2846422-1-arnd@kernel.org>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2021-11-11 09:56+0100, Arnd Bergmann wrote:
> A late addititon to the intel-ish-hid framework caused a build failure
> with clang, and introduced an ABI to the module loader that stops working
> if any driver ever needs to bind to more than one UUID:
> 
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c:1067:4: error: initializer element is not a compile-time constant
> 
> Change the ishtp_device_id to have correct documentation and a driver_data
> field like all the other ones, and change the drivers to use the ID table
> as the primary identification in a way that works with all compilers
> and avoids duplciating the identifiers.

I was not aware that the missing driver_data would actually be part of the ABI.
Thanks for noticing!

> Fixes: f155dfeaa4ee ("platform/x86: isthp_eclite: only load for matching devices")
> Fixes: facfe0a4fdce ("platform/chrome: chros_ec_ishtp: only load for matching devices")
> Fixes: 0d0cccc0fd83 ("HID: intel-ish-hid: hid-client: only load for matching devices")
> Fixes: 44e2a58cb880 ("HID: intel-ish-hid: fw-loader: only load for matching devices")
> Fixes: cb1a2c6847f7 ("HID: intel-ish-hid: use constants for modaliases")
> Fixes: fa443bc3c1e4 ("HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I did not see this reported on the list so far, but it has probably
> shown up in other build bots as well.

The warning/error was also reported by Nathan here:
https://lore.kernel.org/lkml/YYv22iWQ7yTfMNC5@archlinux-ax161/

> There are lots of ways to fix the warning, I picked this way to address
> the more urgent problem of fixing the mod_devicetable.h format before
> it is too late for that.
> ---
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c  | 19 ++++++++-----------
>  drivers/hid/intel-ish-hid/ishtp-hid-client.c | 19 ++++++++-----------
>  drivers/hid/intel-ish-hid/ishtp/bus.c        |  2 +-
>  drivers/platform/chrome/cros_ec_ishtp.c      | 19 ++++++++-----------
>  drivers/platform/x86/intel/ishtp_eclite.c    | 19 ++++++++-----------
>  include/linux/intel-ish-client-if.h          |  4 ++--
>  include/linux/mod_devicetable.h              |  5 +++--
>  7 files changed, 38 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ishtp_eclite.c b/drivers/platform/x86/intel/ishtp_eclite.c
> index b9fb8f28fd63..b2da3a4b3e1b 100644
> --- a/drivers/platform/x86/intel/ishtp_eclite.c
> +++ b/drivers/platform/x86/intel/ishtp_eclite.c
> @@ -93,9 +93,12 @@ struct ishtp_opregion_dev {
>  };
>  
>  /* eclite ishtp client UUID: 6a19cc4b-d760-4de3-b14d-f25ebd0fbcd9 */
> -static const guid_t ecl_ishtp_guid =
> -	GUID_INIT(0x6a19cc4b, 0xd760, 0x4de3,
> -		  0xb1, 0x4d, 0xf2, 0x5e, 0xbd, 0xf, 0xbc, 0xd9);
> +static const struct ishtp_device_id ecl_ishtp_id_table[] = {
> +	{ .guid = GUID_INIT(0x6a19cc4b, 0xd760, 0x4de3,
> +		  0xb1, 0x4d, 0xf2, 0x5e, 0xbd, 0xf, 0xbc, 0xd9), },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(ishtp, ecl_ishtp_id_table);
>  
>  /* ACPI DSM UUID: 91d936a7-1f01-49c6-a6b4-72f00ad8d8a5 */
>  static const guid_t ecl_acpi_guid =
> @@ -462,7 +465,7 @@ static int ecl_ishtp_cl_init(struct ishtp_cl *ecl_ishtp_cl)
>  	ishtp_set_tx_ring_size(ecl_ishtp_cl, ECL_CL_TX_RING_SIZE);
>  	ishtp_set_rx_ring_size(ecl_ishtp_cl, ECL_CL_RX_RING_SIZE);
>  
> -	fw_client = ishtp_fw_cl_get_client(dev, &ecl_ishtp_guid);
> +	fw_client = ishtp_fw_cl_get_client(dev, &ecl_ishtp_id_table[0].guid);
>  	if (!fw_client) {
>  		dev_err(cl_data_to_dev(opr_dev), "fw client not found\n");
>  		return -ENOENT;
> @@ -674,19 +677,13 @@ static const struct dev_pm_ops ecl_ishtp_pm_ops = {
>  
>  static struct ishtp_cl_driver ecl_ishtp_cl_driver = {
>  	.name = "ishtp-eclite",
> -	.guid = &ecl_ishtp_guid,
> +	.id = &ecl_ishtp_id_table,

This '&' should not be there.

drivers/platform/x86/intel/ishtp_eclite.c:680:15: error: initialization of ‘const struct ishtp_device_id *’ from incompatible pointer type ‘const struct ishtp_device_id (*)[2]’ [-Werror=incompatible-pointer-types]
  680 |         .id = &ecl_ishtp_id_table,
      |               ^
drivers/platform/x86/intel/ishtp_eclite.c:680:15: note: (near initialization for ‘ecl_ishtp_cl_driver.id’)

>  	.probe = ecl_ishtp_cl_probe,
>  	.remove = ecl_ishtp_cl_remove,
>  	.reset = ecl_ishtp_cl_reset,
>  	.driver.pm = &ecl_ishtp_pm_ops,
>  };
>  
> -static const struct ishtp_device_id ecl_ishtp_id_table[] = {
> -	{ ecl_ishtp_guid },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(ishtp, ecl_ishtp_id_table);
> -
>  static int __init ecl_ishtp_init(void)
>  {
>  	return ishtp_cl_driver_register(&ecl_ishtp_cl_driver, THIS_MODULE);

Thomas
