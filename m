Return-Path: <linux-input+bounces-4664-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8491A05E
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 09:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E391B1F2168F
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 07:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00FE4D8B9;
	Thu, 27 Jun 2024 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDWa8y05"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3D4D11D;
	Thu, 27 Jun 2024 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473141; cv=none; b=k47B7iH/LuZeHfBKArClLVMItohabdJpQPXNh2uBGTPOLMWBjIMUkhTd2qLpMbdMDpee+g6orkcWzQ3UUprXFIH4tjMCqw1V/W+3haVVz7sV5SUvJ7piFXuDf7oGyoSnwYfNHJf9kMBJV/2zXxTpe77ecIbuxMHi2EqoJFlteDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473141; c=relaxed/simple;
	bh=6fyTLJ2HziCr4ZgDtapcWHnP1N8zwoxz7J4y52+smGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rNGGl3XFXu8VLKHWHjZJjwpVZwqoW5iYTVg6g21L1csu6BA/2Bvu3t2iL8BH/7RQHNMrOYHGrUWeoHsRamtiakNGbkrIs0bhIdiD3w8Z3/wAkCXzBzuNTkOKx2BGPT1/Ap/untdfNoIAiJ8ClTnNuqEw4I7vz5vgcz04i6S+dJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDWa8y05; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F379BC2BBFC;
	Thu, 27 Jun 2024 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719473141;
	bh=6fyTLJ2HziCr4ZgDtapcWHnP1N8zwoxz7J4y52+smGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NDWa8y05gx3m+z7P7IcAgrbm347pYwZrvRmbNw2NQRihWiLSmDwqLtlDyEHpSCHbT
	 Nz0Mctosop3utEoU4XF9eIKD5FTSqQOTy7H+PVpIpDvL4Z5dWIVj4DLjXMP+Wulg8l
	 G4WuZ0HGHrU/FF/qEtOnbxS9SDpagPD24MbCxNFb4F8C88EKQk09EFMc3FMay9u0M9
	 oY88TESGKktp2Wmm1r2OJUHTQZufu0I/mSGRMifchgKH9SmGEYvEe8YiFNCZsk4daq
	 h3Y0+q+KNumlYVUgWz0F3X4/9wnYf0uVJ3dwhPpBZ8O7LRboCGFsWmzB4ZsztCTw6n
	 GJ21yzJlB8aUw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: skhan@linuxfoundation.org, ricardo@marliere.net, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240625105553.50830-1-luis.hernandez093@gmail.com>
References: <20240625105553.50830-1-luis.hernandez093@gmail.com>
Subject: Re: [PATCH RESEND] hid: bpf: Fix grammar
Message-Id: <171947313973.11413.11930898416850500936.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 09:25:39 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Tue, 25 Jun 2024 06:55:51 -0400, Luis Felipe Hernandez wrote:
> * spelling fix: XBox -> Xbox, lowercase 'b' as per Microsoft branding
> * rephrase: paddle -> paddles, the controller itself has more than one paddle
> * rephrase: replace usage of "those" in favor of explicitly making reference
>   to the paddles
> * grammatical fix: report -> reports, use present tense verb.
> * spelling fix: interpret
> * consistency: capitalize the first word in bullet points
> 
> [...]

Applied to hid/hid.git (for-6.11/bpf), thanks!

[1/1] hid: bpf: Fix grammar
      https://git.kernel.org/hid/hid/c/9e16bada9299

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


