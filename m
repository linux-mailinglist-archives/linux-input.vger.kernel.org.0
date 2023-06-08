Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8F972828F
	for <lists+linux-input@lfdr.de>; Thu,  8 Jun 2023 16:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbjFHOXG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jun 2023 10:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbjFHOXE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Jun 2023 10:23:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056AA198B
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 07:23:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9028964E14
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 14:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6139C433EF;
        Thu,  8 Jun 2023 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686234178;
        bh=CmN11RF3f/lPLGLDXfXDqrKrTZyB7sWxOWxuUhMLjUU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LfHRbv4JegLDIAEEOS3EPSF1PuYegASZQCvP2Jj95Sz8bMWhkWKC5qpuTFF9TLw8p
         OHFHQn8YlB8V6iK59fYKJjyyzRa1gxTcQkPdSyj5d6Fed7PSEexrEpi+biEI4AHWUN
         eiNlKxxC9MBXEzqXd6lCJ02yQEYwLcyrmSiT+rqWoprQzRXUwO3Tj0czlDVUdY07Bo
         qy1cikZPhcUfXbuXyPIo6cUxivvsE7JsP4jVcZD5VsAhPf+az9gdLgwygchhRiPMbF
         oSUXC2wia+kDgdi3xE70bICW3LdlWBRJqmv8v+r3zLrod1yHOXBXy80Ig/CURh8EQD
         BG/eI84gua64Q==
Date:   Thu, 8 Jun 2023 16:22:54 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>,
        Douglas Anderson <dianders@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] HID: i2c-hid: Switch i2c drivers back to use .probe()
In-Reply-To: <20230525203202.646669-1-u.kleine-koenig@pengutronix.de>
Message-ID: <nycvar.YFH.7.76.2306081622340.5716@cbobk.fhfr.pm>
References: <20230525203202.646669-1-u.kleine-koenig@pengutronix.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 25 May 2023, Uwe Kleine-König wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

