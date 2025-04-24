Return-Path: <linux-input+bounces-11968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEAEA9A953
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CDC717527E
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC901F4617;
	Thu, 24 Apr 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NChss0fw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B21383;
	Thu, 24 Apr 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489047; cv=none; b=P9/KjqK5CktWv8SeYw0Y/e3ZQW/ygsJNC0ZrsU9DStUGxgKlQAkqf3FNJklUGbLjFiXCvn/xMfX2fFUsHr1MpN28JZK9NOwc4l3wIQTdwhg9cNmdKVrZJtAivDdZT6KVjTCgtarP1ehRQ6nT4Od4Z6gTnNwYkFTQhaKeCpGGAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489047; c=relaxed/simple;
	bh=QkO9f05HBZfRAYHuTdXZCS4UVeVMSqLZN8idIx1+JmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mnrE/cL+8SMAq2L4Ce1z9Gxytb2Ugwp/CGjDvb3tXgljZrlfahx4KR8tWLOZnOy86k0iI7CwLIqow5A+jkR2311V+OULM5ax6bYfOVGOV2abI3/O+Opo25qgCEfl/dFzz+/KCnFLu/JbcDnZmEudG1VccfQaS0W6cqybckp6mHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NChss0fw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020D6C4CEE3;
	Thu, 24 Apr 2025 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489047;
	bh=QkO9f05HBZfRAYHuTdXZCS4UVeVMSqLZN8idIx1+JmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NChss0fwfbzY5ZsKASwFKreSMNk+rN3T0G4Imr0ha8+GNTfOa144igFLbYFGsN9n8
	 w1wyqQ1/hfzTLAgfF9pr3PKAFIVXoKoOlWSCJ6Zn/pxPJebLKRweeeQIYH/qSsUzeK
	 wfN57iuRlBD6nfo1HYCmLD3I19BElPZGg4pn42BO0mE+JKX7q+rEUuy26AmCR2xTJo
	 Sx+lK9ZPIqzcH7fdw/3WUWqsfZRHp+s4XtOU/C1WlK/wty8mkeW6YFAZ//XyRIYcJn
	 /X4mBlQnArWm6ZFmzCrncUi2zbPMGSLubK5fQr7MVgrLawk++clFmfg5ok5e4L1wdZ
	 vKg580wBjnjUg==
Date: Thu, 24 Apr 2025 12:04:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
cc: even.xu@intel.com, xinpeng.sun@intel.com, bentiss@kernel.org, 
    mpearson-lenovo@squebb.ca, srinivas.pandruvada@linux.intel.com, 
    guanwentao@uniontech.com, phasta@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, zhanjun@uniontech.com, 
    niecheng1@uniontech.com
Subject: Re: [PATCH] HID: intel-thc-hid: intel-quicki2c: pass correct arguments
 to acpi_evaluate_object
In-Reply-To: <DA446911D078F45A+20250417135023.543707-1-wangyuli@uniontech.com>
Message-ID: <r8o135p2-9291-q830-qnn0-9nn80486458s@xreary.bet>
References: <DA446911D078F45A+20250417135023.543707-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, WangYuli wrote:

> From: Wentao Guan <guanwentao@uniontech.com>
> 
> Delete unused argument, pass correct argument to acpi_evaluate_object.
> 
> Log:
>   intel_quicki2c 0000:00:10.0: enabling device (0000 -> 0002)
>   ACPI: \_SB.PC00.THC0.ICRS: 1 arguments were passed to a non-method ACPI object (Buffer) (20230628/nsarguments-211)
>   ACPI: \_SB.PC00.THC0.ISUB: 1 arguments were passed to a non-method ACPI object (Buffer) (20230628/nsarguments-211)
> 
> Fixes: 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces")
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index fa51155ebe39..8a8c4a46f927 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -82,15 +82,10 @@ static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string
>  {
>  	acpi_handle handle = acpi_device_handle(adev);
>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object obj = { .type = type };
> -	struct acpi_object_list arg_list = {
> -		.count = 1,
> -		.pointer = &obj,
> -	};
>  	union acpi_object *ret_obj;
>  	acpi_status status;
>  
> -	status = acpi_evaluate_object(handle, dsd_method_name, &arg_list, &buffer);
> +	status = acpi_evaluate_object(handle, dsd_method_name, NULL, &buffer);
>  	if (ACPI_FAILURE(status)) {
>  		acpi_handle_err(handle,
>  				"Can't evaluate %s method: %d\n", dsd_method_name, status);

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


