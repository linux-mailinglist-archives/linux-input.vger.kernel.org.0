Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B3623C72D
	for <lists+linux-input@lfdr.de>; Wed,  5 Aug 2020 09:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgHEHun (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Aug 2020 03:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEHun (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Aug 2020 03:50:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C24BC06174A
        for <linux-input@vger.kernel.org>; Wed,  5 Aug 2020 00:50:42 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k3EC7-0003wV-G7; Wed, 05 Aug 2020 09:50:39 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k3EC7-0007Z0-5j; Wed, 05 Aug 2020 09:50:39 +0200
Date:   Wed, 5 Aug 2020 09:50:39 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ili210x: Fix potential memory leaks
Message-ID: <20200805075039.jptytefw3mm2d4nq@pengutronix.de>
References: <20200804183007.117125-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804183007.117125-1-aford173@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:48:37 up 263 days, 23:07, 241 users,  load average: 0.14, 0.10,
 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Adam,

On 20-08-04 13:30, Adam Ford wrote:
> This driver requests, memory twice and requests a threaded irq, but
> it doesn't free any of them if something fails.

Free'ing is done automatically because the driver uses devres
(identified by devm_ prepfix) functions.

Regards,
  Marco
