Return-Path: <linux-input+bounces-13687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B8B1270B
	for <lists+linux-input@lfdr.de>; Sat, 26 Jul 2025 01:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CA421CC280A
	for <lists+linux-input@lfdr.de>; Fri, 25 Jul 2025 23:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701BD24BD1A;
	Fri, 25 Jul 2025 23:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPH96wuN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF021E9B22;
	Fri, 25 Jul 2025 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753484624; cv=none; b=eKJW4z8COuUZlN926FUFR7xIOZSCZIJJWOMCJ7vl01tYZfSTsVrlu34HceLp/YUD26MprxUuQUNWuFgj32F8Md//ZNhEZDdRJykjCpeFtEopHkCQddDOtOZkkJuwY3oGZ9sTBl2c473vXtb/SgsRiweDNdeF/FgtTEEMRNKq0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753484624; c=relaxed/simple;
	bh=JCPGAeq5h3alLBTKg3UQyJ1k3L9zSUxf+6cEhbIJi6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADtb7pJ9YrZlu4ZFNd00kCOyPBRktoGVsYiHDwwL8OCkLKzNzuZAvKTBDpM+L1MoeSSeOUDZoVCnHHkhXfUu7/o5ZPYL6EIZ23MnJwo5jjAfJSkyLiT8QEtNBAr/F7DxCddXyzCAqk57n3T8Axq62OP0dOCyZCkxSEjrQBvkeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPH96wuN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83281C4CEE7;
	Fri, 25 Jul 2025 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753484623;
	bh=JCPGAeq5h3alLBTKg3UQyJ1k3L9zSUxf+6cEhbIJi6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPH96wuNxf8STO8NTrMyO6TM9xJIfW7bEcE4GMcrnwbNyfBeUU4ePdJfKUP3yxg39
	 CUx4xPm5vZ0JLbsfraDzNVwDtonzTNA2nZdJOlqjB7eJz4ph5iX6suezAbOFQzrC2G
	 sgYnuhCIeiZmljiW9982uSeQeNE13+gVpFC62hICRChGAyY90ASyN1Vmp80W5yNqGk
	 +uz4SGW2YWye4dwNUAS17iJi8FMiW45/TDAgVMxFcvHg8AuwKNgjLraswk7Y1+93h+
	 l2dGlopP/nErZ6GQKbmNXZaU2gT0H3CUVPhB6fyO9xab8iI+3aoRIoloF7r4D+9IG1
	 jDwp7uq+b47ig==
Date: Fri, 25 Jul 2025 18:03:42 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: touchscreen: drop any reference to
 touchscreen.txt
Message-ID: <20250725230342.GA1993803-robh@kernel.org>
References: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com>

On Wed, Jul 23, 2025 at 09:14:20AM +0200, Dario Binacchi wrote:
> With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
> schema") touchscreen.txt is no longer needed. Remove the file and
> replace every reference to it with the corresponding YAML schema.

The point of what touchscreen.txt says is to not do this. I'd rather see 
time spent on conversions. But you've already done it, so:

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  .../devicetree/bindings/input/touchscreen/bu21013.txt  |  2 +-
>  .../devicetree/bindings/input/touchscreen/eeti.txt     |  2 +-
>  .../input/touchscreen/raspberrypi,firmware-ts.txt      | 10 +++++-----
>  .../bindings/input/touchscreen/touchscreen.txt         |  1 -
>  .../devicetree/bindings/input/touchscreen/zet6223.txt  | 10 +++++-----
>  5 files changed, 12 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

