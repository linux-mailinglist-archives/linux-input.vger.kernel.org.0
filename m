Return-Path: <linux-input+bounces-10353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF3A44777
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 18:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B1BF1886F78
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 17:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F68191F6F;
	Tue, 25 Feb 2025 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="s8m+99E4"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384D192590;
	Tue, 25 Feb 2025 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503349; cv=none; b=ALCVVScpLhC7xHhPkB6GuFtex6LHsKimB8zRtSzR9Fjj5LeulPvfJP7oNQWPpbgHVytxqTBzH5hBEVzysfsZo/02uXwhQ7RJ7jkBM3fF3e3YBLVsrCe5cCjPUH53N9K6JG1GronFl0Mm6/I5H5ELm6CRQPEAyeY4D2pVtZ21M/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503349; c=relaxed/simple;
	bh=qTaFiNahYfqBOZoxABura0o5a6snDlv+gJJyasmTF7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/YPVumurItRsYFLYX+kB2M8kTyAwPDQ1eDADVEWflNAhw0+WkbFdEB1mnxJxlTRk48O6qrru+0O/CWHzMYuIt/OUBY7nfKa4O8dpODlDxxyUXF0rZoG2BdFdS48vpI280yAbJS67miSY2WzPgX6RqkrcJdaeWmUVvVLYPUN+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=s8m+99E4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1740503338;
	bh=qTaFiNahYfqBOZoxABura0o5a6snDlv+gJJyasmTF7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8m+99E4GBR+qHtwppeyXyLVapH59YkdlLIy/C9VNK1Icw/2yHrVurAQBysFLhgVN
	 rwft0EqsFM//A1Hnrx33M3r/mlY7gVUWlDPRJr1kkDp3PYaWDlYfnVLwbnwCPoj2HP
	 CJlz5uOyplbdGqdf36ExCFFadYL92E2SRThBV59A=
Date: Tue, 25 Feb 2025 07:38:28 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bastien Nocera <hadess@hadess.net>, 
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix-berlin - constify 'struct bin_attribute'
Message-ID: <2cedc1f5-3a6e-46cc-a214-497f899fd115@t-8ch.de>
References: <20241222-sysfs-const-bin_attr-input-v1-1-1229dbe5ae71@weissschuh.net>
 <Z71j73PPLO5AwkxA@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z71j73PPLO5AwkxA@google.com>

Hi Dmitry,

On 2025-02-24 22:32:15-0800, Dmitry Torokhov wrote:
> On Sun, Dec 22, 2024 at 09:00:43PM +0100, Thomas Weißschuh wrote:
> > The sysfs core now allows instances of 'struct bin_attribute' to be
> > moved into read-only memory. Make use of that to protect them against
> > accidental or malicious modifications.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Applied, thank you.

Thanks.

However Greg already took this through the driver core tree, as it was
blocking the general progress.
Could you drop it again?


Thomas

