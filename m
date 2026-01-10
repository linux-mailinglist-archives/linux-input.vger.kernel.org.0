Return-Path: <linux-input+bounces-16923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F9D0D393
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 631273006443
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 08:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A215A155389;
	Sat, 10 Jan 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWihwLRo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F332946A;
	Sat, 10 Jan 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768035186; cv=none; b=E5znFiKepjQu5mUVCGiWVNdBQR8p9AIdWvJR9m/NpIphI/ymq0sNhA97mc2y8LXkAdc/hyZsVXxypymgezqmf56AzxNfOKMDKB7Be820gHc3+MAAnPNPkZZnV0p4fX0q17BXhISjU7Ns+YXErGhNfdbetowxKsMhH7QDdJafILI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768035186; c=relaxed/simple;
	bh=0N7lZP2YLyx8AxDxXpWc1ge0r9+EQ0fiXxyVrohC/NI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L6qmcPEN9msogsKCK7/LbccHCbPjaNz4e/Bkl7IHTv99Rh4ZTENwr3VKFymfd5xkVPCfWNkIrgYsQ2/y5maTDjxNmbmOKKRraA+enh7j2erqmuQ4GtnXKA4Cq/eOAb0sbFR2zUirO94sGIe6Og6zq+YRSX5j9MrhI8UHIjld2sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWihwLRo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC79FC4CEF1;
	Sat, 10 Jan 2026 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768035186;
	bh=0N7lZP2YLyx8AxDxXpWc1ge0r9+EQ0fiXxyVrohC/NI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rWihwLRo+y4cqSH3zL1TOLFyxujuoeLf3ZTSsp2p6ixiottxeka8SXqWlkmnYoZ/3
	 KQKZPaZgS3ovMId2MCeHSgzU9Wh6En5klXTfUGpRZjpToUGeET5fopzI0a5gHImsM6
	 uM8Lrc6hqkT2Py48405FBUOXnCBb0f+w/Ka6nvT7VH2lD7DVw8liM5PdPIkHe+iq7a
	 XjwfpOnV0hyuccumI38db8J7zbyxhPSECG9dhsO0ZaI5ucVG1C8ntdFbtdUPz3NLMo
	 4e11eGzBAo5TLg9tWLrKIklgraE1RUtvE1NAK/Dvs+1Tll74Ka1zMy+ok3CD+03tRS
	 umBEgr+dK69mA==
Date: Sat, 10 Jan 2026 09:53:03 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Nguyen Dinh Dang Duong <dangduong31205@gmail.com>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: rapoo: Add support for side buttons on RAPOO 0x2015
 mouse
In-Reply-To: <20250627170425.11166-1-dangduong31205@gmail.com>
Message-ID: <42ppo0r7-30n6-son3-q8r6-542s39476585@xreary.bet>
References: <20250627170425.11166-1-dangduong31205@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 28 Jun 2025, Nguyen Dinh Dang Duong wrote:

> This patch adds support for handling the side buttons
> on the RAPOO 0x2015 wireless mouse. These buttons were
> previously not generating input events due to missing
> driver logic.
> 
> The new code handles raw HID input report with Report
> ID 1 and maps the side buttons to KEY_BACK and KEY_FORWARD
> using the input subsystem.
> 
> Tested on a RAPOO mouse with USB ID 24AE:2015.
> 
> Signed-off-by: Nguyen Dinh Dang Duong <dangduong31205@gmail.com>

Sorry, this fell in betwwen cracks. Now applied.

-- 
Jiri Kosina
SUSE Labs


