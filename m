Return-Path: <linux-input+bounces-4163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2E8FE18F
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 10:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F271C24298
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 08:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424ED13C3F9;
	Thu,  6 Jun 2024 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXWkv87T"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700F224D6;
	Thu,  6 Jun 2024 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663775; cv=none; b=FGfnR5eEchyMxDbKdls3Sj8lj+zRA9TUBAW510PMIpej8eoZTts5oUr1MguOa/Ts2Wqh5r1uREWIgkgQX12Ck4oqQHtoOqiyPdmkEvZmAjnRKEmlnpZgj8Cisv51+KgkDeNCC3hVfkrCfHfTimuIkcWuIYLQyzmhmXrId23quvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663775; c=relaxed/simple;
	bh=dfVI/Ias/QH1fB6PdleaDpJdgE9J8+Im8iYfonyb/fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8k6svgKGTJLMLh6QOGCAC6RPChA7u9fcC+8hcZcVA2UrPOYbo3Zoo14NtgmNtuSOXPa4KkMJhFf4dsHvB7PRQsA6o+O4Lv8etKovOuWU9BRe0XHQzTJEx5xAQiNntnEtyUq4Vxz8qDJv6WlT+MqMbQ/ACrv58mDHOV1EP9hosk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXWkv87T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED1EC4AF0C;
	Thu,  6 Jun 2024 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717663774;
	bh=dfVI/Ias/QH1fB6PdleaDpJdgE9J8+Im8iYfonyb/fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXWkv87TKtRUSkjrpl9WBIMY6mBJ9QPS7BtHjKkdBkz0gFi8u5CwaMHyCyby9Szvt
	 B70hE8uW84WT8zRTAdkIccDVLNcC78B2m0zovDwQu04tdlFROBBpctRBEnKJGPv5Zy
	 oeirI1Dn6bfv6NSEaFll6nIPeNgNQqH7YxrIBdMWUb81eK0dxLGMHTHAG88L/9hJW2
	 sOblBxjYyZK7Xd2MaomQqviWZL8eHk8rE+6CoupP9yS5lNaa+NknJQpES4ab5yN6cj
	 FiI6NcuAhj5at0RvlL0NZ+dsj0pv5vW4H0rKwEGZeEPVM6Qj3bhs4rr+FFNBCIQe2Z
	 KZaoWpYqNsGBw==
Date: Thu, 6 Jun 2024 10:49:30 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Luke D. Jones" <luke@ljones.dev>, Jiri Kosina <jikos@kernel.org>, 
	ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 0/2] asus wmi and hid: use HID LED for brightness
Message-ID: <dflqwdl4fo3wv4zjj4jl6sbot6cotscksgpyrbiu3j77lyrwal@s6nomonx4gv6>
References: <20240529012827.146005-1-luke@ljones.dev>
 <b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com>

On May 29 2024, Hans de Goede wrote:
> Hi all,
> 
> On 5/29/24 3:28 AM, Luke D. Jones wrote:
> > Changelog:
> > - v1
> >   - Split the patch in two
> >   - Move function body to asus-wmi and export
> >   - Use array of names and for loops
> > 
> > History:
> > - https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u
> > 
> > Luke D. Jones (2):
> >   hid-asus: use hid for brightness control on keyboard
> >   hid-asus: change the report_id used for HID LED control
> > 
> >  drivers/hid/hid-asus.c                     | 32 +++++++++++++++++++-
> >  drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
> >  include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
> >  3 files changed, 75 insertions(+), 2 deletions(-)
> 
> Jiri, Benjamin since the first patch now also touches pdx86 files
> we need to coordinate merging this.
> 
> There also is a long list of patches pending for
> drivers/platform/x86/asus-wmi.c
> 
> So I would prefer to take this series (both patches) upstream through
> the pdx86 tree to avoid conflicts.
> 
> May we have an ack from one of you for merging this through pdx86/for-next ?

Sure:
Acked-by: Benjamin Tissoires <bentiss@kernel.org>

But I haven't seen the v2. Are you sure you want to take this series as
it is?

Cheers,
Benjamin

