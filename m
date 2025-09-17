Return-Path: <linux-input+bounces-14801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6EB7EB6A
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7FA1C00F29
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 10:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438A42EFDAF;
	Wed, 17 Sep 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkNpn9Vu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794522B584;
	Wed, 17 Sep 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758104737; cv=none; b=lM6BK0iUt3HfoWODMFvgJBbRBTJL6C//iRvVys3S0leTK86F/PsalTXUPN8iTisvyCcdhZwcVuoj+IV6y3dQJ9bq2/fY0eblFeQpWqa9LvrQ4p4a9nmiXB6118A63kKkyIQFjHsUzf7l85Pt59fFnRzw7BXf2mPxbvOBFSckm40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758104737; c=relaxed/simple;
	bh=WImgDiFakTd1yqEXanaauXiIi7dUaP3ktNhX61rPnDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U9p7vzJSXuKlFwyoXhArRCLj511xcFyokNEbubAppL1shEpsLQjvrr5cd8DFiW7t22D5yd1kBG2tlikOwNVdhtvqygVvYHct6Qn5jpkAQBFJE0xnPNPa1xZ7Y79nvuvm2ZU+qAvE9TrlBZJ5ubVQyKs67WDadSF5sysP1UcF6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkNpn9Vu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4ADC4CEF0;
	Wed, 17 Sep 2025 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758104736;
	bh=WImgDiFakTd1yqEXanaauXiIi7dUaP3ktNhX61rPnDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mkNpn9VutUC5/Ny6TpKFY1cuNzXgoWtAef4xysDKAp2acGbKiQMfLV9iszh5x1y8y
	 O3t+a7Nc16YvQ1XtHM0gv2eJ/oHvUC70nVwTtVdv8C1GUYxVckyB0yvKe5amPwsqbT
	 57qGuZqMd/9jAmUUYn0hXAJjKwsaKUV6YONeEBWS7vdBDU4+nmCAZiX42IsyRmabKe
	 iWFQxbWeIh759H3+5lawGEhN/3Y/vMGnVs5Gp+hivVMKF2hvds4hMoTfgB66vQmzk3
	 oDIgkvQbA1faZxCVF2yOydjKExWycpOotrGas06sczF5aztGy9RDQXVueGbARkPkcL
	 enOEu93OylDAA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, 
 alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
 boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, 
 ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, 
 Benno Lossin <lossin@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
In-Reply-To: <20250913161222.3889-1-sergeantsagara@protonmail.com>
References: <20250913161222.3889-1-sergeantsagara@protonmail.com>
Subject: Re: (subset) [PATCH v3 RESEND RESEND 0/3] Initial work for Rust
 abstraction for HID device driver development
Message-Id: <175810473311.3076338.14309101339951114135.b4-ty@kernel.org>
Date: Wed, 17 Sep 2025 12:25:33 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sat, 13 Sep 2025 16:12:43 +0000, Rahul Rameshbabu wrote:
> I am doing another resend. Let me know if it makes sense to start sending out
> work I have on top of these changes. I wanted to wait till these changes got
> merged first but maybe that is not the right strategy?
> 
> https://lore.kernel.org/rust-for-linux/20250721020211.196394-2-sergeantsagara@protonmail.com/
> 
> I incorporated Danilo's and Miguel's feedback from my v2. Additionally, I
> noticed I had basic formatting issues when running scripts/checkpatch.pl.
> I made sure to check the generated rustdocs and that the Rust examples
> compile as part of the kunit infrastructure. I dropped the kref bindings
> as they are no longer needed for this series.
> 
> [...]

Applied to hid/hid.git (for-6.18/core), thanks!

[1/3] HID: core: Change hid_driver to use a const char* for name
      https://git.kernel.org/hid/hid/c/d1dd75c6500c

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


