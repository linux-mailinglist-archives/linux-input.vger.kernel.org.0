Return-Path: <linux-input+bounces-11958-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD6A9A857
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E3E1B84302
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD7C226CFC;
	Thu, 24 Apr 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lpm4z+Te"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B09221265;
	Thu, 24 Apr 2025 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487197; cv=none; b=iDPNzuI+yzkU7LIo4Pg1p2jZy6QwnEdXvy7dgmc4aGC54YXecobzzEaPlKgiKv4dN21F62y0lnRoOEv0BqfcwdPQ2wHbO7zmmz2W/51BDQDSme52M9QlWJzfoki6mjsJQEKwAU3vwuBEwRp7t/z1+I2hdxxZFpAuCk1e6CXYhuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487197; c=relaxed/simple;
	bh=HgZHGN3Lv3PS8IjhMR5bQsaFx5r63bxznaYHqYIUodg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ov0/RCprYgl75Gj+Qr9867MMnzkPiF547kD1TTaz7zDyu8IkAqydKt1LrRIVkFlU91ocvBNk3wA2ejYuNnnDnr/NdFNfU+QAEkNOjlhB90RNzmEBxEyHISoxnnNXwT7QDUaf++mE77ChpL3aTXbnSH9dUhgnv31vu6/vI9BsdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lpm4z+Te; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A429C4CEE3;
	Thu, 24 Apr 2025 09:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745487194;
	bh=HgZHGN3Lv3PS8IjhMR5bQsaFx5r63bxznaYHqYIUodg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lpm4z+TeKQeNEA7VOzypSnFXZttOGcTu6KLdYKtIiHamLO4nSr8/eX7QkAzR6F2aB
	 RnOSsJUwMD5ylLhDT/HShBgtc1kKlvfauC5jJFnqbQ13JOBlfx7490urZCvpfO7oql
	 8hrvn/tTxaWjQfiVxv86PO35nC3j1cdJ7vUKWA6ZMWT4G7ciV8wty2MmqjbJp17sKy
	 5OYFNB99NzW0+HURgQlar4ewikzguET2rvRQdYdPkR0Brm9BDN8eG0pRX75eNWIoXz
	 Wr9vBMWvWsaUILMF2jQsKlwGYN5A9noL8f9i46f+0qsQlDHZqdJpgcCBtdBo7khSOE
	 WD1ntEpeDY7tw==
Date: Thu, 24 Apr 2025 11:33:11 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] HID: quirks: Add HID_QUIRK_IGNORE_MOUSE quirk
In-Reply-To: <PN3PR01MB95975285B1ECB09D2B88D113B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <o52s4223-sp20-4045-779o-273r72o073rq@xreary.bet>
References: <PN3PR01MB95975285B1ECB09D2B88D113B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Apr 2025, Aditya Garg wrote:

> From: Aditya Garg <gargaditya08@live.com>
> 
> Some USB HID mice have drivers both in HID as well as a separate USB
> driver. The already existing hid_mouse_ignore_list in hid-quirks manages
> this, but is not yet configurable by usbhid.quirks, unlike all others like
> hid_ignore_list. Thus in some HID devices, where the vendor provides USB
> drivers only for the mouse and lets keyboard handled by the generic hid
> drivers, presence of such a quirk prevents the user from compiling hid core
> again to add the device to the table.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


