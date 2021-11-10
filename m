Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4474444C540
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 17:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhKJQrE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 11:47:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:46590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229995AbhKJQrD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 11:47:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3601A61205;
        Wed, 10 Nov 2021 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636562656;
        bh=+KD0uJ2aB7eJaed+K7AZZWyM1PljfTbjc0UOLx5oQwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCuoIdz3rtrlenZb/iekEtbbVNoLUsF5Ph+BRZeFdlWQBTW83JegBac5JIZbzpG98
         6ftpT5J+cUO8WNdGhbbkwNAXULax0yQic2elPllzArXFmZAlcpxHfXzvlmYDKne+mC
         pP6pDZ5VvqXZlk0k9bpRMKs+UV4Ap7eItJFNAbJTjfDu5yXs/iOxVss4B2A6HbbBSi
         qjuVHu80iREW6lfVk3wzUXeNx4shH3kZlMc6C7s3YkH5YpW2ure4oTkrbe1WR4CiP2
         Lg844WNAkkzVaLEeDjLMOMJjgLSP737hdsyZb50zr9ApUA4J7EODueEppO2qprxjHs
         KO9Fgsl9YfT5w==
Date:   Wed, 10 Nov 2021 09:44:10 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>, llvm@lists.linux.dev
Subject: Re: [PATCH 5/6] platform/chrome: chros_ec_ishtp: only load for
 matching devices
Message-ID: <YYv22iWQ7yTfMNC5@archlinux-ax161>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <20211029152901.297939-3-linux@weissschuh.net>
 <20211029152901.297939-4-linux@weissschuh.net>
 <20211029152901.297939-5-linux@weissschuh.net>
 <20211029152901.297939-6-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211029152901.297939-6-linux@weissschuh.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 29, 2021 at 05:29:00PM +0200, Thomas Weiﬂschuh wrote:
> Previously it was loaded for all ISHTP devices.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> ---
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_ishtp.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
> index 9d1e7e03628e..8c17358e84c1 100644
> --- a/drivers/platform/chrome/cros_ec_ishtp.c
> +++ b/drivers/platform/chrome/cros_ec_ishtp.c
> @@ -774,6 +774,12 @@ static struct ishtp_cl_driver	cros_ec_ishtp_driver = {
>  	},
>  };
>  
> +static const struct ishtp_device_id cros_ec_ishtp_id_table[] = {
> +	{ cros_ish_guid },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(ishtp, cros_ec_ishtp_id_table);
> +
>  static int __init cros_ec_ishtp_mod_init(void)
>  {
>  	return ishtp_cl_driver_register(&cros_ec_ishtp_driver, THIS_MODULE);
> @@ -791,4 +797,3 @@ MODULE_DESCRIPTION("ChromeOS EC ISHTP Client Driver");
>  MODULE_AUTHOR("Rushikesh S Kadam <rushikesh.s.kadam@intel.com>");
>  
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("ishtp:*");
> -- 
> 2.33.1
> 
> 

This patch in -next as commit facfe0a4fdce ("platform/chrome:
chros_ec_ishtp: only load for matching devices") and the following one
as commit f155dfeaa4ee ("platform/x86: isthp_eclite: only load for
matching devices") break clang and GCC prior to 8.1 (output from
Debian's GCC 6.3.0 below):

$ make -skj"$(nproc)" distclean allmodconfig drivers/platform/
drivers/platform/chrome/cros_ec_ishtp.c:778:4: error: initializer element is not constant
  { cros_ish_guid },
    ^~~~~~~~~~~~~
drivers/platform/chrome/cros_ec_ishtp.c:778:4: note: (near initialization for 'cros_ec_ishtp_id_table[0].guid')
scripts/Makefile.build:288: recipe for target 'drivers/platform/chrome/cros_ec_ishtp.o' failed
make[4]: *** [drivers/platform/chrome/cros_ec_ishtp.o] Error 1
drivers/platform/x86/intel/ishtp_eclite.c:685:4: error: initializer element is not constant
  { ecl_ishtp_guid },
    ^~~~~~~~~~~~~~
drivers/platform/x86/intel/ishtp_eclite.c:685:4: note: (near initialization for 'ecl_ishtp_id_table[0].guid')

I am sure clang should be fixed to recognize this value as a compile
time constant but the kernel supports GCC back to 5.1.0 so this should
be fixed here as well.

Cheers,
Nathan
