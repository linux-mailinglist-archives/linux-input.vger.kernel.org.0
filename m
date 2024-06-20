Return-Path: <linux-input+bounces-4487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3691020C
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 13:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6207282C8F
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479F4433C9;
	Thu, 20 Jun 2024 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXXUdK97"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227AC21A19
	for <linux-input@vger.kernel.org>; Thu, 20 Jun 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718881302; cv=none; b=j5jeaD1ZmbPqC5P7lYR0qY+5GZdabmcnl8el9gceKD+r/S1XUNTk6Hg9+cMBSRztSpsbl42FRQ/sT3obieOc77bSLs/yt30xn3saGzjnBL0OTW2DfC7wBvOUU9+MHZgy1LUhAv+ynlx8Z2nulR84pxIrRzQKkVnO+aRjVqEMVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718881302; c=relaxed/simple;
	bh=t3sgE0x9AbD57jiCr5FUfU139Gg0VdDVokNa7k0YyDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDu+UvodGGKmQzN4Leb1WgzwBwkZSAOu6a8d9oySZ534gKCunOvdC3auprbIgPLgBYP2afHrFYxhfvu5LDCtVFUhSCglgi2J+mikPuxKn+lVyVzANnyAZKLnipe5+bTO6VgAKKIYza/Aw38qj9pFeYVpxVkYbtPd++jzscYUdwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXXUdK97; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E2AC2BD10;
	Thu, 20 Jun 2024 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718881300;
	bh=t3sgE0x9AbD57jiCr5FUfU139Gg0VdDVokNa7k0YyDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXXUdK977lALMBlfHXSEzOJRJgKy9QTfhb4yCLqViHg9VhPqRS+vtfyF7RZaGsPFd
	 Nr8mE7Qzvo6rAKfnTQicYt5Rk+8STzZbWboGZhprmMCNe4flX+Nmx/8f60V3kwJnRI
	 IX0C+vwVXUXRMXwlzy00R1MMtu6DFgiWVFOiKa7+NpcmvYYOqZ2UwpGcKAZ89Nabme
	 bSZR5Di8Jrm9WKaHUMd3RQ0PTaMYb4pu2SZ+cTYKIYR6PpolvX7+IRraslFAeS4YXY
	 zIOOtM97DMc0KMYW4hcbYSnEUixLXbMNxVRiXYrkoH/KyzPhdikSVYj/DXVpZIU7Zf
	 wf60XNQLKguJw==
Date: Thu, 20 Jun 2024 13:01:36 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-input@vger.kernel.org
Subject: Re: [bug report] HID: bpf: remove tracing HID-BPF capability
Message-ID: <aiw25qbnoyzefiwzicjhe4docbs2xis6l756fpi4xhmvgiajr3@pfrdaslfss6r>
References: <00f7b624-219f-4a05-a7ad-5335f15a41c7@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f7b624-219f-4a05-a7ad-5335f15a41c7@moroto.mountain>

Hi,

On Jun 20 2024, Dan Carpenter wrote:
> Hello Benjamin Tissoires,
> 
> Commit 4a86220e046d ("HID: bpf: remove tracing HID-BPF capability")
> from Jun 8, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/hid/bpf/hid_bpf_dispatch.c:65 dispatch_hid_bpf_device_event()
> 	error: uninitialized symbol 'ret'.
> 
> drivers/hid/bpf/hid_bpf_dispatch.c
>     26  dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type, u8 *data,
>     27                                u32 *size, int interrupt)
>     28  {
>     29          struct hid_bpf_ctx_kern ctx_kern = {
>     30                  .ctx = {
>     31                          .hid = hdev,
>     32                          .allocated_size = hdev->bpf.allocated_data,
>     33                          .size = *size,
>     34                  },
>     35                  .data = hdev->bpf.device_data,
>     36          };
>     37          struct hid_bpf_ops *e;
>     38          int ret;
>     39  
>     40          if (type >= HID_REPORT_TYPES)
>     41                  return ERR_PTR(-EINVAL);
>     42  
>     43          /* no program has been attached yet */
>     44          if (!hdev->bpf.device_data)
>     45                  return data;
>     46  
>     47          memset(ctx_kern.data, 0, hdev->bpf.allocated_data);
>     48          memcpy(ctx_kern.data, data, *size);
>     49  
>     50          rcu_read_lock();
>     51          list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
>     52                  if (e->hid_device_event) {
>     53                          ret = e->hid_device_event(&ctx_kern.ctx, type);
>     54                          if (ret < 0) {
>     55                                  rcu_read_unlock();
>     56                                  return ERR_PTR(ret);
>     57                          }
>     58  
>     59                          if (ret)
>     60                                  ctx_kern.ctx.retval = ret;
>     61                  }
> 
> Can all the e->hid_device_event pointers be NULL?

They can, but then hdev->bpf.device_data will also set to NULL in 99% of
the normal cases. The only case where device_data is set to a value and
hid_device_event is never set anywhere is after the last bpf filter has
been removed.

> 
>     62          }
>     63          rcu_read_unlock();
>     64  
>     65          if (ret) {
>                     ^^^
> If so then ret is uninitialized

Yep, good point. Let me fix that in my followup series.

> 
>     66                  if (ret > ctx_kern.ctx.allocated_size)
>     67                          return ERR_PTR(-EINVAL);
>     68  
>     69                  *size = ret;
> 
> 
> regards,
> dan carpenter

Thanks!

Cheers,
Benjamin

