Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FF51C8456
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 10:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgEGIHk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 04:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgEGIHk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 04:07:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F79C061A10
        for <linux-input@vger.kernel.org>; Thu,  7 May 2020 01:07:39 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jWbZB-0008I9-Li; Thu, 07 May 2020 10:07:37 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jWbZB-00049X-65; Thu, 07 May 2020 10:07:37 +0200
Date:   Thu, 7 May 2020 10:07:37 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v3 1/3] Input: ads7846: Add short-hand for spi->dev in
 probe() function
Message-ID: <20200507080737.c33dcevmpie7q4if@pengutronix.de>
References: <20200507062014.1780360-1-daniel@zonque.org>
 <20200507062014.1780360-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507062014.1780360-2-daniel@zonque.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:07:21 up 173 days, 23:25, 180 users,  load average: 0.09, 0.11,
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20-05-07 08:20, Daniel Mack wrote:
> This will make the code a bit more terse.
> No functional change intended.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
