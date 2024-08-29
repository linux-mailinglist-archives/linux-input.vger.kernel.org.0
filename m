Return-Path: <linux-input+bounces-5991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A098F965056
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E63528B2FA
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0041BA293;
	Thu, 29 Aug 2024 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyGwZxJ9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE041B9B4E;
	Thu, 29 Aug 2024 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724961110; cv=none; b=OyTvbrrA12KoM/uVi40QH6+nSwm4j9xBTNtH2NBV3zGAIJ3KmYMruO0/kWrlzDAMlSIcE5pGFlqzSlvL7SmnyLo99K0wZTkdp1wvRwOW4rgA4DrjgVfRqmAeBjjIumWGBO/MiRUdYxWMH/poHBzmgbNe12R/t4B1OV1gI3Mc2X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724961110; c=relaxed/simple;
	bh=cfIKT9eNvoU1qh4Xk0i3IXhcZ1HonaBRt9s9t/j3xCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BFwjXqFBJPKMQ0K9MEzfLD7gcX82bxMl8CLQBrtgdbcvu/eS2hZErTP7zCUMPINVb0UXdS6r63IAqqwP1DkoYRHx1N6Z5pNhKh8XQmhZDbuMBAL4kmbvIlOAWoHca4mpfdiws0K6qLchAS2qMPZEDmm6DsUgj5CH+0Mfudy2OdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TyGwZxJ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FD5C4CEC1;
	Thu, 29 Aug 2024 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724961110;
	bh=cfIKT9eNvoU1qh4Xk0i3IXhcZ1HonaBRt9s9t/j3xCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TyGwZxJ9/DMvX+cYxpJttg81315XS4eoXgWV7JZhXzBnSh1mDZf/b0FKuFqAnS8n7
	 BqRSk3IAOExnm0CPflxQ/k1Stfe0gF8BFdMmyakZO/O5M3AlJiMXwexsoGjtU5//RH
	 zULZlWNTFOwFIXcO6JZ6BNy2uDyH3zvxMu0sJ6iP0wKgCbJB4MWGUqQnyJK80Vr+NX
	 JdeR8Pi0r2plSPEw0LsHxsYY/3CqigmxDQUwYS2ieUZY3nzwSjOdcCydapPbTMPlpd
	 HsSbt8b6N6wn06PTZPCNgnpD9PhGgbDlhuPS4+6SypASxUfJpfr2X5H2GcpRjedcYx
	 q3JgGtykB0lWQ==
Date: Thu, 29 Aug 2024 21:51:47 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Charles Wang <charles.goodix@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] HID: hid-goodix: Fix type promotion bug in
 goodix_hid_get_raw_report()
In-Reply-To: <a04cfa63-de06-4d09-af80-a567f2db8f12@stanley.mountain>
Message-ID: <nycvar.YFH.7.76.2408292151350.12664@cbobk.fhfr.pm>
References: <a04cfa63-de06-4d09-af80-a567f2db8f12@stanley.mountain>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Aug 2024, Dan Carpenter wrote:

> The issue is GOODIX_HID_PKG_LEN_SIZE is defined as sizeof(u16) which is
> type size_t.  However, goodix_hid_check_ack_status() returns negative
> error codes or potentially a positive but invalid length which is too
> small.  So when we compare "if ((response_data_len <=
> GOODIX_HID_PKG_LEN_SIZE)" then negative error codes are type promoted to
> size_t and counted as a positive large value and treated as valid.
> 
> It would have been easy enough to add some casting to avoid the type
> promotion, however this patch takes a more thourough approach and moves
> the length check into goodix_hid_check_ack_status().  Now the function
> only return negative error codes or zero on success and the length
> pointer is never set to an invalid length.
> 
> Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch Dan, applied, thanks!

-- 
Jiri Kosina
SUSE Labs


