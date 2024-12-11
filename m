Return-Path: <linux-input+bounces-8498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 323839ECE00
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 15:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A37E16164D
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 14:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E69423369C;
	Wed, 11 Dec 2024 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AG7oFVku"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA7211282;
	Wed, 11 Dec 2024 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925989; cv=none; b=B7QGlX/BZnek8Z5AHQAiGAOCAPtWHvXtRNxgaWKaUgxcP0ylK4gHJtyXc7eNlfzhLN7NQQEs0071GqC7Q7Rw4o0AezsutbSNftjy6jtmM7PXkVysogDoqwKBSnk/gptS3EiK16zjDNARgU4iGpfJ4Jd0ZGQjraet6D17eLaaM2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925989; c=relaxed/simple;
	bh=BwIBKxD/oRVzF5pJ22pf3/3NdhTx6f99CUCZxZMX2mc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YSTE+t/gH/nFYF6TCOKI2K5SskrouC+7DkgdtXdVI3vkmPEV7oJ6/D09FhmLctTIDhxFjP574l8gLBhiTzslNtKWWChLjZxzSXBVqrZCcgCFmv1vhphgCfm5mP/Xgw4f+ntTtfimz1NzViSdP2grYHysYtbJW6vEeqeX18cPKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AG7oFVku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE30C4CED3;
	Wed, 11 Dec 2024 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733925986;
	bh=BwIBKxD/oRVzF5pJ22pf3/3NdhTx6f99CUCZxZMX2mc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AG7oFVkuHLlOT9q6IBpTVckzzRPLiEJteFRo8XGHI7IJ06mk9SliLyXZv7oSJ003y
	 eB6SWBYsUIb5Jnx2PbxtNJ55tOcdDo7A4gWfRyx/o2NsbQYz+2OJiQRcDvsWX/Dj+l
	 1GvyUZJMX9QTyqNNBZ2TakC/U1GhhZ7S/Eq6lZbs6WXJb5fIBBOtNdv/pifTlL51ja
	 A/yK4ZFQ7MLLRaKzgwNCDvEg9WFARBfIgOETLAtLVGDjux71bHZ+bbZ1lQC0VJP4Al
	 jzhmpmMMWUdxhWFJUxAE3RX+OX3vP50NUP7xTSftzxRWu5Cl99sbvE1YpfxMuZ0fPT
	 82jbO5O0u3eNg==
Date: Wed, 11 Dec 2024 15:06:24 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Bryan.Kemp@dell.com, laurentiu.tudor1@dell.com
Subject: Re: [PATCH v2 0/2] HID: i2c-hid: re-power-on quirk for QTEC kbrd
In-Reply-To: <20241031073419.9189-1-alex.vinarskis@gmail.com>
Message-ID: <881968q8-nsqn-pso8-9979-1071r3288s74@xreary.bet>
References: <20241031073419.9189-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Oct 2024, Aleksandrs Vinarskis wrote:

> Resolve keyboard not working out of the box for Dell XPS 9345 13"
> codenamed 'tributo'. X1E80100-based laptop's initial support is currently
> being upstreamed [1].
> 
> In present state, keyboard is succesfully initialized, however attempt to type
> anything throws 'incomplete report' errors. When utilizing
> I2C_HID_QUIRK_BAD_INPUT_SIZE quirk the error is gone, however raw data coming
> from the keyboard is always the same, no matter the key pressed. Issue
> 'resolves' itself when suspending and resuming the device.
> 
> It appears that calling power on command one more time after device
> initialization before finishing off the probing fixes this weird behavior, and
> keyboard works right away.
> 
> Introduce a new quirk for such behaviour, and enable it for particular keyboard.
> Vendor is shown as 'QTEC', however device id is reported as 0000. Given that
> vendor was not present before, using HID_ANY_ID to match the device should be
> okay in this case.
> 
> In v1 it was suggested to make a dedicated i2c-of-qtec driver, but I was not
> sure how to proceed at the time. I have now drafted a dedicated driver, and it
> really is just probe method being extended to call powerup command again. Given
> that a similarly 'ugly' quirk was just merged to i2c-hid-core.c for a Goodix
> device [2], and that (IMO) creating a dedicated driver for such a small change
> without any plan on extending it will be just polluting, I am asking you to
> consider this change again. Alternatively, if it is yet still strongly
> preferred to have a dedicated driver to include this quirk, please let me know
> so I can proceed accordingly.
> 
> [1] https://lore.kernel.org/all/20241003211139.9296-1-alex.vinarskis@gmail.com/
> [2] https://lore.kernel.org/all/20241007222629.172047-1-marynczakbartlomiej@gmail.com/
> 
> --------
> 
> Changes to V1:
> * Rebase on top of latest linux-next
> * Update coverletter's reasoning and links
> * link: https://lore.kernel.org/all/20240925100303.9112-1-alex.vinarskis@gmail.com/

Applied, thanks, and sorry for the delay.

-- 
Jiri Kosina
SUSE Labs


