Return-Path: <linux-input+bounces-13352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AD4AF6BBE
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51D11C46A6A
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 07:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B036299ABF;
	Thu,  3 Jul 2025 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3U5YG8A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB942298262;
	Thu,  3 Jul 2025 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528310; cv=none; b=s+ATV/9mSZmL1/V25WGZGf+MV/OHusiOrrlftZe23yzOE96swEWJdTBbhnTbtowlqAkQgLZ/sp1lE3b4UBZKx5eHPOcnHieW7tUguB3m8Py72ZFJwtlEnTgsLXJvtA67s0Ff7E2icFEQLFCdzm+t7/v0CJL4hs+Eqn9ZwcuUu8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528310; c=relaxed/simple;
	bh=vG+Joviv1dl+dWwKuzGYlENosRlADezMchazk7x1Bq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hGMlIePo2NHdKvPGbliGQ7fB92UGtnQD/lwbGtxeVojwz0O+t5QJTCaUSWiO/D5eMZwIkWVlQIaVlmiJfIsVVFZ/xHWPUxi93hvzJYTmgRT2S2LCFqZBvwFiTYhxnLo0gfIKWP0suX+dhzE89l3jumcvKRkhd5lT25i/dE6H7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3U5YG8A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70689C4CEE3;
	Thu,  3 Jul 2025 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528309;
	bh=vG+Joviv1dl+dWwKuzGYlENosRlADezMchazk7x1Bq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A3U5YG8AM5o3kQlwEx/WHSvnOIBtrkzbBI09p3KV1FBWs/tV7XlPH1iWLL86zt2/s
	 mHb7KDr97Wc9cdNXNC4iykwdA3jvQwn34BCv41j8jeZa3p5DOwwLIS5pxOp/wbqt+I
	 psLBLQbrAJLkb+uRZ97j2kY178AnW6wt4VJXOcx2kE6ACDcyZTgvIt+1HirVlCMJI9
	 h80M/rk000i/VIvyJO5vxY38iFou/Ep1I5O3zWNGvJDEP7aXLg98Q27V5n9U0BAZp4
	 YxPU67NrgG+7t8KNcz3upYDjMv9Z19DNHpl72J/J+68YjOaQc7keP/PIznowpCcgcX
	 89UKzzbd7xBhA==
Date: Thu, 3 Jul 2025 09:38:27 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: bentiss@kernel.org, gargaditya08@live.com, jirislaby@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH v2] HID: appletb-kbd: fix memory corruption of
 input_handler_list
In-Reply-To: <20250627110121.7802-1-qasdev00@gmail.com>
Message-ID: <qp120s01-q22q-52rr-97n2-or6o30n1qrqq@xreary.bet>
References: <20250627110121.7802-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Jun 2025, Qasim Ijaz wrote:

> In appletb_kbd_probe an input handler is initialised and then registered
> with input core through input_register_handler(). When this happens input
> core will add the input handler (specifically its node) to the global
> input_handler_list. The input_handler_list is central to the functionality
> of input core and is traversed in various places in input core. An example
> of this is when a new input device is plugged in and gets registered with
> input core.
> 
> The input_handler in probe is allocated as device managed memory. If a
> probe failure occurs after input_register_handler() the input_handler
> memory is freed, yet it will remain in the input_handler_list. This
> effectively means the input_handler_list contains a dangling pointer
> to data belonging to a freed input handler.
> 
> This causes an issue when any other input device is plugged in - in my
> case I had an old PixArt HP USB optical mouse and I decided to
> plug it in after a failure occurred after input_register_handler().
> This lead to the registration of this input device via
> input_register_device which involves traversing over every handler
> in the corrupted input_handler_list and calling input_attach_handler(),
> giving each handler a chance to bind to newly registered device.
> 
> The core of this bug is a UAF which causes memory corruption of
> input_handler_list and to fix it we must ensure the input handler is
> unregistered from input core, this is done through
> input_unregister_handler().

Applied to hid.git#for-6.16/upstream-fixes, thanks!

-- 
Jiri Kosina
SUSE Labs


