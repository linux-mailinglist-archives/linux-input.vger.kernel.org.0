Return-Path: <linux-input+bounces-9093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C9A0706E
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68AAB7A1280
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 08:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2236E20408E;
	Thu,  9 Jan 2025 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKz3NmzQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6AA201002;
	Thu,  9 Jan 2025 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413034; cv=none; b=d0ge1uD2gvl5uVrYF3LJ0pkZB2cs93j5/MI9jNUIAVgE17VINAmE4wRnqBeqv0n/vWNmRh03eHqMNQC6vAb38jfAgloZ6ZrC6IBNx2Bd+11i7nahmuJfC+RhWDPD9joDhNMYy0yP3pke97ev8BE4d0Sa5KqoABBxR2qFuh745Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413034; c=relaxed/simple;
	bh=VvcoOf4B5NRBSb9g7B9LFjGSUOo6jKAOssKcGWSXudc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OABNmU2tVeL+rzYsupscSg9Gzxsg3/KEgOsqAlSHpFEvgsh+iw3S8lNdKLz/Z1FVKD28Qa63YeoU9j+l2sk7uVkHTl8HWSeYLvTjsrPpviU4lCrUtiqPBd4uf/A/ChuSBwYpPknbGZKY3RM2MnZWldxnIYusavKRSeHfnjZTyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKz3NmzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3BFC4CED2;
	Thu,  9 Jan 2025 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413033;
	bh=VvcoOf4B5NRBSb9g7B9LFjGSUOo6jKAOssKcGWSXudc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YKz3NmzQ4Z6s+hC6u34uTFkvwzTzckF0Qo/ERz6VB9RbzRpmbhEQgWUzm+xeZWaOV
	 4PCp+/QVjp9jBpMsvJQrN18BSlbsElDFo0ILSkE/7zNPpjh6fofJDzUGeVrRG/JkbE
	 MKy3rzaE1xTA+RbvEbVYzNBMGvL0DV1aJBjIxgBJhUhy1Sb/ryVCXFiLFytt730Sfo
	 RXsKnSvuLNAXlCq0wO/oBrXA7WVavHALLLa1+EHJMcjRXxClFgV7UbB0bf9jY4SaGM
	 ilX7IPjQyRWpNcDdqoIqv0yEJ9mGBwO6j6RCMX2CrxwMnUiLNdezivvftTOQFJrb6E
	 +o++pLmKQJZ+g==
Date: Thu, 9 Jan 2025 09:57:10 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?GB2312?B?xOMg0dTR1A==?= <soragoto@soragoto.io>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: magicmouse: Update device name for Apple Magic
 Trackpad
In-Reply-To: <20241202060545.21193-1-soragoto@soragoto.io>
Message-ID: <s0p24401-5960-o7q6-8686-s455rs300pr0@xreary.bet>
References: <20241202060545.21193-1-soragoto@soragoto.io>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 2 Dec 2024, =A7A =A8=A5=A8=A5 wrote:

> Updated the device name for Apple Magic Trackpad USB-C when connected via
> Bluetooth.
>=20
> This change ensures the correct recognition of the 2024 USB-C trackpad an=
d
> improves user experience.
>=20
> Signed-off-by: Qingyan Li <soragoto@soragoto.io>

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs


