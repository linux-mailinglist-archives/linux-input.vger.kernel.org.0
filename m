Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B96A518110C
	for <lists+linux-input@lfdr.de>; Wed, 11 Mar 2020 07:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgCKGrX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Mar 2020 02:47:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgCKGrX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Mar 2020 02:47:23 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C0EB208C4;
        Wed, 11 Mar 2020 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583909242;
        bh=1L8TjFfihGshIzkEM6CmdHV+pCg3Tp027/L3pLR/vKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HIR+j2I59UjllRewn3aytb2ic1xfJtvItX4kmzINrBJIL2HNaYJDTmk0Z5uB9UzjN
         oBAv7imfGiXpSL9J5eU5kKppn7nAQiQX5yY5f4LUqmlqJ6/ETsMV3zlkaNW5Yd1+h7
         CShax6KlT/MvlDfdfe1WoDl8087oLXsHv5kNjFIk=
Date:   Wed, 11 Mar 2020 14:47:12 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Cc:     linux-kernel@vger.kernel.org,
        Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Robin Gong <yibin.gong@nxp.com>, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: imx8mm: add snvs clock to pwrkey
Message-ID: <20200311064711.GG29269@dragon>
References: <20200225161201.1975-1-git@andred.net>
 <20200225161201.1975-3-git@andred.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200225161201.1975-3-git@andred.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 25, 2020 at 04:11:58PM +0000, André Draszik wrote:
> On i.MX8MM, the SNVS requires a clock. This is similar to the clock
> bound to the SNVS RTC node, but if the SNVS RTC driver isn't enabled,
> then SNVS doesn't work, and as such the pwrkey driver doesn't
> work (i.e. hangs the kernel, as the clock isn't enabled).
> 
> Also see commit ec2a844ef7c1
> ("ARM: dts: imx7s: add snvs rtc clock")
> for a similar fix.
> 
> Signed-off-by: André Draszik <git@andred.net>

Applied, thanks.
