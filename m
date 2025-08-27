Return-Path: <linux-input+bounces-14356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 751F0B38B4F
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 23:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35EDC7A8135
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 21:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1E930C62A;
	Wed, 27 Aug 2025 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6inQvkI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B63093A8;
	Wed, 27 Aug 2025 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756329872; cv=none; b=lGRBCpginunw8ZUL64gVDRz2oyxoSkMzrUgWlnO4xSctvOfk22OlXb0FZzToDaXCeJQhK4dB1TK5z39pOsw4af7MSdkL+AEi1x3BcqDA4rvmYRZho4aVhyWB+5X3b+Z7vXst0C6rz0UYIoQ9p+JMWWuOaH7+7aC3S7cCeK8doc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756329872; c=relaxed/simple;
	bh=UJFJMU1UD+WG1g/ePunik75j/tAVkx3D42evy8MfEYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swIxIvBXmz848nPJhWOY0iyWJFqLlSkQBxtHUHsNYg3t0SXpBCtVGS54V0ecvXoRkMuWvQpuDqlYdcvairE242WfwFQKgfnj9/3be7/RPg7oErIvIv4F1X36+fIU9zOUzVybk0vLq67w74vCL1hJ6jmPWiewGRItULoYPUAHuD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6inQvkI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F169EC4CEEB;
	Wed, 27 Aug 2025 21:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756329871;
	bh=UJFJMU1UD+WG1g/ePunik75j/tAVkx3D42evy8MfEYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6inQvkIkBZaN0kYG3XCFdf+K6mO1S/KZc/QcWnv7rgEnYIz8zGMINylM7CxXRnnH
	 /JX5neMsDcoVqWKD7eAdOUzVtDvcjoVhGrpO7eTD4qMu3O/eXxAmb4g57U4MfV9qf/
	 0bmGq+cEPraMNTDAIU8QdNlMAEFdsRNyIsd/HRxqmK+R7cx+cwdlrl3a6TrO3o0ZFU
	 l2fqGfIJAcFbAC4vp+PsTgsMAE2X2ui95IegkW2pIMfgr4EeVBMTh2zm3Rf62oz8JJ
	 6e2yjQ9NAtdtAbbfePRb02nHxdjv2BSDUH150fql/Sl5SfKUp8y8FfGfmbSHJ8PA9D
	 fus0MRTc18Eag==
Date: Wed, 27 Aug 2025 14:24:29 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <aK93jXST02r3C3iC@bombadil.infradead.org>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>

On Thu, Aug 21, 2025 at 07:26:36PM +0200, Marco Felsch wrote:
> Add FW_UPLOAD_ERR_DUPLICATE to allow drivers to inform the firmware_loader
> framework that the update is not required. This can be the case if the
> user provided firmware matches the current running firmware.
> 
> Sync lib/test_firmware.c accordingly.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

 Luis

