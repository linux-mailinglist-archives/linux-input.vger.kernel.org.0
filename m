Return-Path: <linux-input+bounces-14655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8AB552F2
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 17:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E006E16C8DB
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 15:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1ED221F09;
	Fri, 12 Sep 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6vtMwod"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A872144C7;
	Fri, 12 Sep 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689978; cv=none; b=lgs+9MHxuydiVRaqKIQ0vIDnxegfgCGEGa998kCzAOKknWdF6hODcH/a/PGVjK1vxjolv6RjpsixlEWmpy4TEN8E1tldJLogOp81AVzrBtf1cQTnFa/htwGM/jHaQFof1r9l07oL+hwdt3yidSNfz76azYzp1C7tMgDlTWTXZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689978; c=relaxed/simple;
	bh=mRzSKcC/KI18SwXAI1Q2W1SKGXdrV1Xe4lyDTEro8FQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dX34NhYvTpgivpdv6GWWVBXjca3HXByU3WSZkuDnE//s+xb7D/XKqlxN7eYlSNFn9rPL6xULyHOsbCzwufbZObZ6PjNWCkf4K8vDgvm/6VDFYfF5mY4etbqhcPASrmJ5CQyhOe/s7AEqH1Lma4NYdaF8DtBGKpZy9X6GccUnY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6vtMwod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E11C4CEF1;
	Fri, 12 Sep 2025 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757689977;
	bh=mRzSKcC/KI18SwXAI1Q2W1SKGXdrV1Xe4lyDTEro8FQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n6vtMwodxMYpMOJYOSdMEfmpibq/tvz/p370QvTbOY37BZJ7VKtGFR87nf4+6Yf7n
	 Q4LdILUkg9dz2fnPpDWljpEIwL4ZZw2wqdFlW3sOHh+OQcOfniVVKjM91H/dnoZaRN
	 I2t2oKQUtduYYG3VvKELZ9l+OKPJ4D/xz3s/fJX9V4U0gyVNzXng6wv0kingTxhVu6
	 KvLHmlFGsQv5sNwYYIthAbH7uU4WwoXUG8IGKgHPKUlVolmWSawhFLi1JDd7npbf67
	 wPCQ+o4/3C14LH0tei05Wj9NsDQp16MDX5ePO+Z6rdaTrIRfvYHXEQPEMG2TVcocHe
	 GYdkVTzxRKtAg==
Date: Fri, 12 Sep 2025 17:12:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
cc: Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: bpf: allow bpf to rebind a driver to
 hid-mutltiouch
In-Reply-To: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
Message-ID: <7462634n-519r-2461-o17o-6s4q0po26n9q@xreary.bet>
References: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Aug 2025, Benjamin Tissoires wrote:

> This happened while Peter was trying to fix a Viewsonic device: the HID
> device sending multiotuch data through a proprietary collection was
> handled by hid-generic, and we don't have any way of attaching it to
> hid-multitouch because the pre-scanning wasn't able to see the Contact
> ID HID usage.
> 
> After a little of back and forth, it turns out that the best solution is
> to re-scan the device when a report descriptor is changed from the BPF
> point of view.
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
> Benjamin Tissoires (2):
>       HID: core: factor out hid_set_group()
>       HID: bpf: rescan the device for the group after a load/unload
> 
>  drivers/hid/hid-core.c | 44 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)

Now in hid.git#for-6.18/core. Thanks,

-- 
Jiri Kosina
SUSE Labs


