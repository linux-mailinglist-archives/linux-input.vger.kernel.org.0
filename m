Return-Path: <linux-input+bounces-84-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5547EE83E
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 21:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC7031C2042E
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 20:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601A24644E;
	Thu, 16 Nov 2023 20:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBGG+yXG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4094643C;
	Thu, 16 Nov 2023 20:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2552DC433CB;
	Thu, 16 Nov 2023 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700166127;
	bh=Tk4VsI3q7+2p/BjMyvGCqbKi/6B2IcPsL/NYpb93qWQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OBGG+yXG+xhEmE3lcKicd/ekzT1LDf0GFJQ8X07qXI/H+VXyHbLUZGhoarpaNKQIR
	 xZCF4GKxuCLUorhVMFXggT/HubCG+9FxTCgX8+m3iR5mZ1BuFautofiPgF9zb87/xa
	 PyKjMq9VQiKDFL1usaKyLgW+9RTkBjKwfyBYfA0lbNu80mKps8q5VC7bdHsS1fogQo
	 SO0N/Hw+K+hx2179GY++mV0FI0uVUuuEZp7Q1kj88kxpXFRJdbPSejD6ycNpU7+8Qv
	 CLtw+p2rfqqWfo+TewBhLwkXuU+Uh1NGGXkEWv/nnzffNfqxtxpDv5iCcd0/5fFy8O
	 mxgMlawr4gA/A==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Yang Yingliang <yangyingliang@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-spi@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
References: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] treewide, spi: Get rid of
 SPI_MASTER_HALF_DUPLEX
Message-Id: <170016612386.72552.14423257472508429993.b4-ty@kernel.org>
Date: Thu, 16 Nov 2023 20:22:03 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Mon, 13 Nov 2023 13:12:49 +0200, Andy Shevchenko wrote:
> The SPI_MASTER_HALF_DUPLEX is the legacy name of a definition
> for a half duplex flag. Since all others had been replaced with
> the respective SPI_CONTROLLER prefix get rid of the last one
> as well. There is no functional change intended.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] treewide, spi: Get rid of SPI_MASTER_HALF_DUPLEX
      commit: 3fc6350fc8470d42f5e700ecd1c3d90f9dd9fd2d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


