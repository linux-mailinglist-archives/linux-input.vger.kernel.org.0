Return-Path: <linux-input+bounces-13798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD8B1A39E
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 15:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7D53BE139
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 13:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034D926A1A4;
	Mon,  4 Aug 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XK8/aBo3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1475257AF4
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314803; cv=none; b=Mopq/IwjPnkv+vY7Ll87g8+Z9KjIp91jopnPHSw2IuMGR0Ksm143tqAJype9lczOFqbxNaJLveQStD4B/wuzRAR4wC0PNcJULCeqEOfT3SGaXIFZuuLgOU1HBbnhXnsbBAJ+p0AYGbxchX2WnZqiozyrHD6RSFPATed3eaVvZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314803; c=relaxed/simple;
	bh=xwue/WrsNS8f84JWqGyz2+fkfKxzOJyfm7Zlc0AgFdk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cM4se+8AflADA57taKKyBRcL98fwULM2UqG8I2z0LBrIcD3D3b/UUPmPmKsR4ygj+AmowqH7YRTHUpm5hlqnnfPca02wdOy5ewBJjxPQ5OlxX9VXn6xVzIUYWE6KDgxkdZhY+PMyXpBrO4fPaVXWVz/CVc7TpY8Yqwc8uzDKWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XK8/aBo3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0321CC4CEE7;
	Mon,  4 Aug 2025 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754314803;
	bh=xwue/WrsNS8f84JWqGyz2+fkfKxzOJyfm7Zlc0AgFdk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XK8/aBo3vi/L1yQ+RlSiJuxwZNNhj5K5e08Nycb/5NJUE5v/bfkuNLOgGCuu0uuVn
	 09QhZOOTjdP6n8/xh8CQZ2brNnWYW0rQX7wh0IdB0+km5eTOMO2syv6SUqjbx/sNn8
	 9fO595P2DLHEbL9WrWu0f3t6vMjuA+3HHL7w0cTWAIl7/8Jy5kGn2I9FLDyyU2wsKl
	 r1wXOLymWsGx3fATH/4kzZocPHVcWH/hfRQVF4XhoomreX+O4bbzlExEYSr0/G9vQ8
	 xJVwH0GDn4Xm2aVYQoKr+bc1roClTGAzEMnfXstvTusEChe8LN4V5auhzKojPy/wc1
	 OokJnki5KB/tw==
Date: Mon, 4 Aug 2025 15:40:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/3] HID: hid-steam: Use new BTN_GRIP* buttons
In-Reply-To: <20250717000143.1902875-4-vi@endrift.com>
Message-ID: <pnp2n115-qn9r-8954-32q6-7p136q83p3ss@xreary.bet>
References: <20250717000143.1902875-1-vi@endrift.com> <20250717000143.1902875-4-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Vicki Pfau wrote:

> Signed-off-by: Vicki Pfau <vi@endrift.com>

Dmitry,

with

	Acked-by: Jiri Kosina <jkosina@suse.com>

can you please take it with the generic and xpad patch through your tree, 
to avoid cross-tree dependency?

Thanks!

-- 
Jiri Kosina
SUSE Labs


