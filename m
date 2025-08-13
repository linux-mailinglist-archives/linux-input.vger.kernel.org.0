Return-Path: <linux-input+bounces-13967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB7B248AD
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 13:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E0854E16C5
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 11:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFFE2F7453;
	Wed, 13 Aug 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnNn0Ozr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE52EFDA9
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085443; cv=none; b=Ozv+FXOl0U6gTni9e7ofyJ0ru/LsCbY32lDEFpWQLe5gql3JEr4qAB7PPeTF5FcH0ohitocU18R8gxkmN3yHEIwqT50+FsRuJL6uTvG5FA1g6gttbaqCrv//8aiEqJ8b3sPe8/yNSfAuMe7Hj3qBgVwVKr6lTlbM0oDqe8rzUw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085443; c=relaxed/simple;
	bh=sub9cbAh8NPcEj81TtZOToK613QvlgwVpMyHVyADfIo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I95u/fB36zGCNNd1mMz99pjS6cMmyAwgTHoC7dZYgN+l6VxeHUIKg3WXxc+1i3rEJoeTNlqVe5x7Q64eH/yXKO62cKvHCbA8FDcxB9BB1iZinQ6IAisSc9s2DgkLHvAgdjnbtCdzM4YHMG81mMQ5HCiYDfO4lhu5e+kvLs3Nfkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnNn0Ozr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CBFC4CEF5;
	Wed, 13 Aug 2025 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755085443;
	bh=sub9cbAh8NPcEj81TtZOToK613QvlgwVpMyHVyADfIo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jnNn0OzrA1X8yByUrb+13QwB8/5KU4X75zLj9L+lDWy040u2jzrOJ9pPfUZEBaXAf
	 JjN8LWEvRizojlxNSXEhD7cDDOrVrak5u5UxbLUozJLHQD0Z7RLLGeH8+nXBOVGMAv
	 JWP+MOY/7bVNijcq9zvkWCntm+SSJLcOA6u11lrxqzpIs1J4Vf1XNvZE90fK56nkmC
	 klANUuuXL0SqUYHCj7sYS3A8/elNb/SB36HwPl/3da8rOvGNnqY8Nq0leTB3JJZCY+
	 6+QD3hlNg8xfbyV+kRIJglZqKWf+yq9rVaC5tjIfKH0zNJg3b+R6xrQcfHLAbQokzg
	 tOviiFpr70r3w==
Date: Wed, 13 Aug 2025 13:44:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org
Subject: Re: [PATCH 03/17] HID: pidff: Remove unneeded debug
In-Reply-To: <20250803181354.60034-4-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <rp37rs8o-s33p-q8n5-2q69-2410206s9op9@xreary.bet>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com> <20250803181354.60034-4-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 3 Aug 2025, Tomasz Paku=C5=82a wrote:

> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>

Could you please provided rationale in the changelog what makes this debug=
=20
'unneeded', so that it's properly recorded in the history?

Thanks,

--=20
Jiri Kosina
SUSE Labs


