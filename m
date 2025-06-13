Return-Path: <linux-input+bounces-12877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74136AD85DF
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 10:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3860117C5B5
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 08:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D632727F0;
	Fri, 13 Jun 2025 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jrnGy9zx"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED2726B75E;
	Fri, 13 Jun 2025 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804289; cv=none; b=WYcwWNDK5oWrKpIXeFzrt9owNgaqqotj2kqGAH+RxzO4sUX/L+F+YlTj9UD276Esnbrtpih4CXyRhtkQUKkba8BpFClzBxSzXCjbVLCgKIvYMpFNPactHud+tvQHD+OAe0eI5Tfz5QafF6UmZWmfy6d9eFwHQGz3xUjJB7loizg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804289; c=relaxed/simple;
	bh=O0oMevI0+fsqaiQmYRliBlOITZY6NqjayKVJfj1TUJc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Qegj8vsRqjOsSMLIKF86Ru7/VCo5yzhhxQSb6ZgUVjmh1k4J3WHq7jGEq1irf6LQrn4xEfFiVj5FF/n97Z/drencLS8nFzok15Q9G7OVnVU38P7/5whXRDH2KJx4MgLfDdEvijEn3zWaKD+p1ATeVXZdeolePJYTJJT8bkGeRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jrnGy9zx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4C33625D88;
	Fri, 13 Jun 2025 10:44:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJ3FmyzkRE4g; Fri, 13 Jun 2025 10:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749804283; bh=O0oMevI0+fsqaiQmYRliBlOITZY6NqjayKVJfj1TUJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jrnGy9zxM+TxKbgEnY76Sd3r8sA47VyKEqG4QEFmALpH9bqn1UfkS7HXqV5pEyNw/
	 3npTjLBmTNLaXcURkkv+wi5g7JQ7IzxeIBd5CdgmsnwUvPXrzAAC6kU/XTQ1ho3S8s
	 Az9lel6UrrN3s+OFsT2X0MkAeaAnrx4yyMLSeamnKEIaHLhQUSQsnLQHdXfzP6ZWDq
	 /PyWIPYfcHAlrPU7XZ1gWCgCv2OfKZzxk7XD1bcifdIm/mvIKQjNrtFbB1yKvV+IAv
	 nfnXq+HrtTMeCUPYYc/n6A2pMY4WMYqxB4YlFPq0QBfP2SdeqYRpfRu8c8mQPVQLVY
	 TZ3OeLxeQBaLA==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Jun 2025 08:44:43 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Henrik
 Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/5] Support for MELFAS MIP4 touchkey devices
In-Reply-To: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
Message-ID: <e6b71b3d3cacc2f112e62c57fd0c3c65@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-06-12 19:41, Kaustabh Chakraborty wrote:
> MIP4 is a protocol developed and used by MELFAS in its touchscreen and
> touchkey devices. The MIP4 touchscreen driver acknowledges the
> touchscreen capabilities, but touchkeys are left unimplemented.
> 
> Apart from touchscreen + touchkey devices, the protocol is also used by
> devices which are, functionally, touchkey devices. Thus, the driver
> should also be compatible with those devices. This series aims to
> introduce such required changes.
> 
> RFC: How should the compatible string be handled? The string defined in
> dtschema is 'melfas,mip4_ts', which implies that it's a MIP4 *touchscreen*
> by MELFAS.

I see that there are 2 dts(i) files which use the compatible
"melfas,mip4_ts", as discovered from a simple grep in arch/. They are:
- arm64/qcom/msm8916-lg-m216.dts
- arm64/mediatek/mt8173-elm-hana.dtsi

Is it possible to change all references of the compatible to something more
generic, such as "melfas,mip4"?

