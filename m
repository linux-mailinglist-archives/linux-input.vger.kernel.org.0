Return-Path: <linux-input+bounces-13949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD6CB22AA7
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 16:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22F3D1892883
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE602D0C99;
	Tue, 12 Aug 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdnrgvMK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFD12857E0;
	Tue, 12 Aug 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008748; cv=none; b=GR2g1RohWkeLUtOTXRNu9SDQ5wGkcfMwhdvjIbJ6OMGdW9fkFNfCcX4cfn1yI2kL7gleeBoN9m+/F+uA9r3oTELTZxRt/GaXvCRVM7IZ6DDuIGbloOaGbw4Rh0bbt5/8s3iR0TG7FDWZBZfOTU8I6c53FuTnt1Hmv1660hqYWoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008748; c=relaxed/simple;
	bh=rwXmrw9D3dyrsku31VCi9/Z463CZfsrK/smdh+iaUEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jLj818jJbe/KkFLKIjAAjFSXgTtXnmTIJCdRxYdhFRjH5W7eNpf5pZUZzPFdlYGWKbpYCKfQ9vfAuVwfl/OkNPOCfvechP56djqoKZNdyNp9WtmltBpBtJUHUKMRcOjkDvhonfNf1rDV5pUyR0Z3AouJSrxrnFigA6r3x2tVyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdnrgvMK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924E6C4CEF0;
	Tue, 12 Aug 2025 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008748;
	bh=rwXmrw9D3dyrsku31VCi9/Z463CZfsrK/smdh+iaUEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AdnrgvMKZbP4H5GTtT6Zp1mKchvVItLD/ez+jqycjhzYVTVECWcta0KCHcDHoyGQI
	 6GNfPmXUIy36bvQNeoDgIP2GTNSI6JEBCrKK8PE3IlSflxK4RpmRgEUEmICKqOZQNe
	 EinQKCEa3boplVPr3nHmL09d/9N0wk3lpWR7uMh+St+s6hPJ3yfxe0UssOQltyx3Lw
	 xALlj7D9yiunHcAIaagR9ClYu6Ln+JymQHVEu37VlfFU/X6pBSRsGcphLX32N1J9UB
	 ejSqT6npbxgSFWoyHv/7t9+Ga4TCXS2ghmWrXt4YMah9TZef2YDvY25sv5YfVblhg8
	 gJ5rdO95m9LEA==
Date: Tue, 12 Aug 2025 16:25:45 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
    Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 RESEND] HID: multitouch: fix slab out-of-bounds access
 in mt_report_fixup()
In-Reply-To: <aJtOG7bqgC8wUxta@gmail.com>
Message-ID: <rq255rs5-0ps7-882r-000s-oq50r906p003@xreary.bet>
References: <20250810180924.44582-1-qasdev00@gmail.com> <6o42n3q5-sq57-q7nq-rpn6-50np33r5ssqp@xreary.bet> <aJtOG7bqgC8wUxta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Aug 2025, Qasim Ijaz wrote:

> Thanks Jiri. Would it also be possible to review this one:
> <https://lore.kernel.org/all/20250810181041.44874-1-qasdev00@gmail.com/>,
> I resent it but it probably got buried in your inbox.

That one is still in my queue to review, in didn't fall in between cracks.

Thanks,

-- 
Jiri Kosina
SUSE Labs


