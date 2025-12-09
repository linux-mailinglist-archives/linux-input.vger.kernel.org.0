Return-Path: <linux-input+bounces-16514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7CCB0EBE
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 20:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2AF0300AC52
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 19:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1853301489;
	Tue,  9 Dec 2025 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD6MZW0O"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EAA2E7653;
	Tue,  9 Dec 2025 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765308166; cv=none; b=QmFE3iqXPQ0+zeKaasf6lYLjJKY8yduH0v4RZADPhq2Y+wVgUhDZfZ7SbScsr6j2QvUum78Zo49f/uWB1fCcBkH0lvA+TAjAHlRCkhF9ni9y+oHFpUCaFuzbevjFXnn3SMWSW68flw3ADLTUZRZ32CfFG1qUpP1Rlzu6VFDhNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765308166; c=relaxed/simple;
	bh=t0qChSJDwjezcJhrXDIB3CjUcjU6qcijviG/mtKduvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBK4tuVUnz/CANpPK6bCvRA2aLd9XswbEHpAfdQhJJ8DLsUi1GqTr487Qjta1PyN3+rLaLmCuaETmDQTonRqmTFa6wY9BBihaBgVBj2cCx/GwHL3/S+gCMfRlCUadnM7zJS0Yu8DyS8YJ2RFA8hMxAeUEpo02LaQ9l9acy4cMP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD6MZW0O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A322C4CEF5;
	Tue,  9 Dec 2025 19:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765308166;
	bh=t0qChSJDwjezcJhrXDIB3CjUcjU6qcijviG/mtKduvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bD6MZW0OXUT3Vjoy1Lg29c6GyuAIEIwYMrk60LFPcHBKBHhMVK2juGfNLB7+PMyqU
	 kU+r+7cTzPXUjWUZevPASZkKzigR+lZmTSXVw9/3B+UkQcfa8Ips3aOQZo6Z65qUSM
	 lbEm9P5yb3Xw/mclvtWmM1icsJ++N3hJ7x4yZrkku9XL1IHSnNoiwTpMzBBCkSo6EI
	 A7XQr08v4hTHQBCIMFmR4YK01Ykjcb1Eg7d96g1DNyjo8otaCMxAyjDZeYuuobajMl
	 CFOhTO1DKtMaRn+DGkBTGvRe8wiJu3QWeHwLGRFpRUbrt+uG5c58Y/M6PGpqs5BDOa
	 K0KvLFVEvOqdQ==
Date: Tue, 9 Dec 2025 13:22:43 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.orga
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <20251209192243.GA963693-robh@kernel.org>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209154706.529784-4-fabiobaltieri@chromium.org>

On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> Add binding documentation for the fn-key and fn-keymap properties,
> verify that the two new properties are either both preseent or none.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  .../bindings/input/google,cros-ec-keyb.yaml   | 60 +++++++++++++++----
>  1 file changed, 49 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index fefaaf46a240..56adf9026010 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -44,6 +44,20 @@ properties:
>        where the lower 16 bits are reserved. This property is specified only
>        when the keyboard has a custom design for the top row keys.
>  
> +  fn-key:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> +      col, code) macro, code is ignored.
> +
> +  fn-keymap:

If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
Depends if we still think linux,keymap is Linux specific?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 32
> +    description: |
> +      An array of u32 mapping the row, column and codes for the function keys,
> +      use the MATRIX_KEY macro to define the elements.
> +
>  dependencies:
>    function-row-physmap: [ 'linux,keymap' ]
>    google,needs-ghost-filter: [ 'linux,keymap' ]
> @@ -51,17 +65,28 @@ dependencies:
>  required:
>    - compatible
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: google,cros-ec-keyb
> -then:
> -  $ref: /schemas/input/matrix-keymap.yaml#
> -  required:
> -    - keypad,num-rows
> -    - keypad,num-columns
> -    - linux,keymap
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,cros-ec-keyb
> +    then:
> +      $ref: /schemas/input/matrix-keymap.yaml#
> +      required:
> +        - keypad,num-rows
> +        - keypad,num-columns
> +        - linux,keymap
> +  - if:
> +      anyOf:
> +        - required:
> +          - fn-key
> +        - required:
> +          - fn-keymap
> +    then:
> +      required:
> +        - fn-key
> +        - fn-keymap

This can be more concisely written as:

dependencies:
  fn-key: [fn-keymap]
  fn-keymap: [fn-key]

