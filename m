Return-Path: <linux-input+bounces-7532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF19A3BB9
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6BA1F214A9
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FB7201109;
	Fri, 18 Oct 2024 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eiyx96dr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904E72010F7;
	Fri, 18 Oct 2024 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247949; cv=none; b=Ue5rR4sHdB7dyIhxld0rxd3SQ+3zphI6df+1ExW7nKnFlJlWA20nVoO7+381K0DYmocrrEnMgCNZL4ZbnO1b8d1rd3hFIB+Hw6wVUSNReVFlRHMwgBllt0V2LJkjprx5iZxjLNPNeCCd4k+6OeeK1VyQs4ri9EsRZoqQX1HwAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247949; c=relaxed/simple;
	bh=pnvMpKpm8lg+Npieq10yqbwYs67uQybysE8OyAUFSVA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Pt6y6lfjTg6p1ym3qJe9ic+uMrMgWc3N7CwQSjkfeOAXo8+/Q/2An3Ck0a5dzf5mtVwi4pzvpyKb6faZkxOTl644TaRv26CtQY2F2o+M25Tzna3NYbuZ35mDVTumDW4XhMClJ1D7mOWnjwTat3CkQCoTJmgfqjj8a3aCM59wY80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eiyx96dr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3EDC4CED1;
	Fri, 18 Oct 2024 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729247949;
	bh=pnvMpKpm8lg+Npieq10yqbwYs67uQybysE8OyAUFSVA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Eiyx96dr+uUryvDhSFBAGwxpevwAa+R+5eBQYgB3DHPLxBQ98Zh3A0x4RfbhfQIpK
	 24X/1Uh/Hwv+ykvHh+4Dp14vWjE+E63jbVsOYNASGscTdmiASLVTENxq5gVvf1TddQ
	 WUKpvn/XBvImLv+Dlzx/sECME1ipJNk7iqTO/jgfrtsp9CApaxFZjc+rSA1bk4jLOh
	 CVnu58mtH8FQk8a4dwkQokD4nn+DSBCQP4KH4BuTJJFdaq/oBwJjBZLX0BE7vxYhU+
	 mKAEEKVmfUfEtgloqG4oTnx+OJOMZ5WJE7UyRLo0TlRbIYrlG2sC1qSUnP0yiNTgGR
	 VKL+gdtIc0tzw==
Date: Fri, 18 Oct 2024 12:39:06 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, 
    =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>, 
    Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [PATCH v2 0/3] HID: bpf: add a couple of HID-BPF device fixes
In-Reply-To: <20241017-import_bpf_6-13-v2-0-6a7acb89a97f@kernel.org>
Message-ID: <nycvar.YFH.7.76.2410181238450.20286@cbobk.fhfr.pm>
References: <20241017-import_bpf_6-13-v2-0-6a7acb89a97f@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Oct 2024, Benjamin Tissoires wrote:

> Both files have been in udev-hid-bpf for too long.
> Both files are actually simple report descriptor fixups, so
> there is not a lot to explain here :)
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
> Changes in v2:
> - Sorry, while preparing the udev-hid-bpf tree I realized we had a
>   change in hid_report_helpers.h, so added the third commit
> - Link to v1: https://lore.kernel.org/r/20241017-import_bpf_6-13-v1-0-197d882ade37@kernel.org
> 
> ---
> Benjamin Tissoires (3):
>       HID: bpf: Fix NKRO on Mistel MD770
>       HID: bpf: Fix Rapoo M50 Plus Silent side buttons
>       HID: bpf: drop use of Logical|Physical|UsageRange

FWIW:

	Acked-by: Jiri Kosina <jkosina@suse.com>

for the series.

Thanks,

-- 
Jiri Kosina
SUSE Labs


