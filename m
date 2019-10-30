Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA84EA4D1
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 21:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfJ3Udp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 16:33:45 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:29460 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfJ3Udp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 16:33:45 -0400
Received: from belgarion ([90.55.204.252])
        by mwinf5d15 with ME
        id KwZb210025TFNlm03wZhdS; Wed, 30 Oct 2019 21:33:43 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 30 Oct 2019 21:33:43 +0100
X-ME-IP: 90.55.204.252
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 29/46] Input: touchscreen: use wrapper for pxa2xx ac97 registers
References: <20191018154052.1276506-1-arnd@arndb.de>
        <20191018154201.1276638-29-arnd@arndb.de>
X-URL:  http://belgarath.falguerolles.org/
Date:   Wed, 30 Oct 2019 21:33:35 +0100
In-Reply-To: <20191018154201.1276638-29-arnd@arndb.de> (Arnd Bergmann's
        message of "Fri, 18 Oct 2019 17:41:44 +0200")
Message-ID: <87y2x2m0rk.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> To avoid a dependency on the pxa platform header files with
> hardcoded registers, change the driver to call a wrapper
> in the pxa2xx-ac97-lib that encapsulates all the other
> ac97 stuff.
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
