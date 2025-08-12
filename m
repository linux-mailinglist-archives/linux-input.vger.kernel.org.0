Return-Path: <linux-input+bounces-13939-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE0B2274E
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51A293ADCC9
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737B2227B9F;
	Tue, 12 Aug 2025 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvr2PH6Y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5D199230;
	Tue, 12 Aug 2025 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002910; cv=none; b=e1vEjX6Z0a5XNol8fK/+ocbJ+GOrOIbEu37Es+O71gJmhEpYafH1RjibpFs3812yv1OofComv+yCCGN9Sh4hC/AW1DwmHmfqLKCLLSxtlUN0Ds8ReMiDKR8oFYBiES3g51fdwLtO48NAEe3DWoUlprnUcVZUF7HatKBchi+hQbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002910; c=relaxed/simple;
	bh=i/vGmqu9dH6WECIjxg44yJaSv5Tp+gsmXK0hqRe81+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gXt/X4ahpWtGl+6dQ3bvHZ2F6eww90BPIyHKkfT4T/Uo+z+mdg4lnsAEh5heOWwjIPzITiaLQtVFmoEHsT2Bvtlf6Nmkhk8FwVKn3foIyj7nzusxdiBnfT7r2K38K/QKrI+bdv5Hez6DnIGnmW/YcaIs234AgdMNrhREHXXJL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvr2PH6Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D5DC4CEF0;
	Tue, 12 Aug 2025 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755002909;
	bh=i/vGmqu9dH6WECIjxg44yJaSv5Tp+gsmXK0hqRe81+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dvr2PH6Yj8f0OBVwaaJHNIN4ZRIt2K/GerN1FTiy03jPBgED48IvCxVTfPKPDdAqt
	 qtfAk+p3J0nNikz/O4xko2kX6/wKxOXmSUMQXgWtlZb6ni5E9UmTLReBBcAj9FE1jr
	 oPCizXq3SVMopiZVY6gvhf/T6LE+Cbpc5HjgOTuskrcBHIFrjFKjSA72L4SwJStVou
	 9SEXwBmDvyhMGXlIW3YXxVVgLWRk7ks6hCd+AZ8t7lp7rbVSP2E4isxmwdftxiio1I
	 TUzJrm3oiCvnZLSHcm2JqKcuejTgoXljOc6JgJ+KrRoQHZ1meQyFjAkehT844HUCB3
	 aXMiDukzEt77Q==
Date: Tue, 12 Aug 2025 14:48:27 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jeongjun Park <aha310510@gmail.com>
cc: bentiss@kernel.org, hadess@hadess.net, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: steelseries: refactor probe() and remove()
In-Reply-To: <20250717112643.1410093-1-aha310510@gmail.com>
Message-ID: <4r8n3287-o91r-4903-0o01-5q93834sp47n@xreary.bet>
References: <20250717112643.1410093-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Jul 2025, Jeongjun Park wrote:

> steelseries_srws1_probe() still does not use devm_kzalloc() and
> devm_led_classdev_register(), so there is a lot of code to safely manage
> heap, which reduces readability and may cause memory leaks due to minor
> patch mistakes in the future.
> 
> Therefore, it should be changed to use devm_kzalloc() and
> devm_led_classdev_register() to easily and safely manage heap.
> 
> Also, the current steelseries driver mainly checks sd->quriks to determine
> which product a specific HID device is, which is not the correct way.
> 
> remove(), unlike probe(), does not receive struct hid_device_id as an
> argument, so it must check hdev unconditionally to know which product
> it is.
> 
> However, since struct steelseries_device and struct steelseries_srws1_data
> have different structures, if SRWS1 is removed in remove(), converts
> hdev->dev, which is initialized to struct steelseries_srws1_data,
> to struct steelseries_device and uses it. This causes various
> memory-related bugs as completely unexpected values exist in member
> variables of the structure.
> 
> Therefore, in order to modify probe() and remove() to work properly,
> Arctis 1, 9 should be added to HID_USB_DEVICE and some functions should be
> modified to check hdev->product when determining HID device product.
> 
> Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>

Applied to hid.git#for-6.18/steelseries, thanks.

-- 
Jiri Kosina
SUSE Labs


