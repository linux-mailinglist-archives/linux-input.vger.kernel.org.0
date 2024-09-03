Return-Path: <linux-input+bounces-6102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D3296A62A
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 20:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37FC61C22334
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 18:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6449018E37B;
	Tue,  3 Sep 2024 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVL1v7EY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C4F18FDAB;
	Tue,  3 Sep 2024 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386849; cv=none; b=V6VmiSuMzjNiJNqXt6kZsHfPqXM0Z43TI7qh45sPpwi4VrrlpB9+tAFMwgPfKsG+bF65VivPA5usJ1dhcw0xOBTSBeHrFtw9mL2BULcisSRZsp7mE9Zpbs+1H+tDqLkMg920WAigL6FlCN6YQsUgLceaoCdmKZ/4IV05Wcq3DgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386849; c=relaxed/simple;
	bh=tcRexD4BMihnY/a5kT1onmI8F6363GBsoHWU4QUgpcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQiTaINdI1T0mZCcAK/VRqikE17HpZV3kMjZPVakFrGHEP0FCD9WsOgVdFZNzUukw7MTXSPVGKMWS3CB5Eh/ecnOIi1ZoA1sEuTG6DrBK9LlChRm0r8f/+d27sELNZIcZ66K0SvhlC5R4KryPbOiSjgaJtlKYYttbPCDF1LC948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVL1v7EY; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a8197d82a9so252683985a.0;
        Tue, 03 Sep 2024 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725386846; x=1725991646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oR15MFjpZiLIP3RCSsWdLv5eTx1QDsdg2gCZRpemFqg=;
        b=OVL1v7EYetvRE9YFRSqqM5TDiazBtp3XY9b5mhKUVlPj7AqLqkMUTaxtJrajHoWlsZ
         Yip8qK07gonRdM3sdLfKDwq3yqaejJdZGP5NbKwPuperZ8BFzO0HEPI2He09YCFwTXMr
         9oNa3+uuxCGHA1B5HAvd3xioK3CRW+keSYNwE5tNKBd+0unc59fYcp2+IHna5x5KozAK
         ypBsWEvfrepHmJyzKHKCExGV16mG7vRrbRAfDn+GB3SWL96TQ8VMRlb2g2fwDLD6XEn9
         59MI3eR2uL4CKCEcVkb6n/GYtr9W2mS+RpZ5kozwY+1gtA+12ORolwWEMKubvO483/6f
         LAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725386846; x=1725991646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR15MFjpZiLIP3RCSsWdLv5eTx1QDsdg2gCZRpemFqg=;
        b=vzttXobHUjH1xhmWqjKzY1s+bvDns/RpNj3LQJKT3DKwHqotmvVBathO9njJv19URT
         LO3AUtdi4MH5abt9ceXOtRm30zsCFjgTLotly8o86Z++0nw1vyJAS6uiDRt4b8aRrBUJ
         5RucUs7pYejpdyNJv81VZOLTBXbqkBHoHFRjHFQMiodOOqo1jObuF9J4bCm8vNuZCpnr
         b0bO2/bysHg6AwD0lrAQLGxYwmfKNIvNEeVWdWI7wSpa8tG7lT2KIYGvf3s7XPZarg6i
         aDkBEE7prFc5qG2r2hHqY+1FCVlZ0IeyI3eF4BJDl1o6GNjHNniUGvw5eE10y7JBIWDG
         ZdwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOUCUXbmka0jOuZlX6Cbxh4661qMyfjyMe1tIxDDbc+dZZ3YE0B2kDgQ4519+PGOJbXjuofb+Gm921CieF@vger.kernel.org, AJvYcCWd2EJOuXbqKWokjnrFuO5DyDZvJygvzrfjgYIu96LS7IhYGt4iJjVB4KriX0bAUD5j2pBIhmH0Nux9gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5Zb1DOQ1Zlj53QiT238O523WtshaqsKmnWYfP9Vfw7fZ444P
	aC5VvljCQDgo2nt018fAtPPPtrIwIlxh3rm569n/nw86+sCQQfay
X-Google-Smtp-Source: AGHT+IEzOOnGHeVcFVIClXExk4vtH7f4J/IXHXp1cMB1N4p+xhGPUEIWjJdsJz/lsyWEJe/KMmJ+GA==
X-Received: by 2002:a05:620a:2a08:b0:79f:104a:ba4e with SMTP id af79cd13be357-7a97bc4fa19mr392083785a.13.1725386846252;
        Tue, 03 Sep 2024 11:07:26 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3ed6bsm549048085a.73.2024.09.03.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 11:07:25 -0700 (PDT)
