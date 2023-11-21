Return-Path: <linux-input+bounces-153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F4B7F2798
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C3B28265C
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65B71E53A;
	Tue, 21 Nov 2023 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpb9mDKc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1B1FA7
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750A6C433C8;
	Tue, 21 Nov 2023 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700555803;
	bh=7oU59AhZacys6APydlz0Q8zZkl6P3NympOdU5R/Oc3U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cpb9mDKcB5aYYed7/kjYr2pzaCQItJgAcs9utMW+k9X7jToQQgP7pHDWeSDu1pvd+
	 IJFlrlA03ZbHNtnk9BzkOuDIGU3CEAk6xv1M6ASc0KATmaRIl5b+reje3db8mmgN8H
	 TdnWxZvMVeAEwDhTAnZrg+6r3KaFPcLWzEQzqhduG/Tb7u56TW4SCdXb0gOEuqXjR+
	 JP27xIXD2jLV807at3tVO0bjmPjI4XwFzWHMDmfbYdA0htNmacVaQMnM2Os/gD6PQH
	 1UKyjaXhtG6C09i7ziufdGN2b38d6MHp9Ncua8TnvY7s/Sxc3VG/NSY9C74E6+lM4t
	 xRPbVUGkWFcLQ==
Date: Tue, 21 Nov 2023 09:36:40 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Charles Yi <be286@163.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: fix a crash in hid_debug_events_release
In-Reply-To: <20231031043239.157943-1-be286@163.com>
Message-ID: <nycvar.YFH.7.76.2311210936160.29220@cbobk.fhfr.pm>
References: <20231031043239.157943-1-be286@163.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Oct 2023, Charles Yi wrote:

> hid_debug_events_release() access released memory by
> hid_device_release(). This is fixed by the patch.
> 
> When hid_debug_events_release() was being called, in most case,
> hid_device_release() finish already, the memory of list->hdev
> freed by hid_device_release(), if list->hdev memory
> reallocate by others, and it's modified, zeroed, then
> list->hdev->debug_list_lock occasioned crash come out.

I have applied the changelog changes proposed by Rahul and applied, 
thanks.

-- 
Jiri Kosina
SUSE Labs


