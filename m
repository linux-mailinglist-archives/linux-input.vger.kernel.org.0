Return-Path: <linux-input+bounces-29-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71E7E95A3
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 04:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C090B20944
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 03:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24174C2CD;
	Mon, 13 Nov 2023 03:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlxhlH2K"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8FC132;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BFD9C43397;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699846957;
	bh=cJyTsg2/ykeyXvrK54v0p7rMm498zi6eFEDrVxQoqHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XlxhlH2Ky0/ppr6cbSjHHpmiaiAVtSAxgBo4szAffgNq3Vw2d4mxasFwD8OxzJ9Zc
	 f4QvUyLxBzdsORjYJ/jIA3bMgB6rFLhgu9WGPPq6txPrGEpYMonIfKKyLZFKV9Ikgr
	 i46ejT5aoIaDrxYme/xKHKediCRPVMl04Gq+WxbwWhon8SoJXo7GvqFTX7QGYoTGuv
	 Q+xiS2gFfR3PcLmP2/s/s4W4dBHixX8YysXwO7Btaoc8ufZji2Kt6zGcmxlXEjGfeS
	 Tys2pX5hYdkuhdMzwFp19SMxgYZGEqpYnLIzX7HltYLcLL+0OAkYB96UQAAEngliA1
	 T3cWunvqmrg/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2142AE32714;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/52] input: Convert to platform remove callback returning
 void
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984695713.27851.5146160260731495399.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:42:37 +0000
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@codeaurora.org
Cc: dmitry.torokhov@gmail.com, michael.hennerich@analog.com,
 linux-input@vger.kernel.org, kernel@pengutronix.de, bleung@chromium.org,
 groeck@chromium.org, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
 joewu@msi.com, chrome-platform@lists.linux.dev,
 andriy.shevchenko@linux.intel.com, mkorpershoek@baylibre.com,
 jeff@labundy.com, robh@kernel.org, lis8215@gmail.com, pavel@ucw.cz,
 rostedt@goodmis.org, pabeni@redhat.com, kvalo@kernel.org, frank.li@vivo.com,
 ye.xingchen@zte.com.cn, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, support.opensource@diasemi.com,
 o2g.org.ru@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 linux-arm-msm@vger.kernel.org, hdegoede@redhat.com, mitr@volny.cz,
 patches@opensource.cirrus.com, christophe.jaillet@wanadoo.fr, windhl@126.com,
 chenjun102@huawei.com, ruanjinjie@huawei.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev,
 michal.simek@amd.com, robert.jarzmik@free.fr, dmitry.baryshkov@linaro.org,
 arnd@arndb.de, rafael.j.wysocki@intel.com, krzysztof.kozlowski@linaro.org,
 daniel.lezcano@linaro.org, corbet@lwn.net

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Dmitry Torokhov <dmitry.torokhov@gmail.com>:

On Wed, 20 Sep 2023 14:57:37 +0200 you wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/input to use
> remove_new. The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> [...]

Here is the summary with links:
  - [02/52] input: cros_ec_keyb - Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/63ef64cb6453

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



