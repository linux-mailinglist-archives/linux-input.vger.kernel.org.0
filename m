Return-Path: <linux-input+bounces-13351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06141AF6BB1
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85009483567
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 07:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AB623D291;
	Thu,  3 Jul 2025 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8yRTtKT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5CD221F37
	for <linux-input@vger.kernel.org>; Thu,  3 Jul 2025 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528174; cv=none; b=EKORI8zEJ2yaVo8LNwxzRdlVLDaTMvy/E5EXaBF/pRoN5GlQzOs5EcuGTVQbPLseFnAywc8mqj6nThBI5LM0F7/eDxVMxoLuZZxDAqOmHjP5EuhhvxRjDdk8KcFQ5r/9JYO4hJmxj7OKoH8cnc/tky0PcmZlaspHFrGMIVisJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528174; c=relaxed/simple;
	bh=imYNRsq3vEhiy1/Gv4xLEhV5iOWP+vQDFSqpbRx/sfo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gGXbg1ioylT9FIoXpT2HBJgS+gH494QoCvs/hSG9dJ7+aBGlEoie0Yvm9xC/ghFpkm4x/UlStzSXQbmsDu17JEzNge20gcVjUuxZstWUYxT4x0MYQaY2QgdG01uZiy8gg5yKfiGKjxvI7Y0OwzUslyQaAUdCHeogrZrzKKC0zJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8yRTtKT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90826C4CEE3;
	Thu,  3 Jul 2025 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528174;
	bh=imYNRsq3vEhiy1/Gv4xLEhV5iOWP+vQDFSqpbRx/sfo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d8yRTtKT5buqvcnJ7jhXKSVw135A9R9O79fXMVHm+MGRH5daIkjQBi5BR++MHav9/
	 s+GLXPs549qwcDkO46ScLpbuyxKQmtSFqwwAa4aFOhzUhBjpclfuUqIS0nlno5Z8Fr
	 TKCXgDTmQA37WZkZdm73CfeJYjmkvvguRfb3iU7RHmctAHsNLvO+c224eGRGJNRZKB
	 RqNhYDxmw1bn4R/OKnqWb4lMXHcUXdmW/XoO1NJQUsxumYXEh0WptbJ54A4CF786p1
	 CkoTMjVmZSZLWNhSHnvqG5mVUH4bHIJcxCH5QZZXBIVU5rowqO5s07jzuCP3gvDzcV
	 vuwOuOeibo+Pw==
Date: Thu, 3 Jul 2025 09:36:11 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: bentiss@kernel.org, Mario.Limonciello@amd.com, linux-input@vger.kernel.org, 
    Eric Naim <dnaim@cachyos.org>, 
    Akshata MukundShetty <akshata.mukundshetty@amd.com>
Subject: Re: [PATCH v2] HID: amd_sfh: Enable operating mode
In-Reply-To: <20250623085453.2267034-1-Basavaraj.Natikar@amd.com>
Message-ID: <1o3n7op6-775o-713n-2n9n-n6rs300o4825@xreary.bet>
References: <20250623085453.2267034-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jun 2025, Basavaraj Natikar wrote:

> Add changes to enable operating modes in the driver to allow the FW to
> activate and retrieve data from relevant sensors. This enables the FW to
> take necessary actions based on the operating modes.
> 
> Tested-by: Eric Naim <dnaim@cachyos.org>
> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Applied to hid.git#for-6.17/amd-sfh. Thanks,

-- 
Jiri Kosina
SUSE Labs


