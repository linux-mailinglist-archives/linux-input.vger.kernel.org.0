Return-Path: <linux-input+bounces-14652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5FB5512A
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 16:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984867C63CC
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 14:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480B931E0F5;
	Fri, 12 Sep 2025 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhBcIKTV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2215131E0EE;
	Fri, 12 Sep 2025 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686920; cv=none; b=bxFj2D5BuYXHMYQRgTZ0ycqHDIjQVeiC0G5E6BfReVf9ldqUBaYIY1Z7s7rGH96dFTDpdqkozxJCULzjmtR2Twpxa5BHl+n12iGdikdxEy78t0EAUEONwlEm7lgb7anMahErhPWg3SfZ215a3AFN+BlNXE/WYrYyQq7rPZWh2RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686920; c=relaxed/simple;
	bh=ffQAmgCN15kQvgKVgV0zYGnJ6qyHjS3Gm+IMCvZZ1Zo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eVA8BYnLQY197yxEyTUqp8lDjRFHTfY5NE4zGwFTUUakZj69xrB5iF/FJJY3Hz969Kz4c9ALoaDZyrd15beT+YItBk8gZAEa6+lpJ7DuKNFqea/hiGIMikvRQ9mdTm4JHcYfn8uKCyGSGK+3sXZPr4czvSpE7dHtDAboEW6ylww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhBcIKTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E411BC4CEF1;
	Fri, 12 Sep 2025 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757686919;
	bh=ffQAmgCN15kQvgKVgV0zYGnJ6qyHjS3Gm+IMCvZZ1Zo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UhBcIKTV7lysZ7goFRVC+T0uoj1GD92aQLGLRgh+jkjq4Lu2eFN/cOhJp3Zl7PTDj
	 1NCoa+uFN1Vic4KpkfshboomiTGW4OGTfWHnG5dxzthoUa7etdwT3nl7WKm3QJ+Trg
	 hiWeWB47QCj8dR7XjUoL7sLIr6LufEUN8avY8F9CnVmbaFXcgQ08iWY2AfkMisdxE4
	 GGIZiJC5YXKiB4U+U7hJROIe3JL73CCVMZ3O+jrEyOl+hTHQ5u76AD/liwJf5VAf5G
	 qehX1ErXg57pdE4GbpVZ8cqnLVP00ovZakxPtGDge9u9v32sBBS2b/A2qlEcTI4tJ8
	 PwPXbIcrp+KwQ==
Date: Fri, 12 Sep 2025 16:21:56 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: stepeos <stevepeter.oswald@gmail.com>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: LOFREE: Fix back/forward buttons for
In-Reply-To: <20250831095348.93453-1-onegearmode@gmail.com>
Message-ID: <7406r1oo-o69n-rq07-qqq9-sp52p70po32q@xreary.bet>
References: <20250831095348.93453-1-onegearmode@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 Aug 2025, stepeos wrote:

> From: Steve Oswald <stevepeter.oswald@gmail.com>

Changelog and signoff need to go here, otherwise I can't apply the patch.

> ---
>  drivers/hid/hid-ids.h    |  3 ++
>  drivers/hid/hid-lofree.c | 96 ++++++++++++++++++++++++++++++++++++++++

You are adding a new driver, but neither Makefile nor Kconfig entry for 
it, which is suspicious at least :)

Thanks,

-- 
Jiri Kosina
SUSE Labs


