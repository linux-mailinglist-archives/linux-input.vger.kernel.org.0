Return-Path: <linux-input+bounces-16700-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BECDFC12
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 13:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BA173069302
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 12:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9860B3195FB;
	Sat, 27 Dec 2025 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgqQehUa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694233195E6;
	Sat, 27 Dec 2025 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766839469; cv=none; b=goaYEwwfLhR5FLHoIdvn8H5FCO4iMR2aU5IpK+Xcoirxn4xhWgFZH2OVYDrwPbnjxhlii2qQCxaPqKRo4vauiYUWqch0qHIEQsyviW9kfdyXGX60JQU2V0KmV1GuDtFKrOaLLayxSUoz+iXhbRMxhvX74ufTbAEMwj9ho7EyDXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766839469; c=relaxed/simple;
	bh=vEShTIzKhF+RRKNLUEVfNVwv1QxJc8R+0hDHtBehu6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVpbs1t4zcNQERa2rN+sP6//NqyngmcoTIoZuXEZRfK/E4/BIrK570DvcdZoGuo8i67R2VhXGX8gk6OkGrGzXl+MHODjG3/1KbDYcOaPVPS6gZWIS/Lm2h+5sTcBjCfpnJtvDBb9PShJuSc5pO/SLJ3vJGjtq+HIS5VZsAvJRQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgqQehUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70955C4CEF1;
	Sat, 27 Dec 2025 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766839469;
	bh=vEShTIzKhF+RRKNLUEVfNVwv1QxJc8R+0hDHtBehu6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgqQehUavkPJvU55Pktmj+FuJgHjevsdIjpUm0JkuxTvYrGLk4mIUOu/fsG9URuY+
	 1xLwzvQ2s4Nd3+NneU3I2vqVbGhiinaLWcf6Zk5vghKNTKLjP0NFqc+fi0qdPX2kGF
	 Lt+IvO8wxEHHquqI3B/z0pTJiJXnuYZN8xahwSq1l8lwP2tMiqPM8sFtH3zLQR8NT6
	 6NQ6JbkGjVC5I8xF+I6kt88HXp7UXo0WaAsD8fpiQehwab3PIEbUxTU6Zoa9JLe3C4
	 SdcYFNQRwMc56Q8lIj/eMHlexZXplH74VCi46vKHNCkA1MwaD5sDzSHufTyMmK507K
	 gPYHTBs6sHw9w==
Date: Sat, 27 Dec 2025 13:44:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: google,cros-ec-keyb: add
 use-fn-overlay prop
Message-ID: <20251227-laughing-white-dalmatian-f9d98a@quoll>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224152238.485415-3-fabiobaltieri@chromium.org>

On Wed, Dec 24, 2025 at 03:22:38PM +0000, Fabio Baltieri wrote:
> Add binding documentation for the use-fn-overlay property.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  .../bindings/input/google,cros-ec-keyb.yaml   | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index fefaaf46a240..437575cdf352 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -44,6 +44,14 @@ properties:
>        where the lower 16 bits are reserved. This property is specified only
>        when the keyboard has a custom design for the top row keys.
>  
> +  google,use-fn-overlay:
> +    description: |
> +      Use a function key overlay. This allows defining an extra set of codes

What is a function key overlay? Overlays are DT term and therefore are
not suitable for bindings.

> +      that are sent if a key is pressed while the KEY_FN is held pressed as
> +      well. The function codes have to be defined in the linux,keymap property
> +      with an offset of keypad,num-rows from the normal ones.
> +    type: boolean
> +
>  dependencies:
>    function-row-physmap: [ 'linux,keymap' ]
>    google,needs-ghost-filter: [ 'linux,keymap' ]
> @@ -132,6 +140,23 @@ examples:
>              /* UP      LEFT    */
>              0x070b0067 0x070c0069>;
>      };
> +  - |
> +    /* With function keys */
> +    #include <dt-bindings/input/input.h>
> +    keyboard-controller {
> +        compatible = "google,cros-ec-keyb";
> +        keypad,num-rows = <8>;
> +        keypad,num-columns = <18>;
> +        google,use-fn-overlay;

Difference in one property does not justify new example.

Best regards,
Krzysztof


