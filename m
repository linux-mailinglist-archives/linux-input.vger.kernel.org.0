Return-Path: <linux-input+bounces-16513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0ABCB0BBA
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 18:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907B330B5678
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 17:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4184032ED4B;
	Tue,  9 Dec 2025 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1Dq13mg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BE832ED34;
	Tue,  9 Dec 2025 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765301049; cv=none; b=EX4dNOVBTksoKOp7gYbZMa8a2CnUXauI+kjedk+EcTjgb6xTNNUDHHUivTJjqQo8DlNqEqsley84IOz9ivX1DFJ9Vk7wtAWJl5I5RF8J793g65LdhafnNC6U69xSSF+Mzx6CVkzxjN56DTF45nVNpo93+/ogdTrh0Gynozb58O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765301049; c=relaxed/simple;
	bh=jeWfM1ta4ijL9dpaYyIrgDKDAAU/iGUmT4B/25is+n0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=McMQqiaZxKX2HkaRBOG/ZVoGEYM1BbebqrIfXJKDaLn6H7hjQcpXmajkQpTxciFgCyfcL+gZ3pW8gMYx5VUshUuRg7/9wF2J37w61AUrCCT/zT+k1gY83ATI5jUs5vvaQYf2S9MoLf7uuoy0lWd+FVNf/pOAj9zhFenaqyZlcbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1Dq13mg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4308FC4CEF5;
	Tue,  9 Dec 2025 17:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765301047;
	bh=jeWfM1ta4ijL9dpaYyIrgDKDAAU/iGUmT4B/25is+n0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l1Dq13mgAXX52FnFCDDcUdXXRV5Z1N/Z7iw/d4hkA+6Utzv/SrAZapcF4PZEQLyTh
	 f2qT2wNA3EXH1UDyxBpRD/aklM1s1NxZ+ZUhYtQvn8/zlW1S+Vm/M7FVQaNNGAB/s1
	 Od1b1dZQQjiNZkt2U8TYUTTNHUchx7+hJqVpvnZdEYFm9NwbxOGaPWdEibH5Ui7lZ7
	 qZfOCwGGViDxrWG4P/iYqIDp5PyD8PoDJicuBl6yRiykTRiQt64M/QkM7qQ3qDAf+1
	 Pz/7XVWjPg2/3Iw3Wowm/fj14W4HGadnn3vKb5Zqi+Qygn5qsPyYIdL62cYu5gHhVT
	 VA/HI4aLQP2PA==
Date: Tue, 09 Dec 2025 11:24:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simon Glass <sjg@chromium.org>, 
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Guenter Roeck <groeck@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.orga
To: Fabio Baltieri <fabiobaltieri@chromium.org>
In-Reply-To: <20251209154706.529784-4-fabiobaltieri@chromium.org>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
Message-Id: <176530104512.701024.1104589612757918275.robh@kernel.org>
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key
 and f-keymap props


On Tue, 09 Dec 2025 15:47:06 +0000, Fabio Baltieri wrote:
> Add binding documentation for the fn-key and fn-keymap properties,
> verify that the two new properties are either both preseent or none.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  .../bindings/input/google,cros-ec-keyb.yaml   | 60 +++++++++++++++----
>  1 file changed, 49 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml:83:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml:85:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/input/google,cros-ec-keyb.example.dts:83.9-89 Properties must precede subnodes
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/input/google,cros-ec-keyb.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251209154706.529784-4-fabiobaltieri@chromium.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


