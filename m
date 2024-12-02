Return-Path: <linux-input+bounces-8331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEEE9DFDDD
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 10:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59441161C9D
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 09:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33D31FBCA2;
	Mon,  2 Dec 2024 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aPElvuOX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F621F949;
	Mon,  2 Dec 2024 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133384; cv=none; b=huZN4AyYAqdgg0FrHDiT1dHfUzkGawvJ39bxt0vn9SQsqGHeTdsMMtr03tZ85VIk9ahAooJ9OlfVj8EM4UHNyRWWhOVIqe+HuvdBLNAoZRFU6K3bPZpR6HiUFYLESDStvGc5nuobVobEL+yQHIJaLbFIMg9FfEIp30mPRrJHdLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133384; c=relaxed/simple;
	bh=R2oHX3LG/XfyQeXfbxicFLjLRuAlEPL+0zd2eh0Mb54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKTOu4y4lQy5XjzDJBssnVn9S/C8fnaACVAx8f99Yd4I/p5bIte9bfvxHQ+J4Iau5QRlSsTpdPO5Rt7rFTIEH03i8rMw3D5wN+r2AjQ/dbZS1Fzz/ZM+bB+NPo+arAhoEH0Ez2oLoD9B7bdDay43IiqSr7rvVLLRMDNiHgGV8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aPElvuOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B38CC4CED2;
	Mon,  2 Dec 2024 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733133384;
	bh=R2oHX3LG/XfyQeXfbxicFLjLRuAlEPL+0zd2eh0Mb54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPElvuOXwuvSOKHlm8BE4yNRE/c3yrJNVX56IM9RawDl6n7mDY39gCaTFcPDY/mIm
	 tnGLomD7DJgLJjHy+XJQegaIaxSJ5HK+p6COKlEmTFqviyKevPQLsy6DMAnjRl2oS6
	 09L/NV/yysJuFduE6sn0QPgcpjeX0IkZ8/gK8yrw=
Date: Mon, 2 Dec 2024 10:56:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 5/5] Input: Add TouchNetix aXiom I2C Touchscreen support
Message-ID: <2024120248-barbed-dwarf-fa73@gregkh>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-5-6124925b9718@pengutronix.de>
 <20241202094434.b7ozyfazbfgjv5ks@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202094434.b7ozyfazbfgjv5ks@pengutronix.de>

On Mon, Dec 02, 2024 at 10:44:34AM +0100, Marco Felsch wrote:
> Hi,
> 
> gentle ping after the rc1 tag was released :)


Where is the Documentation/ABI/ entries for your custom sysfs files this
driver is creating?  That's required, right?

thanks,

greg k-h

