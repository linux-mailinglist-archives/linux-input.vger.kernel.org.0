Return-Path: <linux-input+bounces-12726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9274ACF981
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 00:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D8603AB8A1
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 22:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0F627E7CF;
	Thu,  5 Jun 2025 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Obq4ZLVs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D501FC7D2;
	Thu,  5 Jun 2025 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749161231; cv=none; b=HTthgUkDGkKaOUJd9u4qyhmce10P6481ZpdIpsB0CfrCPLx1jTPqkC6KbBKwIPbhfDM15Njuth8zNCdfjS0i+2gDKU3/bpd+1J5xQTUvA8lG/s/N6h5f67RWo05L32txf1Y6jNuWGsKgjiQr9FLkrMBxHdsQPDsH7kcQkjtxAwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749161231; c=relaxed/simple;
	bh=8h3nEjxWto6afsinlYcxucDFWWoTVght7M3fLmSvZWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQUg+awyINxlpExUomrfQtg7IsVJvhGr2Jq+cHwpRdtiaOSh4EEPoBNgpR/R/A6bVZlyki8NvFN40D17y0KoQEOehDNb/hUiK8oti0I+CKE4Yb2u22bXLDsoWeZzauYJftZROtMcUOabqxNx9cOxpwC89ocYe0Ipw1T5KOB1L/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Obq4ZLVs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5CCC4CEE7;
	Thu,  5 Jun 2025 22:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749161231;
	bh=8h3nEjxWto6afsinlYcxucDFWWoTVght7M3fLmSvZWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Obq4ZLVsSdK79AHA+tmmCWPQHJ6X4ekguZyiGWmvdIedth8MKGYyKIAYAfXSj008R
	 4hfa7cl3UK3DiM9SLsoJAmO5ag9+yoafn3NbO8VTv4sHWwylHWZFxRDETzmxeDVyut
	 nzfe5E8vhpwz/t/RLkmbA7CHSgJkoHH67dKdP1W8CT73/lbur9GJnvLjUBSR+igIjL
	 hg+f/C4qsJRm2R27Y1OW7qUbVUPybr5yZHQmFsMWja3uG9TcFYClKSj9kRJ3QGE24B
	 HtppdCz1UpKZgNeH73NpgmZTACQ5r+WslJPwxk5aHFnmS2Vsi+2kBLHXERFHsHYSj+
	 dxS+54T/NgEnQ==
Date: Thu, 5 Jun 2025 17:07:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt
 to yaml format
Message-ID: <174916122654.3336186.7288797577884154304.robh@kernel.org>
References: <20250529193241.793678-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529193241.793678-1-Frank.Li@nxp.com>


On Thu, 29 May 2025 15:32:35 -0400, Frank Li wrote:
> Convert tsc2007.txt to yaml format.
> 
> Additional changes:
> - add pendown-gpio property to match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../input/touchscreen/ti.tsc2007.yaml         | 75 +++++++++++++++++++
>  .../bindings/input/touchscreen/tsc2007.txt    | 39 ----------
>  2 files changed, 75 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


