Return-Path: <linux-input+bounces-15458-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B43BD8697
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39D8A4ECE9C
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0E72DCF6B;
	Tue, 14 Oct 2025 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzeKlsoA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515612877CB;
	Tue, 14 Oct 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433718; cv=none; b=fzICdXYSA/Eyo1ZwuQawAwccSrqh2tKkl5nw5APldJ3eYL7jUyUyPPXYaBk7lIFyKq7VFRsdRQKJUZOWmFCTYm0WAKu/jy19L+QzNpPIgjb8KQE+PTyXT6aREmGnl7SSHKFykHNkkKbXeYujqV+i/bB3/vJxk9PZfG85P7sIw6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433718; c=relaxed/simple;
	bh=xjvtN6+t2OdC5jPv4gLpO6TcwGJJdQZYK3vhlYIlt3E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kenzt2HyPXuANPjFA75lD05dNjxXYCO8aIVRv2DRv9gVX3PGoC0MAEdINU04cFyah70kbTE/e3P6nQ/AN/Y15bnpBiRgcu2RnDCgYVBKwjuirkcQAslfq1KnxV/oRysszSU8tE3QrKTD4wja7MAu3BKtHskmDja6IRvV8eMyAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzeKlsoA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E48C16AAE;
	Tue, 14 Oct 2025 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433717;
	bh=xjvtN6+t2OdC5jPv4gLpO6TcwGJJdQZYK3vhlYIlt3E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fzeKlsoA2RVe+cCt+GApRU4C/wGqIcL0uzqBUBTuCFM3+JOS5lSz4+YouWPrQODcR
	 PHJ8CyCv2ExGe5cHYk13Ht25tNFKyruvSq+mBp03ild2yijp4IkOYGKaoaxmtUZPzs
	 cCjKlpEmdhphewiShBvWwAI+6whuAAVZdLLzdCswq/8VfB66ktuz3Up/J3KHnChLm4
	 REsSdwKdkg810A+MQSZ60wa/u2olfvsG1FFdpovWXyDIrT3YwIglm6K6YcBrJxzaF6
	 sYdeqkw7hRYB033W0N7cfG5c7fz4bVj84S2KGJJn6JbUcLV/T4ZYrOm5bg6hnBrGxx
	 j1F0S3NkIrl/w==
Date: Tue, 14 Oct 2025 11:21:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Ivan Gorinov <linux-kernel@altimeter.info>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3] Input: Improve WinWing Orion2 throttle
 support
In-Reply-To: <20251012205054.GA15885@altimeter-info>
Message-ID: <pq6110o3-5s06-6807-rr5r-5qs7751r8qr9@xreary.bet>
References: <20251012205054.GA15885@altimeter-info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 Oct 2025, Ivan Gorinov wrote:

> Add support for Orion2 throttle configurations with more than 32 buttons
> on the grip handle (this means the device reports more than 80 buttons).
> 
> Map additional button codes to KEY_MACRO1 .. KEY_MACRO28.
> 
> Make the module simpler, removing report descriptor fixup.
> 
> Changes since v2:
>    - Add more comments about button mapping
> 
> Changes since v1:
>    - Correct trivial coding style violations

These changes should go below the '--- ' line so that they don't end up in 
the actual git changelog.

Also we use 'HID:' prefix in shortlog.

I've fixed both and applied, thanks.

-- 
Jiri Kosina
SUSE Labs


