Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A9279EAFC
	for <lists+linux-input@lfdr.de>; Wed, 13 Sep 2023 16:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbjIMOZQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Sep 2023 10:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241177AbjIMOZF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Sep 2023 10:25:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9DA170B
        for <linux-input@vger.kernel.org>; Wed, 13 Sep 2023 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694615087; x=1726151087;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=zReAJBwY1TEI7erKLtAalumBtIBlI+Mt80z7dVu5ytI=;
  b=GSiu+x7GAt1/QthdfdnDxDJ5WHjirt3MDr6URTMr/gL0T+bq4ubUtv6B
   cla119WcMHiD8YfApbtD9A11qM5mUyoqEO4jxqNPE500KExBcKZSCq+Xl
   lFDEgN6qhPDKwWIHfJEqGd4vPm/YRHEFhQxsW7qnZPfAaYfhmrQlmKu9i
   gmrLe7MCLMtfk0F+JNA/2tfJfP081oj+ReyXPtqDZhttfEbnqlR8h5dL8
   9fZD2K80fsOdLjnCXOP6x9A/ZbLx1LIcs47HsaVLbSbnQVecT0pI66YMz
   tkvAPDxSMpRAeNftD2WJh7oAGkmgtcb2uNKxr1Fu4ZAcdLmbw88LipIzr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442704969"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="442704969"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 07:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="747322431"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="747322431"
Received: from spandruv-desk1.amr.corp.intel.com ([10.251.12.27])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 07:24:07 -0700
Message-ID: <ed25e5826f2406a1dd2e7ce8d2e9ab0374508ea5.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Arrow Lake PCI device ID
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Even Xu <even.xu@intel.com>, linux-input@vger.kernel.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Date:   Wed, 13 Sep 2023 07:24:06 -0700
In-Reply-To: <1694572419-10981-1-git-send-email-even.xu@intel.com>
References: <1694572419-10981-1-git-send-email-even.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2023-09-13 at 10:33 +0800, Even Xu wrote:
> Add device ID of Arrow Lake-S into ishtp support list.
>=20
> Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/hid/intel-ish-hid/ipc/hw-ish.h=C2=A0 | 1 +
> =C2=A0drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
> =C2=A02 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> index e99f3a3..f89b300 100644
> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> @@ -34,6 +34,7 @@
> =C2=A0#define RPL_S_DEVICE_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x7A78
> =C2=A0#define MTL_P_DEVICE_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x7E45
> =C2=A0#define ARL_H_DEVICE_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x7745
> +#define ARL_S_DEVICE_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x7F78
> =C2=A0
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0REVISION_ID_=
CHT_A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x6
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0REVISION_ID_=
CHT_Ax_SI=C2=A0=C2=A0=C2=A00x0
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index 55cb250..ae3c6c1 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -45,6 +45,7 @@ static const struct pci_device_id ish_pci_tbl[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{PCI_DEVICE(PCI_VENDOR_ID=
_INTEL, RPL_S_DEVICE_ID)},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{PCI_DEVICE(PCI_VENDOR_ID=
_INTEL, MTL_P_DEVICE_ID)},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{PCI_DEVICE(PCI_VENDOR_ID=
_INTEL, ARL_H_DEVICE_ID)},
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{PCI_DEVICE(PCI_VENDOR_ID_INTE=
L, ARL_S_DEVICE_ID)},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{0, }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(pci, ish_pci_tbl);

