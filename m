Return-Path: <linux-input+bounces-11751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299EDA888C0
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 18:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B5817AB61
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 16:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28402820A0;
	Mon, 14 Apr 2025 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Im93iHAa"
X-Original-To: linux-input@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF454279903;
	Mon, 14 Apr 2025 16:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648870; cv=none; b=gW0urV9Whti7Dm8sSYllTU99OKOLZmHleME4Aa/hLjM1fyQlXkmQgBNfFAQGD8YtIl90Jx1NcyLKVC4abBYKc1nfH45Hwa7VIyR1B11AgemdmsNruHC3kUcYQNNjO4AmRKGMdXqdI/0j+Kya5rjf9sKsFOMvsQ+xsV0Cno36Jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648870; c=relaxed/simple;
	bh=yFrck275ZtBjk95YqcbCA+f9RitQzmjgpVgi08uiIJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R8Smozfm4nqvrUl0a7bYs834Aj2vK6ORNK4Wb04/fAFR+OZV9knSiJJ8xYRiGTt+zyYf7yXQGdk/SD5EFxadzOcQXiyNvkg0t0Nhw0Flxmx1xZAEewEtA4DQu27BEZVL6mI62vb0T4aOYoMjrAHOFM5p6NNFLm1UchFC9MIBlqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Im93iHAa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF17141062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744648868; bh=wX4JW4LDlFSVkvOT0ahTg9N82VpsuNanMqc4ZUSb80A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Im93iHAapRQScNBN+z5UJRmOi3rI4CVaw3L0T9bZ46nx90ceiFac8wNzcf6l2AxXu
	 q+lMmjU8HOw7U9yoCnKViM5Hba1YIYkqaSZwzj6yQSRiptKeieeNViTqz+GjB6de+S
	 H5pHyZsi29j8fsxOlVLeEtw5otI67o4a842xhdQGej8n2pQje3Hq+jqqmf8ZEWy7Ej
	 6fuDD1Ftei5blD9savdf3AMxcYh3jyRW83tHmXWhfyHm3XMq0nBgzf4so9Ftej4+zw
	 xBD2P8yfm4YcZPlFSDAGMMvpT8C9xXhof9ezc7aeDU0Pgl5Ivw1xs3SdSEwB+fRPp4
	 dZ2wzXsMp5lVg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EF17141062;
	Mon, 14 Apr 2025 16:41:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Chih Yun Lin <noralin249@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Chih Yun Lin
 <noralin249@gmail.com>
Subject: Re: [PATCH] docs: hid: Fix typo in intel-thc-hid.rst
In-Reply-To: <20250330084518.20916-1-noralin249@gmail.com>
References: <20250330084518.20916-1-noralin249@gmail.com>
Date: Mon, 14 Apr 2025 10:41:07 -0600
Message-ID: <87a58iae70.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chih Yun Lin <noralin249@gmail.com> writes:

> Corrected the spelling of "triggerred" to "triggered" and "flexiblity"
> to "flexibility".
>
> Signed-off-by: Chih Yun Lin <noralin249@gmail.com>
> ---
>  Documentation/hid/intel-thc-hid.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon

