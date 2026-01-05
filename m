Return-Path: <linux-input+bounces-16786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46CCF246D
	for <lists+linux-input@lfdr.de>; Mon, 05 Jan 2026 08:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F5B300D4BD
	for <lists+linux-input@lfdr.de>; Mon,  5 Jan 2026 07:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C192D97B9;
	Mon,  5 Jan 2026 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5kr3reW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10FD2D8793;
	Mon,  5 Jan 2026 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599581; cv=none; b=ZhIxJMDquSNeW2MC5N+99bJ/L7wAK2Q4Hnot000FMm7EaJOILXJpynYHpobIVcq0KXkhtP5VWowJgEYWw48TFxiErO7R48N3ZcQM1nn//L8HQk/10Xy8HTnDP6/MJC2UGtbPp3qcBefgC6DirE5+mAJBBf7+Cgbmvc70NLBgyqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599581; c=relaxed/simple;
	bh=AiSYHgd0LeMj4IYkW5BSptu0mxPtYcWnONLKwMb1fzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiC3gVWIga5irEv2hdWERLhEj2VblRX8tMOFAZXM6VGbaQr0rsOH4ggugO/9YWEMIJtx1jZ2e0ReUGaMqSriOo7i7AhNKjlgmPumcP9AAqG2O46p+BOWsHXOdagrxKDUYTej2DfgoIwa/3X6uH5mk8fhQTo25L+6phRgHaawNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5kr3reW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EA2C116D0;
	Mon,  5 Jan 2026 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599580;
	bh=AiSYHgd0LeMj4IYkW5BSptu0mxPtYcWnONLKwMb1fzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5kr3reWi4rMJpw3k9dv0aR1x0qpH0wvTUyfVk8ruKF5agk5PehhI048fD/2pyjnV
	 /WDHVvjA0V0lUWZUQiQboQK4dvs9SHwZttsPL33/TxwLa77Yc+FH7DVnM9UF+D9FvC
	 vgwqG+LZyWEPEgttWc6TeZ0c0BX92CSvNlTQMhzcLwkddAa1v0f9jejo1rGMlfcb+5
	 GFLa1cxVbbz8P5AWHQuYoY6Fqr5uJXRSAq0VFjDPyoqo8b7p/qV4UFRfjt8wQPyxLT
	 6CGUt8JBkqCvm6xKjcGnZ1T9nl3Q9JN2DK8/GZUsYgXuX0hDXPMPtwZmjflrhu5x6z
	 mm7tnsktKPOCQ==
Date: Mon, 5 Jan 2026 08:52:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: add has-fn-map
 prop
Message-ID: <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
 <20251231143538.37483-2-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231143538.37483-2-fabiobaltieri@chromium.org>

On Wed, Dec 31, 2025 at 02:35:37PM +0000, Fabio Baltieri wrote:
> Add binding documentation for the has-fn-map property.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index fefaaf46a240..fa24b1cbc788 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -44,6 +44,14 @@ properties:
>        where the lower 16 bits are reserved. This property is specified only
>        when the keyboard has a custom design for the top row keys.
>  
> +  google,has-fn-map:
> +    description: |
> +      The keymap has function key layer. This allows defining an extra set of
> +      codes that are sent if a key is pressed while the KEY_FN is held pressed
> +      as well. The function codes have to be defined in the linux,keymap
> +      property with an offset of keypad,num-rows from the normal ones.
> +    type: boolean

You still did not answer to my previous question, why this is not
deducible from the key map (presence of KEY_FN in the map).

Best regards,
Krzysztof


