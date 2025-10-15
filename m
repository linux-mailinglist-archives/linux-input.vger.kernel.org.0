Return-Path: <linux-input+bounces-15504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F7BDF4F8
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 17:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFA24505C1A
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 15:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FB92FB62D;
	Wed, 15 Oct 2025 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dc3Lg5EQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACA2FB0B7;
	Wed, 15 Oct 2025 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541477; cv=none; b=dcwdyNPDR3P+uEVrzuZw513enLpP17oy4O3YabiumIXrD3W3Nl87RsIBcHidkyQgd/5gobK4Rn9gKOIe9SN3S7sgqvR7LlR0N1PBL1E1Xmefq5lGEOHroaBO4lN+pc3k+hvw/q/LW0mo60k5E6zZnHJWJ9+reokqtgbYc62IClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541477; c=relaxed/simple;
	bh=v92RAT4Xz9qvTX+waPKnsiJB/HoT0A1NhS1028kNez0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CX+qXCyJ8V6XZswHOBxr+VxAPeTeZVLjcoMRDlrQv1lWCeZ7WGRGKCpucgor6CEv24eky6UvfSXHhwvsotgGe+y8zR/a61O8SFsN2wWjuQFS8sqdCIoPTj+G5coOAgEydmqANrn/IKXwavIJckwJ6MVnOJ1TvksZ/XIvRFDNhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dc3Lg5EQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9FDC4CEF8;
	Wed, 15 Oct 2025 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760541476;
	bh=v92RAT4Xz9qvTX+waPKnsiJB/HoT0A1NhS1028kNez0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dc3Lg5EQpQthohDWIJ7BI87zd/rLwi4K3xLHuYy8ppYtbEYwAnPD2swWtWQx54DJD
	 htxYFEXz1DYurPcndwVsjUNNJy4Na2GAFegZdaiciFG7Z5B0o4v739K8NPzwaT+bwH
	 rQ23FadtmrMMvGA1eLYbQ2mJ15CT2iwKMaCTlf29LLDypbRRkMxP1mjcVIASOQUOUy
	 ksYlpYvUaNOERyziptUZPjKT6bFX18jd3o+PQ1zxX5ecwhGbDW5c7X+h0zdFx884Lw
	 BKcnBE6REbTtYobR2vAN8HHW/5FAQZFNpgAoHDyvRLXW6UMzSsNCyEVebXJP2eKs39
	 q8ZTiK4HsI+fA==
Date: Wed, 15 Oct 2025 17:17:53 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    Tero Kristo <tero.kristo@linux.intel.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] HID: multitouch: fix name of Stylus input devices
In-Reply-To: <20251008-hid_multitouch_stylus-v1-1-9f43f7e79195@igalia.com>
Message-ID: <pq18q556-n54p-0ro6-7no8-8q0rp0237on3@xreary.bet>
References: <20251008-hid_multitouch_stylus-v1-1-9f43f7e79195@igalia.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Oct 2025, Thadeu Lima de Souza Cascardo wrote:

> HID_DG_PEN devices should have a suffix of "Stylus", as pointed out by
> commit c0ee1d571626 ("HID: hid-input: Add suffix also for HID_DG_PEN").
> However, on multitouch devices, these suffixes may be overridden. Before
> that commit, HID_DG_PEN devices would get the "Stylus" suffix, but after
> that, multitouch would override them to have an "UNKNOWN" suffix. Just add
> HID_DG_PEN to the list of non-overriden suffixes in multitouch.
> 
> Before this fix:
> 
> [    0.470981] input: ELAN9008:00 04F3:2E14 UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-16/i2c-ELAN9008:00/0018:04F3:2E14.0001/input/input8
> ELAN9008:00 04F3:2E14 UNKNOWN
> 
> After this fix:
> 
> [    0.474332] input: ELAN9008:00 04F3:2E14 Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-16/i2c-ELAN9008:00/0018:04F3:2E14.0001/input/input8
> 
> ELAN9008:00 04F3:2E14 Stylus
> 
> Fixes: c0ee1d571626 ("HID: hid-input: Add suffix also for HID_DG_PEN")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


