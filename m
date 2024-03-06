Return-Path: <linux-input+bounces-2257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A57872BE6
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 01:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BDFE1C212A8
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 00:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB8119E;
	Wed,  6 Mar 2024 00:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZeyZXg9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16F6FAD
	for <linux-input@vger.kernel.org>; Wed,  6 Mar 2024 00:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709686437; cv=none; b=gQqHTyPtRyq2uhR8O2D95+ZZUIsEfAWGAfSj/qO8dAe9/hV/jUKnFuRY9DYj8CWpPt7GLr3AiDvCA0Q+X9cWX8cvxiD2I6XNCRYaNN44+3DRRgReigWiLJj8iHwMKgFeIZdBwjMi3IwRzdz6gpeu56as0PEy6TjuS9B6q6faO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709686437; c=relaxed/simple;
	bh=6Y6i8AaFPiHKrFFjd9/+eYJHITedvi8cEqxbHfsnOhA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mv/qAp4QIGxLZhbvYNwgeKZPFLjcsa1T7h+3KztadDLH45RJewUNnuof6ZA2EUH3hPYMYf/AtJCBKa7wLaBuqJgHkndc+6YD8H2JDUMnP5Y2Y6sew7/Cp0IMbNa5SqBHmcERlQZEvWf0ujwU7+x+7vQgmp/RIzgPKRrrsfuY0ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZeyZXg9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709686436; x=1741222436;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=6Y6i8AaFPiHKrFFjd9/+eYJHITedvi8cEqxbHfsnOhA=;
  b=HZeyZXg9GUIxDt8q9lCC1kRqoRu1rH+eEZobbX5f9ucnxNCw6HqHh8jB
   6COqNrN3kqOluI1DsXXAVBRiY8zJazear1yF8qERWbyiHeWGgVd5085Pm
   RqbYhmn9Kou/YPVJHh1nsqfWLGz7UShab3EJfSJbA9RySHq2Vxi//ndHH
   mrchc8sbGdKW6NWL4RGSGiqTwAx8ItMAIhZ7YfT83y0X1QfNB7wosrLMS
   ZXi4Fdhdc5ZNAG1Rf8fAzhRxDB+V/mJ5IXR0cmjKPsP8fM4cdnwgqk43o
   tSkkhvo7TacyNBf9lw99YDuxADuD8pIqw8S/OCQLWUrM6mbmfshpUCkhU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8094611"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8094611"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 16:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9983057"
Received: from spandruv-desk1.amr.corp.intel.com ([10.209.19.141])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 16:53:56 -0800
Message-ID: <f5ca7644241a989779d85086ac55e8c100d926a2.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Fix dev_err usage with
 uninitialized dev->devc
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Zhang, Lixu" <lixu.zhang@intel.com>, linux-input@vger.kernel.org, 
	jikos@kernel.org, benjamin.tissoires@redhat.com
Date: Tue, 05 Mar 2024 16:53:55 -0800
In-Reply-To: <20240306004404.2770417-1-lixu.zhang@intel.com>
References: <20240306004404.2770417-1-lixu.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-03-06 at 00:44 +0000, Zhang, Lixu wrote:
> From: Zhang Lixu <lixu.zhang@intel.com>
>=20
> The variable dev->devc in ish_dev_init was utilized by dev_err before
> it
> was properly assigned. To rectify this, the assignment of dev->devc
> has
> been moved to immediately follow memory allocation.
>=20
> Without this change "(NULL device *)" is printed for device
> information.
>=20
> Fixes: 8ae2f2b0a284 ("HID: intel-ish-hid: ipc: Fix potential use-
> after-free in work function")
> Fixes: ae02e5d40d5f ("HID: intel-ish-hid: ipc layer")
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
This is not an important change to submit to rc cycle.
This is just a logging issue.

Thanks,
Srinivas

> =C2=A0drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-
> ish-hid/ipc/ipc.c
> index 7cc412798fdf..adce30f8ebff 100644
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -948,6 +948,7 @@ struct ishtp_device *ish_dev_init(struct pci_dev
> *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev->devc =3D &pdev->dev;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ishtp_device_init(dev);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0init_waitqueue_head(&dev-=
>wait_hw_ready);
> @@ -983,7 +984,6 @@ struct ishtp_device *ish_dev_init(struct pci_dev
> *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev->ops =3D &ish_hw_ops;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev->devc =3D &pdev->dev;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev->mtu =3D IPC_PAYLOAD_=
SIZE - sizeof(struct ishtp_msg_hdr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return dev;
> =C2=A0}