Date: Tue, 3 Sep 2024 14:07:23 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Marge Yang <marge.yang@tw.synaptics.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vincent Huang <Vincent.Huang@tw.synaptics.com>
Cc: david.chiu@tw.synaptics.com, derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com
Subject: Re: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Message-ID: <ZtdQW7nqAOEJDNBN@radian>
References: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>

Hi,

On Mon, Aug 05, 2024 at 08:36:36AM +0000, Marge Yang wrote:
> Newer firmware allows to query touchpad resolution
> information by reading from resolution register.
> Presence of resolution register is signalled via bit
> 29 of the "register presence" register.
> On devices that lack this resolution register
> we fall back to using pitch and number of receivers
> data to calculate size of the sensor.
> 
> RMI4 F12 will support to query DPM value on Touchpad.
> When TP firmware doesn't support to report logical and
> physical value within the Touchpad's HID report.
> We can directly query the DPM value through RMI.
> 
> Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
> Signed-off-by: Vincent Huang <Vincent.Huang@tw.synaptics.com>
> ---
>  drivers/input/rmi4/rmi_f12.c | 41 +++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
> index 7e97944f7616..b8dfb9ffdbf5 100644
> --- a/drivers/input/rmi4/rmi_f12.c
> +++ b/drivers/input/rmi4/rmi_f12.c
> @@ -24,6 +24,7 @@ enum rmi_f12_object_type {
>  };
>  
>  #define F12_DATA1_BYTES_PER_OBJ			8
> +#define RMI_F12_QUERY_RESOLUTION		29
>  
>  struct f12_data {
>  	struct rmi_2d_sensor sensor;
> @@ -73,6 +74,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
>  	int pitch_y = 0;
>  	int rx_receivers = 0;
>  	int tx_receivers = 0;
> +	u16 query_dpm_addr = 0;
> +	int dpm_resolution = 0;
>  
>  	item = rmi_get_register_desc_item(&f12->control_reg_desc, 8);
>  	if (!item) {
> @@ -122,18 +125,36 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
>  		offset += 4;
>  	}
>  
> -	if (rmi_register_desc_has_subpacket(item, 3)) {
> -		rx_receivers = buf[offset];
> -		tx_receivers = buf[offset + 1];
> -		offset += 2;
> -	}
> +	/* Use the Query DPM feature when the query register exists for resolution. */
> +	item = rmi_get_register_desc_item(&f12->query_reg_desc, RMI_F12_QUERY_RESOLUTION);
> +	if (item) {
> +		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
> +			RMI_F12_QUERY_RESOLUTION);
> +		query_dpm_addr = fn->fd.query_base_addr	+ offset;
> +		ret = rmi_read(fn->rmi_dev, query_dpm_addr, buf);
> +		if (ret < 0) {
> +			dev_err(&fn->dev, "Failed to read DPM value: %d\n", ret);
> +			return -ENODEV;
> +		}
> +		dpm_resolution = buf[0];
> +
> +		sensor->x_mm = sensor->max_x / dpm_resolution;
> +		sensor->y_mm = sensor->max_y / dpm_resolution;
> +	} else {
> +		if (rmi_register_desc_has_subpacket(item, 3)) {

The item variable is NULL in this branch, as it was overwritten just
before the if statement.

This patch causes a NULL pointer dereference:

	[    1.738650] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: S3706B, fw id: 2869618
	[    1.771232] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
	[    1.771245] Mem abort info:
	[    1.771248]   ESR = 0x0000000096000004
	[    1.771254]   EC = 0x25: DABT (current EL), IL = 32 bits
	[    1.771261]   SET = 0, FnV = 0
	[    1.771266]   EA = 0, S1PTW = 0
	[    1.771271]   FSC = 0x04: level 0 translation fault
	[    1.771276] Data abort info:
	[    1.771280]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
	[    1.771285]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	[    1.771291]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	[    1.771298] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000986a9000
	[    1.771308] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
	[    1.771326] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
	[    1.771335] Modules linked in: rmi_i2c(+) rmi_core gpi
	[    1.771358] CPU: 1 UID: 0 PID: 165 Comm: udevd Not tainted 6.11.0-rc6-next-20240902-sdm670-00022-g6ab596a153e1-dirty #10
	[    1.771371] Hardware name: Google Inc. MSM sdm670 S4 PVT v1.0 (DT)
	[    1.771378] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[    1.771389] pc : _find_next_bit+0x18/0x78
	[    1.771411] lr : rmi_register_desc_has_subpacket+0x24/0x40 [rmi_core]
	[    1.771444] sp : ffff800080fdb0b0
	[    1.771448] x29: ffff800080fdb0b0 x28: 0000000000000000 x27: 000000000000000c
	[    1.771463] x26: ffff614ec34aa880 x25: ffff800080fdb0f9 x24: ffff614ec34aa958
	[    1.771477] x23: ffff614ec34adc00 x22: ffff614ed8a02880 x21: ffff614ec34aa9c8
	[    1.771492] x20: ffff614ec34adc18 x19: 0000000000000003 x18: 000000005e77a5e3
	[    1.771506] x17: 000000040044ffff x16: ffffb02de6d83ba8 x15: 0000000000000000
	[    1.771520] x14: ffff614ec1a85640 x13: ffff614ec96dc580 x12: 000000003474591d
	[    1.771534] x11: 0000000068d948e4 x10: ffffb02d74a1c000 x9 : 0000000000000000
	[    1.771548] x8 : ffff614ec96dc500 x7 : 0000000000000001 x6 : 0000000000000001
	[    1.771561] x5 : 0000000000000000 x4 : fffffffffffffff8 x3 : 0000000000000000
	[    1.771574] x2 : 0000000000000003 x1 : 0000000000000100 x0 : 0000000000000018
	[    1.771588] Call trace:
	[    1.771593]  _find_next_bit+0x18/0x78
	[    1.771608]  rmi_f12_probe+0x728/0x960 [rmi_core]
	[    1.771632]  rmi_function_probe+0x8c/0x20c [rmi_core]
	[    1.771654]  really_probe+0xbc/0x2c0
	[    1.771671]  __driver_probe_device+0x78/0x120
	[    1.771686]  driver_probe_device+0x3c/0x154
	[    1.771699]  __device_attach_driver+0xb8/0x140
	[    1.771713]  bus_for_each_drv+0x88/0xe8
	[    1.771727]  __device_attach+0xa0/0x190
	[    1.771735]  device_initial_probe+0x14/0x20
	[    1.771744]  bus_probe_device+0xb4/0xc0
	[    1.771757]  device_add+0x578/0x750
	[    1.771769]  rmi_register_function+0x64/0xc8 [rmi_core]
	[    1.771792]  rmi_create_function+0x11c/0x1c4 [rmi_core]
	[    1.771815]  rmi_scan_pdt+0x90/0x1e4 [rmi_core]
	[    1.771837]  rmi_init_functions+0x6c/0x13c [rmi_core]
	[    1.771860]  rmi_driver_probe+0x130/0x3a0 [rmi_core]
	[    1.771882]  really_probe+0xbc/0x2c0
	[    1.771896]  __driver_probe_device+0x78/0x120
	[    1.771911]  driver_probe_device+0x3c/0x154
	[    1.771925]  __device_attach_driver+0xb8/0x140
	[    1.771939]  bus_for_each_drv+0x88/0xe8
	[    1.771952]  __device_attach+0xa0/0x190
	[    1.771960]  device_initial_probe+0x14/0x20
	[    1.771970]  bus_probe_device+0xb4/0xc0
	[    1.771983]  device_add+0x578/0x750
	[    1.771994]  rmi_register_transport_device+0x8c/0x138 [rmi_core]
	[    1.772017]  rmi_i2c_probe+0x1b0/0x304 [rmi_i2c]
	[    1.772040]  i2c_device_probe+0x130/0x290
	[    1.772056]  really_probe+0xbc/0x2c0
	[    1.772070]  __driver_probe_device+0x78/0x120
	[    1.772084]  driver_probe_device+0x3c/0x154
	[    1.772098]  __driver_attach+0x90/0x1a0
	[    1.772111]  bus_for_each_dev+0x7c/0xe0
	[    1.772124]  driver_attach+0x24/0x30
	[    1.772137]  bus_add_driver+0xe4/0x208
	[    1.772150]  driver_register+0x68/0x124
	[    1.772159]  i2c_register_driver+0x48/0xcc
	[    1.772173]  rmi_i2c_driver_init+0x20/0x1000 [rmi_i2c]
	[    1.772185]  do_one_initcall+0x60/0x1d4
	[    1.772198]  do_init_module+0x5c/0x21c
	[    1.772211]  load_module+0x18cc/0x1e60
	[    1.772222]  init_module_from_file+0x88/0xd0
	[    1.772234]  __arm64_sys_finit_module+0x1c0/0x320
	[    1.772246]  invoke_syscall+0x48/0x104
	[    1.772261]  el0_svc_common.constprop.0+0x40/0xe0
	[    1.772274]  do_el0_svc+0x1c/0x28
	[    1.772287]  el0_svc+0x34/0xe0
	[    1.772298]  el0t_64_sync_handler+0x120/0x12c
	[    1.772309]  el0t_64_sync+0x190/0x194
	[    1.772324] Code: d346fc43 92800004 9ac22084 d37df065 (f8656802) 
	[    1.772331] ---[ end trace 0000000000000000 ]---

