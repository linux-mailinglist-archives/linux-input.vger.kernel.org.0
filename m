Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B95C17D967
	for <lists+linux-input@lfdr.de>; Mon,  9 Mar 2020 07:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgCIGoa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 02:44:30 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57365 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIGoa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 02:44:30 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBC9I-0006cj-C0; Mon, 09 Mar 2020 07:44:24 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBC9G-0008L0-Up; Mon, 09 Mar 2020 07:44:22 +0100
Date:   Mon, 9 Mar 2020 07:44:22 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, LW@KARO-electronics.de
Cc:     kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/4] EDT-FT5x06 Fixes and improvments
Message-ID: <20200309064422.k7o3eyvfqklflpt4@pengutronix.de>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227112819.16754-1-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:43:57 up 114 days, 22:02, 135 users,  load average: 0.08, 0.10,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

gentle ping.

Regards,
  Marco

On 20-02-27 12:28, Marco Felsch wrote:
> Hi,
> 
> first this series fixes a possible undefined register access for
> ev-ft5726 devices.
> 
> This series also includes the v4 of the improved pm ops. Please check
> my notes I made on the patch.
> 
> Last but least it adds the support for async probe which is important
> for fast booting because devices having a reset-pin specified sleeps
> 300ms..
> 
> Regards,
>   Marco
> 
> Ahmad Fatoum (1):
>   Input: edt-ft5x06 - prefer asynchronous probe
> 
> Marco Felsch (3):
>   Input: edt-ft5x06 - fix get_default register write access
>   Input: edt-ft5x06 - move parameter restore into helper
>   Input: edt-ft5x06 - improve power management operations
> 
>  drivers/input/touchscreen/edt-ft5x06.c | 179 ++++++++++++++++++++++---
>  1 file changed, 157 insertions(+), 22 deletions(-)
> 
> -- 
> 2.20.1
