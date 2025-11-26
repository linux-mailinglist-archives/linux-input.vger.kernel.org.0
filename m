Return-Path: <linux-input+bounces-16347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E72C8A914
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77FE93A6133
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 15:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CFC30B53A;
	Wed, 26 Nov 2025 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWKAV+gc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A731305068;
	Wed, 26 Nov 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170086; cv=none; b=ohZiFeeYmxQh2QDtFqveYtx8NO4uQd3WXm2sjIJu86VeW3xoCBL53to+4SSLTGiAsbK0CISCc4JqysWP1oaZKGJGiYvXOchMqQHO3u/8OMyzaJpI37KfAuP/arxuBM3xxadsSt1Kh6n14hocGKyiX753jSupnkkxysMv2XTcqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170086; c=relaxed/simple;
	bh=XBgL8belC8WkVo4z5wVYEy7xRd55WxnsQC6SwPL3Q34=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GSYoqyXmSyJBhCKk89lqqD9JAO738MYRj8TbfsEvDKI8hp4gm8aAqd92RUyYuqRCvDAtOPTHrfAm6IpPmwAnbTEUKhA860U+OoT8UDSdgP5B8Pz8yV0/ZDGLIrhSRwTJFpc9owB7VwxOL3EsFUBpbgC3DZ6vyO2mxyOmoZUixSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWKAV+gc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A53C4CEF7;
	Wed, 26 Nov 2025 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764170085;
	bh=XBgL8belC8WkVo4z5wVYEy7xRd55WxnsQC6SwPL3Q34=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cWKAV+gcJHavRV1Lq9Bm5TSuWYtGoDD3sGT/g7Bz57RSINDBETs6yT5dBJTBV7LF+
	 Wd7cw35qa3YopnEFtivmpvVyjGarHAAbxrDLwq7EG8rE9ICne5UzV63f+t0qMcdsHw
	 hP0dkXE9YCVx5WMH5AkRziJG3H8x7hjO2DOk19HzbDLFlton3vCu6BWmERaMmaeZWi
	 uHGPpziFDk84eTN0fMAsX4vCU5b0QC6x6egRZUqEg7l50s9rL5OskE+CbKB6vBSqAj
	 Au7DWI7ArB/nZHZYlbvP5w7c/VxOf89bZbLPaJlaeXIUURzrHRh/DiyuVPvMgJsYwR
	 RmfMKK5TC4doA==
Date: Wed, 26 Nov 2025 16:14:42 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Nathan Rossi <nathan@nathanrossi.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>
Subject: Re: [PATCH] HID: logitech-dj: Add support for G Pro X Superlight 2
 receiver
In-Reply-To: <20251108141300.3402380-1-nathan@nathanrossi.com>
Message-ID: <1s044rn1-962q-50r8-5808-r5605s9p1s3o@xreary.bet>
References: <20251108141300.3402380-1-nathan@nathanrossi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 8 Nov 2025, Nathan Rossi wrote:

> The Logitech G Pro X Superlight 2 has a lightspeed receiver with a
> product id of 0xc54d, this receiver behaves like the receiver used in
> the original Logitech G Pro X Superlight (id 0xc547) including the 13
> byte mouse reports.
> 
> This change adds a definition for this receiver id, and a mapping for
> the recvr_type_gaming_hidpp_ls_1_3 type. With this change in place the
> receiver now reports the battery status of the connected mouse over
> wireless as well as exposing the HID interface needed for userspace to
> perform additional configuration with libratbag/Piper.
> 
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


