Return-Path: <linux-input+bounces-9234-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C8EA11171
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 20:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D15931881A8A
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 19:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4361FECC6;
	Tue, 14 Jan 2025 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIb0e2hY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F615623A;
	Tue, 14 Jan 2025 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884223; cv=none; b=p9OS7Swsu8bB6whSGN5EFwTk1zVyU7rTucSAbfixkcapr/5mFzXvnLhOm0AEKuUWCW+WaniYO5W1QpVK4d9Gie3ekX9TNKO9hzkVjQRHolcx5O2EGcLWvfnCMiGd+XybacUCmAoFP0DNOMK5i6PUqmmgkUloySwTG4F8Fiz1rx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884223; c=relaxed/simple;
	bh=BGfcXiEE1FnlDqT6Q5FOiW3hDYWzsKAxUl4wjY5sYIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWtAgB3y+l6MdiYKoL3QXE52dZW9WOUcmNf6Jh1iybnY8+TaNoeav89QKiHUT5UyyYrT1Nuh4UNY1J7BSyiEBBMKhO3iSSnBjvWd8T/0S6rBaTTdxc577T4tNPPRz3M6r9520rrNAHIcET2WQJWg9d0Zjpp0zGD/8A59bMi/z58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIb0e2hY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D62EC4CEDD;
	Tue, 14 Jan 2025 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736884222;
	bh=BGfcXiEE1FnlDqT6Q5FOiW3hDYWzsKAxUl4wjY5sYIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIb0e2hYuwe3RKgNS9UAeT2oQQGuKW2jlZnfolG/eWxpdR/z9FFG9JDq6eLUU9sZx
	 PUMzuPKZunqn6wKOOiTx9IEW4hDt1KiNA6EGns2k6TJEd2HtAUYYzHCc7aVnYUvPPh
	 o0839Z1RCTidzHlQuLr5pTmuHlW+yoZuC/U/FY3sL7B5gIVN2JkMAa3yvwGXcA5okF
	 6teBuBckcDv5y1WZXNzFyxcrhcEbu+CY+utzKE2tB9ZBtlUJ/Y6N37K11w/M7ZFZpP
	 vrb9NrL/2oifxel7Dig32onyfO/X9GXVF9UZ9KiF2Yvd54B0EhQgft0KyAXjIqjwze
	 SaiH/1kfJSDHQ==
Date: Tue, 14 Jan 2025 13:50:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: input: matrix_keypad - convert to
 YAML
Message-ID: <173688422090.1615715.3179682317896999462.robh@kernel.org>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-4-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-4-markus.burri@mt.com>


On Fri, 10 Jan 2025 06:49:02 +0100, Markus Burri wrote:
> Convert the gpio-matrix-keypad bindings from text to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  .../bindings/input/gpio-matrix-keypad.txt     | 49 -----------
>  .../bindings/input/gpio-matrix-keypad.yaml    | 88 +++++++++++++++++++
>  .../bindings/power/wakeup-source.txt          |  2 +-
>  3 files changed, 89 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
>  create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


