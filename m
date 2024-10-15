Return-Path: <linux-input+bounces-7409-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D512299EF3D
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 16:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797881F265BE
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 14:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCEB1E9096;
	Tue, 15 Oct 2024 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ea1n0h+A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA11E7C35;
	Tue, 15 Oct 2024 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001873; cv=none; b=Aov+Smbvu0XEqK66FHbHDHfgs2mqyOZ4KiCSs5PQM9IekfrXEHEVcTup6dZtaQGGPcp8mIkMBdHZ+PNi3UuYaQbkfc/6z3OfKZlW0v4M7rToL41hWvlgaQb8/RqkmrKbI7plPBCSi5LQBID+3/mypeS0rCMgKBexf5u8veTLSEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001873; c=relaxed/simple;
	bh=9baH6CHGZzsM468eHEGN4gVq+5woj1MILXky7eF7law=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=OGaL1qew3jxes0muua4PPfhTTR4rO8+Chr+7hB6BliKjD/nqXW1/UNeyZDBrCj2aLgHoNLSAqDPY2JGE0nk2QCti6mB1qL29ZzQi1b5/+1qR/f/p7lbq6v1dbY+cwmPlb2lo70A6uEA/vPKb35L431g1/VMBylO29/tjtecYrYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ea1n0h+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815B8C4CED2;
	Tue, 15 Oct 2024 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729001872;
	bh=9baH6CHGZzsM468eHEGN4gVq+5woj1MILXky7eF7law=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ea1n0h+A8vZ+CYbBUYN/JABoDPu4WImaTh8VyRjrMfxf1HNNGWcqwUpOcf6BwXTZL
	 Hc8/WjOB9c38UmMSXmtfP2hMhPPOSEvVkg0oQHOdsQ8rPsV2e8xLMqAykQH824qFbQ
	 884KnmRkFBwBTnZVlNCCy4+icqxIH7zvsnYTPFgs3yft4/oOan5DAZA4ZOdBTu6/Mo
	 iasxFqR8xAKH8YusBWimPmbq6Nu599hnGz2DF35DqH7+QVbOwP2Sn8hjeTDJP6zj0p
	 vy/kPzBHQCZr2qq2DtbysCFl+ok0dzx/SZfM7py861cQZsXq8vn1jcq3y0KtuhqzqI
	 A8UbHx2hVfJjw==
Date: Tue, 15 Oct 2024 09:17:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Chan <gchan9527@gmail.com>
Cc: linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Del Regno <kholk11@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
References: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
Message-Id: <172900161342.733407.14343301296469733039.robh@kernel.org>
Subject: Re: [PATCH RFC/RFT 0/3] Add support to Novatek's touch IC nt36xxx


On Tue, 15 Oct 2024 20:53:28 +0800, George Chan wrote:
> Initially support for nt36xxx series spi device. Below
> list all supported varients:
> 
>  - NT36675
>  - NT36672A
>  - NT36772(?)
>  - NT36525
>  - NT36676F
> 
> I had tested it with Redmi note 9 pro, aka NT36675 chip.
> 
> This series is based on my repo below:
> https://github.com/99degree/linux/tree/nt36xxx
> 
> There is a boot-and-functional tree for miatoll device:
> https://github.com/99degree/linux/tree/working-20241015
> 
> And the older dev history:
> https://github.com/99degree/linux/tree/nt36xxx_old
> https://github.com/99degree/linux/tree/working-20230528/drivers/input/touchscreen
> 
> This driver is based on
> AngeloGioacchino Del Regno for i2c based drive
> https://patchwork.kernel.org/project/linux-input/cover/20201028221302.66583-1-kholk11@gmail.com/#24831734
> 
> _AND_
> Neil Armstrong for the spi device codes
> https://patchwork.kernel.org/project/linux-input/patch/20231213-topic-goodix-berlin-upstream-initial-v13-2-5d7a26a5eaa2@linaro.org/
> 
> Download fw function is adapted from original vendor driver
> https://github.com/LineageOS/android_kernel_xiaomi_sm6250/tree/lineage-21/drivers/input/touchscreen/nt36xxx_spi/
> 
> Panel follower functionality is finally added.
> 
> Since the driver is split into core+spi so i2c function is relatively
> easily to add.
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---
> George Chan (3):
>       dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
>       [RFC/RFT]Input: Add Novatek NT36xxx touchscreen driver
>       dts: sm7125-xiaomi-joyeuse: Sample device tree for reference
> 
>  .../bindings/input/touchscreen/nt36xxx.yaml        |   70 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dts  |  183 +++
>  drivers/input/touchscreen/Kconfig                  |   13 +
>  drivers/input/touchscreen/Makefile                 |    2 +
>  drivers/input/touchscreen/nt36xxx.h                |  142 ++
>  drivers/input/touchscreen/nt36xxx_core.c           | 1422 ++++++++++++++++++++
>  drivers/input/touchscreen/nt36xxx_spi.c            |  256 ++++
>  8 files changed, 2089 insertions(+)
> ---
> base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> change-id: 20241015-nt36xxx-07e458ba2877
> 
> Best regards,
> --
> George Chan <gchan9527@gmail.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/sm7125-xiaomi-joyeuse-touch.dtb' for 20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com:

arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dts:9:10: fatal error: sm7125-xiaomi-joyeuse-display.dts: No such file or directory
    9 | #include "sm7125-xiaomi-joyeuse-display.dts"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dtb] Error 1
make[2]: *** [scripts/Makefile.build:478: arch/arm64/boot/dts/qcom] Error 2
make[2]: Target 'arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1412: qcom/sm7125-xiaomi-joyeuse-touch.dtb] Error 2
make: *** [Makefile:224: __sub-make] Error 2
make: Target 'qcom/sm7125-xiaomi-joyeuse-touch.dtb' not remade because of errors.






