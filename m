Return-Path: <linux-input+bounces-7138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DC993F8F
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4E5D1F23668
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642161CCB3E;
	Tue,  8 Oct 2024 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzdSSPhy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404741C230A
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728371501; cv=none; b=PMOWyQpTML/bGMAVltGYArlj67jel940CBT65WKy0Vbv2BCdTY8/X0hgQxWVXA/d3e2I3dUPc3kyJSsMzRqtuAh0kQhXu5wQ09EYVQe2bCQhXQHXgebZAgLh1hNY3nEUy2sq0wiH+9VnSJ8JAHJmCGL7iQJkmeQr8XDfRsJJv+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728371501; c=relaxed/simple;
	bh=vSAhI6utc46bgXE8SR4heNf/PQz6JEuNBkGM7Y3lkZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oa7n2zRgJaJ1I/MiAmNc94ilyNS860acRspvt/iKwykUN7KGJ2uUX1ecTCiu0Qw2MZ6BCFaWs8j6/aWjnV1kiCTuTauDSuuc32brmCSgBLUi2cGnLm3SsKnj0QGVkjbTJY0hAbE+ZMkugwAbvA7ue0ax1WTIiRKp5AkDV84+Pds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzdSSPhy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7147AC4CEC7;
	Tue,  8 Oct 2024 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728371500;
	bh=vSAhI6utc46bgXE8SR4heNf/PQz6JEuNBkGM7Y3lkZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OzdSSPhyej2P1oCYParP8BxkxRb8IM1XDndvrIOX9qiDRjEj10slt3MqgSg8bOAkl
	 u0SocWNahj7e5dCG5wrf5rZFfdAxaHtsctmQzRLS37s38EZ7Qv9wRHFw2WCr2SXNtm
	 Ae1gPy2MV+nnfNcpqw5+dVHgXvRmc/T6wO+b8J9f7dqRzTZ7qrmpiuNl/2sN4pNO2n
	 zAAtgQUkStJ0PhS/DA8EHgEb0rFnPqLLFM4RnbHWit4CFMlVpsi2YiqhF6dzCeqFFd
	 SyB/a/W7k3Nb6dt2jiy31xntemcVXIKDJ1C0AwEOMdTV2VAa1QtDpv6Kp/tIeUV/GH
	 CBmlwdbPTzZ0g==
Date: Tue, 8 Oct 2024 09:11:38 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Stefan Blum <stefanblum2004@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Add support for B2402FVA track point
In-Reply-To: <1917062e-1c6e-43bd-b33a-5d40eb5c261c@gmail.com>
Message-ID: <nycvar.YFH.7.76.2410080911200.20286@cbobk.fhfr.pm>
References: <1917062e-1c6e-43bd-b33a-5d40eb5c261c@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 6 Oct 2024, Stefan Blum wrote:

> Hello,
> 
> By default the track point does not work on the Asus Expertbook B2402FVA.
> 
> >From libinput record i got the ID of the track point device:
>   evdev:
>     # Name: ASUE1201:00 04F3:32AE
>     # ID: bus 0x18 vendor 0x4f3 product 0x32ae version 0x100
> 
> I found that the track point is functional, when i set the MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU class for the reported device.
> 
> With kind regards,
> 
> Stefan
> 
> Signed-off-by: Stefan Blum <stefan.blum@gmail.com>

I have reformatted the changelog a little bit to match kernel standards :) 
and applied, thanks.

-- 
Jiri Kosina
SUSE Labs


