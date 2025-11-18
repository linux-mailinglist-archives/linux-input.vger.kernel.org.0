Return-Path: <linux-input+bounces-16176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE5C6AC7C
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70FA74F1AC1
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 16:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D863570AB;
	Tue, 18 Nov 2025 16:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="andbDvRP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B3D33C50B;
	Tue, 18 Nov 2025 16:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484817; cv=none; b=E+lAtZmm5wTf2oIU0zYw7BDz2sMZBL3Y0DHnxzTgXdBA+jEKCYbUagKfGVmio8lQE5Vzr6j366RkbixDDyS+iNxTxmpoS3ai8vG0oK5qOWu/dhOKA+wRW2wD3+UZ4EY6JSvaFqcYsyXqy4XQAPOJHQI1T3KNOWPWiDhMdHXvXqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484817; c=relaxed/simple;
	bh=Fy5zKjypwvzeIeIUqJ1IcsRvWz0TTPqQ8vO9exRMO0A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bkS2AhFt4gNTQu6PzXL/JfapFbQRKJ0lKtY0VXhGNJ6CPc45C0kZQ2yF26+yvKoncVDXMHoyHkNR8actFPJrPCIk3oCnlgc1W0xkzJl2dGyBJ1FyWVMSDCGPddsHM1OWU+TA7q2jwTNKch2cO6tDrZKqx9V9JrAmncb0FmGA9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=andbDvRP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF81CC19422;
	Tue, 18 Nov 2025 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484816;
	bh=Fy5zKjypwvzeIeIUqJ1IcsRvWz0TTPqQ8vO9exRMO0A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=andbDvRPZSRIt8YQEwF1VpYmYLsww1Yxnmmo+GC9p9AS1RUj3ZM6333HUrFtebcU9
	 pukCnmcasGi3THUA8XoRmokmeiweWsnN62Zf0PcfJbULRZIAeZVXVuVonlkemp8ReC
	 VNQV3iEEZmeQlnE4C7jkvJdT2/PIv8WUgGopy+l5LU/R4z3XSYP8rCYcfSkjX4fbN1
	 8Wv08ZapuWpvArq6CQRbmEO70VyioImTYdrOsgT12IZ/kpa0A/+KmXyhzJMdOlHwdi
	 +4JgR9S2Zx7RNfJNciBjuUY+QoH5eva0NCEOwFePiyuQVsPiWLtpk7f/9flFFZTtQV
	 t3uAlGVQTQAmQ==
Date: Tue, 18 Nov 2025 17:53:32 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Documentation <linux-doc@vger.kernel.org>, 
    Linux Input Devices <linux-input@vger.kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
    Masaki Ota <masaki.ota@jp.alps.com>, 
    George Anthony Vernon <contact@gvernon.com>
Subject: Re: [PATCH 0/2] hid-alps docs heading cleanup
In-Reply-To: <20251024103934.20019-1-bagasdotme@gmail.com>
Message-ID: <2r581q07-0n9r-q810-8sn4-pp555ps75171@xreary.bet>
References: <20251024103934.20019-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Oct 2025, Bagas Sanjaya wrote:

> Here are two section headings cleanup patches for Alps HID documentation.
> Enjoy!
> 
> Bagas Sanjaya (2):
>   Documentation: hid-alps: Fix packet format section headings
>   Documentation: hid-alps: Format DataByte* subsection headings
> 
>  Documentation/hid/hid-alps.rst | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


