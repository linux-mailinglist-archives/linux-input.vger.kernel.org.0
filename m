Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4EE257A48
	for <lists+linux-input@lfdr.de>; Mon, 31 Aug 2020 15:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHaNWr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Aug 2020 09:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgHaNWq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Aug 2020 09:22:46 -0400
X-Greylist: delayed 622 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 31 Aug 2020 06:22:46 PDT
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8557BC061573
        for <linux-input@vger.kernel.org>; Mon, 31 Aug 2020 06:22:46 -0700 (PDT)
Received: from [192.168.178.183] (pd95ef01a.dip0.t-ipconnect.de [217.94.240.26])
        by mail.bugwerft.de (Postfix) with ESMTPSA id BD5B245793B;
        Mon, 31 Aug 2020 13:12:11 +0000 (UTC)
Subject: Re: [PATCH v4 0/3] Input: ads7846: pdata cleanups and devm init
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de
References: <20200519182540.219027-1-daniel@zonque.org>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <484c21b1-592e-c71c-cf36-84af2afa0f53@zonque.org>
Date:   Mon, 31 Aug 2020 15:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200519182540.219027-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This series never got merged, but it still applies cleanly on top v5.8.

Should I resend it once more?


Thanks,
Daniel


On 5/19/20 8:25 PM, Daniel Mack wrote:
> Hi,
> 
> This is v4 of the patches to bring devm initialization to the ads7846
> driver. I left the gpiod conversion patch out for now as it needs more
> work, and it's also independent of the other changes.
> 
> v3:
> 
> * Added a patch to remove custom filter handling from pdata
> * Added devm_add_action_or_reset() for regulator state maintaining
> * Addressed minor nits pointed out by Marco Felsch
> 
> v4:
> 
> * Call ads7846_stop() rather than ads7846_disable() in the unbind
>   path to avoid regulator refcount confusion, Thanks to Marco Felsch.
> 
> Daniel Mack (3):
>   Input: ads7846: Add short-hand for spi->dev in probe() function
>   Input: ads7846: Remove custom filter handling functions from pdata
>   Input: ads7846: Switch to devm initialization
> 
>  drivers/input/touchscreen/ads7846.c | 187 +++++++++++-----------------
>  include/linux/spi/ads7846.h         |  15 ---
>  2 files changed, 73 insertions(+), 129 deletions(-)
> 

