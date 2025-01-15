Return-Path: <linux-input+bounces-9252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF4EA12E06
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 23:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C160A1889C82
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 22:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35A41DA631;
	Wed, 15 Jan 2025 22:02:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34A132C38;
	Wed, 15 Jan 2025 22:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736978562; cv=none; b=JsOGbMUAnEE49ZzjM8tf0fS+Yet8EiFOViwajKhEaAZluYkBjmRAmJiNKRV79eUYXquuYsXzOmkwR/jNEfcyvyRJArGoFH2KoB6MIzanPYGnP/NLJZaYpAjs5ku80zLQXJ5RvrI1jSU7MsLYgNAcJJ+jZxxeOjwbFU6TTdc+59I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736978562; c=relaxed/simple;
	bh=ijlIvHMTyrjTCxvbB/pvCCuD+jmZ39Q6g0EnWlcR5mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XD+j1U0whvZGQOq8Jm6PVjDEdhbuJcpT36RGkZqFS/oC5EUMvGEdSLl6/F/stfzY3fJe1UXJxamF9hJ2QQdPCkg8+RtHyW8saYdM6fG1uavCdDacHdkOEJgpJzE8lllooEnN9cc1RrpGhfW6DmYveJfixfYtAGsXC2JRaUJBPrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32891C4CEE1;
	Wed, 15 Jan 2025 22:02:42 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id E31B61060346; Wed, 15 Jan 2025 23:02:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <20241223-starqltechn_integration_upstream-v13-0-fbc610c70832@gmail.com>
References: <20241223-starqltechn_integration_upstream-v13-0-fbc610c70832@gmail.com>
Subject: Re: [PATCH v13 00/10] Add support for Maxim Integrated MAX77705
 PMIC
Message-Id: <173697855990.458200.13692575371536759973.b4-ty@collabora.com>
Date: Wed, 15 Jan 2025 23:02:39 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Mon, 23 Dec 2024 16:59:37 +0300, Dzmitry Sankouski wrote:
> The Maxim MAX77705 is a Companion Power Management and Type-C
> interface IC which includes charger, fuelgauge, LED, haptic motor driver and
> Type-C management IC. It's used in Samsung S series smart phones
> starting from S9 model.
> 
> Add features:
>   - charger
>   - fuelgauge
>   - haptic
>   - led
> 
> [...]

Applied, thanks!

[01/10] power: supply: add undervoltage health status property
        commit: df998c22321dde3f70cd3cf8c183dfd6bf64c759
[02/10] dt-bindings: power: supply: max17042: add max77705 support
        commit: 4519e13aef44269b0f8b6694a7adeb13d7d66b14
[03/10] dt-bindings: power: supply: add maxim,max77705 charger
        (no commit info)
[04/10] dt-bindings: mfd: add maxim,max77705
        (no commit info)
[05/10] power: supply: max17042: add max77705 fuel gauge support
        commit: 260d7c5e5392ac41c94152005d416172ba0a906d
[06/10] power: supply: max77705: Add charger driver for Maxim 77705
        (no commit info)
[07/10] mfd: simple-mfd-i2c: Add MAX77705 support
        (no commit info)
[08/10] mfd: Add new driver for MAX77705 PMIC
        (no commit info)
[09/10] input: max77693: add max77705 haptic support
        (no commit info)
[10/10] leds: max77705: Add LEDs support
        (no commit info)

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


