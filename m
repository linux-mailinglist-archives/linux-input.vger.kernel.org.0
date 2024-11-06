Return-Path: <linux-input+bounces-7894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5749BEFD7
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 15:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845A71F221CC
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E785E201273;
	Wed,  6 Nov 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJBF9mgl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1331F9ABD;
	Wed,  6 Nov 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730902260; cv=none; b=BRBfXj++9UJFyOZLFEtcQeh5pYNZlLU2SLNeVL07hP5KssBQKwlXsL8YeAL0sq2s7UJjkoI6p5uajVnCWj9gONtuTb1OW6KykvmdY5i21mumc7IoM3fufHpd7UW8p4/QYV16qCkxmKXKDrYDL0rInZUDhYmBVNVLZ4N+lCisNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730902260; c=relaxed/simple;
	bh=Vvk6OJRGtFWm6SRl0tOTu9QB+wAJUZt9TJM2i03TKVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hNSgc/t8lUwHktJfX/00tXPasR89uaFRrXr3ndEaGmH3FrL61R/aG1GqFfP0zskIho58gH6i7JXbawRh92KkTLIi2/1HN4lK8820YfhdtD87MNsrTYLkNjygmaivC8gLJnE94rIuArymY+z0q3JY3oMZkGjsuQLi/A51S65eEe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJBF9mgl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044D3C4CEC6;
	Wed,  6 Nov 2024 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730902260;
	bh=Vvk6OJRGtFWm6SRl0tOTu9QB+wAJUZt9TJM2i03TKVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JJBF9mgl90jjsNEAcEODsKKowI/bDIdm3chsnG0qlGCMHhcioYD+dgD2XYyJNShaf
	 IiDaka+iT9x4t/3YMiltxuKsjr1IZuvYgwMS09kqwNQTeSHogMhw4D5G5JqErLtw2j
	 ENPZLld4uuLzRH7TVOBiFaIRFIk3IA1i1qXi0UMKEv0F7plRK30o0wFz8oKKsTh99f
	 deapYfv7+EHbkFRK+ztmwp3WEzX66yeEpunuHSvBfevAI47DnbCsXyRcr66kY/GHp1
	 gCQat8ynyh+JikhvgXDEex5dAaeWuhlCE2RSMdwKi7/rkM2IY3+/igGv01gTRETk40
	 71a8dyDdPYTpQ==
Date: Wed, 6 Nov 2024 15:10:58 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Bastien Nocera <hadess@hadess.net>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 0/2] HID: steelseries: Bug fixes
In-Reply-To: <20241023112828.320157-1-hadess@hadess.net>
Message-ID: <nycvar.YFH.7.76.2411061510520.20286@cbobk.fhfr.pm>
References: <20241023112828.320157-1-hadess@hadess.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Oct 2024, Bastien Nocera wrote:

> A couple of bug fixes for the battery reporting for the Steelseries
> Arctis 1 after using the feature for a while.
> 
> Bastien Nocera (2):
>   HID: steelseries: Fix battery requests stopping after some time
>   HID: steelseries: Add capacity_level mapping
> 
>  drivers/hid/hid-steelseries.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Applied, thanks Bastien.

-- 
Jiri Kosina
SUSE Labs


