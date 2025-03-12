Return-Path: <linux-input+bounces-10741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76397A5E0A1
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 16:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76F1017CE57
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 15:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BE82528F5;
	Wed, 12 Mar 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQ/mDQDq"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D9A1DE2BD;
	Wed, 12 Mar 2025 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793929; cv=none; b=Iw7DUMf/OktyqGlKAqxdw9RdQ6i/kbEZSwerwAPHZoPFZdEVMBfzjGBY+h30vwVmOYL2kPhBNOFFbM13teRu26WEkIjmjnAOw7KEGdJatGiol4U726CkvF1qVto4weKtQBgYD6k+zkDDzeOy099QLHd+G0qn8ZJ39pku7S2tUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793929; c=relaxed/simple;
	bh=5sWTWyGSWzMsM7Q52oQzlru0KXZl2CJjlVs+dqkfi3U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SZGq/9uNGYTY5nrTSA6bmrREk7GztqopOYVvmExBHrsyFz1R5VGUe7ixRqtDDvmiKQjH5drsTSyzOR2pe/bDopB2HNzxBXHKLdGYc71jpCLJQGLOh7ygF+zUhi7+39LHnsntjeK078E2Jw19+L8E9Dpe2EEvkk5pXvNOd9Cxe3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQ/mDQDq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741793928; x=1773329928;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5sWTWyGSWzMsM7Q52oQzlru0KXZl2CJjlVs+dqkfi3U=;
  b=EQ/mDQDqftGCCl2At5J3NfM8a27TRsN3zfdA1eiptevwDMYOD/wJ9uyI
   hIJXaU00xpD/wuEATgnyJG5yjmELM7hwv0kzKvF9XAY0HO8Fe30oHSlBa
   99qM9s7r7mOKu7TcNCnS2TEhRGBMwUb+ON9lFhvtvb+cDmIDFZG0L3Wfq
   1nfu2lrX3E4oUWb4H2ecajtLq2eb240ahRnW0KxkGr+877Qc9iGug/2c2
   M8lhVQbo1GTbWD5LYg1Wp6UjFYwQrICrzCYrQzmw8UtjXTxaCazpMpqZr
   /ZjGSOmJ/wuLdj1YSozthchueRPcwX46GGu6czTRGhyKPQsdrzvuWqTVb
   w==;
X-CSE-ConnectionGUID: lIXCbMoxQgiYbtG11zdkeg==
X-CSE-MsgGUID: TBfR/O8TTMe1EChZbZ3New==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42137826"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="42137826"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 08:38:47 -0700
X-CSE-ConnectionGUID: vDJD8g2eT9qGquOzG+kPsA==
X-CSE-MsgGUID: A1KRSP0ZQqqim+fQ4mvjEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120646467"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.111.234])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 08:38:47 -0700
Message-ID: <fa3a518291e7b122f078099b44a9c4a785567a89.camel@linux.intel.com>
Subject: Re: [PATCH] HID: remove superfluous (and wrong) Makefile entry for
 CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
  Nick Crews <ncrews@chromium.org>, Jett Rink <jettrink@chromium.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Date: Wed, 12 Mar 2025 08:38:46 -0700
In-Reply-To: <54o2s270-779o-q635-37o5-7s0o11o74o25@xreary.bet>
References: <54o2s270-779o-q635-37o5-7s0o11o74o25@xreary.bet>
Autocrypt: addr=srinivas.pandruvada@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQGNBGYHNAsBDAC7tv5u9cIsSDvdgBBEDG0/a/nTaC1GXOx5MFNEDL0LWia2p8Asl7igx
 YrB68fyfPNLSIgtCmps0EbRUkPtoN5/HTbAEZeJUTL8Xdoe6sTywf8/6/DMheEUzprE4Qyjt0HheW
 y1JGvdOA0f1lkxCnPXeiiDY4FUqQHr3U6X4FPqfrfGlrMmGvntpKzOTutlQl8eSAprtgZ+zm0Jiwq
 NSiSBOt2SlbkGu9bBYx7mTsrGv+x7x4Ca6/BO9o5dIvwJOcfK/cXC/yxEkr1ajbIUYZFEzQyZQXrT
 GUGn8j3/cXQgVvMYxrh3pGCq9Q0Q6PAwQYhm97ipXa86GcTpP5B2ip9xclPtDW99sihiL8euTWRfS
 TUsEI+1YzCyz5DU32w3WiXr3ITicaMV090tMg9phIZsjfFbnR8hY03n0kRNWWFXi/ch2MsZCCqXIB
 oY/SruNH9Y6mnFKW8HSH762C7On8GXBYJzH6giLGeSsbvis2ZmV/r+LmswwZ6ACcOKLlvvIukAEQE
 AAbQ5U3Jpbml2YXMgUGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5j
 b20+iQHRBBMBCAA7FiEEdki2SeUi0wlk2xcjOqtdDMJyisMFAmYHNAsCGwMFCwkIBwICIgIGFQoJC
 AsCBBYCAwECHgcCF4AACgkQOqtdDMJyisMobAv+LLYUSKNuWhRN3wS7WocRPCi3tWeBml+qivCwyv
 oZbmE2LcxYFnkcj6YNoS4N1CHJCr7vwefWTzoKTTDYqz3Ma0D0SbR1p/dH0nDgN34y41HpIHf0tx0
 UxGMgOWJAInq3A7/mNkoLQQ3D5siG39X3bh9Ecg0LhMpYwP/AYsd8X1ypCWgo8SE0J/6XX/HXop2a
 ivimve15VklMhyuu2dNWDIyF2cWz6urHV4jmxT/wUGBdq5j87vrJhLXeosueRjGJb8/xzl34iYv08
 wOB0fP+Ox5m0t9N5yZCbcaQug3hSlgp9hittYRgIK4GwZtNO11bOzeCEMk+xFYUoa5V8JWK9/vxrx
 NZEn58vMJ/nxoJzkb++iV7KBtsqErbs5iDwFln/TRJAQDYrtHJKLLFB9BGUDuaBOmFummR70Rbo55
 J9fvUHc2O70qteKOt5A0zv7G8uUdIaaUHrT+VOS7o+MrbPQcSk+bl81L2R7TfWViCmKQ60sD3M90Y
 oOfCQxricddC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-12 at 09:08 +0100, Jiri Kosina wrote:
> From: Jiri Kosina <jkosina@suse.com>
>=20
> The line
>=20
> 	obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)=C2=A0=C2=A0 +=3D intel-ish-hid/
>=20
> in top-level HID Makefile is both superfluous (as
> CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER
> depends on CONFIG_INTEL_ISH_HID, which contains intel-ish-hid/
> already) and wrong (as it's
> missing the CONFIG_ prefix).
>=20
> Just remove it.
>=20
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Fixes: 91b228107da3e ("HID: intel-ish-hid: ISH firmware loader client
> driver")
> Signed-off-by: Jiri Kosina <jkosina@suse.com>

Good one

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks,
Srinivas

> ---
> =C2=A0drivers/hid/Makefile | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 482b096eea28..0abfe51704a0 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -166,7 +166,6 @@ obj-$(CONFIG_USB_KBD)		+=3D usbhid/
> =C2=A0obj-$(CONFIG_I2C_HID_CORE)	+=3D i2c-hid/
> =C2=A0
> =C2=A0obj-$(CONFIG_INTEL_ISH_HID)	+=3D intel-ish-hid/
> -obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)	+=3D intel-ish-hid/
> =C2=A0
> =C2=A0obj-$(CONFIG_AMD_SFH_HID)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D =
amd-sfh-hid/
> =C2=A0


