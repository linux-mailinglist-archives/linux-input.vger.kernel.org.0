Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FE62E100
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 17:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfE2P0R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 11:26:17 -0400
Received: from mga06.intel.com ([134.134.136.31]:56309 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbfE2P0R (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 11:26:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 08:26:16 -0700
X-ExtLoop1: 1
Received: from spandruv-mobl3.jf.intel.com ([10.254.112.249])
  by fmsmga001.fm.intel.com with ESMTP; 29 May 2019 08:26:16 -0700
Message-ID: <ae3d89b762181828b8c8ae4eb3cd59110d864b9b.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     "Yang, Hyungwoo" <hyungwoo.yang@intel.com>
Cc:     "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Date:   Wed, 29 May 2019 08:26:16 -0700
In-Reply-To: <7A4F467111FEF64486F40DFE7DF3500A221AE4ED@ORSMSX121.amr.corp.intel.com>
References: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
         <03654457d996c839e8f91bf329819defd8726a14.camel@linux.intel.com>
         <7A4F467111FEF64486F40DFE7DF3500A221AE4ED@ORSMSX121.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2019-05-29 at 07:21 +0000, Yang, Hyungwoo wrote:
> > On Tue, 2019-05-28 at 14:36 -0700, Hyungwoo Yang wrote:
> > > "struct device" is embedded in "struct ishtp_cl_device".
> > > so the conversion should be done by container_of() method.
> > 
> > Which tree this patch is going to? You can't even apply on the
> > mainline tree (5.2-rc2). Also you will not be able to compile even
> > if you address the conflict (The patch ordering is wrong). 
> 
> Oh.. I wasn't careful to split the patch after testing. I've
> corrected.
> 
> > 
> > What was symptom or problem you try to address? Is there any crash
> > or bug occurred? Does it happen with the mainline kernel?
> 
> I've added the detail in commit message in v2. Basically due to wrong
> usage of driver_data of ishtp client device, we see kernel crash.
> Currently driver_data is set by bus driver which is wrong since
> driver_data should be owned by corresponding device driver. Right
> now, we see kernel crash during suspend() of cros_ec_ishtp. Yes, it
> happens with the mainline kernel since cros_ec_ishtp is already
> upstreamed.
Technically this driver is not mainline. It will go in 5.3.

The problem is  cros_ec ish driver is overriding driver_data
"
	client_data->ec_dev = ec_dev;
	dev->driver_data = ec_dev;
"
The client drivers own the driver data in its "struct ishtp_cl_device
*" not the struct device *.

As far as I can see the purpose of this is to get device pointer for
debug purpose only.

I think you can remove the dev->driver_data assignment and simply
replace

dev_*(dev,

to
dev_*(ec_dev->dev,

Thanks,
Srinivas

> 
> > 
> > 
> > > 
> > > Change-Id: Idcbafe724e216ee6275f9d1e35a3b79cee5ce88c
> > 
> > This tells me that you are trying to fix some Chrome issue. Don't
> > include these tags for mainline kernel.
> 
> done in v2. Thank you.
> 
> > 
> > Thanks,
> > Srinivas
> 
> Thanks,
> Hyungwoo

