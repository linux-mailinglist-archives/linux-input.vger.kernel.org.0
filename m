Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C6B2ACB2D
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 03:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgKJCfQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 21:35:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:40254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729874AbgKJCfP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 21:35:15 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FB18205ED;
        Tue, 10 Nov 2020 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604975714;
        bh=Wh8bi6WR/6zd6VZ+8g3BsZ2KyPfC4ojmzhyoO2W82Hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gca15YNJYzsMmQp3Y7S0OnlOVPdii+EFcEqXckOVi+zRr2iHjDZgZbFmp/kDDkAzc
         nsFDEc2DUy+SgfLr7rheCmsf/fRK3/9IZDLJBxx1f2MCyLZoeTEuUu5P51cpcJWyQs
         2LfVTub/mwn3P+t8PdUhOTHMuoj4nmidMwYEPckk=
Date:   Tue, 10 Nov 2020 10:35:09 +0800
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
Subject: Re: [PATCH 3/3] ARM: dts: imx50-kobo-aura: Enable eKTF2132
 touchscreen
Message-ID: <20201110023508.GV31601@dragon>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
 <20201106112412.390724-4-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106112412.390724-4-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 06, 2020 at 12:24:12PM +0100, Jonathan Neuschäfer wrote:
> The Kobo Aura has an eKTF2132 touchscreen controller.
> 
> Although the vendor kernel toggles a reset pin (GPIO5-12) during the
> startup sequence, the touchscreen works without it.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied, thanks.
