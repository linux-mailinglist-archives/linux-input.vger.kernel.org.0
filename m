Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8697340344A
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 08:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhIHGe6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 8 Sep 2021 02:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhIHGe6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Sep 2021 02:34:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3717C061575
        for <linux-input@vger.kernel.org>; Tue,  7 Sep 2021 23:33:50 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mNr9I-0007Wr-61; Wed, 08 Sep 2021 08:33:32 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mNr9G-0002oS-8y; Wed, 08 Sep 2021 08:33:30 +0200
Message-ID: <688d0dc9fd83e98e0a7ed9d8d166e232e75031c6.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] Input: sun4i-lradc-keys: Add optional clock/reset
 support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Wed, 08 Sep 2021 08:33:30 +0200
In-Reply-To: <20210908034016.24119-3-samuel@sholland.org>
References: <20210908034016.24119-1-samuel@sholland.org>
         <20210908034016.24119-3-samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2021-09-07 at 22:40 -0500, Samuel Holland wrote:
> Until the R329, the LRADC hardware was always active. Now it requires
> enabling a clock gate and deasserting a reset line. Do this if the clock
> and reset are provided in the device tree, but keep them optional to
> maintain support for the existing binding.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
