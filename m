Return-Path: <linux-input+bounces-4350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB59F9085AA
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 10:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BE1B28678A
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 08:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204EA1822E3;
	Fri, 14 Jun 2024 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qudhw7rV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C0314A092;
	Fri, 14 Jun 2024 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352506; cv=none; b=Yj+i/Lh9GWqGvCnKKxEE6y9gxh575MOZkDYTsvmglkrPQv6AqqYWH7UvOyAEQKTtaP8ZyGL9jY/amWoyOev1E1meOhFnQull0bwRKYk1MEN3rXzK98zSVnkqVwg6SAIbV56DjlCpHrSKovo1mcfkv6il5maW1/NKA5fU6p4MExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352506; c=relaxed/simple;
	bh=stiFEj7Xn6Q5bImGM9v2ZHAiGPH3T9twAQI/vbuXJZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVMZLx5i1EzhO2D/Uaqy3yGt76+XjAbLr7C7UfR8ra2ddvKKzU+VXAzoIi/OsdlOY9ZOpyNAsQtOE6/1wIk2aDiQX6JLNenQocsVZj6tUZqfMM8cBz5VVCQcwXixV126PT74I3gQBidy2lbsfpaf9L+LSTpnfOsZJtFagBwAMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qudhw7rV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46097C2BD10;
	Fri, 14 Jun 2024 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718352505;
	bh=stiFEj7Xn6Q5bImGM9v2ZHAiGPH3T9twAQI/vbuXJZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qudhw7rVVhs5wc7ZIZZVTlxc6u7D+19Lh54ZauDJg6enkc8Y3S/iiev0wA2g8VcYi
	 IvIiFfpCD8NO7gTcVQezHPG9Vv1RrQQ4qcSKrmv1AQyVQPB8VkvapQOFajN2bJ6aeQ
	 OmnkjmZJ+d0K7GZpahnvJ8+UxA9KyaMMQa9a12XnBKhqOhs9TGDzeaadLabGohUGSo
	 skw83vyEHj8y8ImZawCffqvoXw4shgrGBQs1h2bHEPYss5yozf01FrnZfXVSzm/X9E
	 hCkU6QfDYQcgppHK+KNaS+p0IX31BUOvm7EcFOm9QirUuMattjXFMYpfRJ1CEMy0jx
	 hm94UW2VOtM2w==
Date: Fri, 14 Jun 2024 09:08:20 +0100
From: Lee Jones <lee@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v11 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <20240614080820.GC2561462@google.com>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
 <20240605135249.361082-4-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605135249.361082-4-jogletre@opensource.cirrus.com>

On Wed, 05 Jun 2024, James Ogletree wrote:

> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The MFD component registers and initializes the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  30 ++
>  drivers/mfd/Makefile        |   4 +
>  drivers/mfd/cs40l50-core.c  | 570 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/cs40l50-i2c.c   |  68 +++++
>  drivers/mfd/cs40l50-spi.c   |  68 +++++
>  include/linux/mfd/cs40l50.h | 137 +++++++++
>  7 files changed, 879 insertions(+)
>  create mode 100644 drivers/mfd/cs40l50-core.c
>  create mode 100644 drivers/mfd/cs40l50-i2c.c
>  create mode 100644 drivers/mfd/cs40l50-spi.c
>  create mode 100644 include/linux/mfd/cs40l50.h

This is good to go now.

Ping me once you have all your other Acks and I'll merge the set.

-- 
Lee Jones [李琼斯]

