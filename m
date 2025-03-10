Return-Path: <linux-input+bounces-10681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B38A5901C
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F381E18907E6
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 09:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8EA224B01;
	Mon, 10 Mar 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MH2L4TQT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F601624C3;
	Mon, 10 Mar 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741599932; cv=none; b=ZfJpJRpwgnhIv/pYHjKX3rdvI3TTqfyaX0VallWcxngrHIGu5/Jkm2l6FktcH9vMjOTO15INcrMeQ1WwaB3cHZmXs6yIZROByJdNXtNkdquIV+fNt2cnp62q7xrx8o4T80XRvjY8J68RS1WcBZt6fxCdjuxZ6LMAixPUn2W+AUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741599932; c=relaxed/simple;
	bh=RuNQEcmiwzRvpjUFcODBA0Mm17cQbne/86O864Wdscg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzGcynNmhQRfG10yS/wbeYFyjXWWbkVczHP1H/kqNEfJKqxhRVklMWWOKei0kHt37g4OmLovE2Y4+bjTXccVmVqX2JYYlw6jZExCBv4fWhKabb5Vhyux6QVLA4vmwDBFxpLyCsTdH91lNPHrX6vEgmFRfdh3d0HaAHY9jo9OvlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MH2L4TQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06967C4CEE5;
	Mon, 10 Mar 2025 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741599932;
	bh=RuNQEcmiwzRvpjUFcODBA0Mm17cQbne/86O864Wdscg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH2L4TQTnjAZhVYzcFauyhGYNSN/gunC4BZUJuVp8XqhoovlE518Yr0wDnJGZQ2n9
	 TvPI+BF77xLsuZP6avPO/cwo+7bkp17gvSZT/c2X6I6Z0YlZr+z60wkJTYBX5136wt
	 gdnlLfen430m2t4nA3cR1SIuOu0FhQXPCc7sfEFxCatPa1L4YSQyuD9jJnmmrNyM2R
	 Gu7iLP36pfBOfuw5eLT6hst5NwJZQ+LTLJj9kKZYb27GLBEB6Qx0MhyRBKu+xjOnfZ
	 gzByfQOT/ja+pHNS5j05nbxoYHlYBB5VxT5nUNsDwRwQ9zG7dx+kJc8pqdHqeIu5jU
	 Et4/4pVNegMPg==
Date: Mon, 10 Mar 2025 10:45:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: input: syna,rmi4: document
 syna,pdt-fallback-desc
Message-ID: <20250310-hissing-vagabond-pegasus-cc8aed@krzk-bin>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
 <20250308-synaptics-rmi4-v3-1-215d3e7289a2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-synaptics-rmi4-v3-1-215d3e7289a2@ixit.cz>

On Sat, Mar 08, 2025 at 03:08:37PM +0100, David Heidelberg wrote:
> From: Caleb Connolly <caleb.connolly@linaro.org>
> 
> This new property allows devices to specify some register values which
> are missing on units with third party replacement displays. These
> displays use unofficial touch ICs which only implement a subset of the
> RMI4 specification.

These are different ICs, so they have their own compatibles. Why this
cannot be deduced from the compatible?

> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/syna,rmi4.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> index b522c8d3ce0db719ff379f2fefbdca79e73d027c..a80ec0c052cb1b7278f0832dd18ebd3256bc0874 100644
> --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> @@ -49,6 +49,24 @@ properties:
>      description:
>        Delay to wait after powering on the device.
>  
> +  syna,pdt-fallback-desc:
> +    $ref: /schemas/types.yaml#/definitions/uint8-matrix
> +    description:
> +      This property provides fallback values for certain register fields that
> +      are missing on devices using third-party replacement displays.
> +      These unofficial displays contain touch controllers that claim RMI4
> +      compliance but fail to populate the function_number and function_version
> +      registers of their Page Descriptor Table (PDT) entries.
> +
> +      Since the number of required fallback entries depends on the number of
> +      Page Descriptor Tables supported by a given device, this property
> +      should be provided on a best-effort basis.
> +
> +    items:

min/maxItems here

> +      items:
> +        - description: The 5th byte of the PDT entry (function number)
> +        - description: The 4th byte of the PDT entry (version value)

Best regards,
Krzysztof


