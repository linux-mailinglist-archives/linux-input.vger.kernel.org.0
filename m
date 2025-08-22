Return-Path: <linux-input+bounces-14255-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F7B311F6
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 10:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B6455C7E94
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 08:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD602EB86B;
	Fri, 22 Aug 2025 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5EPUiZr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BA0221577;
	Fri, 22 Aug 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852038; cv=none; b=QI0pwfL4+EuGwFtgPo3BCQDSvs5DaKhyaqs16sZaz7MbDE5CycyaZKeB7fD/bcnT0412HIJwAJQf3iCe9UhvtJR+yUBXG/xUdVpqdZdrDpxbd+ePsM+4wRmnWf3EDomkuJ8fcSqKeAcJSiMm+Au5FMndlnqThFz6OAGPzvfLIxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852038; c=relaxed/simple;
	bh=U672dK4v+PxxtgESXJvazGOxF0mN37c2SaWpTHVq4kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoQNhK66jMn77ElT6+/X29J0jOBmvVaQDOUVz3WdWcfDvfWybtoNTgcCZQ2g7glWHHU0mbonc9CgYzNQ5aYr74Kwcw80VaeylF6JW8oY8U5XbMJpsaF/vlaRD3AvTa3u9W877fYWr0sx6zqvfko/6lH3pEs3HDQYGiMLzCty1hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5EPUiZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343E7C4CEF1;
	Fri, 22 Aug 2025 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755852037;
	bh=U672dK4v+PxxtgESXJvazGOxF0mN37c2SaWpTHVq4kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5EPUiZrJHAk5vVeEqIsRoeciPf0S9JnYzOhTFVuQGXj3vz4PNYmszz+WsgYzr+Kj
	 1VH94zdXC5rNm7DZwhj3pNoy5me0A+UReQjBj5q3IGEesCy6LtRKzjgIs5fxZG2Xvi
	 dj+qM6qqndKAmMbCtzItUHjSI5ALwFrOv5L5OaEARZVars60iUwzHWMvDqKk9w57OB
	 vvRiK8nQDaUOePtu4NUPTHK+qyctgJMsGf5uqTVDdc5fzbQomftZjBMef1HSarWfHV
	 k97D8Mty4Ho1sdAfsTIB3McUgB4YHxdEiqQSFLK+h9Yal3u6iy8kXAz5Psi/YrFjLJ
	 SYNI3UhgdEHrw==
Date: Fri, 22 Aug 2025 10:40:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Marco Felsch <kernel@pengutronix.de>, 
	Henrik Rydberg <rydberg@bitmath.org>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Message-ID: <20250822-pristine-earwig-of-vigor-b7b3bf@kuoka>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-3-940ccee6dba3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-v6-10-topic-touchscreen-axiom-v3-3-940ccee6dba3@pengutronix.de>

On Thu, Aug 21, 2025 at 07:26:38PM +0200, Marco Felsch wrote:
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> Add the TouchNetix axiom I2C touchscreen device tree bindings
> documentation.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../input/touchscreen/touchnetix,ax54a.yaml        | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


