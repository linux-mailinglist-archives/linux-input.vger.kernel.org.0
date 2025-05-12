Return-Path: <linux-input+bounces-12302-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D8AB3B40
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 16:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 645953A6EC3
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 14:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F0122A4D8;
	Mon, 12 May 2025 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANuy1fVk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18A519C569
	for <linux-input@vger.kernel.org>; Mon, 12 May 2025 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061237; cv=none; b=kW09SpACkSpSgbxA6GC7MPkD07L1KooBTEf/xiQ7JetWPh++woqJCdAEeIG6f5+N8dFXk5MSQHE/OhevAMBVRjOkYcOlNNPTFwSOLtF3Tct9Dz/7VhEZ1gRfN8XZtGQSntVyA50UAGhjRPUDeSXzQvVubDRSH4RJBBoTPooS/T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061237; c=relaxed/simple;
	bh=CqfpMXQNyDzFN4FPGV7lFGKO5pQZKtH5+ayKl/m1d1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0bs9iY/yxLQ1/gFI39tcYrZkiCZpMUHS+/z+Z1BpFcR6u+78BL1APN3YRWd+3MjjUgRBRBA5sn9aZBSJm1OQ2pyW5od0yCl1k4yzHpUJoBeyBlqpFGycLJfXEv4qeN+5cbAA7zzopolfAVPZJiOxB6hEcHgYUXNqYFUS23KH4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANuy1fVk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B84C4CEED;
	Mon, 12 May 2025 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747061236;
	bh=CqfpMXQNyDzFN4FPGV7lFGKO5pQZKtH5+ayKl/m1d1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANuy1fVkYpzzI4vSk4YfKaQ0kmUxUdar0O/OUSG8Kse2PRZKZ7E0StZ/z1QEySYSh
	 Cj93NwzxXpLh+4+BadGEuDLkPAwE7h9RLn4MrwZEP6PZ6kjI2Ab5Kyl5P5BNxP541+
	 Ie/zo35qKeh5uMx7U9MeFHs2Wx86ZhoPU9U5NsnbiMBjeSToXeGQg0sW6elH62jSLc
	 widZVRk5OVk+6rBFRgKq2joKt6jNbj5JXEt/s2R7ce9/YlpImzcj9IKFmFwY4wBwjI
	 gHbiaqfl732bZyoOZxDbC37sk0bG8LEGInFQBaJMa0F0jaNGx0q+i2SC56tATe5gFS
	 r+alMbCfkfQsA==
Date: Mon, 12 May 2025 16:47:12 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: linux-input@vger.kernel.org
Subject: Re: Use after free in dispatch_hid_bpf_output_report()
Message-ID: <ce3urcvcm6b5yv42tbopq65ojbv6upprkvqimn5cooo2nhcbdl@mzh4elx2rexx>
References: <20250509113905.34947e78@meshulam.tesarici.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509113905.34947e78@meshulam.tesarici.cz>


Hi Petr,


On May 09 2025, Petr Tesařík wrote:
> Hi all,
> 
> after installing v6.15-rc5 on my laptop, I'm running into an invalid
> pointer dereference in dispatch_hid_bpf_output_report() on suspend. I
> added some debugging messages (see patch below), and I can see this
> sequence of events:
> 
> [ 1568.571776] [   T7420] PM: suspend entry (deep)
> [ 1568.602245] [   T7420] Filesystems sync: 0.030 seconds
> [ 1568.613183] [   T1704] hid-generic 0005:04F2:182A.0004: CLEANED UP srcu 00000000b7570e01
> [ 1568.613348] [    T724] hid-generic 0005:04F2:182A.0004: UAF srcu 00000000b7570e01
> [ 1568.616215] [   T7420] Freezing user space processes
> 
> The HID device is a Bluetooth keyboard (using bluez 5.79), which
> (presumably) gets disconnected on suspend.
> 
> FTR I didn't encounter any such issues with v6.14.

Thanks for the patch. I already cc-ed you to the other debugging
thread[0], because I am slightly in favor of the other approach, based
on ->destroyed. Also that other patch prevents the race in other hooks.

Cheers,
Benjamin

[0] https://lore.kernel.org/linux-input/xyfdjeijtdt4sgb4zjmlibdbbvaaly3m3wiqhk7tu35cb2bpip@axziyhfcqx6w/T/#t

> 
> Petr T
> 
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
> index 2e96ec6a3073..f284175e8b0b 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.c
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.c
> @@ -130,6 +130,11 @@ int dispatch_hid_bpf_output_report(struct hid_device *hdev,
>  	struct hid_bpf_ops *e;
>  	int ret, idx;
>  
> +	if (unlikely(!hdev->bpf.srcu.sda)) {
> +		hid_warn(hdev, "UAF srcu %p", &hdev->bpf.srcu);
> +		return 0;
> +	}
> +
>  	idx = srcu_read_lock(&hdev->bpf.srcu);
>  	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
>  				 srcu_read_lock_held(&hdev->bpf.srcu)) {
> @@ -143,6 +148,8 @@ int dispatch_hid_bpf_output_report(struct hid_device *hdev,
>  	ret = 0;
>  
>  out:
> +	if (unlikely(!hdev->bpf.srcu.sda))
> +		hid_warn(hdev, "RACE srcu %p", &hdev->bpf.srcu);
>  	srcu_read_unlock(&hdev->bpf.srcu, idx);
>  	return ret;
>  }
> @@ -631,6 +638,7 @@ void hid_bpf_destroy_device(struct hid_device *hdev)
>  
>  	synchronize_srcu(&hdev->bpf.srcu);
>  	cleanup_srcu_struct(&hdev->bpf.srcu);
> +	hid_info(hdev, "CLEANED UP srcu %p", &hdev->bpf.srcu);
>  }
>  EXPORT_SYMBOL_GPL(hid_bpf_destroy_device);
>  

