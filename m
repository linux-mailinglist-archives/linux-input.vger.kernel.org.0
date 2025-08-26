Return-Path: <linux-input+bounces-14312-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B45B35A67
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 12:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF1C24E2C5B
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 10:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06183286881;
	Tue, 26 Aug 2025 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDFqe5vt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1626273810;
	Tue, 26 Aug 2025 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205386; cv=none; b=SDnkBtpEvzwxu9e71ChsysIc5qx6ADvIvOTXyejwYg4iJPX3pDB6K7npQGlSUGBySBhT2TSKKMtnXIHrtSEpV3whUSFsAO/vgsL5zI9UisVe4K3CfAhJKmM/Ib31yI8JW7gfx92HmuuZfpZgj39FhWy8eOzmq3MfyV43/kw+HJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205386; c=relaxed/simple;
	bh=QvfQxHRT0op9SoU5DmBsvmJsXBKP+TNeLzFz78P8DE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IyurGTSfLfg1KuNZA6Iq1m0qvzzNY4hfHYGlgrCy8jc0F5fBvlttmBL0Z2NJR3OUZX+h9Yvv1lJp2982Mmy84ojbuYHa1q9bKSGELBXuZcIpvuK2yk5dnDvRe6aif5Yb3ZoDbvqMB+sNCJonAObz23b1+mvNWnt2usQgiKyHoKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDFqe5vt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBADC4CEF1;
	Tue, 26 Aug 2025 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756205386;
	bh=QvfQxHRT0op9SoU5DmBsvmJsXBKP+TNeLzFz78P8DE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DDFqe5vtY7Xd3RECwXJ3v3YJ0UYoZ2e1S99usBBGSZzQntLyNCwYGOhGNrumbLa2A
	 bGLdRnbUAg0yA2u6LkpzK0kZlAqHyK6yN0YZlissHa0aVcgK3YY/zLrSh+eEq6KB1s
	 MRZVzid0WQ/Y6KLKZmbDGGYy495UA/iUO4fm6qmJU8ePsdGKnRSnpkYhiAzDcTlwmq
	 dvp7xT1rNJA8BEWesKR/puUpk6CvvXVU0pKQ5liwDodQ9lycpZUSlq7xNgNEWMvGws
	 /nSwX14vb8giKBbEUa/W9kozrtNNOXrcOUAIkpQQomCEKQUaLRktJrhQosLhhc9KIo
	 tlZ1u56rJcHxw==
Date: Tue, 26 Aug 2025 12:49:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH v1] HID: mf: add support for Legion Go dual dinput
 modes
In-Reply-To: <CAGwozwH8Px=6X1AnH+3pohqdr9Y5thi6MfzJgOGtPC2c23ksjQ@mail.gmail.com>
Message-ID: <6ron46ns-o519-p872-294q-6pors07nsqp9@xreary.bet>
References: <20250803160253.12956-1-lkml@antheas.dev> <404sp531-6o34-rs48-po90-5276or97q405@xreary.bet> <CAGwozwH8Px=6X1AnH+3pohqdr9Y5thi6MfzJgOGtPC2c23ksjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Aug 2025, Antheas Kapenekakis wrote:

> Can you replace mf with quirks when merging if it is more appropriate?

Done. Now in hid.git#for-6.17/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


