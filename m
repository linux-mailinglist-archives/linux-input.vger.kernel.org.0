Return-Path: <linux-input+bounces-7534-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C99A3C2B
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 327A3B27056
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0D42038C2;
	Fri, 18 Oct 2024 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aS/j6LpA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693502038C1
	for <linux-input@vger.kernel.org>; Fri, 18 Oct 2024 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248655; cv=none; b=fwmzT5etqTURVNspDMzeW+yfZyFLAgGVM8Kz0e89Q1TpwESO3p7tWHyKxrns9zQ+2RtQBgUoAQaLn65+f4WSzEnK1uOdpPw9w8EXC568uoLjwZB0VEpEC6J3K9DGRUEFgnkl/OjcV2ZLD9mEvVfCLVKctvdidCVIxKw+XhBqSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248655; c=relaxed/simple;
	bh=wM2/0jHC59bTIdFdrSjggaQRJsKTAZC/soKQ4FNdgVs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WzJYamp2ae0PKh8srT/nHGVFPunQLcAZ9Tths10AAMzjKR1vr/GZ0/P5u05EItO0VYlANAhMeqaqMvz1jOxspV6kFQgVmOOAEkSIyEg6MIx8lE4MGfjpG5XtirKBg/NSPd/1lHdniiU8ZjVWHwroBwqhW9FgQv0p4f4VkpaXU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aS/j6LpA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FB3C4CEC3;
	Fri, 18 Oct 2024 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729248654;
	bh=wM2/0jHC59bTIdFdrSjggaQRJsKTAZC/soKQ4FNdgVs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aS/j6LpA1XeViyE2HOVVQj6adPGV/ERcLF+X1j8aFqVMkYANvXw1pCypOxVlk42hq
	 Kd165PYttDtfAhC/b3diF5swRO2y2CwfuwmZVANyX1bH/kUMfBNYKoQj3saFOtKdhT
	 fdV7JBnvoeZ+JviXi+KVISloLEpo04cO8RANfyS6Mrwa6EsQOVWFm0aOePdqfKM/sV
	 hU3cGyn6VuvBsof8T1nI78uK0blT1Y2y9emwJMnuVZSpQoQCMqftiAB/tLYx4ZB1Kj
	 2RFkXhTU6H/oeM1flOjUhDLMuBUgdjRVEwAnoHddG8WSovgP9qJ+736fWPd+5yAShA
	 DbJk+An62Si4w==
Date: Fri, 18 Oct 2024 12:50:52 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: He Lugang <helugang@uniontech.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [RESEND PATCH] HID:replace BUG_ON() with WARN_ON()
In-Reply-To: <60AAFF285046F56C+20240925062824.731446-1-helugang@uniontech.com>
Message-ID: <nycvar.YFH.7.76.2410181250280.20286@cbobk.fhfr.pm>
References: <60AAFF285046F56C+20240925062824.731446-1-helugang@uniontech.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Sep 2024, He Lugang wrote:

> There is no need to kill the system entirely in HID with BUG_ON,
> use WARN_ON to handle fault more gracefully which allow the system
> to keep running.
> 
> Signed-off-by: He Lugang <helugang@uniontech.com>

Good catch, in all three cases the BUG_ON() is a crazy overkill.

Applied to hid.git#for-6.13/bug-on-to-warn-on, thanks.

-- 
Jiri Kosina
SUSE Labs


