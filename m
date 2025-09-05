Return-Path: <linux-input+bounces-14517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8DB4636A
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 21:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234F617E08E
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 19:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A21227281E;
	Fri,  5 Sep 2025 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtHX8W3C"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4530422F77E;
	Fri,  5 Sep 2025 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099827; cv=none; b=R76KaIQgvk9kKoNZwZwK3C5ejtyaNwb7s6i2YpmVzKmYfVQKJCJdGSemGlR1f3uuW8NORkK+dThKcYDZJlPlXvm/G5PA8hgX9rH92bjTUkLcFqiGWjItpFAw866PrGDDGQ1TDFaXCoNHhPoQydnriB+1hzPsAEaC8245bSpA+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099827; c=relaxed/simple;
	bh=BvsMb/1wHuPKCShz/+mYa6IkInINhMn7sSgrBPdMWRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLbb3WudTecz2EoYyQQYjzPMzZFM/WW8Twuj09Ce1SLlFzwuzdHobrDOa+JVvOPpwBmGkOqFTlpA4UL+0s4NDHhBVoCTuogsSluUcoDgvV3EtetCwRg5cJ9bIu5hoVBF+XXI/ZQDhGcmbszbmWkr8oJDw5AnNg0bikoKI6+JDZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtHX8W3C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AE9C4CEF1;
	Fri,  5 Sep 2025 19:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757099826;
	bh=BvsMb/1wHuPKCShz/+mYa6IkInINhMn7sSgrBPdMWRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtHX8W3ChEbLSy2+LbaxLxmPHMZtoYB/SNSuop3iHdhCmnpJSc9wxY57avUHu4KZE
	 WbgYM9a3+/TFHynCqFBJnLqCYkKswXgESOpNKnGdF5xkoBWud4iVrXtrh9npnP7CUu
	 nq5rvEvMb0YY57APY9ycFnCv1geYq/AUY+H/6+a9ZpXC62Zy3hpT9+oizRZbVwA+Vf
	 py8vrBy7KS5591MhnPVNTNcOtH9AcsqFRgfN4cN7194uQulqE/1QvFkJJJ8GeIazbU
	 SZLOkFhEMoBcMu+M4yW5X98BQG1eEUhqyDJKMozN2dM4apgRa/0/jwjAXw34CX/c+5
	 pMYe84RZm+FDg==
Date: Fri, 5 Sep 2025 14:17:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: input: convert semtech,sx8654 to yaml
 format
Message-ID: <175709982026.1062812.11610809394297867158.robh@kernel.org>
References: <20250904191731.528145-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904191731.528145-1-Frank.Li@nxp.com>


On Thu, 04 Sep 2025 15:17:28 -0400, Frank Li wrote:
> Convert sx8654.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../input/touchscreen/semtech,sx8654.yaml     | 52 +++++++++++++++++++
>  .../bindings/input/touchscreen/sx8654.txt     | 23 --------
>  2 files changed, 52 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/sx8654.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


