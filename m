Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CE41D92DD
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 11:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgESJDJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 05:03:09 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:35490 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbgESJDG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 05:03:06 -0400
Received: from [192.168.178.106] (pd95ef292.dip0.t-ipconnect.de [217.94.242.146])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 1F6D340AB38;
        Tue, 19 May 2020 09:00:09 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] Input: ads7846: pdata cleanups and devm init
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de
References: <20200507062014.1780360-1-daniel@zonque.org>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <97958c4a-094c-46f8-94c2-7e375350810b@zonque.org>
Date:   Tue, 19 May 2020 11:03:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507062014.1780360-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmirty,

Do you think this is good to go in?


Thanks,
Daniel

On 5/7/20 8:20 AM, Daniel Mack wrote:
> Hi,
> 
> This is v3 of the patches to bring devm initialization to the ads7846
> driver. I left the gpiod conversion patch out for now as it needs more
> work, and it's also independent of the other changes.
> 
> v3:
> 
> * Added a patch to remove custom filter handling from pdata
> * Added devm_add_action_or_reset() for regulator state maintaining
> * Addressed minor nits pointed out by Marco Felsch
> 
> Daniel Mack (3):
>   Input: ads7846: Add short-hand for spi->dev in probe() function
>   Input: ads7846: Remove custom filter handling functions from pdata
>   Input: ads7846: Switch to devm initialization
> 
>  drivers/input/touchscreen/ads7846.c | 185 +++++++++++-----------------
>  include/linux/spi/ads7846.h         |  15 ---
>  2 files changed, 72 insertions(+), 128 deletions(-)
> 

