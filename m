Return-Path: <linux-input+bounces-1879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E43852E31
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 11:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FEA31F256C5
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 10:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8BA249F3;
	Tue, 13 Feb 2024 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXpkIAiN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9724211;
	Tue, 13 Feb 2024 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707820849; cv=none; b=OGp31whUYRfkDTezPIGjzuPIoSg/BA8NXIRNYoIk3jktV6h5iMDJxRVveLWpmv5vtjOHVAMuGQ68o/A8qYOYe0TmPgw+ij+fR77fgX87LcYvI2UzZe2Gh53AF0xXn1EBoE69y4u1cjaYPbS/7PwMYjsmVemR4bqZ0aY9Mg6ccVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707820849; c=relaxed/simple;
	bh=SdIGO8QRRKMoXA7F/J7F9sC/SL5JznJ15MYEyHmCxPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V1sihb+/YGUhCf/LczOnluRUB4I6yrvFBJoCfJR4PqNaPVZPaG9PaC1TWh8SKCxhxvpJWDoExAViSW3yPD67ZUaCT9hUn+1wFCdkutYvtLiFUAD6Tzz6VF3IjTfDJTgUhcpY/5ifN3+x77RlIYGbrfgPFngRv64EOFkXfux7X9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXpkIAiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE77C433C7;
	Tue, 13 Feb 2024 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707820849;
	bh=SdIGO8QRRKMoXA7F/J7F9sC/SL5JznJ15MYEyHmCxPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GXpkIAiNAFGIbfIZW3p754J3SEDKkHXA+dNFDpW00G9nL7keajK5XWRlTQlz8PzBs
	 Wn802fyk1KU+OeA0Mzj98Aw1jjrLJb0kEebxXy9/ZnCXLQSyDIJyNgbnjknMtDhXg6
	 kw7YKO5F4TIsoEDP/w0pfrwpUXk1mHPvfOwuLf8uiUudio6qdsWKbjAGynxBMjUhZy
	 zkfU/OfSH4wTAc1ChXM0XTpjycxG04uP4nc6q9xU3mwlvhDuB1x/vwrMO8BeYI6aFZ
	 7UrODPu74DpUU6s9ZTqOOFmr+QcxdKWxZSGSAU0EGCMI/xwodZ/diLmBJIb8+lNNV1
	 awik2N49Y7syQ==
Date: Tue, 13 Feb 2024 11:40:50 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Tobita, Tatsunosuke" <tatsunosuke.wacom@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, Jason Gerecke <killertofu@gmail.com>, 
    Aaron Armstrong Skomra <skomra@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, 
    Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: wacom: generic: Avoid reporting a serial of
 '0' to userspace
In-Reply-To: <20240201044055.23367-1-tatsunosuke.wacom@gmail.com>
Message-ID: <nycvar.YFH.7.76.2402131140250.21798@cbobk.fhfr.pm>
References: <20240201044055.23367-1-tatsunosuke.wacom@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Feb 2024, Tobita, Tatsunosuke wrote:

> From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> 
> The xf86-input-wacom driver does not treat '0' as a valid serial
> number and will drop any input report which contains an
> MSC_SERIAL = 0 event. The kernel driver already takes care to
> avoid sending any MSC_SERIAL event if the value of serial[0] == 0
> (which is the case for devices that don't actually report a
> serial number), but this is not quite sufficient.
> Only the lower 32 bits of the serial get reported to userspace,
> so if this portion of the serial is zero then there can still
> be problems.
> 
> This commit allows the driver to report either the lower 32 bits
> if they are non-zero or the upper 32 bits otherwise.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> Fixes: f85c9dc678a5 ("HID: wacom: generic: Support tool ID and additional tool types")
> CC: stable@vger.kernel.org # v4.10

Applied to hid.git#for-6.8/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs


