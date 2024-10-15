Return-Path: <linux-input+bounces-7433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB599F73F
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 970E2B22C9C
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 19:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083BB1F80CC;
	Tue, 15 Oct 2024 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gg8tqodP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3AF1F80A1;
	Tue, 15 Oct 2024 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729020366; cv=none; b=nxL1e0AsjET6vaoLDtr8H6l85XDo3fapuKoWzXlie7mcUxeuDLjk46P9lhlBKXphjfufvWFOUmt4KBCS9RDMQUjGXsJAjIS11kk5GC4p0ctZfB75AmmlaRK1BN+7YfvuQlY9UNHwdbCg2esxtZvoZQgLzuwU2AYQdhQuTksw8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729020366; c=relaxed/simple;
	bh=aNWCWP+NRA+HcsIkQGIQiYbM8rf1blOIC5ksfv4YQq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVcNmWKlU+5yNx6Y7juoADbYn7eFdZXDhvWPQwCMTDnEWCAmofehmOG3j6Z13uGUQ5Q32YK7WK8m70b+7Ftxvesymp8klD5UE0r1WYymsoqfZQd8XAPaw4Ef+9TJ/TiER7Hec/bv+P9TbE6ju0w3PEeBEck+eUUpNBx69JoOGHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gg8tqodP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF548C4CEC6;
	Tue, 15 Oct 2024 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729020366;
	bh=aNWCWP+NRA+HcsIkQGIQiYbM8rf1blOIC5ksfv4YQq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gg8tqodPEX1BMYb6xsEUk8uXZosp8TAAaSWq7coYG6yKU8NJMjWQSdzwgrZYBqXXy
	 ydgM4bIfOEsHUtMtxHtClKKP0HAFhD1ItkK0CE5k+oZng4HMEGbbHVd5xs/jCw6LLp
	 S5dInlYBzsE7OzUHkMAcCuaSkAUwtjfVe7FP6kO04omTg0iiQKYpOz67XK7qU0hguK
	 JkcnBD66Dcg/42chsCjvNwOx4tgFRLZoBhE+iAHygOZs9jx3WOfFlPmXWBG2H+Iex6
	 ZD+kU6gtELGyxO1k40sorCr767zva5B/EcsPqlqi1uyu7o2Lv7XG53s3CjsGML/Ve6
	 9Z0YVYXKnnsCw==
Date: Tue, 15 Oct 2024 12:26:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, paulmck@kernel.org, sfr@canb.auug.org.au,
	jpoimboe@kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <20241015192604.GA1329867@thelio-3990X>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
 <Zw60Sj-iFh1KWwWG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw60Sj-iFh1KWwWG@google.com>

On Tue, Oct 15, 2024 at 11:28:26AM -0700, Dmitry Torokhov wrote:
> Oh well, if our toolchain does not like "unreachable()" then we can
> simply remove it - the switch does cover all possible values and the
> "return" statement should be valid even if compiler somehow decides that
> "switch" statement can be skipped.
> 
> If you can send a patch that would be great.

Done, thanks a lot for the input!

https://lore.kernel.org/20241015-hid-fix-fetch_item-unreachable-v1-1-b131cd10dbd1@kernel.org/

Cheers,
Nathan

