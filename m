Return-Path: <linux-input+bounces-9968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7FA3186D
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 23:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0922B168163
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 22:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF871E47AE;
	Tue, 11 Feb 2025 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuXIUip6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB1267714;
	Tue, 11 Feb 2025 22:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739312171; cv=none; b=G0l1kbEkh1CRF9J7mG97E3acxcG/ykAMkJLRg+h+W+OGwewI2HwQJtU5He2uRDBRsmTPv5/rTP9z98m+FzEYgsIzSJ5aeopyVxDIJmya8MEH43udTd/NLmt/dtNYyd91roZJyFC3qyz4W+Qy2Icz2d+xpz2HVYBkUVuRMZ6qKOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739312171; c=relaxed/simple;
	bh=Tmr4yGz6axnThyY9C8e2RHUdze5ImlP0nOw5fMJVlT4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HEivl9gyqtIF7WHyUp3HnhdL9+dw0KCx/zpzS+YtzNv9iF4UgBu6wGf9Ein3ZMk1hMOPy0Nc4KDZc5cCxSrkHWHwJH2bz1hPk+Vtcxw9RTCCVIeoCI9oAAygq+VdMiYd9epCP/gk9r5K2Xl0+s2IjRdtIY9JGHuUklrb+5OVnm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuXIUip6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DB7C4CEDD;
	Tue, 11 Feb 2025 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739312170;
	bh=Tmr4yGz6axnThyY9C8e2RHUdze5ImlP0nOw5fMJVlT4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AuXIUip6nQvfQK3tUUHrnFc9Op+TzU1p4+GkevVy7cCoZqSRKew9pNPkWSR67tE1e
	 SE+CwFz00/C/MoqZ239XZYmPGw+M//834yROMfQ/Q3ZdVzew3l8zFou/a+Z0Sd/5fe
	 EgcHlsggJIjJVSwS82Iogq3hBy7n6H1EGqOPOEu/q2IQrKrBtJFsgzzj+T0UHHKXUw
	 d+nBIZMXXF9Wr9Ljwb+1MkyrCPufPtFFRimeG7+a5AFjL5WjWZdCbO0satVzvO3yzS
	 gbvIkWHHudEM+H/6jJ500fnsJhEWqAYyP7jfOjv6qaqYyus0sWz2EG5z/UZgKV17gU
	 7IRw+9spe600w==
Date: Tue, 11 Feb 2025 23:16:07 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org, 
    linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 0/6] HID: pidff: Compatibility update and new
 devices
In-Reply-To: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <0qq8p002-oo32-735o-2qo6-9q0r9s797p9s@xreary.bet>
References: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Feb 2025, Tomasz Paku=C5=82a wrote:

> This is a small series based on top of hid.git#for-6.15/pidff.
> Add Oleg Makarenko as hid-universal-pidff co-maintainer as he fixed
> his email server and will be able to respond to LKML inquiries.
>=20
> Small compatibility patch for situations, where POOL report haven't
> been properly initiated and adding Asetek vendor and 4 of their
> wheelbases.
>=20
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
>=20
> ---
> Changes in v4:
> - Fix Oleg's email address
>=20
> Changes in v3:
> - Change Oleg's name order on request
>=20
> Changes in v2:
> - Updated comments and code to conform with Linux style guide
> - Define 0 duration as FF_INFINITE (PID_INFINITE analog)
> - Support device error response from PID_BLOCK_LOAD
> - Remove redundant call to pidff_find_special_keys

Now applied on top of hid.git#for-6.15/pidff.

--=20
Jiri Kosina
SUSE Labs


