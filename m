Return-Path: <linux-input+bounces-9268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88887A13778
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 11:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B08A8160F7D
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 10:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A791DE2AD;
	Thu, 16 Jan 2025 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcr1i4t4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8730D1DE2A8;
	Thu, 16 Jan 2025 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022127; cv=none; b=ZLrMALKKjrOQZjfONPqlgAjKA2O//kd4THr5PlHP/sMWclRraTZlgeDxPFs+sWC7aTFyQB4wMWQFq6xlGA53vY55CdqrAkkdmxG5r9Js5v9u1/l8NTdwtn1Rid7R9Y2Xzpx48z5XNgZ/7lMpxbl8mQtHJvTzLJJphX3GsuJhzq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022127; c=relaxed/simple;
	bh=1AeOnAVJ2RoStKQ6eVEQzmyutHEVmH5tyWytalBwN+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MqBReStwT9oZStqcThI4vcNLyK1n/eKsnlQGcClRxoJBsKjdngCQoUba+wH2pAh4JCNbAMMPavrHpEICh2uJEVLXgAcHqMwl/HAdx/+sHlTNsNx0schCfIC9ndORGvjs1qAOYwIo94yR6rCo0K6VTsZLluVcY4LtwSMqw0fZ0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcr1i4t4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD377C4CEDF;
	Thu, 16 Jan 2025 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737022127;
	bh=1AeOnAVJ2RoStKQ6eVEQzmyutHEVmH5tyWytalBwN+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rcr1i4t4EvSUN6oAByrWLNmS1gupuRaFL+tSTIgy8plww8ivKD8TgGYjj9rkBLxfQ
	 LjIKaMxUrFm9Iot1+M0ga1zu+8Fi4SCYqeZI428sfzDp7TuePHA7vVM/rj+TnaGA/s
	 +NaiiHpVoIXsLP+pBN2V9+KTYH9vIStrpMAyqpm714TvPo4WmasAzKOTsh7BXPGUgs
	 jnZPGJf4jrkKooxqWfSPrHDLdNtPmeTy8h3gX5nvm4H2CnXVMLU6nHj4bM2dDSq9Bq
	 GmLVNBdzpf2x8NcLv1JwqGhsQi9+CJjWIaC8pvY1FsxR9pD6J5ljhvi2z26aY5e4zV
	 UGarJcxsbiE5A==
Date: Thu, 16 Jan 2025 11:08:44 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Luke D. Jones" <luke@ljones.dev>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    bentiss@kernel.org, Connor Belli <connorbelli2003@gmail.com>, 
    Jan Schmidt <jan@centricular.com>
Subject: Re: [PATCH] hid-asus: Disable OOBE mode on the ProArt P16
In-Reply-To: <20250111010153.35119-1-luke@ljones.dev>
Message-ID: <on7q07n8-sno4-s93q-46p6-9rn96s940980@xreary.bet>
References: <20250111010153.35119-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Jan 2025, Luke D. Jones wrote:

> The new ASUS ProArt 16" laptop series come with their keyboards stuck in
> an Out-Of-Box-Experience mode. While in this mode most functions will
> not work such as LED control or Fn key combos. The correct init sequence
> is now done to disable this OOBE.
> 
> This patch addresses only the ProArt series so far and it is unknown if
> there may be others, in which case a new quirk may be required.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Co-developed-by: Connor Belli <connorbelli2003@gmail.com>
> Signed-off-by: Connor Belli <connorbelli2003@gmail.com>
> Tested-by: Jan Schmidt <jan@centricular.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


