Return-Path: <linux-input+bounces-4608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B910591615E
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 10:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAA171C22200
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 08:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F716149C4B;
	Tue, 25 Jun 2024 08:33:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79517149C41
	for <linux-input@vger.kernel.org>; Tue, 25 Jun 2024 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304383; cv=none; b=lbTro9nMoGY5h0n9aJMVN0h9XkIRhd0FMQ1msz467ybskl/5GVb1MUEa7ZyBG0qsGzx+53FvUL2YZ85mvciCEQJaazW/CUzlC8zDuesGPFKRc1SynWfxVz69FVtVRQv+TpwAN9nqnfYZCEZkNjsi9Mn/iJu/gmKQmO3dG6UMaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304383; c=relaxed/simple;
	bh=BAC4cTMVD1u8CmBSnANIr+EbJBSCJ8Py+C49dJT7/kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOS22syBa52G+dTFuHW6Q4qxgGricxlX71UOWBwhYXSiHFgoUl4H1aACWzs2jZo4bgtTjodFkI04+QxZdZIelhi1uhDrz0y2OGbdt9Frg2P2b4PWhU94Zx8PhGxIDOLeBErt1RkDypc2AP6UdKlDHKWxet0/uJhoBZwdwnQQkLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sM1bf-0002Bf-70; Tue, 25 Jun 2024 10:32:51 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sM1be-004qca-KI; Tue, 25 Jun 2024 10:32:50 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sM1be-00E3rT-1l;
	Tue, 25 Jun 2024 10:32:50 +0200
Date: Tue, 25 Jun 2024 10:32:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Lalaev <andrei.lalaev@anton-paar.com>
Subject: Re: [PATCH] Input: qt1050 - handle CHIP_ID reading error
Message-ID: <20240625083250.jcgfszu6plkopouu@pengutronix.de>
References: <20240617183018.916234-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617183018.916234-1-andrey.lalaev@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On 24-06-17, Andrei Lalaev wrote:
> From: Andrei Lalaev <andrei.lalaev@anton-paar.com>
> 
> If the device is missing, we get the following error:
> 
>   qt1050 3-0041: ID -1340767592 not supported
> 
> Let's handle this situation and print more informative error
> when reading of CHIP_ID fails:
> 
>   qt1050 3-0041: Failed to read chip ID: -6
> 
> Fixes: cbebf5addec1 ("Input: qt1050 - add Microchip AT42QT1050 support")
> Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

