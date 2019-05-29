Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041CC2D37A
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 03:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfE2Bok (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 21:44:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:32994 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbfE2Bok (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 21:44:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 May 2019 18:44:39 -0700
X-ExtLoop1: 1
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by fmsmga007.fm.intel.com with ESMTP; 28 May 2019 18:44:39 -0700
Message-ID: <03654457d996c839e8f91bf329819defd8726a14.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Hyungwoo Yang <hyungwoo.yang@intel.com>
Cc:     jikos@kernel.org, linux-input@vger.kernel.org
Date:   Tue, 28 May 2019 18:44:38 -0700
In-Reply-To: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
References: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2019-05-28 at 14:36 -0700, Hyungwoo Yang wrote:
> "struct device" is embedded in "struct ishtp_cl_device".
> so the conversion should be done by container_of() method.
Which tree this patch is going to? You can't even apply on the mainline
tree (5.2-rc2). Also you will not be able to compile even if you
address the conflict (The patch ordering is wrong). 

What was symptom or problem you try to address? Is there any crash or
bug occurred? Does it happen with the mainline kernel?


> 
> Change-Id: Idcbafe724e216ee6275f9d1e35a3b79cee5ce88c
This tells me that you are trying to fix some Chrome issue. Don't
include these tags for mainline kernel.

Thanks,
Srinivas

> Signed-off-by: Hyungwoo Yang <hyungwoo.yang@intel.com>
> ---
>  drivers/hid/intel-ish-hid/ishtp-hid-client.c | 4 ++--
>  drivers/platform/chrome/cros_ec_ishtp.c      | 4 ++--
>  include/linux/intel-ish-client-if.h          | 1 +
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> index 56777a4..19102a3 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> @@ -899,7 +899,7 @@ static int hid_ishtp_cl_reset(struct
> ishtp_cl_device *cl_device)
>   */
>  static int hid_ishtp_cl_suspend(struct device *device)
>  {
> -	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +	struct ishtp_cl_device *cl_device =
> ishtp_dev_to_cl_device(device);
>  	struct ishtp_cl *hid_ishtp_cl = ishtp_get_drvdata(cl_device);
>  	struct ishtp_cl_data *client_data =
> ishtp_get_client_data(hid_ishtp_cl);
>  
> @@ -920,7 +920,7 @@ static int hid_ishtp_cl_suspend(struct device
> *device)
>   */
>  static int hid_ishtp_cl_resume(struct device *device)
>  {
> -	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +	struct ishtp_cl_device *cl_device =
> ishtp_dev_to_cl_device(device);
>  	struct ishtp_cl *hid_ishtp_cl = ishtp_get_drvdata(cl_device);
>  	struct ishtp_cl_data *client_data =
> ishtp_get_client_data(hid_ishtp_cl);
>  
> diff --git a/drivers/platform/chrome/cros_ec_ishtp.c
> b/drivers/platform/chrome/cros_ec_ishtp.c
> index e504d25..430731c 100644
> --- a/drivers/platform/chrome/cros_ec_ishtp.c
> +++ b/drivers/platform/chrome/cros_ec_ishtp.c
> @@ -707,7 +707,7 @@ static int cros_ec_ishtp_reset(struct
> ishtp_cl_device *cl_device)
>   */
>  static int __maybe_unused cros_ec_ishtp_suspend(struct device
> *device)
>  {
> -	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +	struct ishtp_cl_device *cl_device =
> ishtp_dev_to_cl_device(device);
>  	struct ishtp_cl	*cros_ish_cl = ishtp_get_drvdata(cl_device);
>  	struct ishtp_cl_data *client_data =
> ishtp_get_client_data(cros_ish_cl);
>  
> @@ -722,7 +722,7 @@ static int __maybe_unused
> cros_ec_ishtp_suspend(struct device *device)
>   */
>  static int __maybe_unused cros_ec_ishtp_resume(struct device
> *device)
>  {
> -	struct ishtp_cl_device *cl_device = dev_get_drvdata(device);
> +	struct ishtp_cl_device *cl_device =
> ishtp_dev_to_cl_device(device);
>  	struct ishtp_cl	*cros_ish_cl = ishtp_get_drvdata(cl_device);
>  	struct ishtp_cl_data *client_data =
> ishtp_get_client_data(cros_ish_cl);
>  
> diff --git a/include/linux/intel-ish-client-if.h
> b/include/linux/intel-ish-client-if.h
> index 16255c2..0d6b4bc 100644
> --- a/include/linux/intel-ish-client-if.h
> +++ b/include/linux/intel-ish-client-if.h
> @@ -103,6 +103,7 @@ int ishtp_register_event_cb(struct
> ishtp_cl_device *device,
>  void ishtp_get_device(struct ishtp_cl_device *cl_dev);
>  void ishtp_set_drvdata(struct ishtp_cl_device *cl_device, void
> *data);
>  void *ishtp_get_drvdata(struct ishtp_cl_device *cl_device);
> +struct ishtp_cl_device *ishtp_dev_to_cl_device(struct device *dev);
>  int ishtp_register_event_cb(struct ishtp_cl_device *device,
>  				void (*read_cb)(struct ishtp_cl_device
> *));
>  struct	ishtp_fw_client *ishtp_fw_cl_get_client(struct
> ishtp_device *dev,

