Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFF21BD1C3
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 03:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgD2BgI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 21:36:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:16886 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgD2BgI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 21:36:08 -0400
IronPort-SDR: DKyDf+C7UwHMVrdLb0dCXUoHZNCAfbOgUMmksH9LMEIq/F/l3j0HwAHMfc0Ey0kOcFebO38NPw
 +NuIuYirRt1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 18:36:08 -0700
IronPort-SDR: Z9Ddv9+AOeUO8ugYlktzn19TYxlgniMZg2nWzHfJPzpxAnkXMQYG3kNcroPUzEzodp4kFtRU6K
 rlh8jJBLw+Cg==
X-IronPort-AV: E=Sophos;i="5.73,329,1583222400"; 
   d="scan'208";a="302867262"
Received: from spandruv-mobl.amr.corp.intel.com ([10.251.128.143])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 18:36:07 -0700
Message-ID: <2f526edc870a80ae87a824a1593507306eb05aeb.camel@linux.intel.com>
Subject: Re: [PATCH] hid: intel-ish-hid: avoid bogus uninitialized-variable
 warning
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nick Crews <ncrews@chromium.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 28 Apr 2020 18:36:07 -0700
In-Reply-To: <20200428215337.4094575-1-arnd@arndb.de>
References: <20200428215337.4094575-1-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-04-28 at 23:53 +0200, Arnd Bergmann wrote:
> Older compilers like gcc-4.8 don't see that the variable is
> initialized when it is used:
> 
> In file included from include/linux/compiler_types.h:68:0,
>                  from <command-line>:0:
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c: In function
> 'load_fw_from_host':
> include/linux/compiler-gcc.h:75:45: warning:
> 'fw_info.ldr_capability.max_dma_buf_size' may be used uninitialized
> in this function [-Wmaybe-uninitialized]
>  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix),
> __COUNTER__)
>                                              ^
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c:770:22: note:
> 'fw_info.ldr_capability.max_dma_buf_size' was declared here
>   struct shim_fw_info fw_info;
>                       ^
> 
> Make sure to initialize it before returning an error from
> ish_query_loader_prop().
> 
> Fixes: 91b228107da3 ("HID: intel-ish-hid: ISH firmware loader client
> driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>


> ---
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> index aa2dbed30fc3..6cf59fd26ad7 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> @@ -480,6 +480,7 @@ static int ish_query_loader_prop(struct
> ishtp_cl_data *client_data,
>  			    sizeof(ldr_xfer_query_resp));
>  	if (rv < 0) {
>  		client_data->flag_retry = true;
> +		*fw_info = (struct shim_fw_info){};
>  		return rv;
>  	}
>  
> @@ -489,6 +490,7 @@ static int ish_query_loader_prop(struct
> ishtp_cl_data *client_data,
>  			"data size %d is not equal to size of
> loader_xfer_query_response %zu\n",
>  			rv, sizeof(struct loader_xfer_query_response));
>  		client_data->flag_retry = true;
> +		*fw_info = (struct shim_fw_info){};
>  		return -EMSGSIZE;
>  	}
>  

