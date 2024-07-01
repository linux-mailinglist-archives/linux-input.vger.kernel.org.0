Return-Path: <linux-input+bounces-4740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4B091D6B8
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 05:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B2BB1C2136E
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 03:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F863DF62;
	Mon,  1 Jul 2024 03:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbB9tdLX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E520312;
	Mon,  1 Jul 2024 03:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719805794; cv=none; b=Wk5EYHI8tu82uU72MrBfLtERgxZ1F+UWjzEbL2wpkqBGRk3XGy+NYgm0Bw9590l002P2pIlZSPT/QECatkJqe/k4hMUqHQshXntM1n92MR5L1I/Teaz98k/ioTJ+wGWzhH1k97l9domBuMI41Oh9qKsr7BT1i41qMBzcAToGdss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719805794; c=relaxed/simple;
	bh=hQkaS728q63iPXfVIWLS/QmQ1U9qUrYr8fbEHvTVAJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miBcuF1zxrHCY9yKQSTa4MjieT1I77dzDR5UhhIb2lPDH4dU106Q+uPHtni4AAz379YRGTpKBf/yP3sucGeBjBqAcvXUEWQrXTt9rh5p2OPQ3eG/yVLYEtyCGDJcHMepCBV7sqN/j13Y/ujarIIuy7/752BfQxpa8M56Wpb740E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbB9tdLX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC43C116B1;
	Mon,  1 Jul 2024 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719805793;
	bh=hQkaS728q63iPXfVIWLS/QmQ1U9qUrYr8fbEHvTVAJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbB9tdLX35gVvVqld/CDWme4U2GP0wb7+too+cvtIUHPH+nWzT1cE0DYc9fDM5fHp
	 XXzLciai+gG0LycnbhESpiMVLne6rowoqCT40SzuERJuGsNuza9bjUHv1BUEXOVkpP
	 zq6pWeFnm9UbeUzbSvT+D+0KrOG1aNw0+V/v+GMM5MTODNCJ5NPWsFgpxSlQ9CshQ4
	 6dOfwm0Mf9Squj7F9g0l1Q2KWXQxaLS0ILZQrQ0PODBUCasADV2xBebppA1CImcQSn
	 vn01tlF0RQHyUbXw/1fp+BQOev+G9UedVX+NH+O3WqPIJvxPp5oxWZ27MZfaDzM+OQ
	 R6ElrdgBiiVhg==
Date: Mon, 1 Jul 2024 11:49:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: cros-ec-keyboard: Add keyboard
 matrix v3.0
Message-ID: <ZoInVQL__5f4O0I5@tzungbi-laptop>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>

On Thu, Jun 27, 2024 at 04:53:08PM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0, which reduces keyboard
> ghosting.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

Thanks!

