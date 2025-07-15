Return-Path: <linux-input+bounces-13551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD8B062F0
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 17:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35F5B7A4EB7
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 15:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBC423956A;
	Tue, 15 Jul 2025 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3Pmb4nm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30CC238C06;
	Tue, 15 Jul 2025 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752593400; cv=none; b=NTC+2QftCjo5aPIzUOQOSmDSlpZQm9DjMnDNNL04TsAmP2h7pBvD1J0+v+cLHBquoRA6ITS49PHsvEkDZkXXOUzlt04r1G1de+6jUbkYp4e1dZP21XjGLvlTLh46fmkV1UdO87kX2XbHcYG+2q0s3kzCjkng0F0MyCr8Vuon1gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752593400; c=relaxed/simple;
	bh=FeSYrHc49ok8ajQzXHOBsoSsGDvdw6KtwE5lGhWCJnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uUafBvmiPpRt1yt7RwmYp0YdKSGUQWuRgx32UXnDLdeZqqpNE1q4SGQtg/dUNqUxaAqkQt/p2cTaA+ce9jFmqD098PC4PV7cic55pK1oGYCtkNMXkmWpr37TwfxobHMowPKpfU9Sc0CLAtxOgwiV3bLTHe9ZFajA752FwxK6mpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3Pmb4nm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0658C4CEE3;
	Tue, 15 Jul 2025 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752593400;
	bh=FeSYrHc49ok8ajQzXHOBsoSsGDvdw6KtwE5lGhWCJnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b3Pmb4nmNbXOaZ8iw7Wz9cTKN+i403X6dewwgzmp7c8Y0zRw2ylSAA4OneampnGYH
	 qxe94hAPiT0n1kJkXBfcr04UiECDTaxJl5Nmb4W8zN4CW/g8TJ5MyRFXSodESNiZvx
	 e2jfSFhBesa7QWcJztB/luAqAjsoQw8LR+4QIl6sDDJGe9xCKj4y07iz7oqQuex8ip
	 qZqzsRe4KQXHgTOFmFseeYk+WSkrob5iWnw5H4W7tpMRze/GCkdabSa+nSlhua38Qt
	 YsWOppqpZYy7N2DfNQR92RGRfSLCmOu4Ad6m+KWptG4Vs9L/uuQvlXpEwHevs/rZYc
	 E/TejLZH0yoSg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
 USB mailing list <linux-usb@vger.kernel.org>
In-Reply-To: <1c8416cb-7347-4a06-b00a-20518069d263@rowland.harvard.edu>
References: <20250710-report-size-null-v2-0-ccf922b7c4e5@kernel.org>
 <175239324234.1701499.15395216375379684975.b4-ty@kernel.org>
 <1c8416cb-7347-4a06-b00a-20518069d263@rowland.harvard.edu>
Subject: Re: (subset) [PATCH] HID: core: Improve the kerneldoc for
 hid_report_len()
Message-Id: <175259339951.49458.13286420186218514493.b4-ty@kernel.org>
Date: Tue, 15 Jul 2025 17:29:59 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 13 Jul 2025 11:36:12 -0400, Alan Stern wrote:
> The kerneldoc for hid_report_len() needs to be improved.  The
> description of the @report argument is ungrammatical, and the
> documentation does not explain under what circumstances the report
> length will include the byte reserved for the report ID.
> 
> Let's fix up the kerneldoc.
> 
> [...]

Applied to hid/hid.git (for-6.17/core), thanks!

[1/1] HID: core: Improve the kerneldoc for hid_report_len()
      https://git.kernel.org/hid/hid/c/12f33ef6c2aa

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


