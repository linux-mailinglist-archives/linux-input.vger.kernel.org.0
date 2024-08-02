Return-Path: <linux-input+bounces-5285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F2945CAB
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 12:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BDD4B20A8B
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 10:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162F41DE876;
	Fri,  2 Aug 2024 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW+nChj/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6E14AD38;
	Fri,  2 Aug 2024 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596320; cv=none; b=sDQu+S9AxlQky7En7Ct4G61d/l6YwpNAxKBrQiBrEbKxNtVQKeeiGgs4YOTS6dSxyNGqYeezaGNh8I0bewGQPBGdYHi9LgdEkeyMwWvs9lZ5QPRqkPgFXp3qYGcSRGivJ8wiugCxX1WqZtruITcwXJYPoMIBpTilqUWwYRUkNoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596320; c=relaxed/simple;
	bh=qb4DVqqPh1mYIAE2cm9ELnhbOFTsYN3mV8ZJepzT3+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u0ahWlc1T2ive2iQBYEqsPZqEMIkj+m+z5j63rH2WmgNl9tQ8jQSWhmxREoXyinJ/IHc5b7/YAN/I6EobqZsHi0VcKpD3iIyDfE+bWv46Wol939Lt9R90wvgAY2PIQTWDCTS7NtIhPO3R48p0COIwcyF/IjfzA7zhdClGIfY8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW+nChj/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E25C4AF0D;
	Fri,  2 Aug 2024 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722596319;
	bh=qb4DVqqPh1mYIAE2cm9ELnhbOFTsYN3mV8ZJepzT3+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CW+nChj/opXtVU5Bv9oCG2IwrWFqMMiTYDxhfbAhzshCt3fUfGW5wXvE8idC11QFX
	 SeVRaVEFs9vYsCLhjQms8QnegvaxKKxEIWkfs5hgVULFNWMMWjeto96zSDCQed/YAX
	 BuSlhbJYWUBFajx6vlF1md8yZWfjpNDfFZn37kZL/3Zsa/bNFrChWnwkP1o1GibgNs
	 PdIQiDhtPM+kuRoPGFSe0xgTFmBjxJ01PRvSUlr4maxmedwJXPjqdoXCXIzTuPXoEW
	 L4tKXU5jaBeglA4CGeQLdqAihwyJ9VsmmgVHEA8jwhFvU2uUMZuLE56yT/x0+UPBNa
	 RX1VE8gdJ6Xyw==
Date: Fri, 2 Aug 2024 12:58:37 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <bnatikar@amd.com>
cc: Olivier Sobrie <olivier@sobrie.be>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: amd_sfh: free driver_data after destroying hid
 device
In-Reply-To: <d1c3ab42-107d-4ce0-9d47-9870084c9514@amd.com>
Message-ID: <nycvar.YFH.7.76.2408021258250.12664@cbobk.fhfr.pm>
References: <20240723084827.11773-1-olivier@sobrie.be> <nycvar.YFH.7.76.2408021247560.12664@cbobk.fhfr.pm> <d1c3ab42-107d-4ce0-9d47-9870084c9514@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Aug 2024, Basavaraj Natikar wrote:

> Looks good to me.
> 
> Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Thanks, applied.

-- 
Jiri Kosina
SUSE Labs


