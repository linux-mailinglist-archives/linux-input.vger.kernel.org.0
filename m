Return-Path: <linux-input+bounces-27-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D960F7E9573
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 04:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2251F21150
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 03:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C92C120;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XO7mD6UA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911958BE1;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 237CAC43397;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845835;
	bh=JUnsdCqz3WfcCEsI96srKVFHvE5WeW6CUmBQHypg64Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XO7mD6UAKN8nq9R3JWrzb+MBw4dFmYjxoxrNYghN50KIXOlV60EmzVBfvQ0+AlgDc
	 XfW5zTWEKZPq+rKMzhXIdAt+MO/E0SSsyGPf7VYnsNVTQQp//wiUXSUx6v5CGw9zeq
	 qp/vpUaxdR7poqBfDmTGDUH8jpnioZBTu6xqlsk+NwKyssls6oUttDfD2hYCpYIX7U
	 HQe83dMKkKzgxekRaXlogD/lilBR3eWyWxZ4FnrXsjrolDHYDNvofy4MP32EjM96SY
	 cswxKh4OIVaH/0u+uG5EOjXEvFGrHasdc9yWUpWLrF6ogOLjmthl585KREFlRVmnu5
	 NoBmqT6APGTPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0458BE32713;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
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
 <169984583501.27851.815318901545645450.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:55 +0000
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

This patch was applied to chrome-platform/linux.git (for-kernelci)
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



