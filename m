Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12284666117
	for <lists+linux-input@lfdr.de>; Wed, 11 Jan 2023 17:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbjAKQ7f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Jan 2023 11:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235405AbjAKQ7S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Jan 2023 11:59:18 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AAE1D9;
        Wed, 11 Jan 2023 08:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673456357; x=1704992357;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XmWC3XI33pAhrNwTO3pTEmkiACbcf3LnIHheDFqokkE=;
  b=P3OU5mV+xXoLpwRrFF76da8/UzlrChX77c3/4uzU6KfSjoughgOUHR8X
   kr0Khdh981k4EOyaDA3xJ9Xz2kbJ5ibeC3mcKYGaql1yb+Yt8t6KIQWnt
   Iej0RHUMHLIJJlSW0LTxZWJSedMifZFjN9UXpfUnsD4xBb+bUsAKw7QVa
   5qNvnjfA8HkGEvm50Cc372kK//p+6irPD4SUYfECmlj7LZBhdhe3HgwMP
   Pot01bEWjEPsGzsMOPQN3aXWYhu1RFkzBAPKRL0G3mMiHOj9KkwoWZ1Bm
   k1FwZclX//boldl8adiPb4onDNSZO0dHDPBUpwTisy7Ik6Ye0CqNrZ9E8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311290796"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="311290796"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 08:59:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="765227402"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="765227402"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 08:59:15 -0800
Message-ID: <dd7d9916697fd205038420ff00bf6f36f3fa91da.camel@linux.intel.com>
Subject: Re: [PATCH v3] HID: Recognize sensors with application collections
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Aditya Garg <gargaditya08@live.com>,
        Jiri Kosina <jikos@kernel.org>,
        "jkosina@suse.cz" <jkosina@suse.cz>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jic23@kernel.org" <jic23@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>
Cc:     "orlandoch.dev@gmail.com" <orlandoch.dev@gmail.com>,
        "ronald@innovation.ch" <ronald@innovation.ch>
Date:   Wed, 11 Jan 2023 08:59:15 -0800
In-Reply-To: <9E66CF6F-99A0-4CC5-9FA0-3A9DCFCA0388@live.com>
References: <8DA00FF4-DB08-4CEC-A5B4-47A71DC09C13@live.com>
         <01D620E2-18CA-40F6-A330-454CBC20C542@live.com>
         <EFCEA45A-C6F4-477A-B011-9C9E6E61E488@live.com>
         <9E66CF6F-99A0-4CC5-9FA0-3A9DCFCA0388@live.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2023-01-11 at 10:07 +0000, Aditya Garg wrote:
> From: Ronald Tschalär <ronald@innovation.ch>
> 
> According to HUTRR39 logical sensor devices may be nested inside
> physical collections or may be specified in multiple top-level
> application collections (see page 59, strategies 1 and 2). However,
> the current code was only recognizing those with physical
> collections.
> 
> This issue turned up in the T2 MacBook Pros which define the ALS in
> a top-level application collection.
> 
> Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Since there are some hid core change, Jiri needs to check. If Jiri is
fine with hid core changes:
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>



> ---
> V2 :- Add missing signed-off-by
> V3 :- Avoid using language extensions
>  drivers/hid/hid-core.c       | 3 ++-
>  drivers/hid/hid-sensor-hub.c | 6 ++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index bd47628da..8ff08e6c2 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -804,7 +804,8 @@ static void hid_scan_collection(struct hid_parser
> *parser, unsigned type)
>         int i;
>  
>         if (((parser->global.usage_page << 16) == HID_UP_SENSOR) &&
> -           type == HID_COLLECTION_PHYSICAL)
> +           (type == HID_COLLECTION_PHYSICAL ||
> +            type == HID_COLLECTION_APPLICATION))
>                 hid->group = HID_GROUP_SENSOR_HUB;
>  
>         if (hid->vendor == USB_VENDOR_ID_MICROSOFT &&
> diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-
> hub.c
> index 6abd3e2a9..83237b86c 100644
> --- a/drivers/hid/hid-sensor-hub.c
> +++ b/drivers/hid/hid-sensor-hub.c
> @@ -397,7 +397,8 @@ int sensor_hub_input_get_attribute_info(struct
> hid_sensor_hub_device *hsdev,
>                 for (i = 0; i < report->maxfield; ++i) {
>                         field = report->field[i];
>                         if (field->maxusage) {
> -                               if (field->physical == usage_id &&
> +                               if ((field->physical == usage_id ||
> +                                    field->application == usage_id) &&
>                                         (field->logical ==
> attr_usage_id ||
>                                         field->usage[0].hid ==
>                                                         attr_usage_id)
> &&
> @@ -506,7 +507,8 @@ static int sensor_hub_raw_event(struct hid_device
> *hdev,
>                                         collection->usage);
>  
>                 callback = sensor_hub_get_callback(hdev,
> -                               report->field[i]->physical,
> +                               report->field[i]->physical ? report-
> >field[i]->physical :
> +                                                            report-
> >field[i]->application,
>                                 report->field[i]-
> >usage[0].collection_index,
>                                 &hsdev, &priv);
>                 if (!callback) {
> -- 
> 2.34.1
> 


