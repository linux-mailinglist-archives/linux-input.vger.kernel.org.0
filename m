Return-Path: <linux-input+bounces-9099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA720A070C8
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6E4D7A0685
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0829A215192;
	Thu,  9 Jan 2025 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsaPWIlH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26752010FD;
	Thu,  9 Jan 2025 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413475; cv=none; b=DQAUdCRt3EWa0nqGVksW++L6RwJE9JM1K9ztM4GRoGC8lcLILau6Wte6hx4Hh6mlev+EhmhtaXWeGQg3Qi5qkzfMsIT9KIa5/62C2rBnmaz01apffq3GrEGkgyUWjTZ/jfhBIXq6cI1Wm8agn+GxtpuLSGJdtPvD3Sir7hnr7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413475; c=relaxed/simple;
	bh=yCDT7LRFGPA86UTck6W+MINv0FQivSU6BgH7RG1hGC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZXB43f2CG1alsAk9nPl+QLqh1rDWKDZok5jGm4Uqs++DsGy1hLzCYf82gAu3fxoK407MSkSxIeZ2tSHnX9Z1e34mgmGcYhGb16g9/HdKvToLhPkXjMk5/Oa1ukXpqW5jtMZA6iy2yK4yVCELwOehoCqqR7GWr430zuMQEprFYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsaPWIlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E4BC4CED2;
	Thu,  9 Jan 2025 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413475;
	bh=yCDT7LRFGPA86UTck6W+MINv0FQivSU6BgH7RG1hGC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KsaPWIlHcfFBiucjR93fI/tOAK2oPAzljHFriVKBFkUMroGRoUuZdwIbMcFQ6M7us
	 V295ThVJklagAWjv7AIx8DkmzVaykKkg6C/uMcM1E+C+QLFTDwwJXsw7xtI37QAJoj
	 Icof3b1CSRC6tYWzabVB6uIJzokGEPfXLheaC+tbXZf7z7KnotWl/t+qwM3VYk+IaH
	 BaD2mSrcHIJiQlNc+a5NyMtJKV/JQKHT/cc5CEMbqRTsecR1RFv5/XdGVITUo2kLzo
	 wJ+FXX7fIva1uyyGl/JPh0MtwBSz2bb4wgBSfq0Dq0ypDXSBkG6Ydql3YcoN+3tkLJ
	 PUCyuEgMkrqgg==
Date: Thu, 9 Jan 2025 10:04:32 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, 
    vsankar@lenovo.com
Subject: Re: [PATCH v3] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn
 keys
In-Reply-To: <20241218143309.86811-1-vishnuocv@gmail.com>
Message-ID: <7q7s63n6-o6n9-201o-p270-r0r9069q2226@xreary.bet>
References: <20241218143309.86811-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Dec 2024, Vishnu Sankar wrote:

> Fn Keys like Mic mute, Power Modes/Airplane mode,Selective
> screenshot/Pickup Phone, KBD Backlight and
> star/Favourites is emitted as HID raw events in X12 Tab1 and Tab2.
> This support has been added.
> 
> Thinkpad X12 TAB 2 and TAB 1 Folio keyboard's raw events will get
> detected as Fn keys with this patch.
> 
> Default fn_lock state for these Keyboards are OFF.
> 
> Other than these changes, we follow TP10UKBD's processes.
> 
> Tested on X12 Tab 2.
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


