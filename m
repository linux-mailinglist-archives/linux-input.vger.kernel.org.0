Return-Path: <linux-input+bounces-9097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B06A0709E
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC243188A6D8
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591C5215073;
	Thu,  9 Jan 2025 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcVb6E0D"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30109215071;
	Thu,  9 Jan 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413287; cv=none; b=ASBP6vl+jEoGmAGvEhqcg8l6Tmq9ltnnvOuXmjFq/PXrAa5PSOtES5pQzOkiBxdMXIjHGBGpqK1RKEdDNB3xzDeCR3x9hWEUycdm3ARosZ7PrGE7WhHkkkL5WvJg1RUvnzYKfTAdi6bnqoawknLUTzMVP6xkPGEvzibNnd9fSKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413287; c=relaxed/simple;
	bh=Cj3HHEVFn/z2pO1wbNEthB1cKWcESwKGvTVTkRLGsoU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=X/qESG441Cus1YxP30n2ypmUzid+++uUkllEolXJpN02vECUKG/XgwUviZQOwa38FbtcSyxyo2QNjNAyfKg+iV3VWfGBS3eSc7Wl8bfy//c14ER9d1YAMdiXzLTGHAC1Ls/3LzDEyiORtSerRUCXCgirTwrWFGqqDUCZB+H1pqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcVb6E0D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5306BC4CEDF;
	Thu,  9 Jan 2025 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413286;
	bh=Cj3HHEVFn/z2pO1wbNEthB1cKWcESwKGvTVTkRLGsoU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WcVb6E0D5r1QwkjSYNBcL7lgSpvuq5M8CBtjJT5p6agt08+ln2Hh7M7dTOGxnB6v9
	 SeIAaM4l+hOLGW7TF1u82VI+gZRuxRwctFjvusGryMrMp+5NJkb27QWFQFDh2QeK+9
	 rFot9cIr+yQ6hwNltTrzwjP2CiUNbs5tChd1n5QBLFPRUfGrpXW5Mflm2Py/9c49vG
	 Ku552vRUC/p6cK3gREdgrozsQCJ44jX3/GjpLtTOdiR0cBNg3AhzDfdhKm3/imdJE0
	 dmPl7zRNFh5IrTCCU/PBe6zuGkXRjCc3OnPrwz8tI/+VwpgOw0qtzm8HYOG3J8wWsg
	 cCZQyi54VwHXw==
Date: Thu, 9 Jan 2025 10:01:24 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Youwan Wang <youwan@nfschina.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, enze@nfschina.com
Subject: Re: [PATCH] HID: multitouch: Add quirk for Hantick 5288 touchpad
In-Reply-To: <20241216021801.22572-1-youwan@nfschina.com>
Message-ID: <s3p94r70-64o3-p8n2-2n14-7oo1332q3151@xreary.bet>
References: <20241216021801.22572-1-youwan@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Dec 2024, Youwan Wang wrote:

> This device sometimes doesn't send touch release signals when moving
> from >=2 fingers to <2 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
> of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.
> 
> Signed-off-by: Enze Xie <enze@nfschina.com>
> Signed-off-by: Youwan Wang <youwan@nfschina.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


