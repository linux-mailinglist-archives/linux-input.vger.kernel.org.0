Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1A05998B2
	for <lists+linux-input@lfdr.de>; Fri, 19 Aug 2022 11:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244451AbiHSJeq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 19 Aug 2022 05:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiHSJep (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Aug 2022 05:34:45 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2057B6CF6C
        for <linux-input@vger.kernel.org>; Fri, 19 Aug 2022 02:34:43 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 7E40B40005;
        Fri, 19 Aug 2022 09:34:41 +0000 (UTC)
Message-ID: <b3079fca592e5f8cb4692273e6dea59bcbeb7423.camel@hadess.net>
Subject: Re: [PATCH v2 4/4] Input: xpad - add support for XBOX One Elite
 paddles
From:   Bastien Nocera <hadess@hadess.net>
To:     Pavel Rojtberg <rojtberg@gmail.com>, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org
Cc:     Christopher Crockett <chaorace@gmail.com>
Date:   Fri, 19 Aug 2022 11:34:40 +0200
In-Reply-To: <20220818154411.510308-5-rojtberg@gmail.com>
References: <20220818154411.510308-1-rojtberg@gmail.com>
         <20220818154411.510308-5-rojtberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2022-08-18 at 17:44 +0200, Pavel Rojtberg wrote:
> From: Christopher Crockett <chaorace@gmail.com>
> 
> An effort has been made to support every official model and firmware
> version I could track down info on. The following controllers
> _should_
> have working paddles with this PR:
> - Xbox Elite (**untested**)
> - Xbox Elite Series 2 on early firmwares (**untested**)
> - Xbox Elite Series 2 on v4 firmwares (Tested v4.8.1908.0)
> - Xbox Elite Series 2 on v5 pre-BLE firmwares (**untested**)
> - Xbox Elite Series 2 on v5 post-BLE firmwares (Tested v5.13.3143.0)
> 
> This patch also introduces correct handling for the Elite 1
> controller
> and properly suppresses paddle inputs when using a custom profile
> slot.

I tested with an original "X-Box" Elite (1698) and the paddle buttons
all worked in both profiles. I haven't been able to get the firmware
version (maybe the driver could export it somehow?), and I haven't
tested with custom profiles either.

Tested-by: Bastien Nocera <hadess@hadess.net>
