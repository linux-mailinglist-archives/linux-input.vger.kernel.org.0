Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9542E5B7
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 22:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfE2UH0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 16:07:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:50356 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfE2UH0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 16:07:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 13:07:25 -0700
X-ExtLoop1: 1
Received: from sdlorion-mobl1.amr.corp.intel.com (HELO spandruv-mobl.amr.corp.intel.com) ([10.255.229.247])
  by fmsmga005.fm.intel.com with ESMTP; 29 May 2019 13:07:24 -0700
Message-ID: <0315386b41f5b5446b5b5b55c957f6346a953fa5.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] HID: intel-ish-hid: fix wrong type conversion
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     "Yang, Hyungwoo" <hyungwoo.yang@intel.com>
Cc:     "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Date:   Wed, 29 May 2019 13:07:23 -0700
In-Reply-To: <e2cc2cefeb74c86e49945b7fc2c222c663ea80f7.camel@linux.intel.com>
References: <1559079417-32039-1-git-send-email-hyungwoo.yang@intel.com>
         <03654457d996c839e8f91bf329819defd8726a14.camel@linux.intel.com>
         <7A4F467111FEF64486F40DFE7DF3500A221AE4ED@ORSMSX121.amr.corp.intel.com>
         <ae3d89b762181828b8c8ae4eb3cd59110d864b9b.camel@linux.intel.com>
         <7A4F467111FEF64486F40DFE7DF3500A221AE604@ORSMSX121.amr.corp.intel.com>
         <e2cc2cefeb74c86e49945b7fc2c222c663ea80f7.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2019-05-29 at 12:38 -0700, Srinivas Pandruvada wrote:
> On Wed, 2019-05-29 at 19:03 +0000, Yang, Hyungwoo wrote:
> > > On Wed, 2019-05-29 at 07:21 +0000, Yang, Hyungwoo wrote:
> > > > > On Tue, 2019-05-28 at 14:36 -0700, Hyungwoo Yang wrote:
> > > > > 
> > > > > What was symptom or problem you try to address? Is there any
> > > > > crash 
> > > > > or bug occurred? Does it happen with the mainline kernel?
> > > > 
> > > > I've added the detail in commit message in v2. Basically due to
> > > > wrong 
> > > > usage of driver_data of ishtp client device, we see kernel
> > > > crash.
> > > > Currently driver_data is set by bus driver which is wrong
> > > > since 
> > > > driver_data should be owned by corresponding device driver.
> > > > Right
> > > > now, 
> > > > we see kernel crash during suspend() of cros_ec_ishtp. Yes, it
> > > > happens 
> > > > with the mainline kernel since cros_ec_ishtp is already
> > > > upstreamed.
> > > 
> > > Technically this driver is not mainline. It will go in 5.3.
> > > 
> > > The problem is  cros_ec ish driver is overriding driver_data "
> > > 	client_data->ec_dev = ec_dev;
> > > 	dev->driver_data = ec_dev;
> > > "
> > > The client drivers own the driver data in its "struct
> > > ishtp_cl_device *" not the struct device *.
> > 
> > No. still driver_data in "struct device" should be owned by its
> > device driver. So there's no problem here since cros_ec_ish driver
> > is
> > owner of the device. 
> 
> I don't know how the driver was submitted without suspend/resume
> test.
> 
> Spilt the patch in this for bisect and the cros-ec is not in 5.2 yet.
> 
> The first patch, is the combination of patch 1 and patch 2 excluding
> cros-ec changes.
> 
> The second patch for cros-ec only using the new API.

Also run
./scripts/get_maintainer.pl on the patches

to get maintainers/mailing list to send/copy. This patch probably needs
to go along with cros-ec drivers pull request.

Thanks,
Srinivas

> 
> Thanks,
> Srinivas
> 
> > 
> > > 
> > > As far as I can see the purpose of this is to get device pointer
> > > for debug purpose only.
> > 
> > It's not for debug purpose and most importantly driver_data in
> > "struct device" is used by its child in ec_device_probe()
> > So wrong usage of driver_data should be corrected.
> 
> 
> 
> > 
> > > 
> > > I think you can remove the dev->driver_data assignment and simply
> > > replace
> > > 
> > > dev_*(dev,
> > > 
> > > to
> > > dev_*(ec_dev->dev,
> > > 
> > > Thanks,
> > > Srinivas
> > 
> > Thanks,
> > Hyungwoo

