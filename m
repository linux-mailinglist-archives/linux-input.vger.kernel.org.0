Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2AD22B3E9F
	for <lists+linux-input@lfdr.de>; Mon, 16 Nov 2020 09:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKPI1w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 03:27:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:55204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbgKPI1w (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 03:27:52 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B6032071E;
        Mon, 16 Nov 2020 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605515272;
        bh=8mce2BagjP4rTxmFCfk10rUSrWCgd6QVmCRChIcQj1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t6gpoNisjIds8tnrPVeEaRTAe1QzXlCJJvTsBHdRhBHGueCsQE1k02iv1el6uhF5l
         wZqUV9/FxG+hux7CBq7Wgyfofk3sxT8NunelNJfj/CENWErNbPwGOl84EIxQdIQvhl
         00eG24ZlwezNZOBVW2YtAuCIXusdycbJgUujFe5s=
Date:   Mon, 16 Nov 2020 16:27:46 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: imx50-kobo-aura: Enable eKTF2132 touchscreen
Message-ID: <20201116082745.GJ5849@dragon>
References: <20201112233054.3837465-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112233054.3837465-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 13, 2020 at 12:30:54AM +0100, Jonathan Neuschäfer wrote:
> The Kobo Aura has an eKTF2132 touchscreen controller.
> 
> Although the vendor kernel toggles a reset pin (GPIO5-12) during the
> startup sequence, the touchscreen works without it.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied, thanks.
