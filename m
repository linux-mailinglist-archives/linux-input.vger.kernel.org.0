Return-Path: <linux-input+bounces-15828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A383FC23F61
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 09:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F58F4E3E4E
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D5B329367;
	Fri, 31 Oct 2025 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unP919Z8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35B328B70;
	Fri, 31 Oct 2025 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901144; cv=none; b=OdyP8iL5llBQ3FNcda1mm03sjfeV3orY0uEUB6NCY+BXkldoOZRh/MV799E/ACGr4/7lUof0UQ/vW5bufjRtCJrfuYgWUgmEBSnXX0UKRsVT0WlMtGtXIxzfmKpNO6gAK4DvZTeu5jZwmAXK26LfZVJ34IKnYJ2Nvd2y8pCyKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901144; c=relaxed/simple;
	bh=xFpjtWYV2SQoqcfVJ/GJHQsZC2tJsIB7IOZRD/Qjhdg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=j+DY0C16rITBXEhlo00t5zfBAfoY5vl0hzrRDeFmEHdXYJd2d6Yn//RMc64NmAC0MYQItHi2DquQQ5C1mLTgHTyWBsNf4jl7mp8NCQxjeP3nXD31OzSPwqjGs8cH3YJ2HkyHGBPG2IS/WL/v6vDdilMD+sAEc5WKubiMsjrI8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unP919Z8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91565C4CEFB;
	Fri, 31 Oct 2025 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761901144;
	bh=xFpjtWYV2SQoqcfVJ/GJHQsZC2tJsIB7IOZRD/Qjhdg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=unP919Z8MvN7EXJQKJbdabv5WU2Fem1pGp3gWMs7BpzDuaWEzU7vRo0Xgs21Wxmgy
	 hDAlSP21kILZCFW78QjlVtKHgqJsknmuPWCh9EP5WHkyEVSfW5+3Er1wSxZf1cyrLX
	 t7L5aIbr45kEn9htd5EhIGnpELEfrJpRZDqzI1n/h84OBbtX3E+yseE1ozEalH7oEK
	 ELDgfRARKehwSodKEaWqF1MRAiWsvG4rWBwXKOCtDrJO3wc3hiROO9eW+/HH1Tfx4e
	 c0t1GD22mAWzus1b0VqBVr+Wc4+UF5QkU1fZn+3OcIrOC+h6F+GShQW7JvNGAUkAvJ
	 MdYjvhvnFgorQ==
Date: Fri, 31 Oct 2025 09:59:01 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Masami Ichikawa <masami256@gmail.com>
cc: bentiss@kernel.org, minbell.kim@samsung.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-ntrig: Prevent memory leak in
 ntrig_report_version()
In-Reply-To: <20250921053102.150182-1-masami256@gmail.com>
Message-ID: <844o8550-rr14-1915-qn38-55239sq5o6n1@xreary.bet>
References: <20250921053102.150182-1-masami256@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 21 Sep 2025, Masami Ichikawa wrote:

> Use a scope-based cleanup helper for the buffer allocated with kmalloc()
> in ntrig_report_version() to simplify the cleanup logic and prevent
> memory leaks.
> 
> Fixes: 185c926283da ("HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()")
> Signed-off-by: Masami Ichikawa <masami256@gmail.com>

I have added an explicit reference to the real actual leak being fixed 
into the changelog, and applied, thanks.

-- 
Jiri Kosina
SUSE Labs


