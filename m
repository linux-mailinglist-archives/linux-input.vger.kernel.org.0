Return-Path: <linux-input+bounces-8046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDEE9C6C3B
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 11:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0840CB2B3DB
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 09:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFFF1F8917;
	Wed, 13 Nov 2024 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkZC/IAf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35681F77A9;
	Wed, 13 Nov 2024 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491842; cv=none; b=l0vYLby5NspGvTXkHOX0M9LdtlGMvWzB9p2lDlTevENCBUS4PRTlhR7osfExTzOBwJG7iqHLhcRD79v6MzTEp8lOpgqe2QSBoHYiGptXEVMnulV22JuSZHUKiRdO0RlQZxsBZJdCLFr5Xn3Jo0LM+NCuYzBnPf2XZv2bMcutb4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491842; c=relaxed/simple;
	bh=+lb4EswthuHZhq9iPat5KkW6f8dgsekT3CokYDW6u2s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cILqNGUdW8i9iLFFXaO2sCnhZwd7844HuFRSXqf5Nfd6U425uK3q3AMVgWr7LLUSTl68IDwYn99T64I8cf0/FgbXZO1Yx4X++6tha44fVcH6UtqK57Ct7J2PDDZZwaKc+vNkBmiS++0VWEA0QCHQCseJQiw7PbjAR3C3eqMy9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkZC/IAf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1858EC4CED2;
	Wed, 13 Nov 2024 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731491840;
	bh=+lb4EswthuHZhq9iPat5KkW6f8dgsekT3CokYDW6u2s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qkZC/IAfB2besI01xurtIx8LGvWGXxntKzqryWKXcpskWNO4iSPEGKWHMzmQy6XWu
	 f9mrKF9RzlkYaxyhuNzRF0tGL+ICWaH0W3k+rA+Wx2btITnjFcYdmKurhKT21yHlfH
	 UulqW1HZpAKJHG+Q0BJ2rf/VrG1kzTFh+qvtC8L7aj+gUVREMiYdkepV9N0qPbzHoc
	 qTgmK27eXyyI23POry74YR+3v/gAT2EfC7ERh/MmIMgxAedzvua8Z53sy4lQbFUu9s
	 pKquAJ2cqXD+f7wZlEb0pJjruY5hUbKv6MJTdzGx6Ip1tPVXdF3Xpfqa1uSCmad6hj
	 LQU8TkOpl6OjQ==
Date: Wed, 13 Nov 2024 10:57:18 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
cc: robh@kernel.org, krzk@kernel.org, hbarnor@chromium.org, 
    dianders@chromium.org, conor.dooley@microchip.com, 
    dmitry.torokhov@gmail.com, bentiss@kernel.org, linux-input@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen
In-Reply-To: <20241111075000.111509-1-charles.goodix@gmail.com>
Message-ID: <nycvar.YFH.7.76.2411131057010.20286@cbobk.fhfr.pm>
References: <20241111075000.111509-1-charles.goodix@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Nov 2024, Charles Wang wrote:

> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
> 
> The patchset introduces the following two changes:
> 1) Add goodix,gt7986u-spifw.yaml.
> 2) Modify the driver to align with the device binding file.
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
> Changes in v4:
> - Fix dt build warnings.
> - Modify the driver to align with the device binding file.
> 
> Changes in v3:
> - Split the commit into two patches.
> 
> Changes in v2:
> - Change compatible to 'goodix,gt7986u-spifw'.
> - Remove 'goodix,hid-report-addr' property.
> - Change additionalProperties to unevaluatedProperties.
> - v1: https://lore.kernel.org/all/20241025114642.40793-2-charles.goodix@gmail.com/

Now queued in hid.git#for-6.13/goodix. Thanks,

-- 
Jiri Kosina
SUSE Labs


