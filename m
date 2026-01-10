Return-Path: <linux-input+bounces-16929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 011AFD0D3C4
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AADB5300F5A6
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DE81EDA0F;
	Sat, 10 Jan 2026 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUKng3Ur"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15130500969
	for <linux-input@vger.kernel.org>; Sat, 10 Jan 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768036025; cv=none; b=O2L8u5w/2jFxI1C14Pc5zxPmT85Q8Bt1G9aGVjN2J681wUjRatWTA/H5PXdsr3M2ZyWrcTZL10vksbpHT+HAli981bhSF8FkEAw1/6Y2f52j+DPMHFlKx1KRDi0AJqK0yckqm7k091sFTJt9Nk4SVnMvLRLW3AMN7kNa+R0nV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768036025; c=relaxed/simple;
	bh=NUVvGRK9j8LueFrEV5TZmtiFpVAuaOw8jwNetdtKAsw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dXb7YPsOw155Nks4l6WXginQ2Rr3d9ZQMT/jkneygjiDh+20nnlI9yrmRhEaqET+rCPCIaxSPKnotJ7WIzpO7beQVIqNQZg4ngoTitUs0mKM3yVkNuCE36raVGRGKaFeRo5ZHJLwix+UzpT+JX6z5/6I99xv8WmmCMhP0bSrIR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUKng3Ur; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBE0C4CEF1;
	Sat, 10 Jan 2026 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768036024;
	bh=NUVvGRK9j8LueFrEV5TZmtiFpVAuaOw8jwNetdtKAsw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OUKng3Ur9F6wbFlyxZgBNYcnXN59LkSoKqoHGiO9heYvKd6Kdvx6/0BxiEWSrKkwp
	 qeSFbwELK3Mj1bdpwFmMr39A+jjjmrhGb9TsQraqGH1rlSrmtxbTe2nbLb8zar87Ow
	 su/PKPrb4uThubudyIUWu+8k4dHw+KrbJlei9nulukH09tFg4lVXj9Px5eMfTccPta
	 VOk/5qizyS9cXRB5pvtaIRCRhxbpKjzAQUKBzucaVKfy+/yy13GKyTFdPw1wTbU2Xl
	 0Dk6OfIC3Sg3qIcujQ6sJIA0yBZSnKaHOIr96cgGMcuoggmaQ6hzLGJO9dXg17plWm
	 vXXeT5hnp0Raw==
Date: Sat, 10 Jan 2026 10:07:02 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: pidff: Do not set out of range trigger button
In-Reply-To: <20251129184614.1919238-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <rpo3q1p8-prp3-2294-s596-o3rq615r98o4@xreary.bet>
References: <20251129184614.1919238-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 29 Nov 2025, Tomasz Paku=B3a wrote:

> Some games (mainly observed with Kylotonn's WRC Serises) set trigger
> button to a random value, or always the same one, out of range.
> I observed 307 and other values but, for example, my Moza R9 only
> exposes 128 buttons AND it's trigger button field is 8-bit. This causes
> errors to appear in dmesg.
>=20
> Only set the trigger button and trigger interval in the trigger button
> is in range of the field.

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs


