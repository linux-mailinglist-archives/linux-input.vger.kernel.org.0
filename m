Return-Path: <linux-input+bounces-16851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B83D00107
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 21:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 359D93013952
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 20:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8ED3128CA;
	Wed,  7 Jan 2026 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yxg3WAX0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE67274B4D;
	Wed,  7 Jan 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819215; cv=none; b=SXWL691QdJJw1Iilzi14dq2V0qNA/K+5lKBPMlLFtfjOZJ0kEnTqQD/r0dmnQ5XobKzcCFkpgVHKErPNxCQTSD5oD5wLb9TX3eNF1ws6bLJPJb1bSf2M/+W2VTYbxG6JYj9k+sjYxg5ixbFXstDpgDYRIllq8lfXAPJWq0Xk9Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819215; c=relaxed/simple;
	bh=d9cyx/YAvf1aIW8KBGCLVirG2QSe0/UVBSpNRs6IGBI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bqHTrJmJXky3edgdArfYdak+K2J110hyh5Fz2yXAEt8cErTQFZURmxFv0P87LDvsYmsjNI6zXjctz5iPVEq9ekU9Sg497fS/bGWCmwZ0Q9jNgzH+lZnUWbXAQZMJPis5nuZCPo0TtPpRx51wPHlEAQwGrgXzaqViIrvs9IySCKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yxg3WAX0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE20C4CEF1;
	Wed,  7 Jan 2026 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767819214;
	bh=d9cyx/YAvf1aIW8KBGCLVirG2QSe0/UVBSpNRs6IGBI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Yxg3WAX0ewgE6zRlk3Z7tXzaADG5/5pTNTPT4L3WbU49vSe/6fOoB8GABQfhOkk6J
	 7gpjbW1qS0GRWMRyZ4ZHcpdIrJ+GEGTMohcr+smaMv4bIaCYOl1OWv+BzUAgdzjfp+
	 bcW22LU5GxDsMnDzTTuLduo7LqYHD4oGSEEHFWDlIxweYumd9DZovs4MOlpqcEBDG3
	 MrRYzqxWkLblihlV4qisLT8P56F1xn7NkxMfDCmhny1XFmBNa7OUKKnQUtr1R/ToSI
	 tG7vYP1LgCJLCdtTYFHfq/gGpR5EoZPvR20VZ00eSUEOTy9UhZBNhiCqweSRTsIhiH
	 fEKTLZEZbiQNQ==
Date: Wed, 7 Jan 2026 21:53:31 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Rodrigo_Lugathe_da_Concei=E7=E3o_Alves?= <lugathe2@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
    stern@rowland.harvard.edu, dmitry.torokhov@gmail.com, 
    linuxhid@cosmicgizmosystems.com, linuxsound@cosmicgizmosystems.com, 
    michal.pecio@gmail.com
Subject: Re: [PATCH v3] HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier
 QR30 (2d99:a101)
In-Reply-To: <20251127220357.1218420-1-lugathe2@gmail.com>
Message-ID: <144738o8-qn08-3pr8-1orq-o5r5s11q37o4@xreary.bet>
References: <20251127220357.1218420-1-lugathe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 27 Nov 2025, Rodrigo Lugathe da Concei=C3=A7=C3=A3o Alves wrote:

> The USB speaker has a bug that causes it to reboot when changing the
> brightness using the physical knob.
>=20
> Add a new vendor and product ID entry in hid-ids.h, and register
> the corresponding device in hid-quirks.c with the required quirk.
>=20
> Signed-off-by: Rodrigo Lugathe da Concei=C3=A7=C3=A3o Alves <lugathe2@gma=
il.com>

Applied to hid.git#for-6.19/upstream-fixes. Thanks,

--=20
Jiri Kosina
SUSE Labs


