Return-Path: <linux-input+bounces-7438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCB99F881
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2170D1C20E8E
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7921F80DD;
	Tue, 15 Oct 2024 21:02:21 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6771FBF44;
	Tue, 15 Oct 2024 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026141; cv=none; b=pcEWHrdgkTZDfx4rFsfQF/bibiP9J4f4tAYfx7SJn14DztSKyWWl+wjrRcJ9NWslskmfWYR7w/JMvbtSKtOafqdUydk01yJXc4Qe1xPbztK+OXr84QfhI+Wcqr0ZZexqxtachrcN6CgoeflBbNdc92oLVi8Fvt3C2U2C9CrYn8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026141; c=relaxed/simple;
	bh=/8qW//Xm2w8jxPweUPLiAJboYgNdq6ur315Duu6eN2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBLmdVJoXTM3AC85Z29n+LFq42gcas6bci8ZQKPfCp91nYS9IgKWuEsXaZGSKzeL8MRiN9/vNr8SAtFPKgQq5rE93vYFe2eVFAysfz5KZSR7yw3GJsmnXN/ZlqtyFWqz+biWY9jMqf7Ooqg0nFjnweP3Q2g1EfIBLRIQlHNpdqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49FKxsmh030529;
	Tue, 15 Oct 2024 15:59:54 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 49FKxsAU030528;
	Tue, 15 Oct 2024 15:59:54 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 15 Oct 2024 15:59:53 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev, paulmck@kernel.org,
        sfr@canb.auug.org.au, jpoimboe@kernel.org,
        linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <20241015205953.GH29862@gate.crashing.org>
References: <ZvwYbESMZ667QZqY@google.com> <20241010222451.GA3571761@thelio-3990X> <Zw60Sj-iFh1KWwWG@google.com> <20241015192604.GA1329867@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015192604.GA1329867@thelio-3990X>
User-Agent: Mutt/1.4.2.3i

On Tue, Oct 15, 2024 at 12:26:04PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 15, 2024 at 11:28:26AM -0700, Dmitry Torokhov wrote:
> > Oh well, if our toolchain does not like "unreachable()" then we can
> > simply remove it - the switch does cover all possible values and the
> > "return" statement should be valid even if compiler somehow decides that
> > "switch" statement can be skipped.
> > 
> > If you can send a patch that would be great.
> 
> Done, thanks a lot for the input!
> 
> https://lore.kernel.org/20241015-hid-fix-fetch_item-unreachable-v1-1-b131cd10dbd1@kernel.org/

There also is -funreachable-traps, which the kernel might want to use
(with that option every builtin_unreachablei() is compiled to a trap
instruction, instead of that the compiler just thinks "Aha!  This can
never happen!", and optimise based on that).


Segher

