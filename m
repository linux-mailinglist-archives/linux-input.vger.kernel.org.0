Return-Path: <linux-input+bounces-9139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 330DCA094A2
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 16:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CDF01647F0
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 15:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7884520DD79;
	Fri, 10 Jan 2025 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBF3FL0U"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2C0204C38;
	Fri, 10 Jan 2025 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736521520; cv=none; b=q3OXTQPvkmf2jUKm3ieU9VsqLMs8QMOt3hrkpeleSLGnqGdOvS1tstuVykCHjeGoQqEnRdQHErrYXIFnarPX/DARBXIoxIMKCFap4p/ePyENzPJ7//XqypUnyeNfKeh2wVDEEA06Ofebh45kWfWLRUArn7RIZ0um0lXws58AWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736521520; c=relaxed/simple;
	bh=KD6Vf7pqLFDls8DkTM8a2ldMz9gY2i5DUKKvgKTyagc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ekbjx/BcyUAfQXoNo0UmiF2D2eCYWKBxkxOcd0i7XN0xDDpiLKtalDfB3L/EtKugzt9HYL7hN7ic1PR8XGurUdrTwkwk/nxME+eob33C5OS9DNFT0cJZYQZPUh9J8uzLjEFCXOVlkZTd2aM03r9La8sRX6yzzKVAGaguMc366Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBF3FL0U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE8AC4CED6;
	Fri, 10 Jan 2025 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736521519;
	bh=KD6Vf7pqLFDls8DkTM8a2ldMz9gY2i5DUKKvgKTyagc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SBF3FL0UsWkhZXail9ep+UI/F7q0zJdXRJ3/GQ/w+4iZJv02q5T6VQBm1MXsXb791
	 7bEHkeUVgHa/BxzLDsilN1yE5DefUPoNUaul5cJfACxZzocGFdMjw6OydWGloEjyj7
	 1QTWKod7p1XnGYQCNVQ/yv6r+VGFABtrkDBhv9TZQkmrr4x1frWSJtilVQCLx1HAHx
	 FixP8kUADt/zyk+pVHtHP4YxOadrETPqrkvQjadQBMS12NgvZSdu6/MUKSPSevgcSs
	 ji7FZmFQRGXow3WemLdPd2eXck5rgjl95IBqYrtf6ZHv33KVWHbTMNuSxIsJ7g8Lm7
	 y40jwM/SqGbQQ==
Date: Fri, 10 Jan 2025 16:05:17 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, 
    vsankar@lenovo.com
Subject: Re: [PATCH] HID: lenovo: Fix undefined platform_profile_cycle in
 ThinkPad X12 keyboard patch
In-Reply-To: <20250110141409.96959-1-vishnuocv@gmail.com>
Message-ID: <p6s4s47q-15ss-ps35-6387-n2nsqn05o335@xreary.bet>
References: <20250110141409.96959-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jan 2025, Vishnu Sankar wrote:

> The commit "HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys"
> introduced an issue where the CI failed with the following error:
> ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] undefined!
> 
> This issue occurs because platform_profile_cycle is used without ensuring
> the kernel is configured with CONFIG_ACPI_PLATFORM_PROFILE.
> To address this, this patch adds conditional support for platform profile
> management to the Fn+F8 key handling.
> The functionality for platform_profile_cycle is now included only when
> CONFIG_ACPI_PLATFORM_PROFILE is enabled in the kernel configuration.
> 
> This ensures compatibility with kernels that do not include the ACPI
> platform profile feature, resolving the CI build issue.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


