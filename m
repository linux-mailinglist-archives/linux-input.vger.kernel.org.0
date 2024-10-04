Return-Path: <linux-input+bounces-7075-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290399029E
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 14:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B814E1F21948
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 12:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B01158534;
	Fri,  4 Oct 2024 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRbz4z3u"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CA5157466;
	Fri,  4 Oct 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728043513; cv=none; b=T5I4bz2c6VC2wAgQbk1hmb8WW9mz1hNKMm9IXAqTRrEqbsZ2rWGkR0uxFq3uDQPIjK5BNYHXmn4h0njdwNAkewCHfXsqPWERlbU57f/JcsdKbpkp2FEO7ymDwNQF8iNpAxn6AJRt38vbQFex9JBEVJ1JJqg63kszKwmS/GPDrBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728043513; c=relaxed/simple;
	bh=usyeVIrQPsTwxLugich3Q6f9lTvY0qfgkmQc3oVFmpM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tjTkh5W0gOcXzc+Z8TAZvKfMgIxai6WNbygmOVwljc1GiwbEqAGR4r2evaVPhoWEZDlfF/1yuMRPIhyR6IRopnRMcO73nm4u1lb1hC+EZJtjAcJakRuNKoxVvlnhZaYr/eCNCsxZ+FsNRbDZWOsKnOzghVpk51Nj1vN94f2Z8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRbz4z3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC97AC4CEC6;
	Fri,  4 Oct 2024 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728043512;
	bh=usyeVIrQPsTwxLugich3Q6f9lTvY0qfgkmQc3oVFmpM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DRbz4z3uAhxnjzO3kanLfPftYiIKAcIBVOg7LNWy3l/v8fw7bi/6psafpqZc0hjTf
	 NaaDfG14fM0+MP/n0FAdzCGF0wf/3+C58y+o9k5Qu3lzoFu4/hehfy9XUy+iD6QTUe
	 GGSmhcKcbYUTRR1UcjQv3ZrDShRv+zLdR66v6R6bnfUyMPJIagZniaV0u1JNb+mDTO
	 SSmsX1OGmYngk/lh8RO21lgo39vLpCHSAlJtVy7Buvs6HaCVYVyyB/9TYiVfNYU7UX
	 002umceCmwYqWFLpbzRCyidpQeMn04hHOydGxfsAzGEa3Px05FgOxNndx2CYXRbwd1
	 AyGFThkdS6n8g==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <ZvwYbESMZ667QZqY@google.com>
References: <ZvwYbESMZ667QZqY@google.com>
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-Id: <172804351156.292746.460758059139588756.b4-ty@kernel.org>
Date: Fri, 04 Oct 2024 14:05:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Tue, 01 Oct 2024 08:42:36 -0700, Dmitry Torokhov wrote:
> We can easily calculate the size of the item using arithmetic (shifts).
> This allows to pull duplicated code out of the switch statement, making
> it cleaner.
> 
> 

Applied to hid/hid.git (for-6.13/core), thanks!

[1/1] HID: simplify code in fetch_item()
      https://git.kernel.org/hid/hid/c/61595012f280

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


