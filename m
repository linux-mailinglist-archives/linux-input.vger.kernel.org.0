Return-Path: <linux-input+bounces-4727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8851091D195
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 14:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12C3CB21630
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 12:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DCF13BC05;
	Sun, 30 Jun 2024 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBUrp8YA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874A383A3;
	Sun, 30 Jun 2024 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719749885; cv=none; b=c+LtohEWXq7BOfDqtjCTaVGVLKR2crZ0DWVHJlAkboGqxWc7+iqaS4VikHm7fX49s0ksPI1vknVz9VzvNm9wRzJbllorYls92SRT+2DVcWsWxd3C9l+pVZnLMe32XQBcygHSfOwxaZYKM3WfXj0QX1LYz5VhDNXELHn0QJyOx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719749885; c=relaxed/simple;
	bh=eKwBrzI+lzlfuBG5EPxKBhnoZMId/ejrKy4DBkhiAJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgm5eQi5UXS6XRdxHVyysR3j1mLnxesCxTwn852kauV4Y5ttIyXG3qVuPAd6EfHsNhhCxuGi7dfAScBLX57v5/GRNWq3vcuj48S6DO4Ynirpj7yZuXmPrGAGQ/+2JXOOyIT/eWwJaTOPUJmpvThrpmf90NmkXVSHbic2JV+IBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBUrp8YA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF39C2BD10;
	Sun, 30 Jun 2024 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719749884;
	bh=eKwBrzI+lzlfuBG5EPxKBhnoZMId/ejrKy4DBkhiAJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBUrp8YAABDF4opVRq+DrH8ycNRd8GfrwCW6jJFNwZuNNS+2idGndOFSPmuhIqp0l
	 F3O2cTPeu7xoIp8kPje5tzg8QQ+q5Suk0x+GjG4HgCxx5rgBDWlwLvLSApX6/pKYCg
	 mGppQnfz1/FZ95nvbClpH4z30jvcMbvXJfgy2kkU59wezCQRhMo9QU4PrA2dT3kwjG
	 9RIzsdAQ4CzWmeKRApMa30vn6KLMzAtrTX274RhstAt16g2wfOXSkG1nxsK6L4GVwE
	 HTFfxSiWFgW/dPnCm6k9id0seOQB/T80eo29S0rBt4fck7lCNPSkzLXvT+hvkBTBcv
	 Rd/PD6ZF6gU7A==
Date: Sun, 30 Jun 2024 20:17:57 +0800
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
Message-ID: <ZoFM9QJVp3cpf012@tzungbi-laptop>
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

Dmitry,

I saw your R-b tag of the patch.  Would you like to apply the patch
through chrome-platform tree?

