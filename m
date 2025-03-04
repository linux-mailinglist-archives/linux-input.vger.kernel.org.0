Return-Path: <linux-input+bounces-10533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB0A4EE7E
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B22716C28F
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B38E1F7561;
	Tue,  4 Mar 2025 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv8ySUV5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566D1C84D7
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741120593; cv=none; b=VcBdtLjEijwkX2WHPpSGsVr+g6Ou5xGtdADh5vYf956MpFgUbiKcuV8oWPcXGHcFsi57jrjcj5R6wKPAjvkA2YbCUssZxEDCcMCyVlfDWtYH+rQ9FGzHVESCPcDqvKh5lnswLX+1nRQ4NnIaSlTAa26M53t1LxT1WAtU2A9S8MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741120593; c=relaxed/simple;
	bh=FlDiXMiefnTaxf1A+keKriB3wWBfDYoNAITLBmm2oGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iS7N0dKr7iNu3nyYBKN46JySzHYeFPkT5msxiHhuR+0J6bYiRN2H++n53R3QJ9T2C0MG/JucJB7VRITqji9CmJrrEwSilfbAhVLvuj/iUPgrZPy2D/nWBWFgsh3KiL0wdyfgSjqZ7ZvP19VPJBcFW+Q9kDLZtd9iZqvz8lByFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv8ySUV5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE3FC4CEE5;
	Tue,  4 Mar 2025 20:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741120592;
	bh=FlDiXMiefnTaxf1A+keKriB3wWBfDYoNAITLBmm2oGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mv8ySUV5lk1KtbND9CS786QEZNrHjMff8zI50GCjkCW9ccKO8v9uHdGaG+V+ie3Uv
	 36K0+6PBXEwGV3pBrv7KSv2OhGceQijzkGZPOatLBGsJAKhp5kIy2N9FVozxCX27mx
	 8Lw6rbJzBTpph2EBffIUL9pl7cTIob9wD9ToOVnC2Wk3QYA2vkRROEqmnxA3A0DiKc
	 qLAYRe8bFP7YqEzIX7IZ1aaZT+lA6FIXReIzNOFxkuQ++mUt6+xyM6loL6hGVM70d6
	 swSgIfb/3TijhOByfulcltWab+frEApkyw0qmuymDBumQy3fJ2aCRsfPm6qC0QA2cz
	 11t8TJe6bqtAA==
Date: Tue, 4 Mar 2025 21:36:30 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Alex Henrie <alexhenrie24@gmail.com>
cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, 
    gargaditya08@live.com
Subject: Re: [PATCH] hid: apple: disable Fn key handling on the Omoton
 KB066
In-Reply-To: <20250224053632.2800-1-alexhenrie24@gmail.com>
Message-ID: <q89r66o5-0on2-72or-6nr1-4on2o2386o27@xreary.bet>
References: <20250224053632.2800-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Feb 2025, Alex Henrie wrote:

> Remove the fixup to make the Omoton KB066's F6 key F6 when not holding
> Fn. That was really just a hack to allow typing F6 in fnmode>0, and it
> didn't fix any of the other F keys that were likewise untypable in
> fnmode>0. Instead, because the Omoton's Fn key is entirely internal to
> the keyboard, completely disable Fn key translation when an Omoton is
> detected, which will prevent the hid-apple driver from interfering with
> the keyboard's built-in Fn key handling. All of the F keys, including
> F6, are then typable when Fn is held.
> 
> The Omoton KB066 and the Apple A1255 both have HID product code
> 05ac:022c. The self-reported name of every original A1255 when they left
> the factory was "Apple Wireless Keyboard". By default, Mac OS changes
> the name to "<username>'s keyboard" when pairing with the keyboard, but
> Mac OS allows the user to set the internal name of Apple keyboards to
> anything they like. The Omoton KB066's name, on the other hand, is not
> configurable: It is always "Bluetooth Keyboard". Because that name is so
> generic that a user might conceivably use the same name for a real Apple
> keyboard, detect Omoton keyboards based on both having that exact name
> and having HID product code 022c.
> 
> Fixes: 819083cb6eed ("HID: apple: fix up the F6 key on the Omoton KB066 keyboard")
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


