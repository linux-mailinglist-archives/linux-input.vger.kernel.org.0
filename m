Return-Path: <linux-input+bounces-4061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFC8FAD36
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917921F21AB3
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254261411F6;
	Tue,  4 Jun 2024 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icrOYmsN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31AF1411C1;
	Tue,  4 Jun 2024 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488803; cv=none; b=Pk+Z37600w+VVrSqHjLEYKkVZda1+Apl4BMefFJErirUQrNMbBsclniXkRqGbVHSBb/3y8LlPH0qZSWsoWEien8VJAlP783vaXWGAjaLHgQ12SFeXPDutiUdDyyZyIOlBsTnlygGPFhZRdDYS+NeUbnQSSKUM84HYPEVQpkTz88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488803; c=relaxed/simple;
	bh=ZSU7PK0vum8taK7BnyorRr6YBa1q8MjzDhJGdV/tLz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sYYkAQ/eZOZK3Pl9C5uWVZb5AklG6os9VxggIOx93Pn5z77KIrqRjf44Ps7wQwT2VzOw2zgx/aiy1SyJrM0BGhjJ9i+DKeWaRv1ydLbXqPpweTwBD846BNmenhxId+7RwFp88TJnjmMRlSlBCJ7ACBuwkHx5MCa5hn2PadfeXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icrOYmsN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038FEC2BBFC;
	Tue,  4 Jun 2024 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717488802;
	bh=ZSU7PK0vum8taK7BnyorRr6YBa1q8MjzDhJGdV/tLz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=icrOYmsN9GOHocEFyhnoBnMUttBJslMtriOixJAgOf3GZXxLg9bZlxhv+7wY5g5bp
	 m79vew42t4ODu6Bis/hzQqiQKVZZpnNtxKfODX+sw3YTJ6o/Rf7l08WSNMxThMZplO
	 CDt5wj+0P+llsL7PSc0TOcx/U6Ztwa15iswXaHyO/GnxiDWy6ptaNmfS69PjjbrSBP
	 6PtdUdEH+ElHsaJI3PkovxRIFILex+gW2d2KrFSs84Gy4yy07zysLZigN/tYFjPbty
	 Ukjp6mOhOTjc1Uox/BuEiOOZ1pHH2D9vBpjqD8VL3SoPBOIo9++gIZAW+OkeEuQEQv
	 cPxyr+4CyufPw==
Date: Tue, 4 Jun 2024 10:13:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Improve HUION Kamvas Pro 24 support
In-Reply-To: <20240524112554.166746-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2406041013110.16865@cbobk.fhfr.pm>
References: <20240524112554.166746-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 24 May 2024, Jos=C3=A9 Exp=C3=B3sito wrote:

> This series includes 2 patches to improve support for the HUION Kamvas
> Pro 24. See [1] and [2] for additional context.
>=20
> [1] https://gitlab.freedesktop.org/libinput/libinput/-/issues/989
> [2] https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/989
>=20
> Jos=C3=A9 Exp=C3=B3sito (2):
>   HID: uclogic: Support HUION devices with up to 20 buttons
>   HID: uclogic: Use Rx and Ry for touch strips

Applied, thanks Jos=C3=A9.

--=20
Jiri Kosina
SUSE Labs


