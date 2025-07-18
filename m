Return-Path: <linux-input+bounces-13592-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF288B0A82B
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 18:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EF25A2001
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 16:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976D62E62B8;
	Fri, 18 Jul 2025 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSB9J4oc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD462E6131;
	Fri, 18 Jul 2025 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855100; cv=none; b=avQu1XCTFxihO4rRY486Zkj4B/uQY5fF8hNMeG/yAA9cA9Avc0BCPSgXRp1yyYqjXooJ6ePe4lMtCGBxkX7WUUAGP7vH0hcqADfmnADR4BzX3rBciUCUVZHj2yoCnIXbFwwqnfjAQ6V0J9DzwnOdHXh1eEgjtOafA6uj2DgnrnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855100; c=relaxed/simple;
	bh=t5D71J5G8B5hbjHk1Vv7Y9tD03a+KeoRXKH981I8y6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iwlJ4WoDgDq9XroMQpcID33I2cuSia7B3NOZRPwG66arMF64gFNDNEUvFkNpL5ufsuyNZhgSa0uZXPHncmxxEQLXoLpWhazs1vtsna05lDWLZCInTIUBqfUTTzk5drM8UvAPxSTuuiwDkKCcko8lOtQt0wYdT4JqGTnN6PNCHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSB9J4oc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90734C4CEEB;
	Fri, 18 Jul 2025 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752855097;
	bh=t5D71J5G8B5hbjHk1Vv7Y9tD03a+KeoRXKH981I8y6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SSB9J4ocCmsfO9t1mk0pQgKQNRuqv+CIWxmOAnF+TvSm8hwEIQeJss1UAdjh6n6g8
	 jPOuIMOVIWug/dSP0OyzA4i9J9FWmKmnGVFgbZHaRZ3HP6Zo77NB0yAv84Dyw2xke6
	 i0TiY20wxLKkOdwsCwBim+aA8AFUMJPK02FRkfMH9T98DELhisk+TVad3d5tnJuziF
	 zclg9ysE4WbyqgrpHxUjs09cXlgFEI4BwBFUQtjXin7iEi69qTfi7eluXe+ETMTvyM
	 IfSU/SVArbKzFf0yyCqW81ltUir0qEdkdUm96uSaqrZa+2qbZY9siacVtUQwYIFNbs
	 1VKEOcKHPXskw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Qasim Ijaz <qasdev00@gmail.com>
Cc: gargaditya08@live.com, orlandoch.dev@gmail.com, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250713233008.15131-1-qasdev00@gmail.com>
References: <20250713233008.15131-1-qasdev00@gmail.com>
Subject: Re: (subset) [PATCH] HID: apple: validate feature-report field
 count to prevent NULL pointer dereference
Message-Id: <175285509633.273643.5107917401641399605.b4-ty@kernel.org>
Date: Fri, 18 Jul 2025 18:11:36 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 14 Jul 2025 00:30:08 +0100, Qasim Ijaz wrote:
> A malicious HID device with quirk APPLE_MAGIC_BACKLIGHT can trigger a NULL
> pointer dereference whilst the power feature-report is toggled and sent to
> the device in apple_magic_backlight_report_set(). The power feature-report
> is expected to have two data fields, but if the descriptor declares one
> field then accessing field[1] and dereferencing it in
> apple_magic_backlight_report_set() becomes invalid
> since field[1] will be NULL.
> 
> [...]

Applied to hid/hid.git (for-6.17/apple), thanks!

[1/1] HID: apple: validate feature-report field count to prevent NULL pointer dereference
      https://git.kernel.org/hid/hid/c/1bb3363da862

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


