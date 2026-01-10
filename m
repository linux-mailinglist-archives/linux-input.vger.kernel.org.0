Return-Path: <linux-input+bounces-16935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 043ADD0D405
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 943B93010E5B
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E7D26738C;
	Sat, 10 Jan 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmiIlk2o"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645AD35965;
	Sat, 10 Jan 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768037341; cv=none; b=s4zvSZSNXPLSDQndFu3zDV0KyAyScc0Ke5H9xJsswldAB0pgleF1RF8I9jJCTjZb4N00UZ9CyOeFGm2sQyxIkRw/vbk9KWbTt3EPwm6VMsDG0vjsewxGK0LpvXYu45xC8ep0gsd657j3gu5rRWuoH/177xDZY1bwhf345a08C4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768037341; c=relaxed/simple;
	bh=svoVtkKrNDwM1MXKQRKoi5fzU1RqRRU3wRu1ssEaU9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qv8l1zLteTxa4qKprW9/yi4hj0uoTNnGEoMSnOVgGsIDtQDRQ8jcbJF3Vxapgz++dFQ9iQhu8nrn7wdvU66/fuVAo/NgAIAGCEjCEW/Oqk8sHfp0zPrAHljbLEL7TqpXGu9VJWwQTTqfHDLEeFEruxG0+LqbbZw68m4V1eOoIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmiIlk2o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AA8C4CEF1;
	Sat, 10 Jan 2026 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768037341;
	bh=svoVtkKrNDwM1MXKQRKoi5fzU1RqRRU3wRu1ssEaU9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VmiIlk2o2CCMYaF48/Jdx164+jcO0pwtoFRnjLFQEAi+fDyU6yU63fLF/gfeQZoAo
	 TInjLYm8zHjsVlliJymcRvSlG6SWbMlefnwh4aZ1r5zIC76ayZURAwlGXbFGMtX2hM
	 3RhEA94QqsOgWmqixifX9PI1qpn/oaujAw2kuQUoafuuAr/lkvzxurLxulDwREtjvm
	 odt4lRkH+xdQOGFY2VRSN1h/qLL350A5065Vch97uo4Jtnpecru69jJn9DJRf3W+A/
	 TU1Nk6NS4t6H/5M0xcrcudcXNx4QEkCi/ohAmDRxigxAd4qVXCjs5vA0cYvXa4Xvuk
	 Udm2/j+Qh/q7g==
Date: Sat, 10 Jan 2026 10:28:58 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?G=FCnther_Noack?= <gnoack@google.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: prodikeys: Check presence of pm->input_ep82
In-Reply-To: <20260109105807.3141618-2-gnoack@google.com>
Message-ID: <rr72r5n4-n236-2nsq-6n5p-p271296p2420@xreary.bet>
References: <20260109105807.3141618-2-gnoack@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 9 Jan 2026, G=FCnther Noack wrote:

> Fake USB devices can send their own report descriptors for which the=20
> input_mapping() hook does not get called.  In this case, pm->input_ep82=
=20
> sta=3D ys NULL, which leads to a crash later.
>=20
> This does not happen with the real device, but can be provoked by=20
> imposing =3D as one.

Applied. thanks.

--=20
Jiri Kosina
SUSE Labs


