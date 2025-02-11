Return-Path: <linux-input+bounces-9934-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A1A30626
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 09:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 929713A1BC7
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 08:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B581EE7B7;
	Tue, 11 Feb 2025 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dB4L0ipo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E551F03EF;
	Tue, 11 Feb 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263504; cv=none; b=E/vGltERL+4Ch//UozRRH6ZDeUIcQ5ynUPNwXEVsvcu8pEV/3LMCrEdcuI3ZpH/rQ7rTr54Y/Qs061E3nAEfqyv0M/AFv4JH9MySk/AemhS35ZphP/GVsprQ/wm2YRNeiEmjWrlsCSXGSAWw1oTk9it29V4q9qL98XY47cMhwxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263504; c=relaxed/simple;
	bh=EXA8sizW3gJ7M/BWsGL05XH6M09E/OUKwgElzm+35ZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pLt0liG6+0Er+HXdp310xNlQKaCgvb0Wm7BooUK/AddEVC3F6/53hQCutiUz0NsmuX1oU6Naf06FiN30LfVJ5TlWWI0CAMHqDFocle/ls/cuQXyjbd7B2wRAeUZlyZKfVrN/JI0XIIrPmpEvs9w4s2YmRWkB0hER568bkmUPF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dB4L0ipo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24450C4CEE6;
	Tue, 11 Feb 2025 08:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263503;
	bh=EXA8sizW3gJ7M/BWsGL05XH6M09E/OUKwgElzm+35ZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dB4L0ipoMWi/9P9gdH+sRGHzloYhHpWzZYnzLZrmVS2SLXogjaDorxWuQrPOpY4AK
	 +Z64dIuMpbTCkO8Xh4p5a2KL4jAfnrgvCdumMsVhIadCIH6h8BEN6l1LHKvxZhkq00
	 wi53JxQ4IfoTmX/t9OkaR63FXCMkbZO0qB4u0/8zGeylGMkRSRlRsvhUeJn7K4L3xZ
	 YZ+SmnobJ4uiS8n/wIHTLBxBIFzx8s9MoTJo6y25LKEAtcdTOISEJJnJqKOM2yWEa2
	 TfCBBM/QGEDddadKXTilMKUayEpNgYmr2wWSlxgvwsZxEnrL2PKGDU7tI9aJ315EhQ
	 gTdFAwQ65DiNQ==
Date: Tue, 11 Feb 2025 09:45:00 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, anssi.hannula@gmail.com, oleg@makarenk.ooo, 
    linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/6] MAINTAINERS: Update hid-universal-pidff entry
In-Reply-To: <20250210151754.368530-2-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <022nps4o-spso-424p-o5nr-4rn89rnnr852@xreary.bet>
References: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com> <20250210151754.368530-2-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 10 Feb 2025, Tomasz Paku=C5=82a wrote:

> Add Makarenko Oleg as co-maintainer
>=20
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>

Oleg, could you please provide your Acked-by: for this one? Thanks,

--=20
Jiri Kosina
SUSE Labs


