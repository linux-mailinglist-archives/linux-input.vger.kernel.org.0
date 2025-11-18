Return-Path: <linux-input+bounces-16180-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B9C6ACC7
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 9B34D2C120
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD2236829C;
	Tue, 18 Nov 2025 17:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNVPgwsB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625736404C
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 17:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485508; cv=none; b=jZ+0SdXd6k50UKfqpJv4O5zc7sgNuTXnOQiI/KYyAAyCQBk+1aEiZgcfwr99fUQJDsRZHyRWKdb/x2N1Fp4fF4TNEykfj/OCNcDwrFx3ljHDjz0wFshAUSYLO180Hru916NX1G5tpOx3AOn2822ep8SYjTXJDvTGZXnvcosMdt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485508; c=relaxed/simple;
	bh=CGAc3un41IhmpsqKJouztxgQXVUZbCLbS4902EuzIr0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nHpXXUm1nrkkJPkurVhNOY+K8OERtj9ZLDI1rJsCNfJWVa3JA1/qPpHeMbZcr4hg+vBLPpKG/nOpJuy1NWiwCAgOe6ksk9Dpxo/uPGDbm4B+V7rJNs6kDlH8yehHlhNRWoFe8VgF/GbbQnWOXGhlyapOwT0XzWCyjiCfcMj8W+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNVPgwsB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64483C2BCB5;
	Tue, 18 Nov 2025 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763485508;
	bh=CGAc3un41IhmpsqKJouztxgQXVUZbCLbS4902EuzIr0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UNVPgwsBVkXDmA+c0Q3iG4XwFOW6XCNDlJgM7+8JE5jEP4uswqSBmqYxin77oPshx
	 yep3hTFUWiv41t194UE1RRFiUDlUSgxRueqSJQP0/11LoVRJq9EpMr3VwU8PIPNbmO
	 9XmSiq6Zf3RjdRpmk9wBVjfpC/0QonvOdryCc4vJhA8SggjpslZWe327kQmkELHvX3
	 /Y3Hl6uwqpb5KrKK79uQ0VgJTgwcxEtCbZ267GBIpESOroOqLrcw2LsfoBYoxGAVtN
	 Rvr7tJpL3k0HkINS+X80zSyTsVfvhmaICr11d1eZZloDqCpVMduldhnLpsNakI28WM
	 O8XRZ1HLgyiAw==
Date: Tue, 18 Nov 2025 18:05:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: pidff: Fix needs_playback check
In-Reply-To: <20251103200243.1154544-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <s37n0nnn-33or-1np3-r6s2-043q3q12qqor@xreary.bet>
References: <20251103200243.1154544-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 3 Nov 2025, Tomasz Paku=B3a wrote:

> Urgent for 6.18 rc period

Applied, but please always put these meta-comments away from the proper=20
changelog that will end up in git (below the '---' mark ideally).

Thanks,

--=20
Jiri Kosina
SUSE Labs


