Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2209B78ADFC
	for <lists+linux-input@lfdr.de>; Mon, 28 Aug 2023 12:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbjH1KyX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Aug 2023 06:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjH1KyS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Aug 2023 06:54:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5FDCC4
        for <linux-input@vger.kernel.org>; Mon, 28 Aug 2023 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693220038; x=1724756038;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=80bMz1w+OzfyKMWvlNvuhyz+eNdQVeUluNv+yh7f+K4=;
  b=E1gE7aI8fyJ7zXZ6psfoVE1LEFPCbbnQNT4n1idoJ0j6gDQjFyfP7Sq5
   HQJoGinzANeaEjT1CMiG4l7f3TQCr0r8GKIvx+ruJxjFrnOLW0m3BhPX+
   W8C/NXRKnSnLhdwvqvRymScgn/Xdg6AYdDj9alxYQCy15LAGZV3/gQRzy
   Ckr4Lc93Q0nt+ezKvSbxPsOqMqD+n9Td9S28hm+iWWXi24LC7lAPPTOQt
   blHVTPRqiPbz8vozoGMlN33/hmEk/5qDuvP58ru1N9W/ohaJltUtqk8km
   7lI98Vrg44fL/WCNr3fbw9t5NIEnxkr8n6hkJePdq3Krdtw9/PWVlcCxz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372478311"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372478311"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 03:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068994160"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1068994160"
Received: from spandruv-desk1.amr.corp.intel.com ([10.209.62.10])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 03:53:17 -0700
Message-ID: <2907aeaaa7ec5b1a04b08c1dd3ec236c88787a16.camel@linux.intel.com>
Subject: Re: [PATCH -next] HID: intel-ish-hid: Remove unused declarations
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Yue Haibing <yuehaibing@huawei.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Date:   Mon, 28 Aug 2023 03:53:16 -0700
In-Reply-To: <20230817135053.51964-1-yuehaibing@huawei.com>
References: <20230817135053.51964-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2023-08-17 at 21:50 +0800, Yue Haibing wrote:
> Commit 3703f53b99e4 ("HID: intel_ish-hid: ISH Transport layer")
> declared ishtp_remove_all_clients()/ishtp_can_client_connect()
> but never implemented them.
>=20
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Sorry I was on vacation to ACK before.

> ---
> =C2=A0drivers/hid/intel-ish-hid/ishtp/bus.h=C2=A0=C2=A0=C2=A0 | 1 -
> =C2=A0drivers/hid/intel-ish-hid/ishtp/client.h | 1 -
> =C2=A02 files changed, 2 deletions(-)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.h
> b/drivers/hid/intel-ish-hid/ishtp/bus.h
> index 5bb85c932e4c..53645ac89ee8 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/bus.h
> +++ b/drivers/hid/intel-ish-hid/ishtp/bus.h
> @@ -46,7 +46,6 @@ struct ishtp_cl_device {
> =C2=A0};
> =C2=A0
> =C2=A0int=C2=A0=C2=A0=C2=A0=C2=A0ishtp_bus_new_client(struct ishtp_device=
 *dev);
> -void=C2=A0=C2=A0=C2=A0ishtp_remove_all_clients(struct ishtp_device *dev)=
;
> =C2=A0int=C2=A0=C2=A0=C2=A0=C2=A0ishtp_cl_device_bind(struct ishtp_cl *cl=
);
> =C2=A0void=C2=A0=C2=A0=C2=A0ishtp_cl_bus_rx_event(struct ishtp_cl_device =
*device);
> =C2=A0
> diff --git a/drivers/hid/intel-ish-hid/ishtp/client.h
> b/drivers/hid/intel-ish-hid/ishtp/client.h
> index fc62dd1495da..d9d398fadcf7 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/client.h
> +++ b/drivers/hid/intel-ish-hid/ishtp/client.h
> @@ -109,7 +109,6 @@ struct ishtp_cl {
> =C2=A0};
> =C2=A0
> =C2=A0/* Client connection managenment internal functions */
> -int ishtp_can_client_connect(struct ishtp_device *ishtp_dev, guid_t
> *uuid);
> =C2=A0int ishtp_fw_cl_by_id(struct ishtp_device *dev, uint8_t client_id);
> =C2=A0void ishtp_cl_send_msg(struct ishtp_device *dev, struct ishtp_cl
> *cl);
> =C2=A0void recv_ishtp_cl_msg(struct ishtp_device *dev,

