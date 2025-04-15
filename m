Return-Path: <linux-input+bounces-11758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F2A890B7
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 02:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C584B3AE553
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 00:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE79E552;
	Tue, 15 Apr 2025 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4T4hIGr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1C111BF;
	Tue, 15 Apr 2025 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744677210; cv=none; b=Jqz673a6G5cbozy3ly8JjorHZFkPfKTukhgYaEVezpUdFrrcCYXsXjkqD6Z3cOwHaU+gdPsUgR2NRldUx3SNWD7x9VyHR6NY6H2H3+Ue/4mkvym9oLS/oh6NYWsgORIbamJyUmjtgKoHOe6+qOdYCvSZPHVU6JPuE9YI1EYCruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744677210; c=relaxed/simple;
	bh=eqwIVwtN+887ohiYvMh6dcfPcTmfL2U0sNbhIFk8RqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD1rr8k5WNI+iNdfhKkgu9xg2EOkM62moCsCUqVosaVxrMufM+fRxZuo358DNDL2oIuxAYXOttt+PpqN3Ls3S06UINjYcoLz9K9sqzT4zIbqYOhQicWyYXeG2Uq7gtsDkomDm8z8ZqkZgh8NczDiMgDdl2FlPOMtBTF676vPhCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4T4hIGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9C8C4CEE2;
	Tue, 15 Apr 2025 00:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744677210;
	bh=eqwIVwtN+887ohiYvMh6dcfPcTmfL2U0sNbhIFk8RqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4T4hIGrPHKtm5upVjDdTU4+H33Plv3vz4qEX5/QKH1aVIk383lDoSuvqN8jOPkRl
	 iGBfUoHAT/TwGtMT48xH3s72eTNnbPfzlp1wEPiDwyr18K1oSNJt7tPotiztpIrGSI
	 +UaLOUcdxTiDVnpsbZhxorANJzaQLP+pkJeSD1SpTXNyibSuzWfgrcOWjdnfDWcMeY
	 1Qf+Kq9xVutzRW7wtOR/Av06dX8F9vw9Q1QLeTidkysEoqeh/Lx98VaEEHJbtb4d2j
	 aWZhDIr+8SV9gD7EnjUQE/CnusTS9mvEpXGVjfupClwJp6Syidc4dr1qu977+VCbib
	 Ex6ev+hcEcZdw==
Date: Mon, 14 Apr 2025 17:33:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <20250415003326.GA4164044@ax162>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
 <Z_yrjPBO_CPS8WX1@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_yrjPBO_CPS8WX1@black.fi.intel.com>

On Mon, Apr 14, 2025 at 09:30:36AM +0300, Andy Shevchenko wrote:
> On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> > On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > Getting rid of the unreachable() in some way resolves the issue. I
> > tested using BUG() in lieu of unreachable() like the second change I
> > mentioned above, which resolves the issue cleanly, as the default case
> > clearly cannot happen. ...
> 
> As Dmitry pointed out to this old discussion, I have a question about the above
> test. Have you tried to use BUG() while CONFIG_BUG=n? Does it _also_ solve the
> issue?

Yes because x86 appears to always emit ud2 for BUG() regardless of
whether CONFIG_BUG is set or not since HAVE_ARCH_BUG is always
respected.

Cheers,
Nathan

