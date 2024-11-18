Return-Path: <linux-input+bounces-8136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4442D9D0D96
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 10:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C351DB26680
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 09:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201E8190468;
	Mon, 18 Nov 2024 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr2J/KGi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC717C98;
	Mon, 18 Nov 2024 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923884; cv=none; b=eoauZ+xxwyOopGR2Q7SMZ5MIOhhU1cH+xfOqf5LEWdnqGXafLjEzHIRQ9XxkxEvB5viyWX+pq2xLAwh5up9lKR5YMTQYOzOZAEvJWN3ro6SnZ/kyL7XRtKlKnqVh1aHvsrbnmXJIYTIzyFVCvZwtkTBeVToBTtAA2wohV5Ky75U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923884; c=relaxed/simple;
	bh=Pgqk5KAHln8i8bFh+aROGfdKZ4Ckt1SCnQwfWjC2sO0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cVMjOCobecpiVG7AabCODeERPOayh4N0agbf+SqYjHIlp5u+zeBhvXgOoCNF10f+YKHiBVHO6uHEVUnLh0B2bN1ovMC87Ql/uM1gKrDi6B4e3r+uPSxdIhrm5CN4uyJj13dATQIZkozryAzdU66eS+6S9L2wkB791tmGGKtsU6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr2J/KGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E815C4CECC;
	Mon, 18 Nov 2024 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731923883;
	bh=Pgqk5KAHln8i8bFh+aROGfdKZ4Ckt1SCnQwfWjC2sO0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Jr2J/KGiu0g1UR24Jl9yPqEdXvInc4LZU/zosqeWEYJnm2PkoepzGClBW9fgEKFsS
	 UIAuHS3zMrrttTw14Cj3isLESn7Skcgh/Mhd3rI6GzsWKrh7pcPOrse697gAFA0ecy
	 TE3nenUX8eVi5D6cnF5XPtPs+OKaO8zI0IQ7MAf9nslTQCUAd6+YMv447hFp5pNg/I
	 Pg/YsRtYGLfbFUdQrJ+wFU9Fn5qASBrN8EJMKLJGyagOPK/m1abkF6OALm90kEQqHe
	 cmGwJq2lnkLrN9teIHdiYlLVWXFR4GNLUtMphy4yMaGDjZ+EvgiEvUZSOGg7ZHr0eU
	 SilYyvQV0Qu/g==
Date: Mon, 18 Nov 2024 10:58:00 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 03/15] HID: google: don't include 'pm_wakeup.h'
 directly
In-Reply-To: <20241118072917.3853-4-wsa+renesas@sang-engineering.com>
Message-ID: <nycvar.YFH.7.76.2411181057480.20286@cbobk.fhfr.pm>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com> <20241118072917.3853-4-wsa+renesas@sang-engineering.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Nov 2024, Wolfram Sang wrote:

> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Jiri Kosina <jkosina@suse.com>

-- 
Jiri Kosina
SUSE Labs


